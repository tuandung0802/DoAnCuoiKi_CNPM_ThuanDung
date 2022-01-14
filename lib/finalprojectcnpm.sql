-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 14, 2022 at 05:02 PM
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
-- Table structure for table `invoice_order`
--

CREATE TABLE `invoice_order` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_receiver_name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_receiver_address` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_before_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_tax_per` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_after_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_amount_paid` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_amount_due` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `note` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order`
--

INSERT INTO `invoice_order` (`order_id`, `user_id`, `order_date`, `order_receiver_name`, `order_receiver_address`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `note`) VALUES
(687, 123457, '2022-01-14 11:09:03', 'Nhuthuan Store', '19 Nguyen Huu Tho, TP HCM', '273775000', '27377500', '10', '301152500', '', '301152500', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_in`
--

CREATE TABLE `invoice_order_in` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_import_name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_import_address` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_before_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_tax_per` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_after_tax` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_amount_paid` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `order_total_amount_due` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `note` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order_in`
--

INSERT INTO `invoice_order_in` (`order_id`, `user_id`, `order_date`, `order_import_name`, `order_import_address`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `note`) VALUES
(1, 123457, '2022-01-14 15:07:53', 'APPLE', 'Hoa Kì', '5000000', '500000', '10', '5500000', '', '5500000', '');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item`
--

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `item_code` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `item_name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_quantity` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_price` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_final_amount` varchar(250) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order_item`
--

INSERT INTO `invoice_order_item` (`order_item_id`, `order_id`, `item_code`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(4380, 687, '', 'Iphone 13 Promax', '10', '27000000', '270000000'),
(4381, 687, '', 'Cáp sạc nhanh ', '25', '151000', '3775000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item_in`
--

CREATE TABLE `invoice_order_item_in` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `item_code` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `item_name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_quantity` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_price` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `order_item_final_amount` varchar(250) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order_item_in`
--

INSERT INTO `invoice_order_item_in` (`order_item_id`, `order_id`, `item_code`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(4, 1, '', 'Iphone 15', '2', '1000000', '2000000'),
(5, 1, '', 'Iphone 16', '2', '1500000', '3000000');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_user`
--

CREATE TABLE `invoice_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_user`
--

INSERT INTO `invoice_user` (`id`, `email`, `password`, `first_name`, `last_name`, `mobile`, `address`) VALUES
(123457, 'ketoan1@gmail.com', '123456', 'Ke Toan ', '1', 167809743, '749/7 Huỳnh Tấn Phát - TP HCM');

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
  `brandId` int(11) UNSIGNED NOT NULL,
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
  `productId` int(11) UNSIGNED NOT NULL,
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
  `catId` int(11) UNSIGNED NOT NULL,
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
  `id` int(11) UNSIGNED NOT NULL,
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
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
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
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) UNSIGNED NOT NULL,
  `brandId` int(11) UNSIGNED NOT NULL,
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
-- Indexes for table `invoice_order`
--
ALTER TABLE `invoice_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `invoice_order_in`
--
ALTER TABLE `invoice_order_in`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `invoice_order_item_in`
--
ALTER TABLE `invoice_order_item_in`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `invoice_user`
--
ALTER TABLE `invoice_user`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `productId` (`productId`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catId` (`catId`,`brandId`),
  ADD KEY `brandId` (`brandId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_order`
--
ALTER TABLE `invoice_order`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=688;

--
-- AUTO_INCREMENT for table `invoice_order_in`
--
ALTER TABLE `invoice_order_in`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4382;

--
-- AUTO_INCREMENT for table `invoice_order_item_in`
--
ALTER TABLE `invoice_order_item_in`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_user`
--
ALTER TABLE `invoice_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123458;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_order`
--
ALTER TABLE `invoice_order`
  ADD CONSTRAINT `invoice_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `invoice_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invoice_order_in`
--
ALTER TABLE `invoice_order_in`
  ADD CONSTRAINT `invoice_order_in_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `invoice_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  ADD CONSTRAINT `invoice_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `invoice_order` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `invoice_order_item_in`
--
ALTER TABLE `invoice_order_item_in`
  ADD CONSTRAINT `invoice_order_item_in_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `invoice_order_in` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `tbl_category` (`catId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `tbl_brand` (`brandId`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
