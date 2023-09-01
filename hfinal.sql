-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jan 20, 2022 at 04:51 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doc_fname` varchar(20) DEFAULT NULL,
  `doc_minit` varchar(20) DEFAULT NULL,
  `doc_lname` varchar(20) DEFAULT NULL,
  `doc_id` int NOT NULL,
  `doc_gender` varchar(6) DEFAULT NULL,
  `doc_mobileno` varchar(10) DEFAULT NULL,
  `doc_mailid` varchar(20) DEFAULT NULL,
  `doc_specialist` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_fname`, `doc_minit`, `doc_lname`, `doc_id`, `doc_gender`, `doc_mobileno`, `doc_mailid`, `doc_specialist`) VALUES
('Hemashree', 'D', '', 410, 'Female', '9988775566', 'hema@gmail.com', 'General'),
('Nandish', 'B R', 'Rao', 419, 'Male', '9875555555', 'nandish@gmail.com', 'ENT'),
('Indu', 'N', '  ', 412, 'Female', '78942153', 'indu@gmail.com', 'dentist'),
('Manju', 'J', 'Shree', 416, 'Female', '9345654310', 'Manju@gmail.com', 'dermotologist'),
('Abhi', 'H', 'Hegde', 401, 'Male', '7896543211', 'abhi@gmail.com', 'neurologist');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE IF NOT EXISTS `hospital` (
  `pat_id` int NOT NULL,
  `bid` int NOT NULL,
  `admitd` date DEFAULT NULL,
  `dis_date` date DEFAULT NULL,
  `billamt` int DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`pat_id`, `bid`, `admitd`, `dis_date`, `billamt`) VALUES
(3213, 4002, '2022-01-06', '2022-01-09', 750),
(3214, 4003, '2022-01-11', '2022-01-14', 2000),
(3216, 4004, '2022-01-19', '2022-01-21', 2800),
(3215, 4005, '2022-01-26', '2022-01-29', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicine_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `medicine_id` int NOT NULL,
  `medicine_cost` int DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_name`, `medicine_id`, `medicine_cost`) VALUES
('paracetamol', 1231, 30),
('dolo65', 1234, 11),
('echosprin av', 1232, 50),
('nuhenz', 1233, 245),
('sugamintrio', 1235, 130);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pat_id` int NOT NULL,
  `pat_fname` varchar(20) DEFAULT NULL,
  `pat_minit` varchar(20) DEFAULT NULL,
  `pat_lname` varchar(20) DEFAULT NULL,
  `pat_gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pat_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pat_mailid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pat_mobileno` varchar(10) DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  KEY `doc_id` (`doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pat_id`, `pat_fname`, `pat_minit`, `pat_lname`, `pat_gender`, `pat_address`, `pat_mailid`, `pat_mobileno`, `doc_id`) VALUES
(3213, 'Manasa', 'G K', '  ', 'Female', 'Sumanahalli', 'manasa@gmail.com', '7899878906', 410),
(3214, 'Sanjana', 'P', '  ', 'Female', 'Kengeri', 'sanju@gmail.com', '8907654231', 419),
(3215, 'Praveen', 'H', '  ', 'Male', 'Hosur', 'praveenh@gmail.com', '7654765400', 412),
(3216, 'Pooja', 'K', 'Shree', 'Female', 'Nagarabhavi', 'poojak@gmail.com', '9966331234', 416);

-- --------------------------------------------------------

--
-- Table structure for table `pdetails`
--

DROP TABLE IF EXISTS `pdetails`;
CREATE TABLE IF NOT EXISTS `pdetails` (
  `pat_id` int DEFAULT NULL,
  `bill_id` int NOT NULL,
  `admitted_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `bill_amt` int DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `pat_id` (`pat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_report`
--

DROP TABLE IF EXISTS `test_report`;
CREATE TABLE IF NOT EXISTS `test_report` (
  `pat_id` int NOT NULL,
  `test_id` int NOT NULL,
  `test_name` varchar(50) DEFAULT NULL,
  `ref_doc_id` int DEFAULT NULL,
  `report` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pat_id`),
  KEY `pat_id` (`pat_id`),
  KEY `ref_doc_id` (`ref_doc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test_report`
--

INSERT INTO `test_report` (`pat_id`, `test_id`, `test_name`, `ref_doc_id`, `report`) VALUES
(3216, 704, 'Covid', 401, 'negative'),
(3212, 700, 'Sugar', 410, 'High'),
(3213, 701, 'BP', 412, 'Low'),
(3214, 702, 'Blood', 416, 'normal'),
(3215, 703, 'Diabetics', 419, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `usermail` varchar(50) DEFAULT NULL,
  `u_pwd` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
