# BookStorm - Website Bán Sách Online

Hệ thống bán sách online full-stack với 3 vai trò: Khách hàng, Nhân viên (Staff) và Quản trị viên (Admin).

## Công nghệ sử dụng

**Backend**
- Java 17, Spring Boot 3.2.0
- Spring Web, Spring Data JPA, Spring Security
- MySQL 8
- JWT (jjwt 0.12.3) cho xác thực
- SpringDoc OpenAPI (Swagger UI)
- Cloudinary (lưu trữ ảnh)
- VNPay (thanh toán online, sandbox)

**Frontend**
- React 18, React Router 6
- Axios, React Hot Toast, Framer Motion, Recharts

**Kiểm thử**
- Playwright (test/e2e)

## Cấu trúc thư mục

```
BookStorm-master/
├── backend/            # Spring Boot REST API
│   └── src/main/java/com/bookstorm/
│       ├── controller/ # 28 REST controllers (Auth, Book, Cart, Order, Shipping, Admin*, ...)
│       ├── service/
│       ├── repository/
│       ├── model/
│       ├── dto/
│       └── config/
├── frontend/           # React SPA
│   └── src/
│       ├── pages/      # Trang Customer / Admin / Staff
│       ├── components/
│       ├── context/    # AuthContext, CartContext
│       └── services/   # Gọi API qua axios
├── test/e2e/           # Playwright end-to-end tests
├── db_book.sql         # Dump database MySQL (schema + dữ liệu mẫu)
└── taikhoan.txt        # Tài khoản demo
```

## Yêu cầu môi trường

- JDK 17+
- Maven 3.8+
- Node.js 18+ và npm
- MySQL 8.0+

## Cài đặt và chạy

### 1. Import database

```bash
mysql -u root -p < db_book.sql
```

Script sẽ tự tạo database `bookstorm_db` (nếu chưa có) và import toàn bộ schema + dữ liệu mẫu.

### 2. Cấu hình backend

Mở `backend/src/main/resources/application.properties` và chỉnh các giá trị cho phù hợp với máy của bạn, đặc biệt:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookstorm_db
spring.datasource.username=root
spring.datasource.password=root
```

Mặc định mật khẩu MySQL là `root`, sửa lại nếu môi trường của bạn khác.

> **Gửi email quên mật khẩu (tùy chọn):** `spring.mail.username`/`spring.mail.password` đọc qua biến môi trường `MAIL_USERNAME`/`MAIL_PASSWORD` — **không hardcode App Password thật vào `application.properties`** (file này được commit lên repo public). Để bật gửi email thật:
> 1. Bật xác minh 2 bước (2FA) cho tài khoản Gmail, tạo App Password tại https://myaccount.google.com/apppasswords.
> 2. Tạo file `backend/src/main/resources/application-local.properties` (đã có trong `.gitignore`, không bao giờ bị commit) với nội dung:
>    ```properties
>    MAIL_USERNAME=your-gmail@gmail.com
>    MAIL_PASSWORD=xxxxxxxxxxxxxxxx
>    ```
>
> Không có file này, ứng dụng vẫn chạy bình thường, chỉ riêng tính năng gửi email reset mật khẩu sẽ báo lỗi khi gọi tới.

### 3. Chạy backend

```bash
cd backend
mvn spring-boot:run
```

Backend chạy tại `http://localhost:8080`. Swagger UI: `http://localhost:8080/swagger-ui.html`.

### 4. Chạy frontend

```bash
cd frontend
npm install
npm start
```

Frontend chạy tại `http://localhost:3000`.

### 5. Chạy test e2e (tùy chọn)

```bash
npm install
npx playwright install
npx playwright test
```

## Tài khoản demo

| Vai trò  | Email                  | Mật khẩu      |
|----------|-------------------------|---------------|
| Admin    | admin@bookstorm.com     | password123   |
| Staff    | staff@bookstorm.com     | password123   |
| Customer | mai@gmail.com           | password123   |

Xem chi tiết tại [taikhoan.txt](taikhoan.txt).

## Tính năng chính

**Khách hàng**
- Đăng ký / đăng nhập (JWT), quên & đặt lại mật khẩu
- Xem, tìm kiếm, lọc sách theo danh mục
- Giỏ hàng, yêu thích (wishlist), đánh giá sách
- Đặt hàng, thanh toán VNPay, theo dõi đơn hàng, yêu cầu đổi/trả
- Quản lý địa chỉ, đổi mật khẩu, nhận thông báo

**Nhân viên (Staff)**
- Quản lý đơn hàng, kho sách, yêu cầu đổi/trả
- Hỗ trợ khách hàng (support)

**Quản trị viên (Admin)**
- Quản lý sách, danh mục, kho, đơn hàng, người dùng
- Quản lý mã giảm giá, banner, vận chuyển, đánh giá
- Báo cáo doanh thu, sách bán chạy, quản lý liên hệ/thông báo

## Thanh toán VNPay (Sandbox)

Dự án tích hợp VNPay ở chế độ **sandbox** (kiểm thử), không phát sinh giao dịch thật.

**Luồng thanh toán:**
1. Khách hàng chọn sản phẩm → giỏ hàng → thanh toán → chọn **"Thanh toán qua VNPay"** → đặt hàng.
2. Hệ thống tạo URL thanh toán và redirect trình duyệt sang cổng VNPay sandbox.
3. Sau khi thanh toán, VNPay gọi về `http://localhost:8080/api/v1/payments/vnpay/return` để xác nhận kết quả.
4. Backend xác thực chữ ký HMAC-SHA512, cập nhật trạng thái đơn hàng và redirect về trang thành công/thất bại.

**Thẻ thanh toán thử (sandbox VNPay):**

| Thông tin | Giá trị |
|-----------|---------|
| Ngân hàng | NCB |
| Số thẻ | 9704198526191432198 |
| Tên chủ thẻ | NGUYEN VAN A |
| Ngày phát hành | 07/15 |
| OTP | 123456 |

> Lưu ý: Cổng VNPay sandbox chặn truy cập từ automated browser (headless). Khi demo cần dùng **Chrome/Firefox thật**.

**Cấu hình VNPay** (trong `application.properties`):
```properties
vnpay.tmn-code=B77INC60
vnpay.hash-secret=NU3W61XPNAW4DDRSYM30E0G4GL97VG7M
vnpay.url=https://sandbox.vnpayment.vn/paymentv2/vpcpay.html
vnpay.return-url=http://localhost:8080/api/v1/payments/vnpay/return
```

## Lưu ý

- File `application.properties` chứa secret (JWT secret, Cloudinary API secret, VNPay hash secret) ở dạng plain text — chỉ phù hợp cho mục đích học tập/demo, **không dùng các giá trị này cho môi trường production**. Riêng App Password Gmail **không** nằm trong file này — xem mục "Cấu hình backend" phía trên.
- `spring.jpa.hibernate.ddl-auto=update`: schema sẽ tự đồng bộ theo entity khi backend khởi động lần đầu sau khi import `db_book.sql`.
- Tính năng gửi email quên mật khẩu (`EmailService`, Gmail SMTP) cần App Password thật, cấu hình qua `application-local.properties` (không commit). Thông báo trong mục "Thông báo" của ứng dụng là thông báo nội bộ (in-app), không gửi qua email.
