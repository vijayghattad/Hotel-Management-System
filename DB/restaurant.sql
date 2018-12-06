-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 06, 2018 at 01:43 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `BI_NO` int(4) NOT NULL,
  `SL_NO` int(5) NOT NULL,
  `F_NAME` varchar(15) NOT NULL,
  `QUANTITY` int(3) NOT NULL,
  `AMOUNT` int(5) NOT NULL,
  `C_ID` varchar(8) NOT NULL,
  `B_DATE` date NOT NULL,
  `TAX` int(4) NOT NULL,
  `OI_ID` varchar(8) NOT NULL,
  `NET_AMT` int(5) NOT NULL,
  PRIMARY KEY (`F_NAME`),
  KEY `C_ID` (`C_ID`),
  KEY `OI_ID` (`OI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`BI_NO`, `SL_NO`, `F_NAME`, `QUANTITY`, `AMOUNT`, `C_ID`, `B_DATE`, `TAX`, `OI_ID`, `NET_AMT`) VALUES
(1002, 3, 'FINGER CHIPS', 2, 200, 'ROYC102', '2017-12-06', 5, 'ROYOI105', 205),
(1002, 1, 'GADBAD', 1, 90, 'ROYC102', '2017-12-06', 5, 'ROYOI104', 95),
(1001, 2, 'KAJU', 1, 150, 'ROYC101', '2017-12-06', 8, 'ROYOI102', 158),
(1002, 2, 'KUSHKKA', 1, 100, 'ROYC102', '2017-12-06', 5, 'ROYOI103', 105),
(1001, 1, 'TANDOORI', 2, 40, 'ROYC101', '2017-12-06', 1, 'ROYOI101', 41);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CAT_ID` int(3) NOT NULL AUTO_INCREMENT,
  `CAT_DES` varchar(15) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CAT_ID`, `CAT_DES`) VALUES
(101, 'VEG SNACKS'),
(102, 'PAPAD'),
(103, 'SOUP CORNER'),
(104, 'KAJU DISHES'),
(105, 'ROTI BASKET'),
(106, 'RICE'),
(107, 'JUICE CORNER'),
(108, 'ICE CREAM');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `C_ID` varchar(8) NOT NULL,
  `C_NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(30) NOT NULL,
  `MOBILE_NO` varchar(12) NOT NULL,
  `W_ID` varchar(8) NOT NULL,
  `T_ID` int(3) NOT NULL,
  PRIMARY KEY (`C_ID`),
  KEY `W_ID` (`W_ID`),
  KEY `T_ID` (`T_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_ID`, `C_NAME`, `ADDRESS`, `MOBILE_NO`, `W_ID`, `T_ID`) VALUES
('ROYC101', 'AMITH', 'HUBBALLI', '9036164661', 'ROYW104', 301),
('ROYC102', 'ROHIT', 'BAGALKOT', '9620988180', 'ROYW105', 305);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `DESG_NO` int(5) NOT NULL,
  `MG_ID` varchar(8) NOT NULL,
  `DESG_NAME` varchar(10) NOT NULL,
  `SALARY` int(6) NOT NULL,
  PRIMARY KEY (`MG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`DESG_NO`, `MG_ID`, `DESG_NAME`, `SALARY`) VALUES
(1, 'ROYM101', 'CLEANING', 4000),
(2, 'ROYM102', 'WAITER', 6000),
(3, 'ROYM103', 'COOKING', 10000),
(1, 'ROYM104', 'MANAGER ', 25000),
(5, 'ROYM105', 'SECURITY', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `food_item`
--

DROP TABLE IF EXISTS `food_item`;
CREATE TABLE IF NOT EXISTS `food_item` (
  `FIT_ID` int(3) NOT NULL,
  `FIT_NAME` varchar(15) NOT NULL,
  `RATE` int(4) NOT NULL,
  `CAT_ID` int(3) NOT NULL,
  PRIMARY KEY (`FIT_ID`),
  KEY `CAT_ID` (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_item`
--

INSERT INTO `food_item` (`FIT_ID`, `FIT_NAME`, `RATE`, `CAT_ID`) VALUES
(201, 'FINGER CHIPS', 100, 101),
(202, 'GOBI MANCHURIAN', 100, 101),
(203, 'GOBI CHILLY', 100, 101),
(204, 'VEG CHILLY', 100, 101),
(205, 'VEG 65', 100, 101),
(206, 'ROASTED PAPAD', 20, 102),
(207, 'FRY PAPAD', 20, 102),
(208, 'MASALA PAPAD', 30, 102),
(209, 'TOMATO SOUP', 90, 103),
(210, 'VEG SOUP', 90, 103),
(211, 'PALAK SOUP', 90, 103),
(212, 'SWEET CORN SOUP', 90, 103),
(213, 'KAJU MASALA', 150, 104),
(214, 'KAJU PANNER', 150, 104),
(215, 'KAJU KURMA', 150, 104),
(216, 'KAJU KADAI', 150, 104),
(217, 'TANDOORI ROTI', 20, 105),
(218, 'BUTTUR ROTI', 20, 105),
(219, 'KULCHA', 20, 105),
(220, 'PLAIN RICE', 40, 106),
(221, 'KUSHKKA', 100, 106),
(222, 'CURD RICE ', 110, 106),
(223, 'GHEE RICE', 110, 106),
(224, 'ORANGE JUICE', 60, 107),
(225, 'MANGO JUICE', 60, 107),
(226, 'APPLE JIICE', 60, 107),
(227, 'COLD COFFEE', 50, 107),
(228, 'VENILA', 35, 108),
(229, 'GADBAD', 90, 108),
(230, 'CHOCOLATE SCOOP', 40, 108),
(231, 'SOFT DRINK', 22, 108);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `LOG_ID` varchar(10) NOT NULL,
  `LOG_NAME` varchar(20) NOT NULL,
  `LOG_PASS` varchar(20) NOT NULL,
  `LOG_TYPE` varchar(10) NOT NULL,
  `C_DATE` date NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`LOG_ID`, `LOG_NAME`, `LOG_PASS`, `LOG_TYPE`, `C_DATE`, `STATUS`) VALUES
('ROYL101', 'ADMIN', 'ADMIN', 'MANAGER', '2017-11-01', 'ACTIVE'),
('ROYL102', 'ACCOUNTANT', 'ACCOUNTANT', 'ACCOUNTANT', '2017-11-01', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `O_ID` varchar(8) NOT NULL,
  `T_ID` int(3) NOT NULL,
  `O_T_D` timestamp NOT NULL,
  `FIT_ID` int(3) NOT NULL,
  `C_ID` varchar(8) NOT NULL,
  PRIMARY KEY (`O_ID`),
  KEY `T_ID` (`T_ID`),
  KEY `FIT_ID` (`FIT_ID`),
  KEY `C_ID` (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`O_ID`, `T_ID`, `O_T_D`, `FIT_ID`, `C_ID`) VALUES
('ROYO101', 301, '2017-12-06 03:48:36', 217, 'ROYC101'),
('ROYO102', 301, '2017-12-06 03:48:57', 214, 'ROYC101'),
('ROYO103', 305, '2017-12-06 05:33:25', 221, 'ROYC102'),
('ROYO104', 305, '2017-12-06 05:33:46', 229, 'ROYC102'),
('ROYO105', 305, '2017-12-05 19:46:30', 201, 'ROYC102');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `OI_ID` varchar(8) NOT NULL,
  `O_ID` varchar(8) NOT NULL,
  `FIT_ID` int(3) NOT NULL,
  `QUANTITY` int(3) NOT NULL,
  `AMOUNT` int(5) NOT NULL,
  `R_P_I` int(4) NOT NULL,
  `W_ID` varchar(8) NOT NULL,
  PRIMARY KEY (`OI_ID`),
  KEY `O_ID` (`O_ID`),
  KEY `FIT_ID` (`FIT_ID`),
  KEY `W_ID` (`W_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`OI_ID`, `O_ID`, `FIT_ID`, `QUANTITY`, `AMOUNT`, `R_P_I`, `W_ID`) VALUES
('ROYOI101', 'ROYO101', 217, 2, 40, 20, 'ROYW104'),
('ROYOI102', 'ROYO102', 214, 1, 150, 150, 'ROYW104'),
('ROYOI103', 'ROYO103', 221, 1, 100, 100, 'ROYW105'),
('ROYOI104', 'ROYO104', 229, 1, 90, 90, 'ROYW105'),
('ROYOI105', 'ROYO105', 201, 2, 200, 100, 'ROYW105');

-- --------------------------------------------------------

--
-- Table structure for table `rtable`
--

DROP TABLE IF EXISTS `rtable`;
CREATE TABLE IF NOT EXISTS `rtable` (
  `T_ID` int(3) NOT NULL,
  `T_CAPACITY` int(2) NOT NULL,
  `W_ID` varchar(8) NOT NULL,
  `OCCUPIED` tinyint(1) NOT NULL,
  PRIMARY KEY (`T_ID`),
  KEY `W_ID` (`W_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rtable`
--

INSERT INTO `rtable` (`T_ID`, `T_CAPACITY`, `W_ID`, `OCCUPIED`) VALUES
(300, 5, 'ROYW105', 0),
(301, 6, 'ROYW106', 0),
(302, 6, 'ROYW107', 0),
(303, 6, 'ROYW108', 0),
(304, 6, 'ROYW105', 0),
(305, 6, 'ROYW106', 0),
(306, 6, 'ROYW107', 0),
(307, 6, 'ROYW108', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
CREATE TABLE IF NOT EXISTS `workers` (
  `W_ID` varchar(8) NOT NULL,
  `W_NAME` varchar(20) NOT NULL,
  `W_ADDRESS` varchar(30) NOT NULL,
  `MOBILE_NO` varchar(12) NOT NULL,
  `GENDER` varchar(6) NOT NULL,
  `MG_ID` varchar(8) NOT NULL,
  PRIMARY KEY (`W_ID`),
  KEY `MG_ID` (`MG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`W_ID`, `W_NAME`, `W_ADDRESS`, `MOBILE_NO`, `GENDER`, `MG_ID`) VALUES
('ROYW101', 'ANAND', 'BAGALKOT', '9876543210', 'MALE', 'ROYM104'),
('ROYW102', 'MEENAKSHI', 'BELLARY', '9876543211', 'FEMALE', 'ROYM101'),
('ROYW103', 'MANJULA', 'HUBBALLI', '9876543212', 'FEMALE', 'ROYM101'),
('ROYW104', 'VIRESH', 'HUBBALLI', '9876543213', 'MALE', 'ROYM101'),
('ROYW105', 'HEMANTH', 'DAVANGERE', '9876543214', 'MALE', 'ROYM102'),
('ROYW106', 'SUNIL', 'HUBBALLI', '9876543215', 'MALE', 'ROYM102'),
('ROYW107', 'SANTOSH', 'GOKAK', '9876543216', 'MALE', 'ROYM102'),
('ROYW108', 'VINAY', 'HUBBALLI', '9876543217', 'MALE', 'ROYM102'),
('ROYW109', 'MURALI', 'BAGALKOT', '9876543218', 'MALE', 'ROYM103'),
('ROYW110', 'KISHOR', 'BAGALKOT', '9876543219', 'MALE', 'ROYM102'),
('ROYW111', 'JAGAN', 'BELLARY', '9876543220', 'MALE', 'ROYM101'),
('ROYW112', 'KRISHNA', 'HUBBALLI', '9876543221', 'MALE', 'ROYM105');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`OI_ID`) REFERENCES `order_item` (`OI_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`W_ID`) REFERENCES `workers` (`W_ID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`T_ID`) REFERENCES `rtable` (`T_ID`);

--
-- Constraints for table `food_item`
--
ALTER TABLE `food_item`
  ADD CONSTRAINT `food_item_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`CAT_ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`T_ID`) REFERENCES `rtable` (`T_ID`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`FIT_ID`) REFERENCES `food_item` (`FIT_ID`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `order_details` (`O_ID`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`FIT_ID`) REFERENCES `food_item` (`FIT_ID`),
  ADD CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`W_ID`) REFERENCES `workers` (`W_ID`);

--
-- Constraints for table `rtable`
--
ALTER TABLE `rtable`
  ADD CONSTRAINT `rtable_ibfk_1` FOREIGN KEY (`W_ID`) REFERENCES `workers` (`W_ID`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`MG_ID`) REFERENCES `designation` (`MG_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
