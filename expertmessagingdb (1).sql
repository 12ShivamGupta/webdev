-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2021 at 11:30 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expertmessagingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `password`) VALUES
('18thjuneadv@gmail.com', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `ansDesc` varchar(1000) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `questionID` int(11) NOT NULL,
  `expertID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `mobileNumber` varchar(10) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `blocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customerreply`
--

CREATE TABLE `customerreply` (
  `id` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `incdesc` varchar(1000) NOT NULL,
  `customerId` varchar(300) NOT NULL,
  `expertId` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `expert`
--

CREATE TABLE `expert` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `blocked` tinyint(1) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `subCategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `questionTitle` varchar(50) NOT NULL,
  `questionDesc` varchar(200) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `subCategoryID` int(11) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `expertID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questioncategory`
--

CREATE TABLE `questioncategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questionsubcategory`
--

CREATE TABLE `questionsubcategory` (
  `id` int(11) NOT NULL,
  `subCategoryName` varchar(60) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reportedincidentsbycustomer`
--

CREATE TABLE `reportedincidentsbycustomer` (
  `id` int(11) NOT NULL,
  `incDesc` varchar(200) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expertID` varchar(40) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reportedincidentsbyexpert`
--

CREATE TABLE `reportedincidentsbyexpert` (
  `id` int(11) NOT NULL,
  `incDesc` varchar(200) NOT NULL,
  `expertID` varchar(40) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `postedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `questionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionID` (`questionID`),
  ADD KEY `expertID` (`expertID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customerreply`
--
ALTER TABLE `customerreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `subCategoryID` (`subCategoryID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`),
  ADD KEY `subCategoryID` (`subCategoryID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `expertID` (`expertID`);

--
-- Indexes for table `questioncategory`
--
ALTER TABLE `questioncategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionsubcategory`
--
ALTER TABLE `questionsubcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expertID` (`expertID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `idx_fk3` (`questionID`);

--
-- Indexes for table `reportedincidentsbyexpert`
--
ALTER TABLE `reportedincidentsbyexpert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expertID` (`expertID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `ibfk_ques` (`questionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customerreply`
--
ALTER TABLE `customerreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `questioncategory`
--
ALTER TABLE `questioncategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `questionsubcategory`
--
ALTER TABLE `questionsubcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reportedincidentsbyexpert`
--
ALTER TABLE `reportedincidentsbyexpert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `Answer_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Answer_ibfk_2` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expert`
--
ALTER TABLE `expert`
  ADD CONSTRAINT `Expert_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `questioncategory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Expert_ibfk_2` FOREIGN KEY (`subCategoryID`) REFERENCES `questionsubcategory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `questioncategory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Question_ibfk_2` FOREIGN KEY (`subCategoryID`) REFERENCES `questionsubcategory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Question_ibfk_3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Question_ibfk_4` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reportedincidentsbycustomer`
--
ALTER TABLE `reportedincidentsbycustomer`
  ADD CONSTRAINT `ReportedIncidentsByCustomer_ibfk_1` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`),
  ADD CONSTRAINT `ReportedIncidentsByCustomer_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `idx_fk3` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`);

--
-- Constraints for table `reportedincidentsbyexpert`
--
ALTER TABLE `reportedincidentsbyexpert`
  ADD CONSTRAINT `ReportedIncidentsByExperts_ibfk_1` FOREIGN KEY (`expertID`) REFERENCES `expert` (`id`),
  ADD CONSTRAINT `ReportedIncidentsByExperts_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `ibfk_ques` FOREIGN KEY (`questionID`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
