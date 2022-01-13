-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 13, 2022 at 08:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalprojectcnpm`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminID` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminEmail` varchar(150) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminPass` varchar(255) NOT NULL,
  `level` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminID`, `adminName`, `adminEmail`, `adminUser`, `adminPass`, `level`) VALUES
(1, 'dung', 'dunglqd0802@gmail.com', 'dungadmin', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(2, 'Dell'),
(3, 'APPLE'),
(4, 'Samsung'),
(5, 'Oppo');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` varchar(200) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(3, 'Đồng hồ'),
(4, 'Máy tính'),
(6, 'Phụ kiện 2'),
(7, 'Máy tính bảng'),
(8, 'Điện thoại');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zipcode` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zipcode`, `phone`, `email`, `password`) VALUES
(3, 'nhuthuanstore12', '19 Nguyễn Hữu Thọ, Q7, TP HCM', 'tphcm', 'HCM', '700000', '0342548657', 'nhuthuanstore@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_order` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `type` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `product_desc`, `type`, `price`, `image`) VALUES
(6, 'Điện thoại iPhone 11 64GB', 8, 3, '<h3>Apple đ&atilde; ch&iacute;nh thức tr&igrave;nh l&agrave;ng bộ 3 si&ecirc;u phẩm iPhone 11, trong đ&oacute; phi&ecirc;n bản&nbsp;<a title=\"Tham khảo điện thoại iPhone 11 64GB ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-11\" target=\"_blank\">iPhone 11 64GB</a>&nbsp;c&oacute; mức gi&aacute; rẻ nhất nhưng vẫn được n&acirc;ng cấp mạnh mẽ như&nbsp;<a title=\"Tham khảo điện thoại iPhone Xr ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-xr-128gb\" target=\"_blank\">iPhone Xr</a>&nbsp;ra mắt&nbsp;trước đ&oacute;.</h3>', 1, '14990000', 'b8ff7118ca.jpg'),
(7, 'Điện thoại iPhone 13 Pro Max 128GB', 8, 3, '<h3>Apple đ&atilde; ch&iacute;nh thức tr&igrave;nh l&agrave;ng bộ 3 si&ecirc;u phẩm iPhone 11, trong đ&oacute; phi&ecirc;n bản&nbsp;<a title=\"Tham khảo điện thoại iPhone 11 64GB ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-11\" target=\"_blank\">iPhone 11 64GB</a>&nbsp;c&oacute; mức gi&aacute; rẻ nhất nhưng vẫn được n&acirc;ng cấp mạnh mẽ như&nbsp;<a title=\"Tham khảo điện thoại iPhone Xr ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-xr-128gb\" target=\"_blank\">iPhone Xr</a>&nbsp;ra mắt&nbsp;trước đ&oacute;.</h3>\r\n<h3><a title=\"Tham khảo gi&aacute; điện thoại iPhone 13 Pro Max ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-13-pro-max\" target=\"_blank\">iPhone 13 Pro Max 128GB</a>&nbsp;- si&ecirc;u phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ&nbsp;<a title=\"Tham khảo gi&aacute; điện thoại smartphone iPhone ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/apple\" target=\"_blank\">Apple</a>. M&aacute;y c&oacute; thiết kế kh&ocirc;ng mấy đột ph&aacute; khi so với người tiền nhiệm, b&ecirc;n trong đ&acirc;y vẫn l&agrave; một sản phẩm c&oacute; m&agrave;n h&igrave;nh si&ecirc;u đẹp, tần số qu&eacute;t được n&acirc;ng cấp l&ecirc;n 120 Hz mượt m&agrave;, cảm biến camera c&oacute; k&iacute;ch thước lớn hơn, c&ugrave;ng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn s&agrave;ng c&ugrave;ng bạn chinh phục mọi thử th&aacute;ch.</h3>', 0, '32990000', 'c68508ccb5.jpg'),
(10, 'Điện thoại iPhone 12 Pro Max 128GB ', 8, 3, '<h3>Apple đ&atilde; ch&iacute;nh thức tr&igrave;nh l&agrave;ng bộ 3 si&ecirc;u phẩm iPhone 11, trong đ&oacute; phi&ecirc;n bản&nbsp;<a title=\"Tham khảo điện thoại iPhone 11 64GB ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-11\" target=\"_blank\">iPhone 11 64GB</a>&nbsp;c&oacute; mức gi&aacute; rẻ nhất nhưng vẫn được n&acirc;ng cấp mạnh mẽ như&nbsp;<a title=\"Tham khảo điện thoại iPhone Xr ch&iacute;nh h&atilde;ng\" href=\"https://www.thegioididong.com/dtdd/iphone-xr-128gb\" target=\"_blank\">iPhone Xr</a>&nbsp;ra mắt&nbsp;trước đ&oacute;.</h3>', 1, '31990000', '53c786118b.jpg'),
(11, 'IPHONE 13 Pro 128GB', 8, 3, '<h3>Mỗi lần ra mắt phi&ecirc;n bản mới l&agrave; mỗi lần Iphone&nbsp;chiếm s&oacute;ng tr&ecirc;n khắp c&aacute;c mặt trận v&agrave; lần n&agrave;y c&aacute;i t&ecirc;n khiến v&ocirc; số người \"sục s&ocirc;i\" l&agrave;&nbsp;IPHONE 13 Pro, chiếc đi&ecirc;̣n thoại&nbsp;vẫn giữ nguy&ecirc;n thiết kế cao cấp, cụm 3 camera được n&acirc;ng cấp, cấu h&igrave;nh mạnh mẽ c&ugrave;ng thời lượng pin lớn ấn tượng.&nbsp;</h3>', 0, '30990000', '5099b75bc4.jpg'),
(12, 'Samsung Galaxy Z Fold3 5G 256GB', 8, 4, '<h3>Samsung Galaxy Z Fold3 5G, chiếc đi&ecirc;̣n thoại&nbsp;được n&acirc;ng cấp to&agrave;n diện về nhiều mặt, đặc biệt đ&acirc;y l&agrave; điện thoại m&agrave;n h&igrave;nh gập đầu ti&ecirc;n tr&ecirc;n thế giới c&oacute; camera ẩn (08/2021). Sản phẩm sẽ l&agrave; một &ldquo;c&uacute; hit&rdquo; của Samsung&nbsp;g&oacute;p phần mang đến những trải nghiệm mới cho người d&ugrave;ng.</h3>', 1, '41990000', 'aa188844f8.jpg'),
(13, 'Laptop Dell Inspiron 15 3511 i3 1115G4/4GB/256GB/Office H&S/Win11 (P112F001CBL)', 4, 2, '<h3>Sở hữu 1 thiết kế sang trọng, thanh lịch, với cấu h&igrave;nh ổn thoải m&aacute;i đ&aacute;p ứng c&aacute;c t&aacute;c vụ học tập, văn ph&ograve;ng v&agrave; giải tr&iacute; cơ bản, sức mạnh hiệu năng đến từ d&ograve;ng chip Intel thế hệ thứ 11, chắc chắn sẽ l&agrave; lựa chọn vừa mắt, th&iacute;ch th&uacute; khi trải nghiệm d&agrave;nh cho bạn.</h3>', 0, '15290000', '73838ebb53.jpg'),
(14, 'Adapter Sạc VOOC 30W OPPO VC56JAUH ', 6, 5, '<p class=\"short-article__title\">Đặc điểm nổi bật: Tăng tốc độ sạc với&nbsp;<strong>c&ocirc;ng nghệ sạc nhanh&nbsp;VOOC 30 W</strong>.<strong>1 cổng ra&nbsp;USB</strong>&nbsp;tương th&iacute;ch với nhiều c&aacute;p sạc, thiết bị phổ biến tr&ecirc;n thị trường.Thiết kế nhỏ gọn, đẹp mắt, dễ cất giữ v&agrave; mang đi.Thương hiệu&nbsp;OPPO v&agrave; sản xuất tại Trung Quốc, an t&acirc;m về chất lượng.</p>', 0, '518000', 'b5708ab631.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
