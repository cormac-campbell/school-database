-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2021 at 11:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ccampbell225`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE `Activity` (
  `AcID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `CaID` int(11) DEFAULT NULL,
  `BuID` bigint(20) DEFAULT NULL,
  `Status` varchar(255) NOT NULL,
  `Started` date NOT NULL,
  `Ended` date DEFAULT NULL,
  `Internal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`AcID`, `Title`, `CaID`, `BuID`, `Status`, `Started`, `Ended`, `Internal`) VALUES
(1, 'New Programme Promotion', 1, 1, 'On Going', '2021-02-01', NULL, 1),
(2, 'Coding Competition', 2, 2, 'Finished', '2019-01-01', '2019-01-30', 1),
(3, 'Drone Design Workshop', 1, 3, 'Finished', '2018-11-14', '2018-12-14', 1),
(4, 'Welcome Party', 3, 4, 'Planning', '2023-01-18', '2023-01-30', 1),
(5, 'Summer Undergraduate BBQ', 1, 5, 'Finished', '2016-06-07', '2016-06-08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Allocation`
--

CREATE TABLE `Allocation` (
  `StaffID` bigint(20) NOT NULL,
  `AcID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Allocation`
--

INSERT INTO `Allocation` (`StaffID`, `AcID`) VALUES
(5, 4),
(5, 2),
(2, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Budget`
--

CREATE TABLE `Budget` (
  `BuID` bigint(20) NOT NULL,
  `Amount` bigint(20) DEFAULT NULL,
  `Approver` varchar(255) DEFAULT NULL,
  `Payee` varchar(255) DEFAULT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Budget`
--

INSERT INTO `Budget` (`BuID`, `Amount`, `Approver`, `Payee`, `Status`) VALUES
(1, 1386, 'Jeff Tina', 'EEECS', 'Completed'),
(2, 1800, 'Lisa Amy', 'IT Mgt.', 'Approved'),
(3, 500, 'Lisa Amy', 'IT Mgt.', 'Approved'),
(4, 1000, 'Jim Jerry', 'Math', 'Approved'),
(5, 3000, 'Sharon Lee', 'Math', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `Campus`
--

CREATE TABLE `Campus` (
  `CaID` int(11) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `GmName` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Campus`
--

INSERT INTO `Campus` (`CaID`, `Address`, `GmName`, `Country`, `Status`) VALUES
(1, '123 PalmBeach Street London', 'Daniel Woo', 'UK', 'Open'),
(2, '24 Lewis Avenue Belfast', 'John Mary', 'UK', 'Open'),
(3, '231 Raffles Street Singapore', 'Alice Springer', 'Singapore', 'Open'),
(4, '19 George Avenue Sydney', 'Sakil Sheer', 'Australia', 'Ready to Open');

-- --------------------------------------------------------

--
-- Table structure for table `Classroom`
--

CREATE TABLE `Classroom` (
  `RmID` bigint(20) NOT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `CaID` int(11) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Classroom`
--

INSERT INTO `Classroom` (`RmID`, `Capacity`, `CaID`, `Location`, `Type`, `Status`) VALUES
(1, 50, 2, 'MM Tower, 23 Lewis Avenue Belfast', 'Classroom', 'Open'),
(2, 100, 2, 'CS Bldg, 24 Lewis Avenue Belfast', 'Classroom', 'Open'),
(3, 75, 2, 'CS Bldg, 24 Lewis Avenue Belfast', 'Classroom', 'Open'),
(4, 200, 1, 'Basement, 123 PalmBeach Street London', 'Hall', 'Ready to Open'),
(5, 25, 3, '1st Floor, 231 Raffles Street Singapore', 'Classroom', 'Under Repair');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DeptID` bigint(20) NOT NULL,
  `DeptName` varchar(255) NOT NULL,
  `Faculty` varchar(255) NOT NULL,
  `HODName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`DeptID`, `DeptName`, `Faculty`, `HODName`, `Address`) VALUES
(10, 'EEECS', 'Science and Engineering', 'David Jones', '10 Milan Road'),
(11, 'Math', 'Science and Engineering', 'Julie Clark', '12 Steven Street'),
(12, 'Mechanical Eng.', 'Science and Engineering', 'Andrew White', '128 Giant Ave.'),
(13, 'Information Eng.', 'Science and Engineering', 'Lee Anderson', '134 Lee Bank Garden'),
(14, 'Music', 'Arts', 'Peter Monash', '29 Jeep Street'),
(15, 'English', 'Arts', 'Mary Lee', '109 King Ave.');

-- --------------------------------------------------------

--
-- Table structure for table `Enrolment`
--

CREATE TABLE `Enrolment` (
  `EID` bigint(20) NOT NULL,
  `StudentID` bigint(20) NOT NULL,
  `ModuleID` bigint(20) NOT NULL,
  `Score` int(11) NOT NULL DEFAULT 1,
  `Semester` varchar(255) NOT NULL,
  `Year` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Enrolment`
--

INSERT INTO `Enrolment` (`EID`, `StudentID`, `ModuleID`, `Score`, `Semester`, `Year`) VALUES
(2, 2, 2, 76, 'S2', 2020),
(3, 3, 3, 88, 'S1', 2020),
(5, 5, 4, 87, 'S2', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `Module`
--

CREATE TABLE `Module` (
  `ModuleID` bigint(20) NOT NULL,
  `ModuleName` varchar(255) NOT NULL,
  `DeptID` bigint(20) NOT NULL,
  `Programme` varchar(255) DEFAULT NULL,
  `TMode` varchar(255) DEFAULT NULL,
  `Date_Of_Firstoffer` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Module`
--

INSERT INTO `Module` (`ModuleID`, `ModuleName`, `DeptID`, `Programme`, `TMode`, `Date_Of_Firstoffer`) VALUES
(1, 'Big Data', 10, 'Bachelor of CS', 'Face to Face/Online', '2000-01-01'),
(2, 'Java Programming', 10, 'Bachelor of CS', 'Face to Face/Online', '2001-01-01'),
(3, 'Data Structure', 10, 'Master of IT', 'Face to Face/Online', '2001-01-01'),
(4, 'Combustion Engine', 12, 'Bachelor of Eng.', 'Face to Face/Online', '1975-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `SpaceAssign`
--

CREATE TABLE `SpaceAssign` (
  `SpaID` bigint(20) NOT NULL,
  `RmID` bigint(20) NOT NULL,
  `TID` bigint(20) NOT NULL,
  `Manager` varchar(255) NOT NULL,
  `Approved` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SpaceAssign`
--

INSERT INTO `SpaceAssign` (`SpaID`, `RmID`, `TID`, `Manager`, `Approved`) VALUES
(1, 1, 3, 'Davis Leed', 'Yes'),
(2, 2, 4, 'Rajiv Sina', 'Yes'),
(3, 3, 2, 'Larry Cool', 'Pending'),
(4, 4, 1, 'Robert Lewis', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `StaffID` bigint(20) NOT NULL,
  `Title` varchar(32) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `DeptID` bigint(20) DEFAULT NULL,
  `CaID` int(11) NOT NULL,
  `Joined` date DEFAULT NULL,
  `LeftD` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL DEFAULT 1,
  `Salary` bigint(20) NOT NULL,
  `ContactType` varchar(32) NOT NULL,
  `SupervisorID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`StaffID`, `Title`, `FirstName`, `LastName`, `DeptID`, `CaID`, `Joined`, `LeftD`, `Current`, `Salary`, `ContactType`, `SupervisorID`) VALUES
(1, 'Dr', 'Daniel', 'Dare', 10, 1, '2005-05-13', '2009-01-12', 0, 40000, 'Full time', 5),
(2, 'Lady', 'Sarah', 'Important', 12, 1, '2005-06-15', NULL, 1, 38990, 'Part time', 5),
(3, 'Ms', 'Alice', 'Alive', 10, 1, '2010-06-15', NULL, 1, 35600, 'Part time', 2),
(4, 'Dr', 'Xander', 'Mander', 10, 1, '2010-04-18', NULL, 1, 45790, 'Part time', 3),
(5, 'Professor', 'Jenny', 'Generator', 12, 1, '2011-12-23', NULL, 1, 68000, 'Full time', 4),
(6, 'Ms', 'Gemma', 'Hardasnails', 11, 2, '2011-08-13', NULL, 1, 70000, 'Full time', 2),
(7, 'HRH', 'Prince', 'Caspian', 12, 1, '2017-09-01', NULL, 1, 21000, 'Full time', 5),
(8, 'Mr', 'Brian', 'Knuckles', 10, 3, '2008-07-01', '2010-09-30', 0, 30000, 'Full time', 6),
(9, 'Mr', 'Bob', 'Punch', 13, 1, '2008-07-01', NULL, 1, 29000, 'Full time', 6),
(10, 'Mrs', 'Natalie', 'Nononsense', 10, 1, '2010-10-13', NULL, 1, 37890, 'Full time', 6),
(11, 'Mr', 'Euan', 'Young', 11, 1, '2017-11-01', NULL, 1, 59000, 'Part time', 7);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StudentID` bigint(20) NOT NULL,
  `StudentName` varchar(255) NOT NULL,
  `DoB` date NOT NULL,
  `Address` varchar(255) NOT NULL,
  `StudyType` varchar(255) NOT NULL,
  `Date_Of_Start` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`StudentID`, `StudentName`, `DoB`, `Address`, `StudyType`, `Date_Of_Start`) VALUES
(1, 'Daniel Lee', '1996-05-13', '11 Martin Street', 'Full time', '2015-06-15'),
(2, 'Jenny Parry', '1997-06-15', '29 Orchard Ave', 'Full time', '2017-06-30'),
(3, 'Mohan Rashiv', '1998-09-15', '210 Kingston Street', 'Full time', '2017-06-30'),
(4, 'Laura Park', '1997-04-18', '56 Depak Park', 'Full time', '2018-06-30'),
(5, 'Levis Shepherd', '1999-12-23', '200 Johnson Ave', 'Full time', '2018-06-30');

-- --------------------------------------------------------

--
-- Table structure for table `Teach`
--

CREATE TABLE `Teach` (
  `TID` bigint(20) NOT NULL,
  `ModuleID` bigint(20) NOT NULL,
  `StaffID` bigint(20) NOT NULL,
  `SpaID` bigint(20) NOT NULL,
  `Semester` varchar(255) NOT NULL,
  `Year` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Teach`
--

INSERT INTO `Teach` (`TID`, `ModuleID`, `StaffID`, `SpaID`, `Semester`, `Year`) VALUES
(1, 4, 5, 1, 'S1', 2019),
(2, 2, 4, 2, 'S1', 2018),
(3, 3, 10, 3, 'S2', 2020),
(4, 4, 7, 4, 'S1', 2017);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activity`
--
ALTER TABLE `Activity`
  ADD PRIMARY KEY (`AcID`),
  ADD UNIQUE KEY `AcID` (`AcID`),
  ADD KEY `CalID` (`CaID`),
  ADD KEY `AcID_2` (`AcID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `Foreign Key` (`BuID`);

--
-- Indexes for table `Allocation`
--
ALTER TABLE `Allocation`
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `AcID` (`AcID`);

--
-- Indexes for table `Budget`
--
ALTER TABLE `Budget`
  ADD PRIMARY KEY (`BuID`),
  ADD UNIQUE KEY `BuID` (`BuID`),
  ADD KEY `BuID_2` (`BuID`);

--
-- Indexes for table `Campus`
--
ALTER TABLE `Campus`
  ADD PRIMARY KEY (`CaID`),
  ADD UNIQUE KEY `CalID` (`CaID`),
  ADD KEY `CalID_2` (`CaID`);

--
-- Indexes for table `Classroom`
--
ALTER TABLE `Classroom`
  ADD PRIMARY KEY (`RmID`),
  ADD UNIQUE KEY `RmID` (`RmID`),
  ADD KEY `CaID` (`CaID`),
  ADD KEY `RmID_2` (`RmID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DeptID`),
  ADD UNIQUE KEY `DeptID` (`DeptID`),
  ADD UNIQUE KEY `DeptName` (`DeptName`),
  ADD UNIQUE KEY `HODName` (`HODName`),
  ADD UNIQUE KEY `Address` (`Address`),
  ADD KEY `DeptID_2` (`DeptID`);

--
-- Indexes for table `Enrolment`
--
ALTER TABLE `Enrolment`
  ADD PRIMARY KEY (`EID`),
  ADD UNIQUE KEY `EID` (`EID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`),
  ADD KEY `EID_2` (`EID`),
  ADD KEY `StudentID_2` (`StudentID`),
  ADD KEY `Semester` (`Semester`),
  ADD KEY `Year` (`Year`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `Module`
--
ALTER TABLE `Module`
  ADD PRIMARY KEY (`ModuleID`),
  ADD UNIQUE KEY `ModuleID` (`ModuleID`),
  ADD KEY `DeptID` (`DeptID`),
  ADD KEY `ModuleID_2` (`ModuleID`),
  ADD KEY `ModuleName` (`ModuleName`);

--
-- Indexes for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  ADD PRIMARY KEY (`SpaID`),
  ADD UNIQUE KEY `SpaID` (`SpaID`),
  ADD KEY `RmID` (`RmID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD UNIQUE KEY `StaffID` (`StaffID`),
  ADD KEY `CalID` (`CaID`),
  ADD KEY `StaffID_2` (`StaffID`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `DeptID` (`DeptID`),
  ADD KEY `Current` (`Current`),
  ADD KEY `SupervisorID` (`SupervisorID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StudentID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`),
  ADD KEY `StudentID_2` (`StudentID`);

--
-- Indexes for table `Teach`
--
ALTER TABLE `Teach`
  ADD PRIMARY KEY (`TID`),
  ADD UNIQUE KEY `TID` (`TID`),
  ADD KEY `TID_2` (`TID`),
  ADD KEY `ModuleID_2` (`ModuleID`),
  ADD KEY `StaffID_2` (`StaffID`),
  ADD KEY `Semester` (`Semester`),
  ADD KEY `Year` (`Year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activity`
--
ALTER TABLE `Activity`
  MODIFY `AcID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Budget`
--
ALTER TABLE `Budget`
  MODIFY `BuID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Campus`
--
ALTER TABLE `Campus`
  MODIFY `CaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Classroom`
--
ALTER TABLE `Classroom`
  MODIFY `RmID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `DeptID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Enrolment`
--
ALTER TABLE `Enrolment`
  MODIFY `EID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Module`
--
ALTER TABLE `Module`
  MODIFY `ModuleID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  MODIFY `SpaID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Staff`
--
ALTER TABLE `Staff`
  MODIFY `StaffID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `StudentID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Teach`
--
ALTER TABLE `Teach`
  MODIFY `TID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Activity`
--
ALTER TABLE `Activity`
  ADD CONSTRAINT `Activity_ibfk_1` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CaID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Foreign Key` FOREIGN KEY (`BuID`) REFERENCES `Budget` (`BuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Allocation`
--
ALTER TABLE `Allocation`
  ADD CONSTRAINT `Allocation_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Allocation_ibfk_2` FOREIGN KEY (`AcID`) REFERENCES `Activity` (`AcID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Classroom`
--
ALTER TABLE `Classroom`
  ADD CONSTRAINT `Classroom_ibfk_1` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Enrolment`
--
ALTER TABLE `Enrolment`
  ADD CONSTRAINT `Enrolment_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Enrolment_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `Module` (`ModuleID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Module`
--
ALTER TABLE `Module`
  ADD CONSTRAINT `Module_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Department` (`DeptID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SpaceAssign`
--
ALTER TABLE `SpaceAssign`
  ADD CONSTRAINT `SpaceAssign_ibfk_1` FOREIGN KEY (`RmID`) REFERENCES `Classroom` (`RmID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SpaceAssign_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `Teach` (`TID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Department` (`DeptID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Staff_ibfk_2` FOREIGN KEY (`CaID`) REFERENCES `Campus` (`CaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Teach`
--
ALTER TABLE `Teach`
  ADD CONSTRAINT `Teach_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `Module` (`ModuleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Teach_ibfk_2` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Teach_ibfk_3` FOREIGN KEY (`SpaID`) REFERENCES `SpaceAssign` (`SpaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
