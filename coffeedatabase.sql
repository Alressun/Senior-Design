-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2016 at 10:39 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeedatabase`
--
CREATE DATABASE IF NOT EXISTS `coffeedatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `coffeedatabase`;

-- --------------------------------------------------------

--
-- Table structure for table `beantypes`
--

CREATE TABLE IF NOT EXISTS `beantypes` (
  `BeanTypeID` int(10) unsigned NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coffeequeue`
--

CREATE TABLE IF NOT EXISTS `coffeequeue` (
  `CoffeeID` int(10) unsigned NOT NULL,
  `BeanTypeID` int(10) unsigned NOT NULL,
  `Email` varchar(250) NOT NULL,
  `StartTime` datetime NOT NULL,
  `Finished` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beantypes`
--
ALTER TABLE `beantypes`
  ADD PRIMARY KEY (`BeanTypeID`);

--
-- Indexes for table `coffeequeue`
--
ALTER TABLE `coffeequeue`
  ADD PRIMARY KEY (`CoffeeID`),
  ADD KEY `BeanTypeID` (`BeanTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beantypes`
--
ALTER TABLE `beantypes`
  MODIFY `BeanTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coffeequeue`
--
ALTER TABLE `coffeequeue`
  MODIFY `CoffeeID` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coffeequeue`
--
ALTER TABLE `coffeequeue`
  ADD CONSTRAINT `coffeequeue_ibfk_1` FOREIGN KEY (`BeanTypeID`) REFERENCES `beantypes` (`BeanTypeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
