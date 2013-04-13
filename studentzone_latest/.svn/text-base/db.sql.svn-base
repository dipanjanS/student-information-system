-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2013 at 08:00 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `studentzone`
--
CREATE DATABASE `studentzone` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `studentzone`;

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_admin`
--

CREATE TABLE IF NOT EXISTS `studentzone_admin` (
  `adminID` int(10) NOT NULL AUTO_INCREMENT,
  `adminUserName` varchar(20) NOT NULL,
  `adminPassword` varchar(128) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminUserName` (`adminUserName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `studentzone_admin`
--

INSERT INTO `studentzone_admin` (`adminID`, `adminUserName`, `adminPassword`) VALUES
(1, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_announcement`
--

CREATE TABLE IF NOT EXISTS `studentzone_announcement` (
  `announcementID` int(10) NOT NULL AUTO_INCREMENT,
  `heading` varchar(512) NOT NULL,
  `content` varchar(512) NOT NULL,
  `announcementCreatedOn` date DEFAULT NULL,
  `validity` date NOT NULL,
  `announcementModifiedOn` date DEFAULT NULL,
  `announcementCreatedBy` varchar(255) DEFAULT NULL,
  `announcementModifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`announcementID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `studentzone_announcement`
--

INSERT INTO `studentzone_announcement` (`announcementID`, `heading`, `content`, `announcementCreatedOn`, `validity`, `announcementModifiedOn`, `announcementCreatedBy`, `announcementModifiedBy`) VALUES
(5, 'Spic Macay', 'Please attend the latest concert in Room 106 on the 25th of February, 2013', NULL, '2013-02-25', NULL, NULL, NULL),
(6, 'Spandan 2013', 'Please don''t forget to register for the various games in Spandan on the portal.', NULL, '2013-03-15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_enrollment`
--

CREATE TABLE IF NOT EXISTS `studentzone_enrollment` (
  `enrollmentID` int(10) NOT NULL AUTO_INCREMENT,
  `enrollmentSemester` varchar(20) NOT NULL,
  `enrollmentDeadLine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`enrollmentID`),
  UNIQUE KEY `subjectID` (`subjectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `studentzone_enrollment`
--

INSERT INTO `studentzone_enrollment` (`enrollmentID`, `enrollmentSemester`, `enrollmentDeadLine`, `subjectID`) VALUES
(1, 'Semester 1', '2012-12-10 17:39:27', 1),
(2, 'Semester 1', '2012-12-10 17:40:08', 6),
(3, 'Semester 1', '2013-02-20 14:30:00', 5),
(4, 'Semester 1', '2013-02-21 15:45:40', 7),
(5, 'Semester 2', '2013-02-22 18:00:00', 2),
(6, 'Semester 2', '2013-02-26 01:45:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_faculty`
--

CREATE TABLE IF NOT EXISTS `studentzone_faculty` (
  `facultyID` int(10) NOT NULL AUTO_INCREMENT,
  `facultyCode` varchar(10) NOT NULL,
  `facultyName` varchar(50) NOT NULL,
  PRIMARY KEY (`facultyID`),
  KEY `facultyCode` (`facultyCode`,`facultyName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `studentzone_faculty`
--

INSERT INTO `studentzone_faculty` (`facultyID`, `facultyCode`, `facultyName`) VALUES
(2, 'DD', 'Debabrata Das'),
(6, 'JP', 'Jay Prakash'),
(3, 'KVD', 'K. V. Dinesha'),
(5, 'MD', 'Meenakshi DSouza'),
(1, 'RC', 'Chandrashekhar Ramanathan'),
(19, 'SR', 'Shrisha Rao'),
(9, 'SS', 'Srinath Srinivasan');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_friendship`
--

CREATE TABLE IF NOT EXISTS `studentzone_friendship` (
  `friendshipID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `friendID` int(10) NOT NULL,
  PRIMARY KEY (`friendshipID`),
  KEY `studentID` (`studentID`,`friendID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `studentzone_friendship`
--

INSERT INTO `studentzone_friendship` (`friendshipID`, `studentID`, `friendID`) VALUES
(61, 9, 4),
(81, 9, 12),
(63, 9, 14),
(78, 9, 15),
(75, 10, 15),
(80, 12, 9),
(73, 12, 15),
(62, 14, 9),
(79, 15, 9),
(74, 15, 10),
(72, 15, 12);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_grade`
--

CREATE TABLE IF NOT EXISTS `studentzone_grade` (
  `gradeID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectGrade` varchar(2) NOT NULL,
  `subjectResult` varchar(10) NOT NULL,
  `studentID` int(10) NOT NULL,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`gradeID`),
  KEY `studentID` (`studentID`),
  KEY `fk_subj` (`subjectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `studentzone_grade`
--

INSERT INTO `studentzone_grade` (`gradeID`, `subjectGrade`, `subjectResult`, `studentID`, `subjectID`) VALUES
(8, 'A', 'PASS', 15, 7),
(9, 'A', 'PASS', 15, 5),
(10, 'A-', 'PASS', 15, 6),
(11, 'A-', 'PASS', 15, 1),
(12, 'A-', 'PASS', 15, 2),
(13, 'A-', 'PASS', 14, 3),
(14, 'A', 'PASS', 14, 5),
(15, 'A', 'PASS', 14, 7),
(16, 'A-', 'PASS', 11, 5),
(17, 'A', 'PASS', 11, 2),
(18, 'A', 'PASS', 11, 3),
(19, 'A', 'PASS', 10, 5),
(20, 'A-', 'PASS', 10, 7),
(21, 'B', 'PASS', 10, 2),
(22, 'A', 'PASS', 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_interest`
--

CREATE TABLE IF NOT EXISTS `studentzone_interest` (
  `interestID` int(10) NOT NULL AUTO_INCREMENT,
  `interestName` varchar(100) NOT NULL,
  PRIMARY KEY (`interestID`),
  UNIQUE KEY `interestName` (`interestName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `studentzone_interest`
--

INSERT INTO `studentzone_interest` (`interestID`, `interestName`) VALUES
(5, 'cooking'),
(2, 'dance'),
(4, 'movies'),
(3, 'music'),
(6, 'reading'),
(1, 'sports');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_news`
--

CREATE TABLE IF NOT EXISTS `studentzone_news` (
  `NEWSID` int(11) NOT NULL AUTO_INCREMENT,
  `heading` varchar(512) NOT NULL,
  `content` longtext NOT NULL,
  `validity` date DEFAULT NULL,
  `NEWSCreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NEWSModifiedOn` timestamp NULL DEFAULT NULL,
  `NEWSModifiedBy` int(10) DEFAULT NULL,
  `NEWSCreatedBy` int(10) NOT NULL,
  PRIMARY KEY (`NEWSID`),
  KEY `NEWSCreatedBy` (`NEWSCreatedBy`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `studentzone_news`
--

INSERT INTO `studentzone_news` (`NEWSID`, `heading`, `content`, `validity`, `NEWSCreatedOn`, `NEWSModifiedOn`, `NEWSModifiedBy`, `NEWSCreatedBy`) VALUES
(3, 'test', 'test', '2013-02-19', '2013-02-09 13:22:28', NULL, NULL, 1),
(4, 'IIITB Newsletter', 'The latest version of the newsletter is out. Grab your copy today!', '2013-03-31', '2013-02-12 15:46:22', NULL, NULL, 1),
(5, 'IIITB Food Court', 'The food Court has been repainted with fresh, vibrant colors. Check it out today! ', '2013-03-31', '2013-02-12 15:47:12', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_student`
--

CREATE TABLE IF NOT EXISTS `studentzone_student` (
  `studentID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `emailID` varchar(256) DEFAULT NULL,
  `lastAccess` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `studentzone_student`
--

INSERT INTO `studentzone_student` (`studentID`, `userName`, `password`, `emailID`, `lastAccess`) VALUES
(9, 'anand', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-02-12 16:55:28'),
(10, 'ritu', '5f4dcc3b5aa765d61d8327deb882cf99', 'ritu.sharma@iiitb.org', '2013-02-12 17:31:52'),
(11, 'suvadra', 'd781131d9b585849347509185d9056e8', 'suvadra.tripathy@iiitb.org', '2013-02-12 16:42:19'),
(12, 'neha', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-03-07 18:34:10'),
(14, 'dipanjan', '5f4dcc3b5aa765d61d8327deb882cf99', 'dipanjan.sarkar@iiitb.org', '2013-02-12 17:04:39'),
(15, 'avipsa', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-02-12 17:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_student_enrollment`
--

CREATE TABLE IF NOT EXISTS `studentzone_student_enrollment` (
  `studentEnrollmentID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `enrollmentID` int(10) NOT NULL,
  PRIMARY KEY (`studentEnrollmentID`),
  KEY `studentID` (`studentID`,`enrollmentID`),
  KEY `enrollmentID` (`enrollmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `studentzone_student_enrollment`
--

INSERT INTO `studentzone_student_enrollment` (`studentEnrollmentID`, `studentID`, `enrollmentID`) VALUES
(17, 10, 3),
(18, 10, 4),
(19, 10, 5),
(20, 10, 6),
(14, 11, 3),
(15, 11, 5),
(16, 11, 6),
(13, 14, 3),
(7, 14, 4),
(12, 14, 5),
(8, 14, 6),
(10, 15, 3),
(9, 15, 4),
(11, 15, 5),
(21, 15, 6);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_student_interest`
--

CREATE TABLE IF NOT EXISTS `studentzone_student_interest` (
  `studentInterestID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) DEFAULT NULL,
  `interestID` int(10) DEFAULT NULL,
  `interestName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentInterestID`),
  KEY `studentID` (`studentID`),
  KEY `interestID` (`interestID`),
  KEY `FK_studentzone_student_interest_studentzone_interest_2` (`interestName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `studentzone_student_interest`
--

INSERT INTO `studentzone_student_interest` (`studentInterestID`, `studentID`, `interestID`, `interestName`) VALUES
(67, 9, 2, 'dance'),
(81, 15, 5, 'cooking'),
(82, 15, 3, 'music'),
(83, 10, 5, 'cooking'),
(84, 10, 2, 'dance'),
(85, 12, 2, 'dance');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_student_profile`
--

CREATE TABLE IF NOT EXISTS `studentzone_student_profile` (
  `profileID` int(10) NOT NULL AUTO_INCREMENT,
  `studentRollNo` varchar(20) NOT NULL,
  `studentName` varchar(40) NOT NULL,
  `studentDOB` date NOT NULL,
  `studentImgUrl` varchar(512) DEFAULT NULL,
  `studentID` int(10) NOT NULL,
  PRIMARY KEY (`profileID`),
  UNIQUE KEY `studentID` (`studentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `studentzone_student_profile`
--

INSERT INTO `studentzone_student_profile` (`profileID`, `studentRollNo`, `studentName`, `studentDOB`, `studentImgUrl`, `studentID`) VALUES
(7, 'MT2012009', 'Rahul', '2013-02-19', 'uploads/profilepictures/6a210153-5361-4254-9918-474b4443839c-1.jpg', 9),
(8, 'MT2012117', 'Ritu Sharma', '2013-02-12', 'uploads/profilepictures/7e1b936d-ca72-4a3a-b010-f974bec61152-ritu.jpg', 10),
(9, 'MT2012148', 'Suvadra Tripathy', '1988-06-26', 'uploads/profilepictures/c0d9661d-6365-4d94-b7e0-39f155a4f735-suvadra.jpg', 11),
(10, 'MT2012088', 'Neha Gupta', '1987-02-10', 'uploads/profilepictures/4034256a-0734-4491-b78a-bff0b98189f7-17again31024-45528.jpeg', 12),
(12, 'MT2012043', 'Dipanjan Sarkar', '1990-12-18', 'uploads/profilepictures/14c28275-225f-4336-a8e8-3cccf52d5ad8-185068_4819728936811_37874243_n.jpg', 14),
(13, 'MT2012029', 'Avipsa Nayak', '1988-06-23', 'uploads/profilepictures/33dfb9fa-1035-4e49-ad76-70eb509044df-avipsa.jpg', 15);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_student_subject`
--

CREATE TABLE IF NOT EXISTS `studentzone_student_subject` (
  `student_subjectID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`student_subjectID`),
  KEY `studentID` (`studentID`),
  KEY `subjectID` (`subjectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `studentzone_student_subject`
--

INSERT INTO `studentzone_student_subject` (`student_subjectID`, `studentID`, `subjectID`) VALUES
(10, 14, 7),
(11, 14, 3),
(12, 15, 7),
(13, 15, 5),
(14, 15, 2),
(15, 14, 2),
(16, 14, 5),
(17, 11, 5),
(18, 11, 2),
(19, 11, 3),
(20, 10, 5),
(21, 10, 7),
(22, 10, 2),
(23, 10, 3),
(24, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_subject`
--

CREATE TABLE IF NOT EXISTS `studentzone_subject` (
  `subjectID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) NOT NULL,
  `subjectCode` varchar(10) NOT NULL,
  `subjectSemester` varchar(20) NOT NULL,
  PRIMARY KEY (`subjectID`),
  KEY `subjectName` (`subjectName`,`subjectCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `studentzone_subject`
--

INSERT INTO `studentzone_subject` (`subjectID`, `subjectName`, `subjectCode`, `subjectSemester`) VALUES
(1, 'Data Modelling', 'DB210', 'Semester 2'),
(2, 'OOAD', 'SE210', 'Semester 2'),
(3, 'SE', 'SE211', 'Semester 2'),
(4, 'OS', 'OS210', 'Semester 2'),
(5, 'Data Management', 'DB110', 'Semester 1'),
(6, 'Network and Comm', 'NC101', 'Semester 1'),
(7, 'Java Programming', 'PAS110', 'Semester 1'),
(8, 'ABC', 'ABC211', 'Semester 2');

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_subject_faculty`
--

CREATE TABLE IF NOT EXISTS `studentzone_subject_faculty` (
  `subjectFacultyID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectID` int(10) DEFAULT NULL,
  `facultyID` int(10) DEFAULT NULL,
  PRIMARY KEY (`subjectFacultyID`),
  KEY `subjectID` (`subjectID`,`facultyID`),
  KEY `facultyID` (`facultyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `studentzone_subject_faculty`
--

INSERT INTO `studentzone_subject_faculty` (`subjectFacultyID`, `subjectID`, `facultyID`) VALUES
(1, 1, 1),
(15, 2, 3),
(17, 3, 5),
(18, 4, 19),
(5, 5, 1),
(6, 6, 2),
(16, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `studentzone_syllabus`
--

CREATE TABLE IF NOT EXISTS `studentzone_syllabus` (
  `syllabusID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectSyllabus` longtext,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`syllabusID`),
  UNIQUE KEY `subjectID` (`subjectID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `studentzone_syllabus`
--

INSERT INTO `studentzone_syllabus` (`syllabusID`, `subjectSyllabus`, `subjectID`) VALUES
(1, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 1),
(2, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 4),
(3, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 7),
(4, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 2),
(5, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 6),
(6, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 3),
(7, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `studentzone_enrollment`
--
ALTER TABLE `studentzone_enrollment`
  ADD CONSTRAINT `studentzone_enrollment_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_friendship`
--
ALTER TABLE `studentzone_friendship`
  ADD CONSTRAINT `studentzone_friendship_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_grade`
--
ALTER TABLE `studentzone_grade`
  ADD CONSTRAINT `fk_subj` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`),
  ADD CONSTRAINT `studentzone_grade_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_news`
--
ALTER TABLE `studentzone_news`
  ADD CONSTRAINT `studentzone_NEWS_ibfk_1` FOREIGN KEY (`NEWSCreatedBy`) REFERENCES `studentzone_admin` (`adminID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `studentzone_student_enrollment`
--
ALTER TABLE `studentzone_student_enrollment`
  ADD CONSTRAINT `studentzone_student_enrollment_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentzone_student_enrollment_ibfk_2` FOREIGN KEY (`enrollmentID`) REFERENCES `studentzone_enrollment` (`enrollmentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_student_interest`
--
ALTER TABLE `studentzone_student_interest`
  ADD CONSTRAINT `FK_studentzone_student_interest_studentzone_interest` FOREIGN KEY (`interestID`) REFERENCES `studentzone_interest` (`interestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_studentzone_student_interest_studentzone_interest_2` FOREIGN KEY (`interestName`) REFERENCES `studentzone_interest` (`interestName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_studentzone_student_interest_studentzone_student` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_student_profile`
--
ALTER TABLE `studentzone_student_profile`
  ADD CONSTRAINT `studentzone_student_rofile_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_student_subject`
--
ALTER TABLE `studentzone_student_subject`
  ADD CONSTRAINT `studentzone_student_subject_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentzone_student_subject_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_subject_faculty`
--
ALTER TABLE `studentzone_subject_faculty`
  ADD CONSTRAINT `studentzone_subject_faculty_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentzone_subject_faculty_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `studentzone_faculty` (`facultyID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentzone_syllabus`
--
ALTER TABLE `studentzone_syllabus`
  ADD CONSTRAINT `studentzone_syllabus_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
