# 🛍️ Web Thương Mại Điện Tử - Bán Quần Áo (PHP)


---

## 🎯 Mục tiêu dự án

* Xây dựng cửa hàng quần áo trực tuyến có trải nghiệm mua hàng mượt mà trên web và di động.
* Hỗ trợ catalogue sản phẩm, giỏ hàng, thanh toán, quản trị sản phẩm/đơn hàng, và quản lý người dùng.
* Triển khai nhanh bằng PHP (core PHP hoặc framework như **Laravel** để tăng tốc phát triển).

---

## ✨ Tính năng chính

* Catalog sản phẩm: danh mục, bộ lọc (size, màu, giá), tìm kiếm full‑text.
* Trang sản phẩm: ảnh gallery, biến thể (size/color), mô tả, đánh giá.
* Giỏ hàng & Checkout: tính toán phí vận chuyển, mã giảm giá (coupon), đa hình thức thanh toán.
* Quản lý đơn hàng: đặt hàng, trạng thái (pending → processing → shipped → delivered), email thông báo.
* Quản trị (Admin panel): CRUD sản phẩm, quản lý đơn hàng, quản lý user, báo cáo bán hàng.
* User account: đăng ký/đăng nhập (email/password, OAuth), lịch sử đơn hàng, địa chỉ giao hàng.
* Quản lý kho (inventory) và alert khi hết hàng.
* Tính năng review & rating cho sản phẩm.

---

## 🧩 Công nghệ 

* **Ngôn ngữ:** PHP 8.x
* **Database:** MySQL
* **Search:** MeiliSearch hoặc Elasticsearch cho tính năng search nhanh và faceted filtering

---

## 📁 Cấu trúc thư mục (ví dụ với Laravel)

```
project/
├─ app/
├─ database/
│  ├─ migrations/
│  ├─ seeders/
├─ public/
│  └─ uploads/
├─ resources/
│  └─ views/
├─ routes/
├─ tests/
└─ README.md
```

---

## 🛠️ Hướng dẫn cài đặt nhanh

1. Clone repository:

```bash
git clone https://github.com/yourusername/ecommerce-clothing-php.git
cd ecommerce-clothing-php
```

2. Cài dependencies (Laravel ví dụ):

```bash
composer install
cp .env.example .env
php artisan key:generate
```

3. Cấu hình database trong `.env` và chạy migration + seed:

```bash
php artisan migrate --seed
```

4. Chạy server local:

```bash
php artisan serve --host=0.0.0.0 --port=8000
```

5. Truy cập: `http://localhost:8000`

> Nếu dùng core PHP, import file `database/schema.sql` vào MySQL và cấu hình `config.php`.

---

## 🧾 Database & Seed 

* Bảng: `users`, `products`, `product_variants` (size/color), `categories`, `orders`, `order_items`, `coupons`, `reviews`, `inventory`, `addresses`.
* Seed mẫu: vài tài khoản (admin, customer), 30 sản phẩm với nhiều biến thể, vài đơn hàng demo.

---


Bạn muốn mình làm tiếp phần nào?
