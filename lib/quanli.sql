-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2021 at 03:02 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daili`
--

CREATE TABLE `daili` (
  `Id` int(100) NOT NULL,
  `DisplayName` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `MoreInfo` varchar(200) NOT NULL,
  `ContractDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `input`
--

CREATE TABLE `input` (
  `Id` int(128) NOT NULL,
  `DateInput` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inputinfo`
--

CREATE TABLE `inputinfo` (
  `Id` int(100) NOT NULL,
  `IdObject` int(100) NOT NULL,
  `IdInput` int(100) NOT NULL,
  `Count` int(200) NOT NULL,
  `InputPrice` float NOT NULL,
  `OutputPrice` float NOT NULL,
  `Status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `object`
--

CREATE TABLE `object` (
  `Id` int(128) NOT NULL,
  `DisplayName` varchar(200) NOT NULL,
  `IdUnit` int(100) NOT NULL,
  `IdSuplier` int(100) NOT NULL,
  `QRcode` varchar(200) NOT NULL,
  `BarCode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `output`
--

CREATE TABLE `output` (
  `Id` int(100) NOT NULL,
  `DateOutput` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outputinfo`
--

CREATE TABLE `outputinfo` (
  `Id` int(100) NOT NULL,
  `IdObject` int(200) NOT NULL,
  `IdInputInfo` int(200) NOT NULL,
  `IdDaili` int(200) NOT NULL,
  `Count` int(11) NOT NULL,
  `InputPrice` float NOT NULL,
  `OutputPrice` float NOT NULL,
  `Status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suplier`
--

CREATE TABLE `suplier` (
  `Id` int(128) NOT NULL,
  `DisplayName` varchar(200) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `MoreInfo` varchar(200) NOT NULL,
  `ContractDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(100) NOT NULL,
  `DisplayName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `Id` int(100) NOT NULL,
  `DisplayName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`Id`, `DisplayName`) VALUES
(1, 'Admin'),
(3, 'Dai Li');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(100) NOT NULL,
  `DisplayName` varchar(128) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `IdRole` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `DisplayName`, `Username`, `Password`, `IdRole`) VALUES
(1, 'Accountant', 'Admin', '123456', 1),
(2, 'nhuthuanStore', 'nhuthuanstore', '123456789', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daili`
--
ALTER TABLE `daili`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `input`
--
ALTER TABLE `input`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `inputinfo`
--
ALTER TABLE `inputinfo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdObject` (`IdObject`),
  ADD KEY `IdInput` (`IdInput`);

--
-- Indexes for table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdSuplier` (`IdSuplier`),
  ADD KEY `IdUnit` (`IdUnit`);

--
-- Indexes for table `output`
--
ALTER TABLE `output`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `outputinfo`
--
ALTER TABLE `outputinfo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdObject` (`IdObject`),
  ADD KEY `IdInputInfo` (`IdInputInfo`),
  ADD KEY `IdDaili` (`IdDaili`);

--
-- Indexes for table `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdRole` (`IdRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daili`
--
ALTER TABLE `daili`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `input`
--
ALTER TABLE `input`
  MODIFY `Id` int(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inputinfo`
--
ALTER TABLE `inputinfo`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `object`
--
ALTER TABLE `object`
  MODIFY `Id` int(128) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `output`
--
ALTER TABLE `output`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outputinfo`
--
ALTER TABLE `outputinfo`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inputinfo`
--
ALTER TABLE `inputinfo`
  ADD CONSTRAINT `inputinfo_ibfk_1` FOREIGN KEY (`IdObject`) REFERENCES `object` (`Id`),
  ADD CONSTRAINT `inputinfo_ibfk_2` FOREIGN KEY (`IdInput`) REFERENCES `input` (`Id`);

--
-- Constraints for table `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `object_ibfk_1` FOREIGN KEY (`IdSuplier`) REFERENCES `suplier` (`Id`),
  ADD CONSTRAINT `object_ibfk_2` FOREIGN KEY (`IdUnit`) REFERENCES `unit` (`id`);

--
-- Constraints for table `outputinfo`
--
ALTER TABLE `outputinfo`
  ADD CONSTRAINT `outputinfo_ibfk_1` FOREIGN KEY (`IdObject`) REFERENCES `object` (`Id`),
  ADD CONSTRAINT `outputinfo_ibfk_2` FOREIGN KEY (`IdInputInfo`) REFERENCES `inputinfo` (`Id`),
  ADD CONSTRAINT `outputinfo_ibfk_3` FOREIGN KEY (`IdDaili`) REFERENCES `daili` (`Id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`IdRole`) REFERENCES `userrole` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
