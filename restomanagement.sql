-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 03:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restomanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `employeeName` varchar(255) NOT NULL,
  `restaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `employeeName`, `restaurantId`) VALUES
(1, 'Budi \'Bandung\'', 1),
(2, 'Tono Bandung', 1),
(3, 'Bahrul Bandung', 1),
(4, 'Ahmed Bandung', 1),
(5, 'Sutisna Jakarta', 2),
(6, 'Syahrul Jakarta', 2),
(7, 'Samsul Jakarta', 2),
(8, 'Milos Jakarta', 2),
(9, 'Made Kuta', 6),
(10, 'Bagus Kuta', 6),
(11, 'Gentong Kuta', 6),
(12, 'Nyoman Kuta', 6),
(13, 'Noel Samarinda', 4),
(14, 'Alexis Samarinda', 4),
(15, 'Alamak Samarinda', 4),
(16, 'Agus Samarinda', 4),
(17, 'Samsoel Padang', 5),
(18, 'Samsudin Padang', 5),
(19, 'Soelis Padang', 5),
(20, 'Muklis Padang', 5),
(21, 'Maxim Surabaya', 3),
(22, 'Stanley Surabaya', 3),
(23, 'Axel Surabaya', 3),
(24, 'Hendi Surabaya', 3);

-- --------------------------------------------------------

--
-- Table structure for table `localspecial`
--

CREATE TABLE `localspecial` (
  `localSpecialId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `menuName` varchar(255) NOT NULL,
  `menuPrice` decimal(10,2) NOT NULL,
  `locationDescription` varchar(255) NOT NULL,
  `specialDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localspecial`
--

INSERT INTO `localspecial` (`localSpecialId`, `menuId`, `menuName`, `menuPrice`, `locationDescription`, `specialDescription`) VALUES
(1, 31, 'Surabaya Special \"ZXZ Supper\"', 55.00, 'Surabaya', 'Signature dish from Malang, Surabaya with a spicy twist, fits for Breakfast & Lunch'),
(2, 32, 'Samarinda Special \"Batu Goreng\"', 40.00, 'Samarinda', 'Signature dish from Samarinda with a fragile taste, fits for Dinner & Late night Dinin'),
(3, 33, 'Padang Special \"Dendeng Bekokok\"', 185.00, 'Padang', 'Experience the next level dish. A signature dish from Padang, West Sumatra');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `menuName` varchar(255) NOT NULL,
  `menuPrice` decimal(10,2) NOT NULL,
  `isSpecialMenu` tinyint(1) NOT NULL,
  `localSpecialLocation` varchar(255) DEFAULT NULL,
  `specialMenuStory` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuId`, `restaurantId`, `menuName`, `menuPrice`, `isSpecialMenu`, `localSpecialLocation`, `specialMenuStory`) VALUES
(1, 1, 'Wagyu A5 Tenderloin', 75.00, 1, NULL, 'A special dish made with A5 marbling grade beef from Kobe, Japan. 100% Original Premium Beef'),
(2, 2, 'Sate Sumanto A6+', 85.00, 1, NULL, 'Experience the exquisite taste of our signature Sate Sumanto with A6+ marbling grade made by Chef Sumanto'),
(3, 6, 'Daging Kudanil A7', 100.00, 1, NULL, 'Taste the difference from our Kudanil Beef with A7 marbling grade, made by Chef Ahmad'),
(4, 1, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(5, 1, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(6, 1, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(7, 2, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(8, 2, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(9, 2, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(10, 3, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(11, 3, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(12, 3, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(13, 4, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(14, 4, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(15, 4, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(16, 5, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(17, 5, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(18, 5, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(19, 6, 'Nasi Goreng Ayam', 25.00, 0, NULL, NULL),
(20, 6, 'Sate Daging Ayam', 30.00, 0, NULL, NULL),
(21, 6, 'Nasi Daging Sapi', 35.00, 0, NULL, NULL),
(31, 3, 'Surabaya Special \"ZXZ Supper\"', 55.00, 1, 'Surabaya', 'Signature dish from Malang, Surabaya with a spicy twist, fits for Breakfast & Lunch'),
(32, 4, 'Samarinda Special \"Batu Goreng\"', 40.00, 1, 'Samarinda', 'Signature dish from Samarinda with a fragile taste, fits for Dinner & Late night Dinin'),
(33, 5, 'Padang Special \"Dendeng Bekokok\"', 185.00, 1, 'Padang', 'Experience the next level dish. A signature dish from Padang, West Sumatra');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderId` int(11) NOT NULL,
  `reservationId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `tableType` varchar(20) NOT NULL,
  `numberOfPeople` int(11) NOT NULL,
  `reservationStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurantId` int(11) NOT NULL,
  `restaurantName` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `isMainBranch` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurantId`, `restaurantName`, `location`, `isMainBranch`) VALUES
