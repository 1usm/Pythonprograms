-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2021 at 09:08 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `user_account` int(110) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `age` varchar(15) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `user_cnic` varchar(15) NOT NULL,
  `pin` varchar(15) NOT NULL,
  `adress` varchar(150) NOT NULL,
  `balance` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`user_account`, `user_name`, `age`, `phone_num`, `user_cnic`, `pin`, `adress`, `balance`) VALUES
(1, 'ahsan', '21', '1234', '1234567891234', '4321', 'lahore cantt', 90000000),
(2, 'waleed', '21', '1234567', '1234567896789', '1234', 'lahore', 900000000),
(3, 'usman', '21', '3040600790', '1234567899876', '1234', 'lahore cantt', 10000000),
(4, 'usman', '18', '123456', '1234567894567', '1234', 'uudsjjs', 0),
(5, 'nomi', '18', '123456', '1234567893456', '1234', 'lahore', 0),
(35, 'usman', '18', '12345677', '1234567892457', '1234', 'lahore cantt', 8000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`user_account`),
  ADD UNIQUE KEY `user_cnic` (`user_cnic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `user_account` int(110) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
