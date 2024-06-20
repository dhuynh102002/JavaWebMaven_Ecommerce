-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 07:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlbh`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(255) NOT NULL,
  `code` char(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `code`, `name`) VALUES
(1, 'SAMSUNG', 'Samsung'),
(2, 'IPHONE', 'Iphone'),
(3, 'OPPO', 'Oppo'),
(4, 'DELL', 'Dell'),
(5, 'MACBOOK', 'MacBook'),
(6, 'ASUS', 'Asus'),
(7, 'IPAD', 'iPad');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(255) NOT NULL,
  `code` char(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`) VALUES
(1, 'LAPTOP', 'Laptop'),
(2, 'DIENTHOAI', 'Điện thoại'),
(3, 'PHUKIEN', 'Phụ kiện'),
(4, 'TABLET', 'Tablet');

-- --------------------------------------------------------

--
-- Table structure for table `chitietmagiamgia`
--

CREATE TABLE `chitietmagiamgia` (
  `id` int(255) NOT NULL,
  `id_magiamgia` int(255) NOT NULL,
  `id_sanphamchinh` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietmagiamgia`
--

INSERT INTO `chitietmagiamgia` (`id`, `id_magiamgia`, `id_sanphamchinh`) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ctbrand`
--

CREATE TABLE `ctbrand` (
  `id` int(255) NOT NULL,
  `id_brand` int(255) NOT NULL,
  `id_category` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ctbrand`
--

INSERT INTO `ctbrand` (`id`, `id_brand`, `id_category`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 1, 4),
(8, 3, 4),
(9, 7, 4),
(10, 1, 3),
(11, 2, 3),
(12, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cthd`
--

CREATE TABLE `cthd` (
  `id` int(255) NOT NULL,
  `id_hoadon` int(255) NOT NULL,
  `id_spc` int(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cthd`
--

INSERT INTO `cthd` (`id`, `id_hoadon`, `id_spc`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 500000),
(2, 1, 4, 10, 800000),
(3, 2, 1, 1, 5000000),
(4, 2, 4, 4, 1800000),
(5, 3, 7, 11, 2000000),
(6, 4, 1, 20, 2000000),
(7, 5, 8, 34, 3400000),
(8, 5, 6, 20, 2400000),
(11, 8, 3, 2, 26990000),
(12, 8, 6, 1, 20000000),
(13, 9, 1, 1, 21790000),
(14, 9, 5, 1, 25990000),
(15, 9, 10, 1, 14390000),
(16, 9, 14, 2, 5700000);

-- --------------------------------------------------------

--
-- Table structure for table `ctpn`
--

CREATE TABLE `ctpn` (
  `id` int(255) NOT NULL,
  `id_phieunhap` int(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ctpn`
--

INSERT INTO `ctpn` (`id`, `id_phieunhap`, `quantity`, `price`) VALUES
(1, 1, 20, 300000000);

-- --------------------------------------------------------

--
-- Table structure for table `ctpx`
--

CREATE TABLE `ctpx` (
  `id` int(255) NOT NULL,
  `id_phieuxuat` int(255) NOT NULL,
  `id_spncc` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ctpx`
--

INSERT INTO `ctpx` (`id`, `id_phieuxuat`, `id_spncc`, `quantity`, `price`) VALUES
(1, 1, 1, 10, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `id` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`id`, `id_user`, `phone`, `address`, `createdAt`, `updatedAt`, `status`) VALUES
(1, 2, '0327037177', 'ABC/123456', '2023-10-20 18:16:12.000000', '2023-09-23 13:33:02.000000', 4),
(2, 3, '0357977736', 'BCD/455', '2023-09-27 18:16:12.000000', '2023-10-30 13:33:07.000000', 4),
(3, 5, '0523716041', '123ABC', '2023-10-12 20:46:34.000000', '2023-10-24 20:46:34.000000', 4),
(4, 5, '0523716046', '12A3ABC', '2023-10-15 20:46:34.000000', '2023-10-22 20:46:34.000000', 4),
(5, 8, '0328321810', '124A nguyÃ¡Â»Ân lÃÂ¢m', '2023-10-11 20:51:14.000000', '2023-11-01 14:07:32.000000', 4),
(8, 1, '0123456789', '123, đường abc, quận 1, tphcm', '2024-06-18 20:37:48.000000', '2024-06-18 20:37:48.000000', 1),
(9, 1, '123456789', '456, đường abc, quận 1, tphcm', '2024-06-20 11:38:20.000000', '2024-06-20 11:38:20.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `magiamgia`
--

CREATE TABLE `magiamgia` (
  `id` int(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `magiamgia`
--

INSERT INTO `magiamgia` (`id`, `discount`, `code`) VALUES
(1, 20, 'MAGIAM20'),
(2, 15, 'MAGIAM15'),
(3, 50, 'MAGIAM50'),
(4, 47, 'MAGIAM47');

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL,
  `status` int(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`id`, `name`, `phone`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'Samsung', 357845612, 1, '2023-09-27 18:21:43.000000', '2023-09-27 18:21:43.000000'),
(2, 'Apple', 478944541, 1, '2023-09-27 18:22:36.000000', '2023-09-27 18:22:36.000000');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `code`) VALUES
(1, 'Admin', 'ADMIN'),
(2, 'Nhân viên', 'STAFF'),
(3, 'Khách hàng', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `phieunhap`
--

CREATE TABLE `phieunhap` (
  `id` int(11) NOT NULL,
  `id_ncc` int(255) NOT NULL,
  `createdAT` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phieunhap`
--

INSERT INTO `phieunhap` (`id`, `id_ncc`, `createdAT`) VALUES
(1, 1, '2023-10-22 20:51:14.000000'),
(2, 2, '2023-09-27 18:25:10.000000'),
(3, 1, '2023-09-27 18:25:24.000000'),
(4, 2, '2023-09-27 18:25:35.000000');

-- --------------------------------------------------------

--
-- Table structure for table `phieuxuat`
--

CREATE TABLE `phieuxuat` (
  `id` int(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phieuxuat`
--

INSERT INTO `phieuxuat` (`id`, `createdAt`) VALUES
(1, '2023-09-27 18:25:52.000000'),
(2, '2023-09-27 18:25:59.000000'),
(3, '2023-09-27 18:26:09.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sanphamchinh`
--

CREATE TABLE `sanphamchinh` (
  `id` int(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(255) NOT NULL,
  `id_spncc` varchar(255) NOT NULL,
  `rating` float NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanphamchinh`
--

INSERT INTO `sanphamchinh` (`id`, `quantity`, `price`, `id_spncc`, `rating`, `discount`) VALUES
(1, 15, 21790000, '1', 7.5, 31),
(2, 30, 17000000, '2', 9.5, 10),
(3, 10, 26990000, '3', 9.5, 5),
(4, 10, 20000000, '4', 8, 5),
(5, 5, 25990000, '5', 8.5, 3),
(6, 5, 20000000, '6', 8.5, 3),
(7, 10, 23990000, '7', 8.5, 5),
(8, 5, 31000000, '8', 9, 3),
(9, 10, 7490000, '9', 8, 10),
(10, 10, 14390000, '10', 9.5, 6),
(11, 10, 9790000, '11', 8.5, 30),
(12, 5, 3490000, '12', 8.5, 30),
(13, 10, 1190000, '13', 8.5, 20),
(14, 10, 5700000, '14', 9.5, 7),
(15, 5, 3100000, '15', 8.5, 20),
(16, 5, 2485000, '16', 9.5, 10),
(17, 5, 890000, '17', 8.5, 10),
(18, 10, 24190000, '18', 9.5, 10),
(19, 10, 14490000, '19', 8.5, 0),
(20, 5, 17990000, '20', 9.5, 30),
(21, 5, 30990000, '21', 8.5, 24),
(22, 5, 7100000, '22', 8.5, 15),
(23, 5, 7190000, '23', 7.5, 10),
(24, 5, 15990000, '24', 9.5, 30);

-- --------------------------------------------------------

--
-- Table structure for table `spncc`
--

CREATE TABLE `spncc` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_ctbrand` int(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `origin` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_producer` int(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `image3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `spncc`
--

INSERT INTO `spncc` (`id`, `name`, `id_ctbrand`, `description`, `updatedAt`, `origin`, `quantity`, `price`, `image`, `id_producer`, `image1`, `image2`, `image3`) VALUES
(1, 'Samsung Galaxy S23 Ultra 5G 256GB', 1, 'Màn hình: Dynamic AMOLED 2X6.8\"Quad HD+ (2K+)%%Hệ điều hành: Android 13%%Camera sau: Chính 200 MP & Phụ 12 MP, 10 MP, 10 MP%%Camera trước: 12 MP%%Chip: Snapdragon 8, Gen 2 for Galaxy%%RAM: 8 GB%%Dung lượng lưu trữ: 256 GB%%SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 5000 mAh45 W', '2023-09-27 18:27:53.000000', 'South Korea', 20, 21790000, 'https://promart.vteximg.com.br/arquivos/ids/7284532-1000-1000/image-2744b4b532e343529b324ea78202d435.jpg?v=638248775702800000\r\n', 1, 'https://d1rlzxa98cyc61.cloudfront.net/catalog/product/cache/1801c418208f9607a371e61f8d9184d9/d/m/dm3_s23_ultra_green_2023_4_1.jpg\r\n\r\n', 'https://media-cdn.bnn.in.th/269587/Samsung-Smartphone-Galaxy-S23-Ultra-5G-7-square_medium.jpg', 'https://csdam.net/digitalcontent/0/4973/49736201.jpg'),
(2, 'Iphone 11 pro max', 2, 'Màn hình: OLED, 6.1\", Super Retina XDR\r\nHệ điều hành: iOS 14%%Camera sau: 2 camera 12 MP%%Camera trước: 12MP%%Chip: Apple A14 Bionic%%RAM: 4GB/256GB%%SIM: 1 Nano SIM & 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 2815 mAh, 20 W', '2023-09-27 18:32:00.000000', 'USA', 15, 15000000, 'https://shop.compasia.com/cdn/shop/files/iphone-11-pro-max-compasia-malaysia-1_c0d47107-ae6e-4883-8ed2-9d5faeba8480.jpg?v=1690819424', 2, 'https://www.certifiedtechdirect.com/assets/alt_3/IPHA2218GRN64GBN.jpg?20220808112321', 'https://cdn.alloallo.media/catalog/product/apple/iphone/iphone-11-pro-max/iphone-11-pro-max-space-gray-front.jpg', 'https://i.ebayimg.com/images/g/7h0AAOSwL8lkUmH6/s-l1200.webp'),
(3, 'Iphone 13 pro max', 2, 'Màn hình: OLED, 6.7\", Super Retina XDR\r\nHệ điều hành: iOS 15%%Camera sau: 3 camera 12 MP%%Camera trước: 12 MP%%Chip: Apple A15 Bionic%%RAM: 6GB/256GB%%SIM: 1 Nano SIM & 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 4352 mAh, 20 W', '2023-10-02 11:37:56.000000', 'USA', 20, 25000000, 'https://www.labtech.dk/image.php?mwidth=1000&mheight=1000&filename=/upload/globalicecat/APPLE/MLLF3QN_A/93841439_3439300548.jpg&type=jpg', 2, 'https://mrcellular.co.il/wp-content/uploads/2022/05/3CUfbE75ZA6CLoYTE49vvzE29effXchDx8k7S6TJ.jpg', 'https://media-cdn.bnn.in.th/140559/iPhone_13_Pro_Max_Graphite_2-square_medium.jpg', 'https://media-cdn.bnn.in.th/140562/iPhone_13_Pro_Max_Graphite_5-square_medium.jpg'),
(4, 'Oppo Find X3 Pro', 3, 'Màn hình: AMOLED, 6.7\", Quad HD+ (2K+)%%Hệ điều hành: Android 11%%Camera sau: Chính 50 MP & Phụ 50 MP%%Camera trước: 12 MP%%Chip: Snapdragon 888%%RAM: 12GB/256GB%%SIM: 2 Nano SIM, Hỗ trợ 5G%%Pin, Sạc: 4500 mAh, 65 W', '2023-10-01 11:52:20.000000', 'USA', 20, 21490000, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_27526/oppo-find-x3-pr_multi_5_523_450.png.webp', 2, 'https://www.negoce.ci/974-large_default/oppo-find-x3-pro-12256gb.jpg', 'https://product.hstatic.net/200000458129/product/upload_8ae1620283964f5881f7191947261e75.jpg', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/7/18/8889bda2-1660-441f-9dc7-0a72ee093c67.jpg'),
(5, 'Dell Vostro 5620 i7', 4, 'CPU: i71260P2.1GHz\r\n%%RAM: 16 GBDDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)3200 MHz\r\n%%Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))\r\n%%Màn hình: 16\"Full HD+ (1920 x 1200)\r\n%%Card màn hình: Card tích hợpIntel Iris Xe\r\n%%Cổng kết nối: HDMILAN (RJ45)Jack tai nghe 3.5 mm2 x USB 3.2USB Type-C (Power Delivery and DisplayPort)\r\n%%Đặc biệt: Có đèn bàn phím\r\n%%Hệ điều hành: Windows 11 Home SL + Office Home & Student vĩnh viễn\r\n%%Thiết kế: Nắp lưng và chiếu nghỉ tay bằng kim loại\r\n%%Kích thước, khối lượng: Dài 356.78 mm - Rộng 251.9 mm - Dày 17.95 mm - Nặng 1.9', '2023-10-01 12:00:20.000000', 'USA', 10, 27990000, 'https://kimlongcenter.com/upload/product/dell-vostro-5620-v6i5001w1-1.jpg', 2, 'https://chinhnhan.vn/uploads/product/laptop/Dell/dell-vostro-5620-p117f001agr.jpg', 'https://songphuong.vn/Content/uploads/2022/07/Laptop-Dell-Vostro-5620-P117F001AGR-songphuong.vn-04.jpg', 'https://product.hstatic.net/200000710483/product/22143_laptop_dell_vostro_5620_70296963_3_890c2fe74fd249b4b91918d969c2c25d.jpg'),
(6, 'Asus TUF Gaming F15 FX506LHB i5', 6, 'CPU: i510300H2.5GHz%%RAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)2933 MHz%%Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)%%Màn hình: 15.6\"Full HD (1920 x 1080) 144Hz%%Card màn hình: Card rờiGTX 1650 4GB%%Cổng kết nối: HDMILAN (RJ45)USB 2.0Jack tai nghe 3.5 mm2 x USB 3.21x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC%%Đặc biệt: Có đèn bàn phím%%Hệ điều hành: Windows 11 Home SL%%Thiết kế: Vỏ nhựa%%Kích thước, khối lượng: Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg%%Thời điểm ra mắt: 2021', '2023-10-01 12:01:12.000000', 'USA', 10, 20990000, 'https://cdn.hoanghamobile.com/i/preview/Uploads/2022/07/18/image-removebg-preview-2_637937503478936645.png', 2, 'https://file.hstatic.net/1000026716/file/gearvn-laptop-asus-tuf-gaming-f15-fx506lhb-hn188w-3_372926b825b14dbd9baebac3b273c60b.png', 'https://img1.datcart.com/wp-content/uploads/2021/01/ASUS_TUF_Gaming_F15_FX506LU-HN146T_FX506LU-HN146T_image_5-510x510.jpg', 'https://www.tncstore.vn/image/cache/catalog/laptop/asus/TUF%20A17/laptop-asus-tuf-a17-1-500x500.jpg'),
(7, 'Samsung Galaxy S21', 1, 'Màn hình: Dynamic AMOLED 2X, 6.8\", Quad HD+ (2K+)%%Hệ điều hành: Android 1%%Camera sau: Chính 108 MP & Phụ 12 MP%%Camera trước: 40 MP%%Chip: Exynos 2100%%RAM: 12GB/128GB%%SIM: 2 Nano SIM hoặc 1%%Nano SIM + 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 5000 mAh, 25 W', '2023-10-01 12:05:00.000000', 'South Korea', 20, 25990000, 'https://mobileworld.com.vn/uploads/product/12_2020/galaxy-s21-ultra-5g-128gb-moi-100-fullbox-ban-my-2sim-chip-snapdragon-888-1.png', 1, 'https://www.samsungshop.tn/18105-large_default/galaxy-s21-ultra-5g-prix-tunisie.jpg', 'https://hd2.tudocdn.net/952960?w=550&h=550', 'https://www.mobhi.it/23156-home_default/Array.jpg'),
(8, 'MacBook Ari M2', 5, 'CPU: Apple M2100GB/s%%RAM: 16 GB%%Ổ cứng: 512 GB SSD%%Màn hình: 13.6\"Liquid Retina (2560 x 1664)%%Card màn hình: Card tích hợp10 nhân GPU%%Cổng kết nối: Jack tai nghe 3.5 mmMagSafe 32 x Thunderbolt 3%%Đặc biệt: Có đèn bàn phím%%Hệ điều hành: Mac OS%%Thiết kế: Vỏ kim loại%%Kích thước, khối lượng: Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg%%Thời điểm ra mắt: 6/2022', '2023-10-01 12:07:14.000000', 'USA', 10, 32990000, 'https://st1.myideasoft.com/idea/dw/66/myassets/products/368/apple-macbook-air-13-m1-8gb-256gb-ssd-silver-52056.jpeg?revision=1695022850', 2, 'https://futureworld.com.vn/media/catalog/product/cache/4dbf4504e0d2fdef53ffcd9886d02b04/m/a/macbook_air_m2_silver_pdp_image_position-3__vn_1_1.jpg', 'https://img2.cgtrader.com/items/3906966/0a392fe230/large/apple-macbook-air-m2-silver-2022-3d-model-max-obj-3ds-fbx-blend-dae.jpg', 'https://i.pinimg.com/736x/05/b8/d5/05b8d552c1e280fc830acada5d353e94.jpg'),
(9, 'iPad 9 WiFi 64GB', 9, 'Màn hình: 10.2\"Retina IPS LCD%%Hệ điều hành: iPadOS 15%%Chip: Apple A13 Bionic%%RAM: 3 GB%%Dung lượng lưu trữ: 64 GB%%Kết nối: Nghe gọi qua FaceTime%%Camera sau: 8 MP%%Camera trước: 12 MP%%Pin, Sạc: 32.4 Wh (~ 8600 mAh)20 W', '2023-10-09 18:50:13.000000', 'USA', 15, 7490000, 'https://songtuanmobile.vn/uploads/Ipad/GEN_9/ipad-gen-9-wifi-gray.jpg', 2, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_32081/may-tinh-bang-i_multi_2_942_450.png.webp', 'https://d2j6dbq0eux0bg.cloudfront.net/images/20081222/2409988304.jpg', 'https://buytec.it/cdn/shop/files/apple-apple-ipad-pro-2020-11-wi-fi-cell-4g-256-gb-space-gray-mxe42ty-a-b-mxe42ty-a-b2-50258298437961_1200x1200.jpg?v=1689612236'),
(10, 'iPad Air 5 M1 WiFi 64GB', 9, 'Màn hình: 10.9\"Retina IPS LCD%%Hệ điều hành: iPadOS 15%%Chip: Apple M1%%RAM: 8 GB%%Dung lượng lưu trữ: 64 GB%%Kết nối: Nghe gọi qua FaceTime%%Camera sau: 12 MP%%Camera trước: 12 MP%%Pin, Sạc: 28.6 Wh (~ 7587 mAh)20 W', '2023-10-09 19:00:46.000000', 'USA', 15, 14390000, 'https://phucanhcdn.com/media/product/46977_tab_app_ip109w_2021_64g_gr.jpg', 2, 'https://cdn-ipoint.waugi.com.ar/20993-thickbox_default/109-inch-ipad-air-wi-fi-cellular-64gb-space-grey.jpg', 'https://api.shopdx.vn/file//Upload/Images/Orther/Orther637989168314840004.png', 'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_92483345/mobile_786_587_png/APPLE-5.-Nesil-10.9%22-256GB-iPad-Air-Wi-Fi-Tablet-Uzay-Grisi-MM9L3TU-A'),
(11, 'Samsung Galaxy Tab S7 FE 4G', 7, 'Màn hình:12.4\"TFT LCD%%Hệ điều hành:Android 11\r\n%%Chip:Snapdragon 750G%%RAM:4 GB%%Dung lượng lưu trữ:64 GB%%Kết nối:Hỗ trợ 4G, Có nghe gọi%%SIM:1 Nano SIM%%Camera sau:8 MP%%Camera trước:5 MP\r\n%%Pin, Sạc:10090 mAh45 W', '2023-10-09 19:12:36.000000', 'South Korea', 10, 9790000, 'https://img.ws.mms.shopee.vn/72148edd9f65a97b93a9c049a74e45e1', 2, 'https://www.anhkhoamobile.vn/Uploads/images/Product/2022/11/Tab%20S7%20FE%202_1113.jpg', 'https://cdn.tgdd.vn/Products/Images/2102/251693/bao-da-khong-ban-phim-samsung-galaxy-tab-s7-fe-600x600.jpg', 'https://media.ldlc.com/r1600/ld/products/00/05/85/68/LD0005856861_1_0005856866.jpg'),
(12, 'Bluetooth Samsung Galaxy Buds 2 \r\nPro R510N', 10, 'Thời gian tai nghe: Dùng 5 giờ - Sạc Khoảng 70 phút%%Thời gian hộp sạc: Dùng 23 giờ - Sạc Khoảng 130 phút%%Cổng sạc: Type-CSạc không dây%%Công nghệ âm thanh: Active Noise Cancelling, 360 Reality Audio, Ambient Sound, Âm thanh Hi-Fi%%Tương thích: Android, iOS(iPhone), Windows%%Ứng dụng kết nối: SmartThings%%Tiện ích: Chống nước IPX7, Hỗ trợ sạc không dây Qi, Sạc nhanh, Chống ồn chủ động ANC, 3 Micro chống ồn%5Hỗ trợ kết nối: Bluetooth 5.3%%Điều khiển bằng: Cảm ứng chạm', '2023-10-09 19:28:36.000000', 'South Korea', 5, 3490000, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_31576/tai-nghe-blueto_main_617_1020.png.webp', 1, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_31576/tai-nghe-blueto_multi_5_706_450.png.webp', 'https://cf.shopee.vn/file/vn-11134207-7qukw-ljl61l3rc050ea', 'https://bizweb.dktcdn.net/thumb/1024x1024/100/344/561/products/tai-nghe-bluetooth-true-wireless-galaxy-buds2-pro-tim-5.jpg?v=1668763402670'),
(13, 'Adapter USB Type C PD 65W Samsung EP-T6530', 10, 'Model: EP-T6530%%Chức năng: Sạc%%Đầu vào: AC 100-240V%%Đầu ra: USB (5V - 2A, 9V - 1.67A (Max 15W)), Type-C1 - PDO (5V - 3A, 9V - 3A, 15V - 3A, 20V - 3.25A (Max 65W)), Type-C1 - PPS (SFC 2.0 - Max 45W)), Type-C2 - PDO (5V - 3A, 9V - 2.77A (Max 25W)), Type-C2 - PPS (SFC 25W)%%Dòng sạc tối đa: 65 W%%Kích thước: Dài 10.8 cm - Ngang 5.2 cm - Cao 3 cm%%Công nghệ/Tiện ích: Power Delivery%Sản xuất tại: Việt Nam', '2023-10-09 19:36:16.000000', 'South Korea', 10, 1190000, 'https://images.samsung.com/is/image/samsung/p6pim/vn/ep-t6530nbegww/gallery/vn-65w-power-adapter-trio-ep-t6530-ep-t6530nbegww-531251127?$720_576_JPG$', 1, 'https://images.samsung.com/is/image/samsung/p6pim/vn/ep-t6530nbegww/gallery/vn-65w-power-adapter-trio-ep-t6530-ep-t6530nbegww-531250724?$650_519_PNG$', 'https://tabletplaza.vn/images/thumbnails/1125/800/detailed/21/adapter-sac-nhanh-65w-samsung-trio-ep-t6530n-3.jpg', 'https://bachlongmobile.com/media/catalog/product/cache/2/image/040ec09b1e35df139433887a97daa66f/s/a/sac-samsung-chinh-hang-65-w-1.jpg'),
(14, 'Bluetooth AirPods Pro (2nd Gen)', 11, 'Thời gian tai nghe: Dùng 6 giờ%%Thời gian hộp sạc: Dùng 30 giờ%%Cổng sạc: Lightning, Sạc không dây Qi, Sạc MagSafe%%Công nghệ âm thanh: Adaptive EQ, Active Noise Cancellation, Chip Apple H2%%Tương thích: Android, iOS, Windows%%Tiện ích: Chống nước IPX4, Sạc không dây, Có mic thoại, Sạc nhanh, Chống ồn chủ động ANC, Trợ lý ảo Siri%%Hỗ trợ kết nối: Bluetooth 5.3%%Điều khiển bằng: Cảm ứng chạm', '2023-10-09 19:48:57.000000', 'USA', 10, 5700000, 'https://cdn.mediamart.vn/images/product/apple-tai-nghe-bluetooth-airpod-pro-2-mqd83---chinh-hang_f6cb28f6.jpg', 2, 'https://ducnguyenstore.com/assets/shops/2021_11/airpods-pro-2-600x600.jpeg', 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_167.jpg', 'https://didongthongminh.vn/upload_images/images/2022/09/13/6(1).jpg'),
(15, 'Apple Pencil (gen 2)', 11, 'Thời gian sạc đầy: Khoảng 45 phút%%Kích thước: Dài 16.6 cm - Đường kính 0.89 cm%%Khối lượng: Khoảng 20.7 g%%Thời gian sử dụng pin: Khoảng 4 tiếng%%Tương thích thiết bị: iPad mini 6, iPad Pro 12.9 inch (Gen 3,4,5,6), iPad Pro 11 inch (Gen 1,2,3,4), iPad Air (Gen 4,5)%%Bluetooth: Có%%Cách kết nối: Sạc nam châm với iPad Pro', '2023-10-09 19:55:19.000000', 'USA', 5, 3100000, 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MK0C2?wid=4000&hei=4000&fmt=jpeg&qlt=95&.v=1564075356758', 2, 'https://m.media-amazon.com/images/I/51c1l--SS0L._AC_UF894,1000_QL80_.jpg', 'https://macstore.id/wp-content/uploads/2017/08/orig.jpeg', 'https://easymac.co/wp-content/uploads/2021/06/Apple-Pencil-primera-generacion-3.jpg'),
(16, 'Chuột Bluetooth Gaming ASUS ROG Gladius III', 12, 'Tương thích: Windows%%Độ phân giải: 26000 DPI\r\nCách kết nối: Đầu thu USB Receiver, Bluetooth, Dây cắm USB%%Độ dài dây / Khoảng cách kết nối: 10 m%%Đèn LED: RGB%%Ứng dụng điều khiển: Armoury Crate%%Loại pin: Pin sạc%%Thời gian: Dùng 85 giờ%%Cổng sạc: USB Type-C%%Trọng lượng: 89 g', '2023-10-09 20:00:59.000000', 'USA', 5, 2485000, 'https://cdn.tgdd.vn/Products/Images/86/309762/chuot-bluetooth-gaming-asus-rog-gladius-iii-1.jpg', 2, 'https://gearshop.vn/upload/images/Product/Asus/Chu%E1%BB%99t/ROG%20GLADIUS%20II%20CORE/ROG-GLADIUS-II-CORE-(3).png', 'https://product.hstatic.net/1000333506/product/h732__2__1e9c0550507a41e9a7f3d2959c19a615_e25a9adc294d47cb993b5e494e65bbc0.png', 'https://www.tncstore.vn/image/cache/catalog/chu%E1%BB%99t/Asus/ROG%20Gladius%20III%20Wireless%20Aimpoint%20Black/chuot-khong-day-asus-rog-gladius-iii-wireless-aimpoint-black-3-500x500.jpg'),
(17, 'Bàn Phím Gaming Asus TUF K1', 12, 'Tương thích: Windows%%Cách kết nối: Dây cắm USB%%Độ dài dây / Khoảng cách kết nối: 1.8 m%%Loại switch: Không%%Kiểu bàn phím: Full size%%Số phím: 104 Phím%%Đèn LED: RGB%%Phần mềm hỗ trợ : Armoury Crate%%Kích thước: Nặng 810 g (bàn phím)', '2023-10-09 20:06:22.000000', 'USA', 5, 890000, 'https://cdn.tgdd.vn/Products/Images/4547/279466/co-day-gaming-asus-tuf-k1-1.jpg', 2, 'https://cdn.tgdd.vn/Products/Images/4547/279466/co-day-gaming-asus-tuf-k1-2.jpg', 'https://www.asus.com/media/global/gallery/eba7pwpyylqszfhv_setting_xxx_0_90_end_2000.png', 'https://bizweb.dktcdn.net/thumb/grande/100/410/941/products/3-1f66664d-2c22-4888-9d7a-653ed655bd7d.jpg?v=1634717135340'),
(18, 'Dell Inspiron 16 5620 i7', 4, 'CPU: i71255U1.7GHz%%RAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz%%Ổ cứng: 512 GB SSD NVMe PCIe%%Màn hình: 16\"Full HD+ (1920 x 1200)%%Card màn hình: Card tích hợpIntel UHD%%Cổng kết nối: HDMIJack tai nghe 3.5 mmUSB Type-C (Power Delivery and DisplayPort)2 x USB 3.2%%Đặc biệt: Có đèn bàn phím%%Hệ điều hành: Windows 11 Home SL + Office Home & Student vĩnh viễn%%Thiết kế: Vỏ kim loại%%Kích thước, khối lượng: Dài 356.7 mm - Rộng 251.9 mm - Dày 17.95 mm - Nặng 1.87 kg%%Thời điểm ra mắt: 2022', '2023-10-09 09:20:29.000000', 'USA', 10, 24190000, 'https://www.dellonline.co.za/cdn/shop/products/D3C18545-0E93-44D1-BDD9-41C8678DD81B_124966_800x.jpg?v=1664196836', 2, 'https://lh3.googleusercontent.com/9zAUmOdErwl-D-QEtk1SVF-ac9a33LQqhAKFIBEvDccPZg12j4rLZrs84k4q6BCXy8VzVRo55gstTuUhOnw3twhxnZg3wC5o=rw\r\n', 'https://images.thinkgroup.vn/unsafe/686x686/https://media-api-beta.thinkpro.vn/media/core/products/2022/5/27/Dell%20Inspiron%2016%205620%204.png', 'https://bizweb.dktcdn.net/thumb/large/100/362/971/products/odinn516adl2301-6009-m2c-traditional-laptops-34933317304484-800x-8555db49-3bbd-4b06-950e-e688b442e38d.webp?v=1679110759233'),
(19, 'Samsung Galaxy S23 FE 5G', 1, 'Màn hình: Dynamic AMOLED 2X6.4\"Full HD+%%Hệ điều hành: Android 13%%Camera sau: Chính 50 MP & Phụ 12 MP, 8 MP%%Camera trước: 10 MP\r\nChip: Exynos 2200 8 nhân%%RAM: 8 GB%%Dung lượng lưu trữ: 128 GB%%SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 4500 mAh25 W', '2023-10-09 09:31:14.000000', 'South Korea', 10, 14490000, 'https://lequanmobile.com/wp-content/uploads/2023/08/Samsung-Tab-S9-Plus-5G-4.png', 1, 'https://images.frandroid.com/wp-content/uploads/2023/06/galaxy-s23-fe-2.jpeg', 'https://www.journaldugeek.com/content/uploads/2023/06/galaxy-s23-fe-3.jpg', 'https://congngheviet.com/wp-content/uploads/2023/06/Galaxy-S23-FE-render-02.webp'),
(20, 'Điện thoại Samsung Galaxy Z Flip5 5G 256GB', 1, 'Màn hình: Chính Dynamic AMOLED 2X, Phụ Super AMOLED, Chính 6.7\" & Phụ 3.4\" Full HD+%%Hệ điều hành:Android 13%%Camera sau:2 camera 12 MP\r\nCamera trước:10 MP%%Chip:Snapdragon 8 Gen 2 for Galaxy%%RAM:8 GB%%Dung lượng lưu trữ:256 GB%%SIM:1 Nano SIM & 1 eSIMHỗ trợ 5G%%Pin, Sạc:3700 mAh25 W', '2023-10-01 12:07:14.000000', 'South Korea', 10, 17990000, 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_32845/samsung-galaxy-_main_615_1020.png.webp', 1, 'https://images.fpt.shop/unsafe/fit-in/585x390/filters:quality(5):fill(white)/fptshop.com.vn/Uploads/Originals/2023/8/9/638271957052778853_samsung-galaxy-z-flip5-xanh-4.jpg', 'https://hc.com.vn/i/ecommerce/media/GS.010392_FEATURE_132803.jpg', 'https://magento.senq.com.my/media/catalog/product/f/l/flip5_mint-1.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=&width='),
(21, 'Điện thoại Samsung Galaxy Z Fold5 5G 256GB', 1, 'Màn hình: Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Quad HD+ (2K+)%%Hệ điều hành: Android 13%%Camera sau: Chính 50 MP & Phụ 12 MP, 10 MP%%Camera trước: 10 MP & 4 MP%%Chip: Snapdragon 8 Gen 2 for Galaxy%%RAM: 12 GB%%Dung lượng lưu trữ: 256 GB%%SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G%%Pin, Sạc:4400 mAh25 W', '2023-10-01 12:05:00.000000', 'South Korea', 10, 30990000, 'https://salt.tikicdn.com/cache/550x550/ts/product/91/8d/44/22ad8cd310258153f8dc646a0adda320.png', 1, 'https://onewaymobile.vn/images/products/2023/07/27/original/samsung-fold-5-1_1690465949.png', 'https://ae04.alicdn.com/kf/S2e079544645343cfa8ebf54c5f426760i.jpg_640x640.jpg', 'https://www.vienquangmobile.com/vnt_upload/product/thumbs/(600x600)_samsung_galaxy_fold_4_kem_vienquangmobile.png'),
(22, 'Điện thoại Samsung Galaxy A34 5G', 1, 'Màn hình: Super AMOLED6.6\"Full HD+%%Hệ điều hành: Android 13%%Camera sau: Chính 48 MP & Phụ 8 MP, 5 MP%%Camera trước: 13 MP%%Chip: MediaTek Dimensity 1080 8 nhân%%RAM: 8 GB%%Dung lượng lưu trữ: 128 GB%%SIM: 2 Nano SIMHỗ trợ 5G%%Pin, Sạc:5000 mAh25 W', '2023-10-01 12:01:12.000000', 'South Korea', 10, 7100000, 'https://cdn.al.to/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_15_10_48_57_671_01.jpg', 1, 'https://file.pico.vn/media/product/44621-sm-a346ezscxxv--2--5-.jpg', 'https://dleyjack4mlu0.cloudfront.net/Custom/Content/Products/50/01/5001_smartphone-samsung-galaxy-a34-128gb-5g-octa-core-6gb-ram-6-6-cam-tripla-selfie-13mp-dual-chip_l6_638189732575679132.jpg', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//catalog-image/99/MTA-126815184/samsung_samsung_galaxy_a34_5g_8gb-256gb_-_8gb-128gb_garansi_resmi_sein_-_grandivo_full55_enbkws0y.jpg'),
(23, 'Điện thoại Samsung Galaxy M34 5G', 1, 'Màn hình: Super AMOLED6.5\"Full HD+%%Hệ điều hành: Android 13%%Camera sau: Chính 50 MP & Phụ 8 MP, 2 MP%%Camera trước: 13 MP%%Chip: Exynos 1280%%RAM: 8 GB%%Dung lượng lưu trữ: 128 GB%%SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ), Hỗ trợ 5G%%Pin, Sạc: 6000 mAh25 W', '2023-10-01 12:00:20.000000', 'South Korea', 10, 7190000, 'https://images.samsung.com/is/image/samsung/p6pim/in/sm-m146bzbhins/gallery/in-galaxy-m-sm-m146bzbhins-front-blue-thumb-537267214?$480_480_PNG$', 1, 'https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/27/m34-6.png', 'https://images.samsung.com/is/image/samsung/p6pim/br/sm-m346bzbdzto/gallery/br-galaxy-m34-5g-sm-m346-sm-m346bzbdzto-thumb-538063716?$480_480_PNG$', 'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture//Apro/Apro_product_33365/samsung-galaxy-_multi_0_207_450.png.webp'),
(24, 'Điện thoại Samsung Galaxy S23 5G', 1, 'Màn hình: Dynamic AMOLED 2X6.1\"Full HD+%%Hệ điều hành: Android 13%%Camera sau: Chính 50 MP & Phụ 12 MP, 10 MP%%Camera trước: 12 MP%%Chip: Snapdragon 8 Gen 2 for Galaxy%%RAM: 8 GB%%Dung lượng lưu trữ: 128 GB%%SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIM, Hỗ trợ 5G%%Pin, Sạc: 3900 mAh25 W', '2023-10-01 11:52:20.000000', 'South Korea', 10, 15990000, 'https://clickbuy.com.vn/uploads/2023/02/ava-s23-green-large.png', 1, 'https://cdn.nguyenkimmall.com/images/detailed/855/10054690-dien-thoai-samsung-galaxy-s23-8gb-128gb-xanh-7.jpg', 'https://media-cdn.bnn.in.th/269122/Samsung-Galaxy-S23-5g-green-3-square_medium.jpg', 'https://eshop.setronic.cz/foto/i590-137671/L5P0G00101-1000-1000.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trangthai`
--

CREATE TABLE `trangthai` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trangthai`
--

INSERT INTO `trangthai` (`id`, `name`) VALUES
(0, 'Khóa'),
(1, 'Hoạt động');

-- --------------------------------------------------------

--
-- Table structure for table `trangthaidonhang`
--

CREATE TABLE `trangthaidonhang` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trangthaidonhang`
--

INSERT INTO `trangthaidonhang` (`id`, `name`) VALUES
(1, 'Đang xác nhận'),
(2, 'Đang chuẩn bị'),
(3, 'Đang giao'),
(4, 'Đã giao');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` char(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `phone`, `email`, `password`, `name`, `createdAt`, `updatedAt`, `status`, `type`) VALUES
(1, '78912378', 'truongdiemhuynh1@gmail.com', '12345', 'Hải', '2023-09-27 09:57:44.000000', '2024-06-20 11:37:09.000000', 1, 3),
(2, '0327037172', '', 'hai123', 'Hải', '2023-09-27 09:57:44.000000', '2023-09-27 09:57:44.000000', 1, 1),
(3, '0357977738', '', 'Kha123', 'Hải', '2023-09-27 09:59:44.000000', '2023-09-27 09:59:44.000000', 1, 2),
(4, '4', '', '4', '4', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 1, 2),
(5, '1234567890', '', 'password123', 'Hải', '2023-10-22 16:08:09.000000', '2023-10-22 16:08:09.000000', 1, 1),
(6, '123', 'cbc@gmail.com', '123456', 'abc', '2023-10-22 16:41:57.000000', '2024-06-17 13:22:14.000000', 1, 3),
(7, 'cc', '', 'c', 'Hải', '2023-10-22 16:48:13.000000', '2023-10-29 21:44:56.000000', 1, 3),
(8, 'c', '', 'c', 'Hải', '2023-10-22 16:48:46.000000', '2023-10-22 16:48:46.000000', 1, 3),
(9, 'd', '', 'd', 'Hải', '2023-10-22 16:59:10.000000', '2023-10-22 16:59:10.000000', 1, 1),
(10, 'e', '', 'bbb', 'Hải', '2023-10-22 20:03:29.000000', '2023-10-23 15:46:44.000000', 1, 3),
(11, '0523716043', '', 'aa', 'Hải', '2023-10-23 16:03:12.000000', '2023-10-29 21:41:50.000000', 1, 3),
(12, 'ccc', '', 'vcdammit', 'e', '2023-10-23 16:05:02.000000', '2023-10-23 22:05:52.000000', 0, 3),
(13, '123', '', '123', 'Hải', '2023-10-30 21:05:45.000000', '2023-10-30 21:05:45.000000', 1, 1),
(14, 'khatop', '', 'khatop', 'khaa', '2023-11-01 14:34:29.000000', '2023-11-01 14:34:47.000000', 0, 1),
(17, '123456789', 'truonganhhuynh1210@gmail.com', '123456', 'abc123', '2024-06-16 12:41:18.000000', '2024-06-16 12:41:18.000000', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chitietmagiamgia`
--
ALTER TABLE `chitietmagiamgia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ctbrand`
--
ALTER TABLE `ctbrand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cthd`
--
ALTER TABLE `cthd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ctpn`
--
ALTER TABLE `ctpn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ctpx`
--
ALTER TABLE `ctpx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magiamgia`
--
ALTER TABLE `magiamgia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phieuxuat`
--
ALTER TABLE `phieuxuat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanphamchinh`
--
ALTER TABLE `sanphamchinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spncc`
--
ALTER TABLE `spncc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trangthai`
--
ALTER TABLE `trangthai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trangthaidonhang`
--
ALTER TABLE `trangthaidonhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chitietmagiamgia`
--
ALTER TABLE `chitietmagiamgia`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ctbrand`
--
ALTER TABLE `ctbrand`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cthd`
--
ALTER TABLE `cthd`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ctpn`
--
ALTER TABLE `ctpn`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ctpx`
--
ALTER TABLE `ctpx`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `magiamgia`
--
ALTER TABLE `magiamgia`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `phieuxuat`
--
ALTER TABLE `phieuxuat`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sanphamchinh`
--
ALTER TABLE `sanphamchinh`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `spncc`
--
ALTER TABLE `spncc`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `trangthaidonhang`
--
ALTER TABLE `trangthaidonhang`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
