-- Charset/Collation
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `webbh01` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `webbh01`;

-- Table: tbl_catagory
CREATE TABLE IF NOT EXISTS `tbl_catagory` (
  `catagory_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `catName` VARCHAR(255) NOT NULL,
  `catStatus` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`catagory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: tbl_brand
CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `brand_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(255) NOT NULL,
  `catagory_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  KEY `idx_brand_catagory` (`catagory_id`),
  CONSTRAINT `fk_brand_catagory` FOREIGN KEY (`catagory_id`) REFERENCES `tbl_catagory`(`catagory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: tbl_product
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `product_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` INT UNSIGNED DEFAULT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  `product_price` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  `product_color` VARCHAR(100) DEFAULT NULL,
  `product_detail` TEXT,
  `product_maintain` TEXT,
  `product_consult` TEXT,
  `product_img` VARCHAR(512) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `idx_product_brand` (`brand_id`),
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand`(`brand_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: tbl_user
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NOT NULL,
  `user_email` VARCHAR(255) NOT NULL,
  `user_account` VARCHAR(100) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ux_user_email` (`user_email`),
  UNIQUE KEY `ux_user_account` (`user_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: tbl_cart (optional)
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cart_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: tbl_cart_item (optional)
CREATE TABLE IF NOT EXISTS `tbl_cart_item` (
  `cart_item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cart_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`cart_item_id`),
  CONSTRAINT `fk_cartitem_cart` FOREIGN KEY (`cart_id`) REFERENCES `tbl_cart`(`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cartitem_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product`(`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- Sample data
INSERT INTO tbl_catagory (catName, catStatus) VALUES ('Thời trang Nam',1), ('Thời trang Nữ',1);
INSERT INTO tbl_brand (brand_name, catagory_id) VALUES ('Brand A',1), ('Brand B',2);
INSERT INTO tbl_product (brand_id, product_name, product_price, product_color, product_detail, product_maintain, product_consult, product_img)
VALUES
 (1, 'Áo phông Basic', 199000.00, 'Trắng', 'Áo cotton 100%', 'Giặt tay, phơi nơi râm', 'Hotline: 0123', 'NewArrive1.jpg'),
 (2, 'Chân váy Xòe', 299000.00, 'Đỏ', 'Vải voan', 'Giặt khô', 'Hotline: 0456', 'NewArrive2.jpg'),
 (1, 'Áo sơ mi nam', 350000.00, 'Xanh', 'Sơ mi vải lụa', 'Giặt máy nhẹ', 'Hotline: 0789', 'NewArrive3.jpg'),
 (2, 'Váy công sở', 450000.00, 'Đen', 'Váy công sở thanh lịch', 'Giặt khô', 'Hotline: 0456', 'NewArrive4.jpg'),
 (1, 'Quần jeans nam', 400000.00, 'Xanh đậm', 'Quần jeans co giãn', 'Giặt máy', 'Hotline: 0123', 'NewArrive5.jpg'),
 (2, 'Áo khoác nữ', 550000.00, 'Hồng', 'Áo khoác dạ nữ', 'Giặt khô', 'Hotline: 0456', '66b30640dda86.jpg'),
 (1, 'Áo vest nam', 1200000.00, 'Xám', 'Vest nam cao cấp', 'Giặt khô', 'Hotline: 0123', '66b30679c2b52.jpg'),
 (2, 'Chân váy bút chì', 320000.00, 'Be', 'Chân váy bút chì công sở', 'Giặt tay', 'Hotline: 0456', '66b306a1ae406.jpg'),
 (1, 'Áo len nam', 250000.00, 'Nâu', 'Áo len cổ tròn', 'Giặt tay', 'Hotline: 0123', '66bb6fd2775a9.jpg'),
 (2, 'Váy maxi', 600000.00, 'Tím', 'Váy maxi đi biển', 'Giặt máy nhẹ', 'Hotline: 0456', '66bb704e67c40.jpg'),

-- Sample user (LƯU Ý: hash password trước khi dùng thực tế)
INSERT INTO tbl_user (user_name, user_email, user_account, user_password)
VALUES ('Admin','admin@example.com','admin','password123');
