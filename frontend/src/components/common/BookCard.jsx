import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { HiOutlineHeart, HiHeart } from 'react-icons/hi';
import toast from 'react-hot-toast';
import { useAuth } from '../../context/AuthContext';
import wishlistService from '../../services/wishlistService';
import styles from './BookCard.module.css';

const BookCard = ({ book, onWishlistToggle }) => {
  const [isWishlisted, setIsWishlisted] = useState(book?.isWishlisted || false);
  const [loading, setLoading] = useState(false);
  const { isAuthenticated } = useAuth();
  const navigate = useNavigate();

  const {
    id,
    _id,
    slug,
    name = 'Book Name',
    author = '',
    images = [],
    basePrice,
    price,
    salePrice,
    discount,
  } = book || {};

  const bookId = id || _id;
  const displayPrice = Number(basePrice ?? price ?? 0);
  const displaySale = salePrice != null ? Number(salePrice) : null;
  const bookUrl = `/book/${slug || bookId}`;
  const displayImage = images[0]?.imageUrl || images[0]?.url || (typeof images[0] === 'string' ? images[0] : '/placeholder.jpg');
  const isOnSale = displaySale != null && displaySale < displayPrice;
  const salePercent = isOnSale ? Math.round(((displayPrice - displaySale) / displayPrice) * 100) : 0;

  const formatPrice = (value) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
    }).format(value);
  };

  const handleWishlistClick = async (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (!isAuthenticated) {
      toast.error('Vui lòng đăng nhập để thêm yêu thích');
      navigate('/login');
      return;
    }
    if (loading) return;
    setLoading(true);
    const next = !isWishlisted;
    setIsWishlisted(next);
    try {
      if (next) {
        await wishlistService.addToWishlist(bookId);
        toast.success('Đã thêm vào danh sách yêu thích');
      } else {
        await wishlistService.removeFromWishlist(bookId);
        toast.success('Đã xóa khỏi danh sách yêu thích');
      }
      if (onWishlistToggle) onWishlistToggle(book, next);
    } catch {
      setIsWishlisted(!next);
      toast.error('Không thể cập nhật danh sách yêu thích');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className={styles.card}>
      <Link to={bookUrl} className={styles.imageContainer}>
        <img
          src={displayImage}
          alt={name}
          className={styles.image}
          loading="lazy"
        />

        {(isOnSale || discount) && (
          <span className={styles.saleBadge}>
            -{salePercent || discount}%
          </span>
        )}

        <button
          className={`${styles.wishlistBtn} ${isWishlisted ? styles.wishlistBtnActive : ''}`}
          onClick={handleWishlistClick}
          aria-label={isWishlisted ? 'Bỏ yêu thích' : 'Thêm yêu thích'}
        >
          {isWishlisted ? <HiHeart /> : <HiOutlineHeart />}
        </button>

        <button className={styles.quickView}>
          Xem nhanh
        </button>
      </Link>

      <Link to={bookUrl} className={styles.info}>
        {author && <div className={styles.brand}>{author}</div>}
        <h3 className={styles.name}>{name}</h3>
        <div className={styles.priceRow}>
          {isOnSale ? (
            <>
              <span className={`${styles.price} ${styles.salePrice}`}>
                {formatPrice(displaySale)}
              </span>
              <span className={styles.originalPrice}>
                {formatPrice(displayPrice)}
              </span>
            </>
          ) : (
            <span className={styles.price}>{formatPrice(displayPrice)}</span>
          )}
        </div>
      </Link>
    </div>
  );
};

export default BookCard;
