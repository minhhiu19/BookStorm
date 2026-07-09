CREATE DATABASE  IF NOT EXISTS `bookstorm_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookstorm_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstorm_db
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` bit(1) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_addresses_user` (`user_id`),
  CONSTRAINT `FK_addresses_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'1111','Huyện Tân Yên','Nguyễn Văn Admin',_binary '','0987676767','Tỉnh Bắc Giang','Xã Liên Chung',1),(2,'123 Đường ABC','Quận Ba Đình','Người nhận test',_binary '','0911223344','Thành phố Hà Nội','Phường Phúc Xá',3),(3,'73/21 Trần Thị Điệu','Thành phố Thủ Đức','Phạm Minh Hiếu',_binary '','0918063406','Thành phố Hồ Chí Minh','Phường Tăng Nhơn Phú A',20);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,_binary '','2026-04-01 08:05:00.000000','https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=1920&h=600&fit=crop','/shop',1,'Khám Phá Kho Sách Khổng Lồ'),(2,_binary '','2026-04-01 08:05:01.000000','https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=1920&h=600&fit=crop','/shop?sale=true',2,'Sale Sách - Giảm Đến 40%'),(3,_binary '','2026-04-01 08:05:02.000000','https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=1920&h=600&fit=crop','/shop?featured=true',3,'Sách Bán Chạy Nhất Tháng');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_images`
--

DROP TABLE IF EXISTS `book_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` bit(1) DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `book_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_book_images_book` (`book_id`),
  CONSTRAINT `FK_book_images_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_images`
--

LOCK TABLES `book_images` WRITE;
/*!40000 ALTER TABLE `book_images` DISABLE KEYS */;
INSERT INTO `book_images` VALUES (1,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop',_binary '',0,1),(2,'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=800&h=1000&fit=crop',_binary '',0,2),(4,'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800&h=1000&fit=crop',_binary '',0,4),(5,'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=800&h=1000&fit=crop',_binary '',0,5),(6,'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=800&h=1000&fit=crop',_binary '',0,6),(7,'https://images.unsplash.com/photo-1532012197267-da84d127e765?w=800&h=1000&fit=crop',_binary '',0,7),(8,'https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?w=800&h=1000&fit=crop',_binary '',0,8),(9,'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=800&h=1000&fit=crop',_binary '',0,9),(10,'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800&h=1000&fit=crop',_binary '',0,10),(11,'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=800&h=1000&fit=crop',_binary '',0,11),(12,'https://images.unsplash.com/photo-1550399105-c4db5fb85c18?w=800&h=1000&fit=crop',_binary '',0,12),(16,'https://res.cloudinary.com/daytrfyrg/image/upload/v1778415971/wearora/books/dfroxlaohbg86fguytbi.jpg',_binary '',0,3),(17,'https://cdn1.fahasa.com/media/catalog/product/i/m/image_173938.jpg',_binary '',0,52),(18,'https://rongmotamhon.net/bookcover/327.jpg',_binary '',0,53),(19,'https://upload.wikimedia.org/wikipedia/vi/f/f4/Muon_kiep_nhan_sinh.jpeg',_binary '',0,54),(20,'https://static.oreka.vn/800-800_c278ee60-29eb-47d3-9fb6-ec474a136688.webp',_binary '',0,55),(21,'https://cdn1.fahasa.com/media/catalog/product/z/2/z2611575615164_9f60c133cfed1c7bb3f59b247f-600.jpg',_binary '',0,56),(22,'https://cdn1.fahasa.com/media/catalog/product/t/h/thiet_ke_chua_co_ten__77__3a31f9c74e0046a5b826f404c94da3e3_master.jpg',_binary '',0,57),(23,'https://static.oreka.vn/800-800_a48018f7-75da-44af-9f0b-c948f91c1eff.webp',_binary '',0,58),(24,'https://cdn1.fahasa.com/media/catalog/product/9/7/9786043495959.jpg',_binary '',0,59),(25,'https://cdn1.fahasa.com/media/catalog/product/8/9/8935251416916_2.jpg',_binary '',0,60),(26,'https://salt.tikicdn.com/cache/750x750/ts/product/69/2f/67/c9cce6c9d0ea2c94dade6a165d54e70e.jpg.webp',_binary '',0,61),(27,'https://salt.tikicdn.com/cache/750x750/ts/product/23/f8/75/5e90d6e0eabaebd068c815cf1c1f7396.jpg.webp',_binary '',0,62),(28,'https://static.oreka.vn/800-800_1a326d32-cb39-4ded-8ee8-a3fa9bd9c336.webp',_binary '',0,63),(29,'https://cdn1.fahasa.com/media/catalog/product/b/i/bia_doc-vi-bat-ky-ai-de-khong-bi-lua-doi-va-loi-dung_bia-1.jpg',_binary '',0,64),(30,'https://cdn1.fahasa.com/media/catalog/product/_/k/_khong-phai-soi-nhung-cung-dung-la-cuu_1.jpg',_binary '',0,65),(31,'https://www.netabooks.vn/Data/Sites/1/Product/25067/lao-gia-me-doc-truyen-tinh-01.jpg',_binary '',0,66),(32,'https://static.oreka.vn/800-800_b6eafa8b-e01b-4a83-989b-b8e1f9784f98.webp',_binary '',0,67),(33,'https://www.netabooks.vn/Data/Sites/1/Product/38822/cay-cam-ngot-cua-toi.jpg',_binary '',0,68),(34,'https://cdn1.fahasa.com/media/catalog/product/8/9/8934974180630.jpg',_binary '',0,69),(35,'https://cdn1.fahasa.com/media/catalog/product/8/9/8935236438643_1.jpg',_binary '',0,70),(36,'https://cdn1.fahasa.com/media/catalog/product/t/i/tieng-goi-noi-hoang-da_bia.jpg',_binary '',0,71),(37,'https://product.hstatic.net/200000692705/product/ban_hang_bang_trai_tim_931e6fda69a148efb1b86463d78babcd_dfe71670327e4fafa48a88b944faf3db.jpg',_binary '',0,72),(38,'https://cdn1.fahasa.com/media/catalog/product/d/a/dat-rung-phuong-nam.jpg',_binary '',0,73),(39,'https://www.nxbtre.com.vn/Images/Book/nxbtre_full_23262019_032631.jpg',_binary '',0,74),(40,'https://cdn1.fahasa.com/media/catalog/product/8/9/8936065773592.jpg',_binary '',0,75),(41,'https://cdn1.fahasa.com/media/catalog/product/8/9/8935235230019_1.jpg',_binary '',0,76),(42,'https://images-na.ssl-images-amazon.com/images/I/61NAx5pd6XL.jpg',_binary '',0,77),(43,'https://cdn1.fahasa.com/media/catalog/product/d/a/dai-duong-den---bia-mem-01.jpg',_binary '',0,78),(44,'https://bizweb.dktcdn.net/thumb/large/100/197/269/products/sach-hieu-ung-canh-buom-alphabooks.jpg?v=1589340421813',_binary '',0,79),(45,'https://cdn1.fahasa.com/media/catalog/product/i/m/image_180771.jpg',_binary '',0,80),(46,'https://cdn1.fahasa.com/media/catalog/product/8/9/8936024919047_1_1.jpg',_binary '',0,81),(47,'https://www.netabooks.vn/Data/Sites/1/Product/599/tu-duy-nhanh-va-cham.jpg',_binary '',0,82),(48,'https://cdn1.fahasa.com/media/catalog/product/n/x/nxbtre_full_09462021_024609.jpg',_binary '',0,83),(49,'https://salt.tikicdn.com/cache/750x750/ts/product/8f/cf/6e/2f720a3f161f8bf3baad202af3fe933f.jpg.webp',_binary '',0,84),(50,'https://cdn1.fahasa.com/media/catalog/product/i/m/image_244718_1_5350.jpg',_binary '',0,85),(51,'https://cdn1.fahasa.com/media/catalog/product/i/m/image_244718_1_4894.jpg',_binary '',0,86),(52,'https://cdn1.fahasa.com/media/catalog/product/c/h/chuyen-con-meo-day-hai-au-bay-01.jpg',_binary '',0,87),(53,'https://cdn1.fahasa.com/media/catalog/product/8/9/8935235241848.jpg',_binary '',0,88),(54,'https://salt.tikicdn.com/cache/750x750/ts/product/07/43/5d/19a4562aca3e65a5ca8acc08f268ea70.jpg.webp',_binary '',0,89),(55,'https://salt.tikicdn.com/cache/750x750/ts/product/6d/e1/0b/eaea2b2bb369797fd3a118738601ef03.jpg.webp',_binary '',0,90);
/*!40000 ALTER TABLE `book_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `base_price` decimal(12,2) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_year` int DEFAULT NULL,
  `page_count` int DEFAULT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `created_at` datetime(6) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `featured` bit(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` decimal(12,2) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_books_slug` (`slug`),
  UNIQUE KEY `UK_books_isbn` (`isbn`),
  KEY `FK_books_category` (`category_id`),
  CONSTRAINT `FK_books_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,_binary '',45000.00,'Nam Cao','NXB Văn học','9786041038011',1941,180,137,'2026-04-01 08:02:00.000000','Chí Phèo là kiệt tác của nhà văn Nam Cao, kể về cuộc đời bi kịch của người nông dân bị tha hóa dưới chế độ phong kiến nửa thực dân.',_binary '\0','Chí Phèo',39000.00,'chi-pheo','2026-05-10 20:21:06.938573',1),(2,_binary '',85000.00,'Nguyễn Du','NXB Văn học','9786041038012',1820,320,200,'2026-04-01 08:02:01.000000','Truyện Kiều là tác phẩm văn học chữ Nôm nổi tiếng nhất của Việt Nam, kể về cuộc đời tài hoa bạc mệnh của nàng Vương Thúy Kiều.',_binary '','Truyện Kiều',NULL,'truyen-kieu','2026-05-10 20:20:52.299945',1),(3,_binary '',120000.00,'Robert T. Kiyosaki','NXB Trẻ','9786041038013',1997,336,998,'2026-04-01 08:02:02.000000','Cha Giàu Cha Nghèo - cuốn sách tài chính cá nhân bán chạy nhất mọi thời đại, thay đổi cách nhìn về tiền bạc và đầu tư.',_binary '','Cha Giàu Cha Nghèo',99000.00,'cha-giau-cha-ngheo','2026-06-19 16:06:28.309627',2),(4,_binary '',95000.00,'Dale Carnegie','NXB Tổng hợp TP.HCM','9786041038014',1936,320,220,'2026-04-01 08:02:03.000000','Đắc Nhân Tâm - nghệ thuật thu phục lòng người, một trong những cuốn sách self-help bán chạy nhất thế giới với hơn 30 triệu bản.',_binary '','Đắc Nhân Tâm',NULL,'dac-nhan-tam','2026-04-01 08:02:03.000000',3),(5,_binary '',110000.00,'Rhonda Byrne','NXB Trẻ','9786041038015',2006,216,300,'2026-04-01 08:02:04.000000','Bí Mật - khám phá sức mạnh của luật hấp dẫn, giúp bạn thay đổi cuộc sống theo hướng tích cực và đạt được mọi điều mơ ước.',_binary '','Bí Mật (The Secret)',89000.00,'bi-mat-the-secret','2026-04-01 08:02:04.000000',3),(6,_binary '',89000.00,'Tô Hoài','NXB Kim Đồng','9786041038016',1941,120,250,'2026-04-01 08:02:05.000000','Dế Mèn Phiêu Lưu Ký - tác phẩm thiếu nhi kinh điển của Việt Nam, kể về hành trình phiêu lưu đầy thú vị của chú dế Mèn.',_binary '','Dế Mèn Phiêu Lưu Ký',NULL,'de-men-phieu-luu-ky','2026-04-01 08:02:05.000000',4),(7,_binary '',75000.00,'Stephen Hawking','NXB Trẻ','9786041038017',1988,212,120,'2026-04-01 08:02:06.000000','Lược Sử Thời Gian - giải thích vũ trụ học một cách dễ hiểu, từ Big Bang đến lỗ đen, bán được hơn 10 triệu bản trên toàn thế giới.',_binary '\0','Lược Sử Thời Gian',65000.00,'luoc-su-thoi-gian','2026-04-01 08:02:06.000000',5),(8,_binary '',130000.00,'Yuval Noah Harari','NXB Thế giới','9786041038018',2011,512,90,'2026-04-01 08:02:07.000000','Sapiens: Lược Sử Loài Người - cuốn sách trình bày lịch sử tiến hóa của loài người từ thời tiền sử đến hiện đại một cách hấp dẫn.',_binary '\0','Sapiens: Lược Sử Loài Người',NULL,'sapiens-luoc-su-loai-nguoi','2026-04-01 08:02:07.000000',9),(9,_binary '',78000.00,'Nguyễn Nhật Ánh','NXB Trẻ','9786041038019',2008,264,499,'2026-04-01 08:02:08.000000','Cho Tôi Xin Một Vé Đi Tuổi Thơ - tác phẩm đưa người đọc trở về thế giới tuổi thơ trong sáng, hồn nhiên và đầy ắp kỷ niệm.',_binary '\0','Cho Tôi Xin Một Vé Đi Tuổi Thơ',NULL,'cho-toi-xin-mot-ve-di-tuoi-tho','2026-06-19 16:14:25.754614',1),(10,_binary '',145000.00,'Erich Fromm','NXB Văn học','9786041038020',1956,176,79,'2026-04-01 08:02:09.000000','Nghệ Thuật Yêu - khám phá tình yêu không phải là cảm xúc mà là một nghệ thuật cần học hỏi, một trong những cuốn sách tâm lý kinh điển.',_binary '\0','Nghệ Thuật Yêu',120000.00,'nghe-thuat-yeu','2026-05-10 19:31:51.826469',8),(11,_binary '',99000.00,'Osamu Tezuka','NXB Kim Đồng','9786041038021',1952,400,349,'2026-04-01 08:02:10.000000','Astro Boy - bộ truyện tranh kinh điển về chú robot nhí Astro Boy chiến đấu bảo vệ hòa bình thế giới của cha đẻ manga hiện đại.',_binary '\0','Astro Boy',NULL,'astro-boy','2026-05-10 19:27:29.243525',7),(12,_binary '',199000.00,'Andrew Hunt & David Thomas','NXB Thông tin & Truyền thông','9786041038022',1999,352,56,'2026-04-01 08:02:11.000000','Lập Trình Viên Thực Dụng - cuốn sách kinh điển dành cho lập trình viên, hướng dẫn cách viết code chất lượng và tư duy như một chuyên gia.',_binary '\0','Lập Trình Viên Thực Dụng',169000.00,'lap-trinh-vien-thuc-dung','2026-06-19 16:07:30.182445',10),(52,_binary '',95000.00,'Trình Chí Lương','NXB Văn Học',NULL,2018,248,100,'2026-06-18 13:54:23.564429','Tìm Lại Cái Tôi Đã Mất\n\nTrong cuốn sách này, chúng ta sẽ cùng đi sâu tìm kiếm bí mật ẩn giấu phía sau cái thế giới mà chúng ta cho là lẽ đương nhiên, tìm kiếm kẻ tội đồ khiến chúng ta đau khổ và tầm thường, tìm lại sức mạnh to lớn của bản thân mà chúng ta đã đánh mất.\n\nĐiều đáng buồn nhất của con người là không hiểu được tình trạng của bản thân có mối liên hệ gì với bản thân. Tìm lại cái tôi đã mất sẽ cùng bạn khám phá bí mật ẩn giấu đằng sau thế giới mà chúng ta nghĩ là đúng, tìm kiếm “kẻ cầm đầu” khiến chúng ta trở nên tầm thường và đau khổ, tìm lại sức mạnh to lớn từ bản thân mà chúng ta đã đánh mất.\n\nNếu bây giờ bạn cảm thấy rất vui vẻ, cuốn sách này sẽ giúp bạn nhận ra bạn có thật sự vui vẻ hay không.\n\nNếu bạn biết mình muốn gì, cuốn sách này sẽ khiến bạn nhìn rõ hơn, đó có phải là thứ mà bạn thật sự mong muốn hay không.\n\nNếu bạn biết mình thật sự muốn gì, cuốn sách này sẽ hướng dẫn làm thế nào để có được thứ bạn muốn.\n\nNếu bạn không vui vẻ, cũng không biết mình muốn gì, cuốn sách này sẽ chỉ ra con đường “huyết mạch” dẫn bạn đến với cuộc sống vui vẻ, hạnh phúc.\n\nCuộc đời của chúng ta đi về đâu, dừng lại ở đâu, quyền quyết định nằm trong tay chúng ta. Hãy học cách thấu hiểu bản thân; Cùng khám phá bí quyết có được thành công và niềm vui thật sự.\n\nKhi lật giở từng trang trong cuốn sách này, chúng ta sẽ phát hiện đằng sau những câu trả lời mà chúng ta hoàn toàn tin tưởng lại ẩn chứa những sự thật không ngờ tới. Cuốn sách dành tặng cho những người đang cảm thấy mơ hồ, cùng bạn cứu vãn cuộc đời không vui vẻ!',_binary '\0','Tìm Lại Cái Tôi Đã Mất, Cứu Vãn Cuộc Đời Không Vui Vẻ (Bìa Cứng)',52000.00,'tim-lai-cai-toi-da-mat-cuu-van-cuoc-doi-khong-vui-ve-bia-cung','2026-06-18 13:54:23.564429',8),(53,_binary '',68000.00,'George Orwell','NXB Hội Nhà Văn','9786049692222',2019,160,100,'2026-06-19 16:31:18.135687','Cuốn tiểu thuyết ngụ ngôn châm biếm sâu cay phản ánh bản chất của sự tha hóa quyền lực độc tài.',_binary '','Trại Súc Vật',58000.00,'trai-suc-vat','2026-06-19 16:31:18.135687',5),(54,_binary '',168000.00,'Nguyên Phong','NXB Tổng hợp TP.HCM','9786045831122',2021,420,420,'2026-06-19 16:35:34.877945','Cuốn sách kể về những hành trình nhân quả, luân hồi tiền kiếp thức tỉnh nhận thức con người hiện đại.',_binary '\0','Muôn Kiếp Nhân Sinh',148000.00,'muon-kiep-nhan-sinh','2026-06-19 16:35:34.877945',8),(55,_binary '',96000.00,'Kishimi Ichiro','NXB Lao Động','9786045991121',2019,300,290,'2026-06-19 16:36:38.372690','Cuốn sách mang tư duy triết học Adler giúp bạn tự giải phóng bản thân khỏi những kỳ vọng của người khác.',_binary '\0','Dám Bị Ghét',NULL,'dam-bi-ghet','2026-06-19 16:36:38.372690',8),(56,_binary '',150000.00,'Mario Puzo','NXB Hội Nhà Văn','9786049691126',2020,540,75,'2026-06-19 16:45:30.158599','Bức tranh chân thực xuất sắc về thế giới tội phạm mafia ngầm đầy danh dự, quyền lực và máu.',_binary '\0','Bố Già',130000.00,'bo-gia','2026-06-19 16:45:30.158599',1),(57,_binary '',45000.00,'Thạch Lam','NXB Văn Học','9786049547782',2018,160,150,'2026-06-19 16:46:12.052094','Tập truyện ngắn chứa chan tình người sâu sắc của Thạch Lam về những mảnh đời nghèo khổ xã hội cũ.',_binary '\0','Gió Lạnh Đầu Mùa',NULL,'gio-lanh-dau-mua','2026-06-19 16:46:12.052094',1),(58,_binary '',60000.00,'Andrew Matthews','NXB Trẻ','9786041052215',2017,210,330,'2026-06-19 16:47:48.838690','Bộ sách tâm lý hài hước giúp bạn thay đổi thái độ nhìn nhận cuộc sống theo hướng tích cực hơn.',_binary '\0','Đời Thay Đổi Khi Chúng Ta Thay Đổi',50000.00,'doi-thay-doi-khi-chung-ta-thay-doi','2026-06-19 16:47:48.838690',3),(59,_binary '',140000.00,'Victor Hugo','NXB Văn Học','9786046914439',2015,620,40,'2026-06-19 16:48:34.313690','Áng văn bất hủ khắc họa tấn bi kịch tình yêu của thằng gù Quasimodo và cô gái lãng du Esmeralda.',_binary '\0','Nhà Thờ Đức Bà Paris',NULL,'nha-tho-duc-ba-paris','2026-06-19 16:48:34.313690',1),(60,_binary '',145000.00,'Charles Duhigg','NXB Thế Giới','9786047761121',2020,440,115,'2026-06-19 16:49:30.696956','Giải thích cơ chế hình thành và cách thức thay đổi thói quen để làm chủ cuộc sống cá nhân và doanh nghiệp.',_binary '\0','Sức Mạnh Của Thói Quen',125000.00,'suc-manh-cua-thoi-quen','2026-06-19 16:49:30.696956',3),(61,_binary '',115000.00,'Jane Austen','NXB Văn Học','9786049821128',2019,480,90,'2026-06-19 16:50:36.018551','Câu chuyện tình yêu lãng mạn trắc trở đầy hiểu lầm giữa Darcy kiêu hãnh và Elizabeth định kiến.',_binary '\0','Kiêu Hãnh Và Định Kiến',NULL,'kieu-hanh-va-dinh-kien','2026-06-19 16:50:36.018551',1),(62,_binary '',76000.00,'George S. Clason','NXB Tổng hợp TP.HCM','9786045892211',2018,185,240,'2026-06-19 16:57:38.282668','Những bí quyết làm giàu và quản lý tài chính hiệu quả nhất từ thành phố Babylon cổ đại.',_binary '\0','Người Giàu Nhất Thành Babylon',65000.00,'nguoi-giau-nhat-thanh-babylon','2026-06-19 16:57:38.282668',2),(63,_binary '',115000.00,'Stephen Hawking','NXB Trẻ','9786041084322',2016,320,60,'2026-06-19 17:00:42.526709','Cuốn sách phổ biến khoa học vũ trụ, hố đen và sự hình thành thế giới của nhà vật lý thiên tài Stephen Hawking.',_binary '\0','Lược Sử Thời Gian',99000.00,'luoc-su-thoi-gian-1','2026-06-19 17:00:42.526709',5),(64,_binary '',89000.00,'David J. Lieberman','NXB Lao Động','9786045952216',2017,250,130,'2026-06-19 17:01:49.468310','Cẩm nang tâm lý giúp bạn thấu hiểu suy nghĩ, cảm xúc ẩn giấu của đối phương qua cử chỉ hành vi.',_binary '\0','Đọc Vị Bất Kỳ Ai',NULL,'doc-vi-bat-ky-ai','2026-06-19 17:01:49.468310',8),(65,_binary '',95000.00,'Christine Liêu','NXB Thanh Niên','9786043351120',2022,280,170,'2026-06-19 17:03:32.446338','Cuốn sách giúp bạn tỉnh táo nhận ra những cạm bẫy tâm lý và bảo vệ bản thân trước sự thao túng.',_binary '\0','Không Phải Sói Nhưng Cũng Đừng Là Cừu',NULL,'khong-phai-soi-nhung-cung-dung-la-cuu','2026-06-19 17:03:32.446338',8),(66,_binary '',55000.00,'Luis Sepúlveda','NXB Hội Nhà Văn','9786049697111',2019,140,110,'2026-06-19 17:09:27.980498','Một câu chuyện ngụ ngôn giàu chất thơ về mối quan hệ giữa con người hoang dã và thiên nhiên đại ngàn Amazon.',_binary '\0','Lão Già Mê Đọc Truyện Tình',48000.00,'lao-gia-me-doc-truyen-tinh','2026-06-19 17:09:27.980498',1),(67,_binary '',110000.00,'Trác Nhã','NXB Văn Học','9786049543322',2018,400,400,'2026-06-19 17:10:26.585787','Hướng dẫn chi tiết kỹ năng giao tiếp giúp bạn thành công trong phỏng vấn, đàm phán và cuộc sống hàng ngày.',_binary '\0','Khéo Ăn Nói Sẽ Được Thiên Hạ',NULL,'kheo-an-noi-se-duoc-thien-ha','2026-06-19 17:10:26.585787',3),(68,_binary '',108000.00,'José Mauro de Vasconcelos','NXB Hội Nhà Văn','9786043382211',2020,244,380,'2026-06-19 17:11:26.521734','Câu chuyện u buồn nhưng vô cùng đẹp đẽ về tình yêu thương, sự thấu hiểu đối với cậu bé tinh nghịch Zezé.',_binary '\0','Cây Cam Cam Của Tôi',95000.00,'cay-cam-cam-cua-toi','2026-06-19 17:11:26.521734',1),(69,_binary '',140000.00,'Keith Ferrazzi','NXB Trẻ','9786041121119',2019,390,220,'2026-06-19 17:12:16.021594','Bí quyết xây dựng mạng lưới mối quan hệ sâu sắc, bền vững để phục vụ cuộc sống và sự nghiệp.',_binary '\0','Đừng Bao Giờ Đi Ăn Một Mình',120000.00,'dung-bao-gio-di-an-mot-minh','2026-06-19 17:12:16.021594',3),(70,_binary '',125000.00,'Nikolai Ostrovsky','NXB Văn Học','9786046973322',2015,580,50,'2026-06-19 17:39:16.082972','Cuốn sách gối đầu giường của nhiều thế hệ, khắc họa ý chí sắt đá kiên cường của người chiến sĩ Pavel.',_binary '\0','Thép Đã Tôi Thế Đấy',NULL,'thep-da-toi-the-day','2026-06-19 17:39:16.082972',1),(71,_binary '',60000.00,'Jack London','NXB Văn Học','9786049540025',2016,210,90,'2026-06-19 17:44:29.246568','Cuốn tiểu thuyết kể về Buck - chú chó nhà bị bắt cóc trở thành chó kéo xe và quay về với bản năng hoang dã.',_binary '\0','Tiếng Gọi Nơi Hoang Dã',50000.00,'tieng-goi-noi-hoang-da','2026-06-19 17:44:29.246568',1),(72,_binary '',110000.00,'Zig Ziglar','NXB Lao Động','9786045934412',2021,290,140,'2026-06-19 17:45:27.244890','Cẩm nang nâng cao nghệ thuật thuyết phục, chăm sóc khách hàng và bán hàng từ sự chân thành.',_binary '\0','Bán Hàng Bằng Trái Tim',NULL,'ban-hang-bang-trai-tim','2026-06-19 17:45:27.244890',2),(73,_binary '',75000.00,'Đoàn Giỏi','NXB Kim Đồng','9786042223316',2022,310,180,'2026-06-19 17:46:56.711532','Bản tình ca về thiên nhiên trù phú, con người hào sảng, bất khuất của vùng đất Nam Bộ thời kỳ kháng chiến.',_binary '\0','Đất Rừng Phương Nam',65000.00,'dat-rung-phuong-nam','2026-06-19 17:46:56.711532',1),(74,_binary '',52000.00,'Camilo Cruz','NXB Trẻ','9786041098817',2017,160,310,'2026-06-20 13:29:09.230851','Bài học sâu sắc về việc rũ bỏ những lời bao biện, lý do để tiến tới thành công đích thực trong cuộc sống.',_binary '\0','Ngày Xưa Có Một Con Bò',45000.00,'ngay-xua-co-mot-con-bo','2026-06-20 13:29:09.230851',3),(75,_binary '',55000.00,'Antoine de Saint-Exupéry','NXB Kim Đồng','9786042168914',2020,108,600,'2026-06-20 13:30:19.009305','Câu chuyện triết lý nhẹ nhàng về cuộc gặp gỡ giữa một phi công và cậu hoàng tử nhỏ đến từ tiểu tinh cầu xa xôi.',_binary '\0','Hoàng Tử Bé',NULL,'hoang-tu-be','2026-06-20 13:30:19.009305',1),(76,_binary '',175000.00,'Fyodor Dostoevsky','NXB Văn Học','9786049823412',2018,710,55,'2026-06-20 13:31:17.612420','Cuốn tiểu thuyết tâm lý sâu sắc về sự dằn vặt lương tâm của một kẻ giết người để thử nghiệm lý thuyết.',_binary '\0','Tội Ác Và Hình Phạt',150000.00,'toi-ac-va-hinh-phat','2026-06-20 13:31:17.612420',1),(77,_binary '',110000.00,'George Orwell','NXB Hội Nhà Văn','9786049692215',2019,360,65,'2026-06-20 13:32:54.658604','Tác phẩm giả tưởng kinh điển phản ánh xã hội độc tài và sự kiểm soát tư tưởng ngột ngạt.',_binary '\0','1984',NULL,'1984','2026-06-20 13:32:54.658604',1),(78,_binary '',115000.00,'Đặng Hoàng Giang','NXB Hội Nhà Văn','9786043385519',2021,312,250,'2026-06-20 13:34:45.403407','Cuốn sách mổ xẻ những góc tối tổn thương, căn bệnh trầm cảm và tâm lý của con người hiện đại.',_binary '\0','Đại Dương Đen',99000.00,'dai-duong-den','2026-06-20 13:34:45.403407',8),(79,_binary '',68000.00,'Andy Andrews','NXB Lao Động','9786045981122',2022,160,85,'2026-06-20 13:36:18.804571','Phân tích cách những quyết định nhỏ nhặt hàng ngày có thể làm thay đổi hoàn toàn cục diện tương lai của bạn.',_binary '\0','Hiệu Ứng Bướm',58000.00,'hieu-ung-buom','2026-06-20 13:36:18.804571',3),(80,_binary '',98000.00,'Harper Lee','NXB Văn Học','9786046985433',2017,420,140,'2026-06-20 13:38:17.238290','Câu chuyện xúc động qua góc nhìn trẻ thơ về nạn phân biệt chủng tộc, công lý và tình yêu thương con người tại Mỹ.',_binary '\0','Giết Con Chim Nhạn',85000.00,'giet-con-chim-nhan','2026-06-20 13:38:17.238290',1),(81,_binary '',120000.00,'Haruki Murakami','NXB Hội Nhà Văn','9786049695544',2018,450,130,'2026-06-20 13:47:44.649614','Câu chuyện trầm buồn về tình yêu, sự cô đơn, mất mát và những trăn trở lớn lên của người trẻ tại Nhật Bản.',_binary '\0','Rừng Na Uy',NULL,'rung-na-uy','2026-06-20 13:47:44.649614',1),(82,_binary '',210000.00,'Daniel Kahneman','NXB Thế Giới','9786047754328',2019,612,70,'2026-06-20 13:49:04.547255','Tác phẩm tâm lý học phân tích sâu hai hệ thống tư duy kiểm soát hành vi và quyết định của con người.',_binary '\0','Tư Duy Nhanh Và Chậm',185000.00,'tu-duy-nhanh-va-cham','2026-06-20 13:49:04.547255',8),(83,_binary '',165000.00,'Jim Collins','NXB Trẻ','9786041091122',2019,480,120,'2026-06-22 14:08:44.369419','Phân tích những yếu tố cốt lõi giúp các công ty vươn lên thành những đế chế vĩ đại trường tồn.',_binary '\0','Từ Tốt Đến Vĩ Đại',145000.00,'tu-tot-den-vi-dai','2026-06-22 14:08:44.369419',2),(84,_binary '',210000.00,'Benjamin Graham','NXB Thế Giới','9786047712345',2020,550,85,'2026-06-22 14:09:49.644097','Cẩm nang kinh điển về đầu tư giá trị, giúp bạn xây dựng chiến lược tài chính an toàn và bền vững.',_binary '\0','Nhà Đầu Tư Thông Minh',NULL,'nha-dau-tu-thong-minh','2026-06-22 14:09:49.644097',2),(85,_binary '',135000.00,'Dan Ariely','NXB Lao Động','9786045956789',2018,380,200,'2026-06-22 14:10:48.956877','Khám phá những lực lượng vô hình chi phối các quyết định kinh tế và hành vi hàng ngày của chúng ta.',_binary '\0','Phi Lý Trí',115000.00,'phi-ly-tri','2026-06-22 14:10:48.956877',2),(86,_binary '',128000.00,'Eckhart Tolle','NXB Tổng hợp TP.HCM','9786045812345',2020,360,180,'2026-06-22 14:12:50.992843','Cuốn sách tâm linh thực tế giúp bạn rũ bỏ cái tôi, tìm lại sự bình yên và ý nghĩa thực sự của cuộc đời.',_binary '\0','Thức Tỉnh Mục Đích Sống',110000.00,'thuc-tinh-muc-dich-song','2026-06-22 14:12:50.992843',3),(87,_binary '',65000.00,'Luis Sepúlveda','NXB Hội Nhà Văn','9786049612345',2019,144,400,'2026-06-22 14:16:54.687836','Câu chuyện cảm động và sâu sắc về tình yêu thương vô điều kiện, bất chấp sự khác biệt giống loài.',_binary '\0','Chuyện Con Mèo Dạy Hải Âu Bay',55000.00,'chuyen-con-meo-day-hai-au-bay','2026-06-22 14:16:54.687836',4),(88,_binary '',95000.00,'Kuroyanagi Tetsuko','NXB Văn Học','9786046912345',2021,350,250,'2026-06-22 14:18:00.746991','Hồi ký tuổi thơ tuyệt đẹp về một phương pháp giáo dục tự do, tôn trọng sự phát triển tự nhiên của trẻ nhỏ.',_binary '\0','Totto-chan Bên Cửa Sổ',NULL,'totto-chan-ben-cua-so','2026-06-22 14:18:00.746991',4),(89,_binary '',75000.00,'Lewis Carroll','NXB Kim Đồng','9786042112345',2018,200,150,'2026-06-22 14:19:04.503279','Chuyến phiêu lưu kỳ ảo của cô bé Alice rơi xuống hang thỏ và bước vào một thế giới đầy màu sắc, vô lý.',_binary '\0','Alice Ở Xứ Sở Thần Tiên',60000.00,'alice-o-xu-so-than-tien','2026-06-22 14:19:04.503279',4),(90,_binary '',195000.00,'Carl Sagan','NXB Dân Trí','9786048812345',2020,500,70,'2026-06-22 14:20:14.325899','Tác phẩm khoa học đại chúng kinh điển đưa người đọc vào chuyến du hành khám phá không gian và thời gian.',_binary '\0','Vũ Trụ',175000.00,'vu-tru','2026-06-22 14:20:14.325899',5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` bigint NOT NULL,
  `book_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cart_items_cart` (`cart_id`),
  KEY `FK_cart_items_book` (`book_id`),
  CONSTRAINT `FK_cart_items_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_carts_user` (`user_id`),
  CONSTRAINT `FK_carts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2026-05-10 12:13:02.829336','2026-05-10 12:13:02.829336',3),(2,'2026-05-10 12:13:13.061872','2026-05-10 12:13:13.061872',1),(3,'2026-05-10 12:13:36.431204','2026-05-10 12:13:36.431204',2),(4,'2026-06-19 16:13:24.649950','2026-06-19 16:13:24.649950',20);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_categories_slug` (`slug`),
  KEY `FK_categories_parent` (`parent_id`),
  CONSTRAINT `FK_categories_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,_binary '','2026-04-01 08:01:00.000000','Tiểu thuyết, truyện ngắn, thơ ca Việt Nam và thế giới','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=400&fit=crop','Văn học','van-hoc',NULL),(2,_binary '','2026-04-01 08:01:01.000000','Sách kinh doanh, tài chính, đầu tư','https://res.cloudinary.com/daytrfyrg/image/upload/v1778415727/wearora/categories/n562k2uwjzvq6vahnmwx.jpg','Kinh tế','kinh-t',NULL),(3,_binary '','2026-04-01 08:01:02.000000','Kỹ năng mềm, phát triển bản thân, tư duy','https://images.unsplash.com/photo-1506880018603-83d5b814b5a6?w=400&h=400&fit=crop','Kỹ năng sống','ky-nang-song',NULL),(4,_binary '','2026-04-01 08:01:03.000000','Sách truyện tranh, truyện thiếu nhi','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=400&fit=crop','Thiếu nhi','thieu-nhi',NULL),(5,_binary '','2026-04-01 08:01:04.000000','Khoa học tự nhiên, vật lý, hóa học, sinh học','https://images.unsplash.com/photo-1532012197267-da84d127e765?w=400&h=400&fit=crop','Khoa học','khoa-hoc',NULL),(6,_binary '','2026-04-01 08:01:05.000000','Giáo trình đại học, cao đẳng, phổ thông','https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=400&h=400&fit=crop','Giáo trình','giao-trinh',NULL),(7,_binary '','2026-04-01 08:01:06.000000','Truyện tranh manga, comic trong và ngoài nước','https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=400&h=400&fit=crop','Truyện tranh','truyen-tranh',NULL),(8,_binary '','2026-04-01 08:01:07.000000','Tâm lý học, sức khỏe tinh thần','https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=400&h=400&fit=crop','Tâm lý','tam-ly',NULL),(9,_binary '','2026-04-01 08:01:08.000000','Lịch sử Việt Nam và thế giới','https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=400&h=400&fit=crop','Lịch sử','lich-su',NULL),(10,_binary '','2026-04-01 08:01:09.000000','Lập trình, công nghệ thông tin, AI','https://images.unsplash.com/photo-1550399105-c4db5fb85c18?w=400&h=400&fit=crop','Công nghệ','cong-nghe',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('NEW','READ','REPLIED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'2026-05-10 13:01:04.707172','contact1778392862510@test.com','Nội dung liên hệ test 1778392862510','Khách Test 1778392862510','NEW','Hỗ trợ test 1778392862510'),(2,'2026-05-10 13:30:26.132830','contact1778394624047@test.com','Nội dung liên hệ test 1778394624047','Khách Test 1778394624047','REPLIED','Hỗ trợ test 1778394624047'),(3,'2026-05-10 20:08:26.381240','contact1778418504117@test.com','Nội dung liên hệ test 1778418504117','Khách Test 1778418504117','NEW','Hỗ trợ test 1778418504117'),(4,'2026-05-10 20:27:05.085508','contact1778419622867@test.com','Nội dung liên hệ test 1778419622867','Khách Test 1778419622867','NEW','Hỗ trợ test 1778419622867');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` enum('PERCENTAGE','FIXED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` decimal(12,2) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `min_order_amount` decimal(12,2) DEFAULT NULL,
  `start_date` datetime(6) NOT NULL,
  `usage_limit` int DEFAULT NULL,
  `used_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_coupons_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,_binary '\0','WELCOME10','Giảm 10% cho đơn hàng đầu tiên','PERCENTAGE',10.00,'2027-12-31 23:59:59.000000',50000.00,100000.00,'2026-04-01 00:00:00.000000',100,0),(2,_binary '\0','SACH50K','Giảm 50.000đ cho đơn mua sách','FIXED',50000.00,'2027-12-31 23:59:59.000000',NULL,200000.00,'2026-04-01 00:00:00.000000',50,0),(3,_binary '\0','FREESHIP','Miễn phí vận chuyển toàn quốc','FIXED',30000.00,'2027-12-31 23:59:59.000000',NULL,0.00,'2026-04-01 00:00:00.000000',200,0);
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('ORDER','PROMOTION','SYSTEM') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notifications_user` (`user_id`),
  CONSTRAINT `FK_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(12,2) NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `order_id` bigint NOT NULL,
  `book_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_items_order` (`order_id`),
  KEY `FK_order_items_book` (`book_id`),
  CONSTRAINT `FK_order_items_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,169000.00,'https://images.unsplash.com/photo-1550399105-c4db5fb85c18?w=800&h=1000&fit=crop','Lập Trình Viên Thực Dụng',2,338000.00,1,12),(2,99000.00,'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=800&h=1000&fit=crop','Astro Boy',1,99000.00,1,11),(3,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,2,1),(4,169000.00,'https://images.unsplash.com/photo-1550399105-c4db5fb85c18?w=800&h=1000&fit=crop','Lập Trình Viên Thực Dụng',1,169000.00,3,12),(5,120000.00,'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=800&h=1000&fit=crop','Nghệ Thuật Yêu',1,120000.00,3,10),(6,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,4,1),(7,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',1,39000.00,5,1),(8,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,6,1),(9,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,7,1),(10,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,8,1),(11,39000.00,'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=800&h=1000&fit=crop','Chí Phèo',2,78000.00,9,1),(12,99000.00,'https://res.cloudinary.com/daytrfyrg/image/upload/v1778415971/wearora/books/dfroxlaohbg86fguytbi.jpg','Cha Giàu Cha Nghèo',1,99000.00,10,3),(13,169000.00,'https://images.unsplash.com/photo-1550399105-c4db5fb85c18?w=800&h=1000&fit=crop','Lập Trình Viên Thực Dụng',1,169000.00,11,12),(14,78000.00,'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?w=800&h=1000&fit=crop','Cho Tôi Xin Một Vé Đi Tuổi Thơ',1,78000.00,12,9);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `discount_amount` decimal(12,2) DEFAULT NULL,
  `final_amount` decimal(12,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('COD','VNPAY') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('PENDING','PAID','REFUNDED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shipping_fee` decimal(12,2) DEFAULT NULL,
  `status` enum('PENDING','CONFIRMED','SHIPPING','DELIVERED','CANCELLED','RETURNED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_orders_order_code` (`order_code`),
  KEY `FK_orders_user` (`user_id`),
  CONSTRAINT `FK_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-05-10 19:27:29.237376',0.00,467000.00,NULL,'BS1778416049234','COD','PENDING','1111, Xã Liên Chung, Huyện Tân Yên, Tỉnh Bắc Giang, Nguyễn Văn Admin - 0987676767 (Nguyễn Văn Admin)',30000.00,'CONFIRMED',437000.00,'2026-05-10 19:28:02.391160',1),(2,'2026-05-10 19:31:45.410437',0.00,108000.00,NULL,'BS1778416305410','COD','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'PENDING',78000.00,'2026-05-10 19:31:45.410437',3),(3,'2026-05-10 19:31:51.822944',0.00,319000.00,NULL,'BS1778416311822','VNPAY','PENDING','1111, Xã Liên Chung, Huyện Tân Yên, Tỉnh Bắc Giang, Nguyễn Văn Admin - 0987676767 (Nguyễn Văn Admin)',30000.00,'PENDING',289000.00,'2026-05-10 19:31:51.822944',1),(4,'2026-05-10 19:45:36.329768',0.00,108000.00,NULL,'BS1778417136328','VNPAY','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'PENDING',78000.00,'2026-05-10 19:45:36.329768',3),(5,'2026-05-10 19:47:52.377983',0.00,69000.00,NULL,'BS1778417272372','VNPAY','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'PENDING',39000.00,'2026-05-10 19:47:52.377983',3),(6,'2026-05-10 19:49:19.822707',0.00,108000.00,NULL,'BS1778417359822','VNPAY','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'PENDING',78000.00,'2026-05-10 19:49:19.822707',3),(7,'2026-05-10 20:02:06.078351',0.00,108000.00,NULL,'BS1778418126078','COD','PAID','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'DELIVERED',78000.00,'2026-06-12 19:33:47.508039',3),(8,'2026-05-10 20:19:48.525044',0.00,108000.00,NULL,'BS1778419188525','COD','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'SHIPPING',78000.00,'2026-05-10 20:20:52.503970',3),(9,'2026-05-10 20:21:06.934582',0.00,108000.00,NULL,'BS1778419266934','COD','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'SHIPPING',78000.00,'2026-06-19 16:05:41.907325',3),(10,'2026-06-19 16:06:28.280725',0.00,129000.00,NULL,'BS1781859988279','VNPAY','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'CONFIRMED',99000.00,'2026-06-19 16:12:41.426952',3),(11,'2026-06-19 16:07:30.171548',0.00,199000.00,NULL,'BS1781860050170','COD','PENDING','123 Đường ABC, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội, Người nhận test - 0911223344 (Người nhận test)',30000.00,'PENDING',169000.00,'2026-06-19 16:07:30.171548',3),(12,'2026-06-19 16:14:25.730712',0.00,108000.00,NULL,'BS1781860465729','COD','PENDING','73/21 Trần Thị Điệu, Phường Tăng Nhơn Phú A, Thành phố Thủ Đức, Thành phố Hồ Chí Minh, Phạm Minh Hiếu - 0918063406 (Phạm Minh Hiếu)',30000.00,'CONFIRMED',78000.00,'2026-06-19 16:15:04.639899',20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vnpay_response_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_payments_order` (`order_id`),
  CONSTRAINT `FK_payments_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,319000.00,'2026-05-10 19:40:10.860195',NULL,'VNPAY','PENDING','BS1778416311822',NULL,3),(2,108000.00,'2026-05-10 19:45:36.349799',NULL,'VNPAY','PENDING','BS1778417136328',NULL,4),(3,69000.00,'2026-05-10 19:47:52.592380',NULL,'VNPAY','PENDING','BS1778417272372',NULL,5),(4,108000.00,'2026-05-10 19:49:19.857996',NULL,'VNPAY','PENDING','BS1778417359822',NULL,6);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `processed_at` datetime(6) DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_amount` decimal(12,2) DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_returns_order` (`order_id`),
  KEY `FK_returns_user` (`user_id`),
  CONSTRAINT `FK_returns_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_returns_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int NOT NULL,
  `visible` bit(1) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `book_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reviews_order` (`order_id`),
  KEY `FK_reviews_book` (`book_id`),
  KEY `FK_reviews_user` (`user_id`),
  CONSTRAINT `FK_reviews_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK_reviews_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_reviews_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_config`
--

DROP TABLE IF EXISTS `shipping_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dmajg14rd0c78cj3kjc11kbte` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_config`
--

LOCK TABLES `shipping_config` WRITE;
/*!40000 ALTER TABLE `shipping_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_configs`
--

DROP TABLE IF EXISTS `shipping_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_configs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_fee` decimal(12,2) NOT NULL DEFAULT '0.00',
  `free_shipping_threshold` decimal(12,2) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_configs`
--

LOCK TABLES `shipping_configs` WRITE;
/*!40000 ALTER TABLE `shipping_configs` DISABLE KEYS */;
INSERT INTO `shipping_configs` VALUES (1,'Giao Hàng Nhanh (GHN)',30000.00,300000.00,_binary '\0','2026-04-01 08:06:00.000000','2026-04-01 08:06:00.000000');
/*!40000 ALTER TABLE `shipping_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_at` datetime(6) DEFAULT NULL,
  `estimated_delivery` datetime(6) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipped_at` datetime(6) DEFAULT NULL,
  `status` enum('PENDING','PICKED_UP','IN_TRANSIT','DELIVERED','FAILED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_shippings_order` (`order_id`),
  CONSTRAINT `FK_shippings_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippings`
--

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` VALUES (1,'GHN',NULL,NULL,NULL,NULL,'PENDING','WR19178145B567',7),(2,'GHN',NULL,NULL,NULL,NULL,'PENDING','WR19252502CDFD',8),(3,'GHN',NULL,NULL,NULL,NULL,'PENDING','WR599418651DB2',9);
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('CUSTOMER','ADMIN','STAFF') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'2026-04-01 08:00:00.000000','admin@bookstorm.com',_binary '','Nguyễn Văn Admin','$2a$10$.hbB9Et.uH446a31SK4dm.B73ZSHKh7u5ETqQVHIL0VUllcNZl3.u','0901000001','ADMIN','2026-04-01 08:00:00.000000'),(2,NULL,'2026-04-01 08:00:01.000000','staff@bookstorm.com',_binary '','Trần Thị Staff','$2a$10$.hbB9Et.uH446a31SK4dm.B73ZSHKh7u5ETqQVHIL0VUllcNZl3.u','0901000002','STAFF','2026-04-01 08:00:01.000000'),(3,NULL,'2026-04-01 08:00:02.000000','mai@gmail.com',_binary '','Phạm Thị Mai','$2a$10$.hbB9Et.uH446a31SK4dm.B73ZSHKh7u5ETqQVHIL0VUllcNZl3.u','0987654321','CUSTOMER','2026-05-10 20:26:31.172576'),(4,NULL,'2026-05-10 12:32:05.548585','testuser1778391125474@example.com',_binary '','Test User 1778391125474','$2a$10$O6NmlPOvJgU5H/JLl2MWfunDg4.tQBZg0AqK6kJMY0xLaSTDMEm/y','0900125474','CUSTOMER','2026-05-10 12:32:05.548585'),(5,NULL,'2026-05-10 12:36:30.864280','testuser1778391390790@example.com',_binary '','Test User 1778391390790','$2a$10$FZmd5YrHVowYxIU.o1UgYO7V1SJ5vgLjS5IVvU/8MFWmeZ/8CwqqS','0900390790','CUSTOMER','2026-05-10 12:36:30.864280'),(6,NULL,'2026-05-10 12:43:36.553308','testuser1778391816499@example.com',_binary '','Test User 1778391816499','$2a$10$7Wty8LaV6c0Vjtw2WlCZHunxdYFXoDmIBGw.XxVQzTnqQ4ezhhe7u','0900816499','CUSTOMER','2026-05-10 20:20:52.663890'),(7,NULL,'2026-05-10 12:52:27.331946','testuser1778392347257@example.com',_binary '','Test User 1778392347257','$2a$10$SqZOFkUwh5FYRana97nYI.NRCFvsvVkPa4S4/kNxBX4HgJ6/5Oj1K','0900347257','CUSTOMER','2026-05-10 20:20:52.708971'),(8,NULL,'2026-05-10 13:18:56.192290','curl-test-1778393936@x.com',_binary '','Test User Curl','$2a$10$HCdK7twGn4qkFkTDnCMbYu7LswzNG5bhGJxvgQc584r/i.T.L7/Wy','0900111222','CUSTOMER','2026-05-10 13:18:56.192290'),(9,NULL,'2026-05-10 13:25:51.704788','flowtest1778394349456@example.com',_binary '','Test User 1778394349456','$2a$10$P7a4NWq7Bjt2GwHT9zW6au7/8Sy3fTg4FkO/tbtoSKVNp9PSWP5hW','0994349456','CUSTOMER','2026-05-10 13:25:51.704788'),(10,NULL,'2026-05-10 13:25:55.072476','ct01-1778394352816@test.com',_binary '','Test 1778394352816','$2a$10$qeZIwwIF4yXH/BkJUrW/VutDCaXEbBGy6EQStk.JFmVipxHeBQXXq','0994352816','CUSTOMER','2026-05-10 13:25:55.072476'),(11,NULL,'2026-05-10 13:26:20.563244','testuser1778394380491@example.com',_binary '','Test User 1778394380491','$2a$10$cVlpCywFTH2YIsSBwbyptO0m0AsLdZ93lxtAvX/CClB29/IX4Ktky','0900380491','CUSTOMER','2026-05-10 13:26:20.563244'),(12,NULL,'2026-05-10 13:26:25.039072','flowtest1778394382780@example.com',_binary '','Test User 1778394382780','$2a$10$xFaNr8zYeC.l63FdSGbIBeSMyoOFcMscABoZ4aQXyez4DWn3fN1XG','0994382780','CUSTOMER','2026-05-10 13:26:25.039072'),(13,NULL,'2026-05-10 13:28:46.583796','ct01-1778394524341@test.com',_binary '','Test 1778394524341','$2a$10$coG4cY13m02NScjmwt6TbuDyA3Z5QDYPaWQK8jUb1pGvNtCmelQFG','0994524341','CUSTOMER','2026-05-10 13:28:46.583796'),(14,NULL,'2026-05-10 20:01:52.366536','testuser1778418112283@example.com',_binary '','Test User 1778418112283','$2a$10$7xWKIRIYDdb5X.pNlfGpVe0l1FqCirtJgN0vcr/.3UAsPkiI/Oqki','0900112283','CUSTOMER','2026-05-10 20:01:52.366536'),(15,NULL,'2026-05-10 20:04:02.933302','flowtest1778418240556@example.com',_binary '','Test User 1778418240556','$2a$10$IXAKOoYfcdZNhIkmoEU25.Q92oieiYfQC6OoAVhGG96WZOXuqOeXa','0918240556','CUSTOMER','2026-05-10 20:04:02.933302'),(16,NULL,'2026-05-10 20:06:43.732437','ct01-1778418401338@test.com',_binary '','Test 1778418401338','$2a$10$hNEibPRsQc9dKZa.oW7Gfee6mpKyNYnClcWVk77cUDaOBxj65VBcq','0918401338','CUSTOMER','2026-05-10 20:06:43.732437'),(17,NULL,'2026-05-10 20:20:54.471689','testuser1778419254406@example.com',_binary '','Test User 1778419254406','$2a$10$BGHZ.dJY91MwxKnJSCRnLOgZa5wWbJi6QiH/8igxDYzIZ8UJMEyfi','0900254406','CUSTOMER','2026-05-10 20:20:54.471689'),(18,NULL,'2026-05-10 20:23:00.817739','flowtest1778419378472@example.com',_binary '','Test User 1778419378472','$2a$10$2HzIcX3snOkHE0y5zxuaVe.b9sfToAWN75tkOlZI1EKwOO6e25f4K','0919378472','CUSTOMER','2026-05-10 20:23:00.817739'),(19,NULL,'2026-05-10 20:25:23.320121','ct01-1778419521012@test.com',_binary '','Test 1778419521012','$2a$10$yH833ygOs4v/y.HbDd6DDeWMlOpaCOhVoQdYGBWzHmxGELmeA1LPW','0919521012','CUSTOMER','2026-05-10 20:25:23.320121'),(20,NULL,'2026-06-19 16:13:16.286783','minhhieu@gmail.com',_binary '','Phạm Minh Hiếu','$2a$10$ACkuCtk2dNUZS6iMSGYKQORpSWTem/ugL0SY4.8reU0KGglPJPWee','0918063406','ADMIN','2026-06-19 16:16:39.158583');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `book_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_wishlists_user_book` (`user_id`,`book_id`),
  UNIQUE KEY `UKqantvi8dvhsq7r5j6qbbbym5r` (`user_id`,`book_id`),
  KEY `FK_wishlists_book` (`book_id`),
  CONSTRAINT `FK_wishlists_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `FK_wishlists_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (7,'2026-05-10 13:42:43.576791',3,3),(11,'2026-05-10 20:26:22.409350',2,3);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookstorm_db'
--

--
-- Dumping routines for database 'bookstorm_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-29 11:38:19
