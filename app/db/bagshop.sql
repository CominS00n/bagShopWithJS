-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2023 at 08:08 PM
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
-- Database: `bagshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`) VALUES
(1, 'pop', 1234),
(2, 'ComingS00n', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `name`, `email`, `mobile`, `username`, `password`, `address`) VALUES
(3, 'สิทธิชัย พักโพธิ์', 'gamesxbow@gmail.com', '093', 'NonaKung', '1234', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerName`, `Address`, `ProductID`, `Quantity`, `OrderDate`, `TotalPrice`) VALUES
(155, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 12, 2, '2023-02-25', '2419.18'),
(156, 'Wiparat', 'ฺBangkok Thailland', 12, 2, '2023-02-25', '2419.18'),
(157, 'Wiparat', 'ฺBangkok Thailland', 8, 2, '2023-02-25', '1045.98'),
(158, 'Wiparat', 'ฺBangkok Thailland', 11, 0, '2023-02-25', '0.00'),
(159, 'Wiparat', 'ฺBangkok Thailland', 11, 0, '2023-02-25', '0.00'),
(160, 'Wiparat', 'ฺBangkok Thailland', 11, 1, '2023-02-25', '120.89'),
(161, 'Wiparat', 'ฺBangkok Thailland', 11, 2, '2023-02-25', '241.78'),
(162, 'Wiparat', 'ฺBangkok Thailland', 5, 1, '2023-02-27', '1000.99'),
(163, 'Wiparat Busyatras', 'Rajamangala University of Technology Thanyaburi, RMUTT', 11, 1, '2023-02-27', '120.89'),
(164, 'Wiparat Busyatras', 'Rajamangala University of Technology Thanyaburi, RMUTT', 11, 2, '2023-02-27', '241.78'),
(166, 'Wiparat', 'ฺBangkok Thailland', 2, 2, '2023-03-01', '1000.44'),
(167, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 5, '2023-03-01', '2501.10'),
(168, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-06', '1000.44'),
(169, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 5, 2, '2023-03-06', '2001.98'),
(170, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 5, 2, '2023-03-06', '2001.98'),
(171, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-06', '1000.44'),
(172, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-06', '1000.44'),
(173, 'Wiparat', 'ฺBangkok Thailland', 1, 1, '2023-03-06', '850.52'),
(174, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-06', '1000.44'),
(175, 'Wiparat Busyatras', 'Rajamangala University of Technology Thanyaburi, RMUTT', 1, 3, '2023-03-06', '2551.56'),
(176, 'Wiparat', 'ฺBangkok Thailland', 5, 2, '2023-03-13', '2001.98'),
(177, 'Wiparat', 'ฺBangkok Thailland', 5, 2, '2023-03-13', '2001.98'),
(178, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-13', '1000.44'),
(179, 'Wiparat', 'ฺBangkok Thailland', 11, 2, '2023-03-13', '241.78'),
(180, 'Wiparat', 'ฺBangkok Thailland', 5, 2, '2023-03-13', '2001.98'),
(181, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-13', '1000.44'),
(182, 'Wiparat', 'ฺBangkok Thailland', 2, 2, '2023-03-13', '1000.44'),
(183, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-13', '1000.44'),
(184, 'Wiparat', 'ฺBangkok Thailland', 2, 2, '2023-03-13', '1000.44'),
(185, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 9, 2, '2023-03-13', '401.10'),
(186, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-13', '1000.44'),
(187, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 2, 2, '2023-03-13', '1000.44'),
(188, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 5, 2, '2023-03-13', '2001.98'),
(189, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 8, 2, '2023-03-13', '1045.98'),
(190, 'Wiparat', 'ฺBangkok Thailland', 8, 2, '2023-03-13', '1045.98'),
(191, 'Wiparat', 'ฺBangkok Thailland', 1, 2, '2023-03-13', '1701.04'),
(192, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 11, 2, '2023-03-13', '241.78'),
(193, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 11, 1, '2023-03-13', '120.89'),
(194, 'Wiparat Busyatras', 'ฺBangkok Thailland', 1, 2, '2023-03-13', '1701.04'),
(195, 'Wiparat', 'ฺBangkok Thailland', 5, 1, '2023-03-13', '1000.99'),
(196, 'Wiparat', 'ฺBangkok Thailland', 1, 2, '2023-03-13', '1701.04'),
(197, 'Wiparat', 'ฺBangkok Thailland', 1, 3, '2023-03-13', '2551.56'),
(198, 'Wiparat', 'ฺBangkok Thailland', 5, 2, '2023-03-13', '2001.98'),
(199, 'Wiparat', 'ฺBangkok Thailland', 1, 2, '2023-03-13', '1701.04'),
(200, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 5, 1, '2023-03-13', '1000.99'),
(201, 'Wiparat', 'ฺBangkok Thailland', 11, 2, '2023-03-13', '241.78'),
(202, 'Wiparat', 'ฺBangkok Thailland', 11, 2, '2023-03-13', '241.78'),
(203, 'Wiparat', 'ฺBangkok Thailland', 11, 2, '2023-03-13', '241.78'),
(204, 'Wiparat', 'ฺBangkok Thailland', 2, 2, '2023-03-13', '1000.44'),
(205, 'Wiparat', 'ฺBangkok Thailland', 1, 2, '2023-03-13', '1701.04'),
(206, 'Wiparat', 'Rajamangala University of Technology Thanyaburi, RMUTT', 11, 2, '2023-03-13', '241.78'),
(207, 'pop', 'pop', 1, 1, '2023-03-26', '5000.00'),
(208, 'pop', 'oo', 1, 9, '2023-03-26', '45000.00'),
(209, 'yy', 'rt', 1, 1, '2023-03-26', '5000.00'),
(210, 'yy', 'rt', 1, 1, '2023-03-26', '5000.00'),
(211, 'pop', 'aa', 1, 2, '2023-03-26', '10000.00'),
(212, 'pop', 'a', 1, 2, '2023-03-26', '10000.00'),
(213, 'pop', 'pop', 1, 2, '2023-03-26', '10000.00'),
(214, 'สิทธิชัย', 'tttt', 1, 2, '2023-03-26', '10000.00'),
(215, 'pop', 'pop', 1, 5, '2023-03-26', '25000.00');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(20) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `MobilePhone` varchar(20) NOT NULL,
  `SlipPayment` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `OrderID`, `MobilePhone`, `SlipPayment`, `Email`) VALUES
(23, 210, '0938600860', '20210616_230357.jpg', 'gamesxbow@gmail.com'),
(24, 211, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(28, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(29, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(51, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(52, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(53, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(54, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(55, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(56, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(57, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(58, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(59, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(60, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(61, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(62, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(63, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(64, 212, '0938600860', '332677369_7367584914', 'gamesxbow@gmail.com'),
(65, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(66, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(67, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(68, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(69, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(70, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(71, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(72, 213, '0938600860', 'e39.png', 'sitthichai_puckpoo@h'),
(77, 214, '0938600860', 'eka-esports.png', 'gamesxbow@gmail.com'),
(78, 215, '0938600860', 'pubgmap.io_miramar_t', 'gamesxbow@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pd_ID` int(11) NOT NULL,
  `pd_name` varchar(50) NOT NULL,
  `pd_detail` text NOT NULL,
  `pd_price` int(6) NOT NULL,
  `pd_imageName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pd_ID`, `pd_name`, `pd_detail`, `pd_price`, `pd_imageName`) VALUES
