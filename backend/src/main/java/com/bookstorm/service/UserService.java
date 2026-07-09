package com.bookstorm.service;

import com.bookstorm.dto.user.UserResponse;
import com.bookstorm.exception.BadRequestException;
import com.bookstorm.exception.ResourceNotFoundException;
import com.bookstorm.model.Role;
import com.bookstorm.model.User;
import com.bookstorm.repository.AddressRepository;
import com.bookstorm.repository.CartItemRepository;
import com.bookstorm.repository.CartRepository;
import com.bookstorm.repository.NotificationRepository;
import com.bookstorm.repository.OrderRepository;
import com.bookstorm.repository.ReviewRepository;
import com.bookstorm.repository.UserRepository;
import com.bookstorm.repository.WishlistRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final OrderRepository orderRepository;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final AddressRepository addressRepository;
    private final WishlistRepository wishlistRepository;
    private final NotificationRepository notificationRepository;
    private final ReviewRepository reviewRepository;

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User", "email", email));
    }

    @Transactional
    public User updateProfile(Long userId, User updatedData) {
        User user = getUserById(userId);

        if (updatedData.getFullName() != null) {
            user.setFullName(updatedData.getFullName());
        }
        if (updatedData.getPhone() != null) {
            user.setPhone(updatedData.getPhone());
        }
        if (updatedData.getAvatar() != null) {
            user.setAvatar(updatedData.getAvatar());
        }

        return userRepository.save(user);
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    public Page<User> searchUsers(String search, Pageable pageable) {
        return userRepository.findByFullNameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                search, search, pageable);
    }

    @Transactional
    public User updateUserRole(Long userId, Role role) {
        User user = getUserById(userId);
        user.setRole(role);
        return userRepository.save(user);
    }

    @Transactional
    public User toggleUserStatus(Long userId) {
        User user = getUserById(userId);
        user.setEnabled(!user.getEnabled());
        return userRepository.save(user);
    }

    @Transactional
    public void deleteUser(Long userId) {
        User user = getUserById(userId);

        if (orderRepository.existsByUserId(userId)) {
            throw new BadRequestException(
                    "Không thể xóa tài khoản đã có đơn hàng. Hãy khóa tài khoản thay vì xóa để giữ lịch sử đơn hàng.");
        }

        cartRepository.findByUserId(userId).ifPresent(cart -> {
            cartItemRepository.bulkDeleteByCartId(cart.getId());
            cartRepository.bulkDeleteById(cart.getId());
        });
        addressRepository.deleteByUserId(userId);
        wishlistRepository.deleteByUserId(userId);
        notificationRepository.deleteByUserId(userId);
        reviewRepository.deleteByUserId(userId);

        userRepository.delete(user);
    }

    public long countByRole(Role role) {
        return userRepository.countByRole(role);
    }

    public Page<UserResponse> getAllUserResponses(Pageable pageable) {
        return userRepository.findAll(pageable).map(this::toUserResponse);
    }

    public Page<UserResponse> searchUserResponses(String search, Pageable pageable) {
        return userRepository.findByFullNameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                search, search, pageable).map(this::toUserResponse);
    }

    public UserResponse toUserResponse(User user) {
        return UserResponse.builder()
                .id(user.getId())
                .fullName(user.getFullName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .avatar(user.getAvatar())
                .role(user.getRole() != null ? user.getRole().name() : null)
                .enabled(user.getEnabled() != null ? user.getEnabled() : true)
                .createdAt(user.getCreatedAt())
                .build();
    }

    @Transactional
    public void changePassword(Long userId, String oldPassword, String newPassword) {
        User user = getUserById(userId);

        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            throw new BadRequestException("Current password is incorrect");
        }

        if (newPassword.length() < 6) {
            throw new BadRequestException("New password must be at least 6 characters");
        }

        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }
}
