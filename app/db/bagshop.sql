-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2023 at 04:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.2

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `name`, `email`, `mobile`, `username`, `password`, `address`) VALUES
(3, 'สิทธิชัย พักโพธิ์', 'gamesxbow@gmail.com', '093', 'NonaKung', '1234', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pd_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