(1, 'SMALL BACKPACK', 'Grained Shiny Calfskin & Gold-Tone Metal Lilac', 5000, '001.jpg'),
(2, 'CHANEL 22 HANDBAG', 'Shiny Calfskin & Gold-Tone Metal Light Green', 5300, '002.jpg'),
(3, 'SMALL CAMERA CASE', 'Calfskin, Gold-Tone, Silver-Tone & Ruthenium-Finish Metal Black', 4800, '003.jpg'),
(4, 'SMALL HOBO BAG', 'Lambskin & Shiny Light Gold Metal Green', 4500, '004.jpg'),
(5, 'MINI CAMERA CASE', 'Shiny Lambskin & Lacquered Metal Black, Lilac, Ecru & Silver', 4600, '005.jpg'),
(6, 'MINI FLAP BAG', 'Shiny Lambskin & Lacquered Metal Light Green, Light Pink, Pink & Green', 4800, '006.jpg'),
(7, 'LARGE BACK PACK CHAN', 'Metallic Calfskin & Silver-Tone Metal Silver', 5600, '007.jpg'),
(8, 'MAXI SHOPPING BAG', 'Cotton, Calfskin & Silver-Tone Metal Pink & Blue', 4800, '008.jpg'),
(9, 'MINI FLAP BAG', 'Tweed, Resin & Gold-Tone Metal Pink, Dark Pink & White', 5000, '009.jpg'),
(10, 'MINI FLAP BAG WITH TOP HANDLE', 'Lambskin & Gold-Tone Metal Lilac & Light Green', 4800, '010.jpg'),
(11, 'CHANEL 19 HANDBAG', 'Shiny Lambskin, Gold-Tone, Silver-Tone & Ruthenium-Finish Metal Dark Green', 5700, '011.jpg'),
(12, 'CHANEL 22 BACKPACK', 'Shiny Calfskin & Gold-Tone Metal Lilac', 5100, '012.jpg'),
(13, 'MINI 2.55 HANDBAG', 'Aged Calfskin & Gold-Tone Metal Dark Pink', 4400, '013.jpg'),
(14, 'CLASSIC HANDBAG', 'Calfskin & Black Metal Multicolor', 9000, '014.jpg'),
(15, 'CLASSIC HANDBAG', 'Cotton Tweed & Gold-Tone Metal Multicolor', 8300, '015.jpg'),
(16, 'SMALL BOY CHANEL HANDBAG', 'Calfskin & Ruthenium-Finish Metal Black', 5400, '016.jpg'),
(17, 'BOY CHANEL MESSENGER BAG', 'Grained Shiny Calfskin & Gold-Tone Metal White', 6000, '017.jpg'),
(18, 'BOY CHANEL HANDBAG', 'Calfskin & Gold-Tone Metal Pink', 5900, '018.jpg'),
(19, 'SMALL BUCKET BAG', 'Lambskin, Resin & Gold-Tone Metal Light Green', 4600, '019.jpg'),
(20, 'SMALL BUCKET BAG', 'Lambskin & Gold-Tone Metal Light Pink', 4700, '020.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `pd_ID` (`ProductID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pd_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pd_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`pd_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