(1, 'Bandung Restaurant', 'Bandung', 1),
(2, 'Jakarta Restaurant', 'Jakarta', 1),
(3, 'Surabaya Restaurant', 'Surabaya', 0),
(4, 'Samarinda Restaurant', 'Samarinda', 0),
(5, 'Padang Restaurant', 'Padang', 0),
(6, 'Kuta Restaurant', 'Kuta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialmenu`
--

CREATE TABLE `specialmenu` (
  `specialMenuId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  `menuName` varchar(255) NOT NULL,
  `menuPrice` decimal(10,2) NOT NULL,
  `specialStory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialmenu`
--

INSERT INTO `specialmenu` (`specialMenuId`, `menuId`, `menuName`, `menuPrice`, `specialStory`) VALUES
(16, 1, 'Wagyu A5 Tenderloin', 75.00, 'A special dish made with A5 marbling grade beef from Kobe, Japan. 100% Original Premium Beef'),
(17, 2, 'Sate Sumanto A6+', 85.00, 'Experience the exquisite taste of our signature Sate Sumanto with A6+ marbling grade made by Chef Sumanto'),
(18, 3, 'Daging Kudanil A7', 100.00, 'Taste the difference from our Kudanil Beef with A7 marbling grade, made by Chef Ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `tabletype`
--

CREATE TABLE `tabletype` (
  `tableTypeId` int(11) NOT NULL,
  `restaurantId` int(11) NOT NULL,
  `typeName` varchar(20) NOT NULL,
  `maxCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletype`
--

INSERT INTO `tabletype` (`tableTypeId`, `restaurantId`, `typeName`, `maxCapacity`) VALUES
(1, 1, 'Romantic', 2),
(2, 1, 'General', 4),
(3, 1, 'Family', 10),
(4, 2, 'Romantic', 2),
(5, 2, 'General', 4),
(6, 2, 'Family', 10),
(7, 3, 'Romantic', 2),
(8, 3, 'General', 4),
(9, 3, 'Family', 10),
(10, 4, 'Romantic', 2),
(11, 4, 'General', 4),
(12, 4, 'Family', 10),
(13, 5, 'Romantic', 2),
(14, 5, 'General', 4),
(15, 5, 'Family', 10),
(16, 6, 'Romantic', 2),
(17, 6, 'General', 4),
(18, 6, 'Family', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `localspecial`
--
ALTER TABLE `localspecial`
  ADD PRIMARY KEY (`localSpecialId`),
  ADD KEY `menuId` (`menuId`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuId`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `reservationId` (`reservationId`),
  ADD KEY `menuId` (`menuId`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationId`),
  ADD KEY `employeeId` (`employeeId`),
  ADD KEY `restaurantId` (`restaurantId`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurantId`);

--
-- Indexes for table `specialmenu`
--
ALTER TABLE `specialmenu`
  ADD PRIMARY KEY (`specialMenuId`),
  ADD KEY `menuId` (`menuId`);

--
-- Indexes for table `tabletype`
--
ALTER TABLE `tabletype`
  ADD PRIMARY KEY (`tableTypeId`),
  ADD UNIQUE KEY `unique_table_type` (`restaurantId`,`typeName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `localspecial`
--
ALTER TABLE `localspecial`
  MODIFY `localSpecialId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `specialmenu`
--
ALTER TABLE `specialmenu`
  MODIFY `specialMenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tabletype`
--
ALTER TABLE `tabletype`
  MODIFY `tableTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`);

--
-- Constraints for table `localspecial`
--
ALTER TABLE `localspecial`
  ADD CONSTRAINT `localspecial_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`);

--
-- Constraints for table `specialmenu`
--
ALTER TABLE `specialmenu`
  ADD CONSTRAINT `specialmenu_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`);

--
-- Constraints for table `tabletype`
--
ALTER TABLE `tabletype`
  ADD CONSTRAINT `tabletype_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
