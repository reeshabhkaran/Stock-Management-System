-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2016 at 10:50 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE IF NOT EXISTS `employer` (
  `e_id` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`e_id`, `username`, `password`, `email`, `pid`) VALUES
(4, 'reeshabh', 'reeshabh', 'reeshabh_27@rediffmail.com', 1),
(4, 'reeshabh', 'reeshabh', 'reeshabh_27@rediffmail.com', 5),
(5, 'karan', 'karan', 'reeshabh_27@rediffmail.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `padd`
--

CREATE TABLE IF NOT EXISTS `padd` (
  `pid` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  `added_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `padd`
--

INSERT INTO `padd` (`pid`, `quantity`, `added_on`) VALUES
(1, 20, '2016-06-15'),
(5, 20, '2016-06-15'),
(1, 5, '2016-06-15'),
(6, 20, '2016-06-15'),
(6, 5, '2016-06-15'),
(5, 6, '2016-06-16'),
(1, 10, '2016-06-16'),
(5, 8, '2016-06-16'),
(5, 15, '2016-06-17'),
(5, 8, '2016-06-17'),
(1, 7, '2016-06-17'),
(5, 9, '2016-06-18'),
(6, 5, '2016-06-18'),
(1, 7, '2016-06-22'),
(5, 5, '2016-06-23'),
(1, 20, '2016-06-24');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`pid` int(5) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `powner` varchar(20) NOT NULL,
  `quantity` int(5) NOT NULL,
  `remaining` int(5) NOT NULL,
  `threshold` int(5) NOT NULL,
  `e_id` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `powner`, `quantity`, `remaining`, `threshold`, `e_id`) VALUES
(1, 'Gloves', 'Medex', 69, 29, 10, 4),
(5, 'Shoes', 'Latex', 71, 22, 10, 4),
(6, 'Jacket', 'Denim', 30, 19, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pused`
--

CREATE TABLE IF NOT EXISTS `pused` (
  `pid` int(5) NOT NULL,
  `used_quantity` int(5) NOT NULL,
  `used_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pused`
--

INSERT INTO `pused` (`pid`, `used_quantity`, `used_on`) VALUES
(1, 2, '2016-06-15'),
(1, 2, '2016-06-15'),
(5, 3, '2016-06-15'),
(5, 3, '2016-06-15'),
(1, 3, '2016-06-15'),
(1, 1, '2016-06-15'),
(6, 1, '2016-06-15'),
(6, 3, '2016-06-15'),
(6, 2, '2016-06-15'),
(1, 3, '2016-06-16'),
(6, 2, '2016-06-16'),
(5, 2, '2016-06-16'),
(1, 5, '2016-06-16'),
(5, 2, '2016-06-16'),
(5, 7, '2016-06-16'),
(1, 1, '2016-06-16'),
(1, 2, '2016-06-17'),
(1, 1, '2016-06-17'),
(6, 1, '2016-06-17'),
(5, 4, '2016-06-17'),
(5, 4, '2016-06-17'),
(5, 15, '2016-06-17'),
(5, 8, '2016-06-18'),
(5, 1, '2016-06-18'),
(6, 2, '2016-06-18'),
(1, 1, '2016-06-18'),
(1, 2, '2016-06-19'),
(1, 3, '2016-06-22'),
(1, 2, '2016-06-22'),
(1, 1, '2016-06-23'),
(1, 5, '2016-06-24'),
(1, 6, '2016-06-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
 ADD KEY `pid` (`pid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`pid`), ADD KEY `e_id` (`e_id`);

--
-- Indexes for table `pused`
--
ALTER TABLE `pused`
 ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `pid` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employer`
--
ALTER TABLE `employer`
ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
