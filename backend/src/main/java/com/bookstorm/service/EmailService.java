package com.bookstorm.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    @Value("${app.frontend-url:http://localhost:3000}")
    private String frontendUrl;

    public void sendPasswordResetEmail(String toEmail, String token) {
        String resetLink = frontendUrl + "/reset-password?token=" + token;
        String subject = "BookStorm - Đặt lại mật khẩu";
        String htmlContent = buildResetEmailHtml(toEmail, resetLink);

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setFrom(fromEmail);
            helper.setTo(toEmail);
            helper.setSubject(subject);
            helper.setText(htmlContent, true);
            mailSender.send(message);
            log.info("Password reset email sent to: {}", toEmail);
        } catch (MessagingException e) {
            log.error("Failed to send email to {}: {}", toEmail, e.getMessage());
            throw new RuntimeException("Không thể gửi email. Vui lòng thử lại sau.");
        }
    }

    private String buildResetEmailHtml(String email, String resetLink) {
        return """
                <!DOCTYPE html>
                <html lang="vi">
                <head><meta charset="UTF-8"></head>
                <body style="margin:0;padding:0;background:#f4f4f4;font-family:Arial,sans-serif;">
                  <table width="100%%" cellpadding="0" cellspacing="0" style="background:#f4f4f4;padding:40px 0;">
                    <tr>
                      <td align="center">
                        <table width="600" cellpadding="0" cellspacing="0"
                               style="background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.1);">
                          <!-- Header -->
                          <tr>
                            <td style="background:#2d6a4f;padding:32px;text-align:center;">
                              <h1 style="margin:0;color:#ffffff;font-size:28px;font-weight:700;">📚 BookStorm</h1>
                            </td>
                          </tr>
                          <!-- Body -->
                          <tr>
                            <td style="padding:40px 48px;">
                              <h2 style="margin:0 0 16px;color:#1a1a1a;font-size:22px;">Đặt lại mật khẩu</h2>
                              <p style="margin:0 0 12px;color:#555;font-size:15px;line-height:1.6;">
                                Chúng tôi nhận được yêu cầu đặt lại mật khẩu cho tài khoản:
                                <strong style="color:#2d6a4f;">%s</strong>
                              </p>
                              <p style="margin:0 0 32px;color:#555;font-size:15px;line-height:1.6;">
                                Click vào nút bên dưới để tạo mật khẩu mới. Link này có hiệu lực trong <strong>1 giờ</strong>.
                              </p>
                              <div style="text-align:center;margin-bottom:32px;">
                                <a href="%s"
                                   style="display:inline-block;background:#2d6a4f;color:#ffffff;text-decoration:none;
                                          padding:14px 36px;border-radius:8px;font-size:16px;font-weight:600;">
                                  Đặt lại mật khẩu
                                </a>
                              </div>
                              <p style="margin:0 0 8px;color:#888;font-size:13px;">
                                Hoặc copy link này vào trình duyệt:
                              </p>
                              <p style="margin:0 0 24px;word-break:break-all;">
                                <a href="%s" style="color:#2d6a4f;font-size:13px;">%s</a>
                              </p>
                              <hr style="border:none;border-top:1px solid #eee;margin:24px 0;">
                              <p style="margin:0;color:#aaa;font-size:13px;line-height:1.6;">
                                Nếu bạn không yêu cầu đặt lại mật khẩu, hãy bỏ qua email này.
                                Tài khoản của bạn vẫn an toàn.
                              </p>
                            </td>
                          </tr>
                          <!-- Footer -->
                          <tr>
                            <td style="background:#f9f9f9;padding:20px 48px;text-align:center;">
                              <p style="margin:0;color:#aaa;font-size:12px;">
                                © 2024 BookStorm. Tất cả quyền được bảo lưu.
                              </p>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </body>
                </html>
                """.formatted(email, resetLink, resetLink, resetLink);
    }
}
