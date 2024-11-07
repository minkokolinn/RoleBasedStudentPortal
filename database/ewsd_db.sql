-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 26, 2022 at 07:06 AM
-- Server version: 8.0.30-0ubuntu0.22.04.1
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewsd_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int NOT NULL,
  `adminName` varchar(30) NOT NULL,
  `adminEmail` varchar(50) NOT NULL,
  `adminPassword` text NOT NULL,
  `adminPhone` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `adminName`, `adminEmail`, `adminPassword`, `adminPhone`) VALUES
(1, 'Admin', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', '09254325731');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `category`) VALUES
(1, 'Exam'),
(2, 'Fresher Welcome'),
(3, 'Marking Scheme'),
(4, 'In campus competitions'),
(5, 'Student Activities'),
(6, 'Canteen'),
(7, 'Suggestions');

-- --------------------------------------------------------

--
-- Table structure for table `closuredate`
--

CREATE TABLE `closuredate` (
  `cdId` int NOT NULL,
  `academicYear` varchar(50) DEFAULT NULL,
  `closureDate` date DEFAULT NULL,
  `finalClosureDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `closuredate`
--

INSERT INTO `closuredate` (`cdId`, `academicYear`, `closureDate`, `finalClosureDate`) VALUES
(2, '2022-2023', '2022-05-04', '2022-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentId` int NOT NULL,
  `comment` text,
  `ideaId` int DEFAULT NULL,
  `adminId` int DEFAULT NULL,
  `qamId` int DEFAULT NULL,
  `qacId` int DEFAULT NULL,
  `staffId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `deptId` int NOT NULL,
  `department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`deptId`, `department`) VALUES
(2, 'Art Department'),
(3, 'Science School'),
(4, 'Computer Science'),
(5, 'Law School'),
(6, 'Business & Management'),
(7, 'Math Department'),
(8, 'Engineering Department'),
(9, 'Cyber Security'),
(12, 'Library Department'),
(13, 'Programming');

-- --------------------------------------------------------

--
-- Table structure for table `idea`
--

CREATE TABLE `idea` (
  `ideaId` int NOT NULL,
  `qamId` int DEFAULT NULL,
  `qacId` int DEFAULT NULL,
  `staffId` int DEFAULT NULL,
  `adminId` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `idea` text,
  `document` text,
  `anonymousStatus` tinyint(1) DEFAULT NULL,
  `uploadDate` date DEFAULT NULL,
  `uploadTime` time DEFAULT NULL,
  `thumbUp` int NOT NULL,
  `thumbDown` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `idea`
--

INSERT INTO `idea` (`ideaId`, `qamId`, `qacId`, `staffId`, `adminId`, `categoryId`, `idea`, `document`, `anonymousStatus`, `uploadDate`, `uploadTime`, `thumbUp`, `thumbDown`) VALUES
(32, 2, NULL, NULL, NULL, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus luctus est quis blandit. Pellentesque mollis porta dapibus. Aliquam euismod aliquam lacus, id bibendum lectus dapibus eget. Nulla vulputate ligula nec risus efficitur sagittis. Integer pharetra, velit sit amet accumsan suscipit, orci risus scelerisque ipsum, id aliquet urna mi non lorem. Cras tempus cursus tellus, a posuere ipsum mollis ac. In ornare fringilla lorem, eu auctor nibh. Nunc at quam ac ante blandit volutpat dignissim eu nisl. Aenean varius cursus libero. Nullam id velit ornare, tempus erat ullamcorper, euismod lorem. Nam ornare enim molestie molestie sollicitudin. Nam blandit tincidunt libero, et pharetra lacus tincidunt in.\r\n\r\nAenean commodo suscipit tempus. Duis pulvinar ligula ut condimentum maximus. Praesent rutrum, dolor consectetur consectetur ullamcorper, urna purus tempus libero, ac fringilla neque neque nec mi. Phasellus vel porta massa. In elementum porta nisl, id tincidunt nisi faucibus nec. Nunc interdum ligula in nunc lacinia, eget scelerisque dui sagittis. Aenean id iaculis massa, sit amet placerat elit. Duis et felis ac erat mollis maximus ac nec ex. Aliquam sit amet malesuada justo. Maecenas bibendum ac ex vel interdum. Sed suscipit rutrum ligula ac tempor. Etiam elit nulla, venenatis in hendrerit a, porta ac orci. Pellentesque blandit porta nibh, sit amet placerat justo volutpat vel. Duis ultrices auctor arcu.\r\n\r\n', 'longtext.pdf', 0, '2022-04-30', '19:08:55', 0, 0),
(33, NULL, NULL, 2, NULL, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus luctus est quis blandit. Pellentesque mollis porta dapibus. Aliquam euismod aliquam lacus, id bibendum lectus dapibus eget. Nulla vulputate ligula nec risus efficitur sagittis. Integer pharetra, velit sit amet accumsan suscipit, orci risus scelerisque ipsum, id aliquet urna mi non lorem. Cras tempus cursus tellus, a posuere ipsum mollis ac. In ornare fringilla lorem, eu auctor nibh. Nunc at quam ac ante blandit volutpat dignissim eu nisl. Aenean varius cursus libero. Nullam id velit ornare, tempus erat ullamcorper, euismod lorem. Nam ornare enim molestie molestie sollicitudin. Nam blandit tincidunt libero, et pharetra lacus tincidunt in.\r\n\r\nAenean commodo suscipit tempus. Duis pulvinar ligula ut condimentum maximus. Praesent rutrum, dolor consectetur consectetur ullamcorper, urna purus tempus libero, ac fringilla neque neque nec mi. Phasellus vel porta massa. In elementum porta nisl, id tincidunt nisi faucibus nec. Nunc interdum ligula in nunc lacinia, eget scelerisque dui sagittis. Aenean id iaculis massa, sit amet placerat elit. Duis et felis ac erat mollis maximus ac nec ex. Aliquam sit amet malesuada justo. Maecenas bibendum ac ex vel interdum. Sed suscipit rutrum ligula ac tempor. Etiam elit nulla, venenatis in hendrerit a, porta ac orci. Pellentesque blandit porta nibh, sit amet placerat justo volutpat vel. Duis ultrices auctor arcu.\r\n\r\n', 'something.pdf', 0, '2022-04-30', '19:13:00', 0, 0),
(34, NULL, NULL, 4, NULL, 2, 'Hello I am handsome', NULL, 0, '2022-06-21', '12:23:37', 0, 0),
(35, NULL, NULL, 1, NULL, 5, 'Hola Nyan Win Naing', NULL, 0, '2022-06-21', '12:27:53', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qac`
--

CREATE TABLE `qac` (
  `qacId` int NOT NULL,
  `qacName` varchar(30) DEFAULT NULL,
  `qacPhone` varchar(22) DEFAULT NULL,
  `qacEmail` varchar(50) DEFAULT NULL,
  `qacPassword` text,
  `qacAddress` text,
  `status` tinyint(1) DEFAULT NULL,
  `deptId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qac`
--

INSERT INTO `qac` (`qacId`, `qacName`, `qacPhone`, `qacEmail`, `qacPassword`, `qacAddress`, `status`, `deptId`) VALUES
(1, 'John', '09383738921', 'john@gmail.com', '$2y$10$qhfbwFus465GERmQNm1Vt.oHp3gy.vUhRXOZcE96/AQ9nMkXiZuy6', 'yangon', 1, 5),
(2, 'Mark', '098237238723', 'mark@gmail.com', '$2y$10$d8wnlXUxNcBSCfPb6PPNT.hoi.xB0xJgOvrpZeXb4wAaEBOD3AsOG', 'bago', 0, 9),
(3, 'Zane', '094844384393', 'zane@gmail.com', '$2y$10$lTa83T2O/OzZPe/uAQa4L../rU16sochx8nfXDQCbT/z/nLBz.KOS', 'ahlone, yangon', 1, 2),
(4, 'Luke', '096837388321', 'luke@gmail.com', '$2y$10$hHBNr1V9UYU6D2nKZKI9Y.kln921wMl0WoabSd/0VM.C6A2kU4AAC', 'London, England', 1, 5),
(5, 'Arkar', '09254252626', 'minkokolinn8@gmail.com', '$2y$10$ctmkdUNqxqeCOQVMa478MuyJeNv5z04qVz6Kq0qi1BA7z.dhNbb9i', '', 1, 8),
(7, 'Leon', '098777', 'leon@gmail.com', '$2y$10$G15rifMZItgGiiPUIELuhO9Tr3HPjGul1TH4dLw9tmV3Z4FsEywNW', 'yangon', 1, 6),
(8, 'Nyan Win Naing', '0925455454', 'nyanwinnaing1922002@gmail.com', '$2y$10$oTkUzOj/I8XC6.cPIh2R9eF.Dz5MGYcCURsVfinHxql43mFXV4Hii', '', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `qam`
--

CREATE TABLE `qam` (
  `qamId` int NOT NULL,
  `qamName` varchar(30) NOT NULL,
  `qamPhone` varchar(22) NOT NULL,
  `qamEmail` varchar(50) NOT NULL,
  `qamPassword` text NOT NULL,
  `qamAddress` text,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qam`
--

INSERT INTO `qam` (`qamId`, `qamName`, `qamPhone`, `qamEmail`, `qamPassword`, `qamAddress`, `status`) VALUES
(1, 'David Martinnn', '09283932832', 'dm@gmail.com', '$2y$10$.4N1qDIDYP30pkUiYMN4oeNYl4nx/FyScGqj.v3qbYr9rE3rB7az6', 'bago', 1),
(2, 'Lewis Capaldi', '093837832', 'lc@gmail.com', '$2y$10$Xv36U.DS6rUuKnDKgr6GOeQ9nBPupAr3LYU7dIQaT.4/HvmsAxfle', 'bagan', 1),
(3, 'Jonas Denk', '09282382323', 'jd@gmail.com', '$2y$10$hyijZqryodtrlcd1vkTW8uFou8YXV9tyOwaUtbGiInnrQb4ZSE.lW', '', 0),
(4, 'John', '092782728', 'john@gmail.com', '$2y$10$hF7LfJLozV5ETNDYky8Sy.SxoHRh64v4/eztC0le5Z5mkBUzwNuVq', 'mandalay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_info`
--

CREATE TABLE `rating_info` (
  `rating_info_id` int NOT NULL,
  `ideaId` int DEFAULT NULL,
  `adminId` int DEFAULT NULL,
  `qamId` int DEFAULT NULL,
  `qacId` int DEFAULT NULL,
  `staffId` int DEFAULT NULL,
  `rating_action` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffId` int NOT NULL,
  `staffName` varchar(50) DEFAULT NULL,
  `staffPhone` varchar(20) DEFAULT NULL,
  `staffEmail` varchar(100) DEFAULT NULL,
  `staffPassword` text,
  `staffAddress` text,
  `status` tinyint(1) DEFAULT NULL,
  `deptId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffId`, `staffName`, `staffPhone`, `staffEmail`, `staffPassword`, `staffAddress`, `status`, `deptId`) VALUES
(1, 'Mg', '095423232399', 'mg@gmail.com', '$2y$10$lGLBaoe/KBENeorvSPOoFuBHwNRN/jrPtuepb4eZtTNqGgdReWoWO', 'mawlamyaing', 1, 8),
(2, 'Min', '0974237878238', 'min@gmail.com', '$2y$10$BxZ.PFHRnA2qDVTDY.HnZeuDzGacrRS9Jor6Z3aujvJNOliffoRhq', 'yangon', 1, 7),
(4, 'blah', '0982672722', 'blah@gmail.com', '$2y$10$nzFnHesKao73R2SR.zGxpOPX0RH85ACPOsDx5hOrsd35UAYL5PCju', '', 1, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `closuredate`
--
ALTER TABLE `closuredate`
  ADD PRIMARY KEY (`cdId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `ideaId` (`ideaId`),
  ADD KEY `adminId` (`adminId`),
  ADD KEY `qamId` (`qamId`),
  ADD KEY `qacId` (`qacId`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`deptId`);

--
-- Indexes for table `idea`
--
ALTER TABLE `idea`
  ADD PRIMARY KEY (`ideaId`),
  ADD KEY `qamId` (`qamId`),
  ADD KEY `qacId` (`qacId`),
  ADD KEY `staffId` (`staffId`),
  ADD KEY `adminId` (`adminId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indexes for table `qac`
--
ALTER TABLE `qac`
  ADD PRIMARY KEY (`qacId`),
  ADD KEY `deptId` (`deptId`);

--
-- Indexes for table `qam`
--
ALTER TABLE `qam`
  ADD PRIMARY KEY (`qamId`);

--
-- Indexes for table `rating_info`
--
ALTER TABLE `rating_info`
  ADD PRIMARY KEY (`rating_info_id`),
  ADD KEY `ideaId` (`ideaId`),
  ADD KEY `adminId` (`adminId`),
  ADD KEY `qamId` (`qamId`),
  ADD KEY `qacId` (`qacId`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffId`),
  ADD KEY `deptId` (`deptId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `closuredate`
--
ALTER TABLE `closuredate`
  MODIFY `cdId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `deptId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `idea`
--
ALTER TABLE `idea`
  MODIFY `ideaId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `qac`
--
ALTER TABLE `qac`
  MODIFY `qacId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `qam`
--
ALTER TABLE `qam`
  MODIFY `qamId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rating_info`
--
ALTER TABLE `rating_info`
  MODIFY `rating_info_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ideaId`) REFERENCES `idea` (`ideaId`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`qamId`) REFERENCES `qam` (`qamId`),
  ADD CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`qacId`) REFERENCES `qac` (`qacId`),
  ADD CONSTRAINT `comment_ibfk_5` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`);

--
-- Constraints for table `idea`
--
ALTER TABLE `idea`
  ADD CONSTRAINT `idea_ibfk_1` FOREIGN KEY (`qamId`) REFERENCES `qam` (`qamId`),
  ADD CONSTRAINT `idea_ibfk_2` FOREIGN KEY (`qacId`) REFERENCES `qac` (`qacId`),
  ADD CONSTRAINT `idea_ibfk_3` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`),
  ADD CONSTRAINT `idea_ibfk_4` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`),
  ADD CONSTRAINT `idea_ibfk_5` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`);

--
-- Constraints for table `qac`
--
ALTER TABLE `qac`
  ADD CONSTRAINT `qac_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`);

--
-- Constraints for table `rating_info`
--
ALTER TABLE `rating_info`
  ADD CONSTRAINT `rating_info_ibfk_1` FOREIGN KEY (`ideaId`) REFERENCES `idea` (`ideaId`),
  ADD CONSTRAINT `rating_info_ibfk_2` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`),
  ADD CONSTRAINT `rating_info_ibfk_3` FOREIGN KEY (`qamId`) REFERENCES `qam` (`qamId`),
  ADD CONSTRAINT `rating_info_ibfk_4` FOREIGN KEY (`qacId`) REFERENCES `qac` (`qacId`),
  ADD CONSTRAINT `rating_info_ibfk_5` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `department` (`deptId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
