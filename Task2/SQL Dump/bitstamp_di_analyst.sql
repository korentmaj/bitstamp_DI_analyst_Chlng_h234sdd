-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 08:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
-- author: Maj Korent

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitstamp_di_analyst`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_profile`
--

CREATE TABLE `client_profile` (
  `unique_id` int(11) NOT NULL,
  `current_country` varchar(50) DEFAULT NULL,
  `current_entity` varchar(50) DEFAULT NULL,
  `date_of_last_change` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `client_profile`
--

INSERT INTO `client_profile` (`unique_id`, `current_country`, `current_entity`, `date_of_last_change`) VALUES
(1, 'SG', 'PTE', '2022-12-12'),
(2, 'DE', 'SA', '0000-00-00'),
(3, 'NL', 'SA', '2022-12-05'),
(4, 'US', 'INC', '2022-12-04'),
(5, 'US', 'INC', '0000-00-00'),
(6, 'US', 'INC', '0000-00-00'),
(7, 'SI ', 'SA', '0000-00-00'),
(8, 'BE', 'SA', '2022-12-16'),
(9, 'HK', 'PTE', '0000-00-00'),
(10, 'AU', 'BVI', '0000-00-00'),
(11, 'NL', 'SA', '0000-00-00'),
(12, 'NL', 'SA', '0000-00-00'),
(13, 'BE', 'SA', '0000-00-00'),
(14, 'US', 'INC', '0000-00-00'),
(15, 'SI ', 'SA', '0000-00-00'),
(16, 'DE', 'SA', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `task2_entities_mapping`
--

CREATE TABLE `task2_entities_mapping` (
  `country` varchar(3) DEFAULT NULL,
  `entity` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `task2_entities_mapping`
--

INSERT INTO `task2_entities_mapping` (`country`, `entity`) VALUES
('NL', 'SA'),
('DE', 'SA'),
('SI ', 'SA'),
('SG', 'PTE'),
('US', 'INC'),
('HK', 'PTE'),
('AU', 'BVI'),
('BE', 'SA');

-- --------------------------------------------------------

--
-- Table structure for table `task2_trading_volume`
--

CREATE TABLE `task2_trading_volume` (
  `unique_id` int(2) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `daily_trading_volume` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `task2_trading_volume`
--

INSERT INTO `task2_trading_volume` (`unique_id`, `date`, `daily_trading_volume`) VALUES
(7, '2022-12-06', 36949),
(16, '2022-12-09', 49072),
(3, '2022-12-15', 20235),
(10, '2022-12-15', 46226),
(15, '2022-12-16', 25690),
(6, '2022-12-14', 38920),
(2, '2022-12-17', 7167),
(5, '2022-12-23', 37436),
(5, '2022-12-15', 33252),
(7, '2022-12-19', 41644),
(16, '2022-12-16', 49563),
(8, '2022-12-13', 38440),
(15, '2022-12-21', 37482),
(7, '2022-12-21', 37066),
(9, '2022-12-06', 6639),
(3, '2022-12-19', 31699),
(2, '2022-12-23', 41811),
(3, '2022-12-24', 30488),
(4, '2022-12-18', 2173),
(4, '2022-12-27', 35231),
(15, '2022-12-10', 44531),
(10, '2022-12-09', 27673),
(5, '2022-12-10', 32963),
(1, '2022-12-25', 23327),
(14, '2022-12-15', 4298),
(10, '2022-12-03', 31353),
(14, '2022-12-06', 15994),
(1, '2022-12-18', 3683),
(11, '2022-12-14', 1202),
(12, '2022-12-24', 22593),
(2, '2022-12-27', 11346),
(5, '2022-12-07', 39122),
(12, '2022-12-03', 3599),
(5, '2022-12-08', 29639),
(9, '2022-12-20', 18869),
(10, '2022-12-30', 32688),
(13, '2022-12-13', 45026),
(3, '2022-12-18', 37011),
(2, '2022-12-29', 46253),
(7, '2022-12-22', 8311),
(16, '2022-12-27', 45428),
(14, '2022-12-09', 31791),
(13, '2022-12-11', 4164),
(10, '2022-12-08', 21143),
(15, '2022-12-11', 2409),
(9, '2022-12-03', 9858),
(15, '2022-12-22', 48468),
(13, '2022-12-03', 3667),
(4, '2022-12-10', 11014),
(5, '2022-12-30', 4836),
(8, '2022-12-07', 37527),
(8, '2022-12-25', 19228),
(12, '2022-12-16', 17505),
(12, '2022-12-20', 9583),
(11, '2022-12-04', 41705),
(1, '2022-12-15', 11074),
(2, '2022-12-03', 17249),
(15, '2022-12-20', 576),
(9, '2022-12-04', 48475),
(12, '2022-12-15', 45703),
(12, '2022-12-14', 35004),
(2, '2022-12-30', 3307),
(6, '2022-12-22', 9081),
(16, '2022-12-31', 49502),
(12, '2022-12-06', 34604),
(15, '2022-12-28', 45752),
(16, '2022-12-25', 19200),
(12, '2022-12-09', 8805),
(3, '2022-12-22', 35507),
(11, '2022-12-16', 27075),
(3, '2022-12-12', 27326),
(6, '2022-12-30', 36161),
(2, '2022-12-31', 11805),
(15, '2022-12-17', 18201),
(11, '2022-12-07', 34187),
(9, '2022-12-05', 11351),
(9, '2022-12-28', 39614),
(13, '2022-12-08', 28388),
(10, '2022-12-22', 20848),
(8, '2022-12-04', 32620),
(3, '2022-12-21', 34043),
(5, '2022-12-18', 33946),
(13, '2022-12-31', 4054),
(2, '2022-12-09', 34030),
(14, '2022-12-28', 47284),
(9, '2022-12-02', 43363),
(4, '2022-12-21', 6513),
(2, '2022-12-16', 34199),
(15, '2022-12-01', 48095),
(2, '2022-12-15', 13076),
(16, '2022-12-20', 44719),
(8, '2022-12-20', 45488),
(16, '2022-12-10', 39278),
(12, '2022-12-02', 9498),
(15, '2022-12-25', 15939),
(1, '2022-12-12', 47441),
(12, '2022-12-26', 36257),
(10, '2022-12-17', 38875),
(10, '2022-12-06', 41139),
(14, '2022-12-22', 35045),
(11, '2022-12-09', 1433),
(4, '2022-12-08', 49645),
(4, '2022-12-15', 37373),
(16, '2022-12-07', 35558),
(4, '2022-12-04', 37701),
(5, '2022-12-31', 36736),
(7, '2022-12-13', 3193),
(4, '2022-12-16', 21946),
(8, '2022-12-30', 3807),
(1, '2022-12-19', 2197),
(7, '2022-12-12', 32554),
(9, '2022-12-27', 46662),
(7, '2022-12-03', 12267),
(1, '2022-12-03', 34231),
(15, '2022-12-03', 49282),
(1, '2022-12-27', 14767),
(8, '2022-12-27', 20280);

-- --------------------------------------------------------

--
-- Table structure for table `task2_userprofile`
--

CREATE TABLE `task2_userprofile` (
  `unique_id` int(2) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `date_changed` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `task2_userprofile`
--

INSERT INTO `task2_userprofile` (`unique_id`, `country`, `date_changed`) VALUES
(1, 'NL', ''),
(2, 'DE', ''),
(3, 'SI ', ''),
(4, 'SG', ''),
(5, 'US', ''),
(4, 'US', '2022-12-04'),
(3, 'NL', '2022-12-05'),
(6, 'US', ''),
(7, 'SI ', ''),
(8, 'NL', ''),
(9, 'HK', ''),
(10, 'AU', ''),
(11, 'NL', ''),
(12, 'NL', ''),
(13, 'BE', ''),
(14, 'US', ''),
(1, 'SG', '2022-12-12'),
(8, 'BE', '2022-12-16'),
(15, 'SI ', ''),
(16, 'DE', '');

-- --------------------------------------------------------

--
-- Table structure for table `trading_volume_summary`
--

CREATE TABLE `trading_volume_summary` (
  `unique_id` int(11) NOT NULL,
  `total_volume` bigint(20) DEFAULT NULL,
  `average_volume` decimal(20,2) DEFAULT NULL,
  `median_volume` decimal(20,2) DEFAULT NULL,
  `is_volume_above_average` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `trading_volume_summary`
--

INSERT INTO `trading_volume_summary` (`unique_id`, `total_volume`, `average_volume`, `median_volume`, `is_volume_above_average`) VALUES
(1, 136720, 19531.43, 12920.50, 0),
(2, 220243, 22024.30, 15162.50, 1),
(3, 216309, 30901.29, 31093.50, 1),
(4, 201596, 25199.50, 28588.50, 1),
(5, 247930, 30991.25, 33599.00, 1),
(6, 84162, 28054.00, 22621.00, 0),
(7, 171984, 24569.14, 22410.50, 0),
(8, 197390, 28198.57, 26450.00, 0),
(9, 224831, 28103.88, 29241.50, 1),
(10, 259945, 32493.13, 32020.50, 1),
(11, 105602, 21120.40, 14254.00, 0),
(12, 223151, 22315.10, 20049.00, 1),
(13, 85299, 17059.80, 4109.00, 0),
(14, 134412, 26882.40, 23892.50, 0),
(15, 336425, 30584.09, 31586.00, 1),
(16, 332320, 41540.00, 45073.50, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_profile`
--
ALTER TABLE `client_profile`
  ADD PRIMARY KEY (`unique_id`);

--
-- Indexes for table `trading_volume_summary`
--
ALTER TABLE `trading_volume_summary`
  ADD PRIMARY KEY (`unique_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
