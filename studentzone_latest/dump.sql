-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.16 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4156
-- Date/time:                    2013-03-21 19:54:26
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for studentzone
CREATE DATABASE IF NOT EXISTS `studentzone` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `studentzone`;


-- Dumping structure for table studentzone.studentzone_admin
CREATE TABLE IF NOT EXISTS `studentzone_admin` (
  `adminID` int(10) NOT NULL AUTO_INCREMENT,
  `adminUserName` varchar(20) NOT NULL,
  `adminPassword` varchar(128) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminUserName` (`adminUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `studentzone_admin` DISABLE KEYS */;
INSERT INTO `studentzone_admin` (`adminID`, `adminUserName`, `adminPassword`) VALUES
	(1, 'admin', 'password');
/*!40000 ALTER TABLE `studentzone_admin` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_announcement
CREATE TABLE IF NOT EXISTS `studentzone_announcement` (
  `announcementID` int(10) NOT NULL AUTO_INCREMENT,
  `heading` varchar(512) NOT NULL,
  `content` varchar(512) NOT NULL,
  `announcementCreatedOn` date DEFAULT NULL,
  `validity` date NOT NULL,
  `announcementModifiedOn` date DEFAULT NULL,
  `announcementCreatedBy` varchar(255) DEFAULT NULL,
  `announcementModifiedBy` varchar(255) DEFAULT NULL,
  `interestID` int(10) DEFAULT NULL,
  PRIMARY KEY (`announcementID`),
  KEY `FK_studentzone_announcement_studentzone_interest` (`interestID`),
  CONSTRAINT `FK_studentzone_announcement_studentzone_interest` FOREIGN KEY (`interestID`) REFERENCES `studentzone_interest` (`interestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_announcement: ~7 rows (approximately)
/*!40000 ALTER TABLE `studentzone_announcement` DISABLE KEYS */;
INSERT INTO `studentzone_announcement` (`announcementID`, `heading`, `content`, `announcementCreatedOn`, `validity`, `announcementModifiedOn`, `announcementCreatedBy`, `announcementModifiedBy`, `interestID`) VALUES
	(5, 'Spic Macay', 'Please attend the latest concert in Room 106 on the 25th of February, 2013', NULL, '2013-04-15', NULL, NULL, NULL, 3),
	(6, 'Spandan 2013', 'Please don\'t forget to register for the various games in Spandan on the portal.', NULL, '2013-04-15', NULL, NULL, NULL, 1),
	(7, 'Movie Club Anniversary', 'Please attend the anniversary of Movie Club', NULL, '2013-04-19', NULL, NULL, NULL, 4),
	(8, 'Movie Tonight', 'Don\'t miss the movie "ARGO" - an Oscar winner ...!!! Finish your assigments and projects work and be on time.', NULL, '2013-03-22', NULL, NULL, NULL, 4),
	(9, 'Book Review Week', 'Don\'t forget to participate in the Book Review Week Starting next week.', NULL, '2013-03-25', NULL, NULL, NULL, 6),
	(10, 'Cultural Fest', 'Please don\'t forget to participate in the Cultural Fest of IIITB.', NULL, '2013-04-20', NULL, NULL, NULL, 2),
	(11, 'Cultural Fest', 'Please don\'t forget to participate in the Cultural Fest of IIITB.', NULL, '2013-04-20', NULL, NULL, NULL, 3);
/*!40000 ALTER TABLE `studentzone_announcement` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_enemy
CREATE TABLE IF NOT EXISTS `studentzone_enemy` (
  `studentenemyID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `enemyID` int(10) NOT NULL,
  PRIMARY KEY (`studentenemyID`),
  KEY `FK_studentzone_enemy_studentzone_student` (`studentID`),
  KEY `FK_studentzone_enemy_studentzone_student_2` (`enemyID`),
  CONSTRAINT `FK_studentzone_enemy_studentzone_student` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_studentzone_enemy_studentzone_student_2` FOREIGN KEY (`enemyID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_enemy: ~4 rows (approximately)
/*!40000 ALTER TABLE `studentzone_enemy` DISABLE KEYS */;
INSERT INTO `studentzone_enemy` (`studentenemyID`, `studentID`, `enemyID`) VALUES
	(2, 15, 12),
	(10, 15, 11),
	(12, 15, 9),
	(13, 10, 14);
/*!40000 ALTER TABLE `studentzone_enemy` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_enrollment
CREATE TABLE IF NOT EXISTS `studentzone_enrollment` (
  `enrollmentID` int(10) NOT NULL AUTO_INCREMENT,
  `enrollmentSemester` varchar(20) NOT NULL,
  `enrollmentDeadLine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`enrollmentID`),
  UNIQUE KEY `subjectID` (`subjectID`),
  CONSTRAINT `studentzone_enrollment_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_enrollment: ~6 rows (approximately)
/*!40000 ALTER TABLE `studentzone_enrollment` DISABLE KEYS */;
INSERT INTO `studentzone_enrollment` (`enrollmentID`, `enrollmentSemester`, `enrollmentDeadLine`, `subjectID`) VALUES
	(1, 'Semester 1', '2012-12-10 23:09:27', 1),
	(2, 'Semester 1', '2012-12-10 23:10:08', 6),
	(3, 'Semester 1', '2013-02-20 20:00:00', 5),
	(4, 'Semester 1', '2013-02-21 21:15:40', 7),
	(5, 'Semester 2', '2013-02-22 23:30:00', 2),
	(6, 'Semester 2', '2013-02-26 07:15:00', 3);
/*!40000 ALTER TABLE `studentzone_enrollment` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_faculty
CREATE TABLE IF NOT EXISTS `studentzone_faculty` (
  `facultyID` int(10) NOT NULL AUTO_INCREMENT,
  `facultyCode` varchar(10) NOT NULL,
  `facultyName` varchar(50) NOT NULL,
  PRIMARY KEY (`facultyID`),
  KEY `facultyCode` (`facultyCode`,`facultyName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_faculty: ~7 rows (approximately)
/*!40000 ALTER TABLE `studentzone_faculty` DISABLE KEYS */;
INSERT INTO `studentzone_faculty` (`facultyID`, `facultyCode`, `facultyName`) VALUES
	(2, 'DD', 'Debabrata Das'),
	(6, 'JP', 'Jay Prakash'),
	(3, 'KVD', 'K. V. Dinesha'),
	(5, 'MD', 'Meenakshi DSouza'),
	(1, 'RC', 'Chandrashekhar Ramanathan'),
	(19, 'SR', 'Shrisha Rao'),
	(9, 'SS', 'Srinath Srinivasan');
/*!40000 ALTER TABLE `studentzone_faculty` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_friendship
CREATE TABLE IF NOT EXISTS `studentzone_friendship` (
  `friendshipID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `friendID` int(10) NOT NULL,
  PRIMARY KEY (`friendshipID`),
  KEY `studentID` (`studentID`,`friendID`),
  CONSTRAINT `studentzone_friendship_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_friendship: ~9 rows (approximately)
/*!40000 ALTER TABLE `studentzone_friendship` DISABLE KEYS */;
INSERT INTO `studentzone_friendship` (`friendshipID`, `studentID`, `friendID`) VALUES
	(61, 9, 4),
	(81, 9, 12),
	(63, 9, 14),
	(85, 10, 15),
	(80, 12, 9),
	(62, 14, 9),
	(87, 14, 15),
	(84, 15, 10),
	(86, 15, 14);
/*!40000 ALTER TABLE `studentzone_friendship` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_grade
CREATE TABLE IF NOT EXISTS `studentzone_grade` (
  `gradeID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectGrade` varchar(2) NOT NULL,
  `subjectResult` varchar(10) NOT NULL,
  `studentID` int(10) NOT NULL,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`gradeID`),
  KEY `studentID` (`studentID`),
  KEY `fk_subj` (`subjectID`),
  CONSTRAINT `fk_subj` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`),
  CONSTRAINT `studentzone_grade_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_grade: ~15 rows (approximately)
/*!40000 ALTER TABLE `studentzone_grade` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `studentzone_grade` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_interest
CREATE TABLE IF NOT EXISTS `studentzone_interest` (
  `interestID` int(10) NOT NULL AUTO_INCREMENT,
  `interestName` varchar(100) NOT NULL,
  PRIMARY KEY (`interestID`),
  UNIQUE KEY `interestName` (`interestName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_interest: ~6 rows (approximately)
/*!40000 ALTER TABLE `studentzone_interest` DISABLE KEYS */;
INSERT INTO `studentzone_interest` (`interestID`, `interestName`) VALUES
	(5, 'cooking'),
	(2, 'dance'),
	(4, 'movies'),
	(3, 'music'),
	(6, 'reading'),
	(1, 'sports');
/*!40000 ALTER TABLE `studentzone_interest` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_news
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
  KEY `NEWSCreatedBy` (`NEWSCreatedBy`),
  CONSTRAINT `studentzone_NEWS_ibfk_1` FOREIGN KEY (`NEWSCreatedBy`) REFERENCES `studentzone_admin` (`adminID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_news: ~3 rows (approximately)
/*!40000 ALTER TABLE `studentzone_news` DISABLE KEYS */;
INSERT INTO `studentzone_news` (`NEWSID`, `heading`, `content`, `validity`, `NEWSCreatedOn`, `NEWSModifiedOn`, `NEWSModifiedBy`, `NEWSCreatedBy`) VALUES
	(3, 'test', 'test', '2013-03-31', '2013-02-12 21:16:22', NULL, NULL, 1),
	(4, 'IIITB Newsletter', 'The latest version of the newsletter is out. Grab your copy today!', '2013-03-31', '2013-02-12 21:16:22', NULL, NULL, 1),
	(5, 'IIITB Food Court', 'The food Court has been repainted with fresh, vibrant colors. Check it out today! ', '2013-03-31', '2013-02-12 21:17:12', NULL, NULL, 1);
/*!40000 ALTER TABLE `studentzone_news` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_student
CREATE TABLE IF NOT EXISTS `studentzone_student` (
  `studentID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `emailID` varchar(256) DEFAULT NULL,
  `lastAccess` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_student: ~6 rows (approximately)
/*!40000 ALTER TABLE `studentzone_student` DISABLE KEYS */;
INSERT INTO `studentzone_student` (`studentID`, `userName`, `password`, `emailID`, `lastAccess`) VALUES
	(9, 'anand', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-03-20 14:26:28'),
	(10, 'ritu', '5f4dcc3b5aa765d61d8327deb882cf99', 'ritu.sharma@iiitb.org', '2013-03-21 19:52:48'),
	(11, 'suvadra', '5f4dcc3b5aa765d61d8327deb882cf99', 'suvadra.tripathy@iiitb.org', '2013-03-20 14:25:38'),
	(12, 'neha', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-03-21 19:52:11'),
	(14, 'dipanjan', '5f4dcc3b5aa765d61d8327deb882cf99', 'dipanjan.sarkar@iiitb.org', '2013-03-21 19:52:26'),
	(15, 'avipsa', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, '2013-03-21 19:50:33');
/*!40000 ALTER TABLE `studentzone_student` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_student_enrollment
CREATE TABLE IF NOT EXISTS `studentzone_student_enrollment` (
  `studentEnrollmentID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `enrollmentID` int(10) NOT NULL,
  PRIMARY KEY (`studentEnrollmentID`),
  KEY `studentID` (`studentID`,`enrollmentID`),
  KEY `enrollmentID` (`enrollmentID`),
  CONSTRAINT `studentzone_student_enrollment_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentzone_student_enrollment_ibfk_2` FOREIGN KEY (`enrollmentID`) REFERENCES `studentzone_enrollment` (`enrollmentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_student_enrollment: ~14 rows (approximately)
/*!40000 ALTER TABLE `studentzone_student_enrollment` DISABLE KEYS */;
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
	(9, 15, 4),
	(11, 15, 5),
	(21, 15, 6);
/*!40000 ALTER TABLE `studentzone_student_enrollment` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_student_interest
CREATE TABLE IF NOT EXISTS `studentzone_student_interest` (
  `studentInterestID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) DEFAULT NULL,
  `interestID` int(10) DEFAULT NULL,
  `interestName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`studentInterestID`),
  KEY `studentID` (`studentID`),
  KEY `interestID` (`interestID`),
  KEY `FK_studentzone_student_interest_studentzone_interest_2` (`interestName`),
  CONSTRAINT `FK_studentzone_student_interest_studentzone_interest` FOREIGN KEY (`interestID`) REFERENCES `studentzone_interest` (`interestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_studentzone_student_interest_studentzone_interest_2` FOREIGN KEY (`interestName`) REFERENCES `studentzone_interest` (`interestName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_studentzone_student_interest_studentzone_student` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_student_interest: ~9 rows (approximately)
/*!40000 ALTER TABLE `studentzone_student_interest` DISABLE KEYS */;
INSERT INTO `studentzone_student_interest` (`studentInterestID`, `studentID`, `interestID`, `interestName`) VALUES
	(105, 9, 2, 'dance'),
	(106, 15, 5, 'cooking'),
	(107, 15, 4, 'movies'),
	(108, 15, 3, 'music'),
	(109, 12, 2, 'dance'),
	(110, 14, 6, 'reading'),
	(111, 14, 1, 'sports'),
	(112, 10, 5, 'cooking'),
	(113, 10, 2, 'dance');
/*!40000 ALTER TABLE `studentzone_student_interest` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_student_profile
CREATE TABLE IF NOT EXISTS `studentzone_student_profile` (
  `profileID` int(10) NOT NULL AUTO_INCREMENT,
  `studentRollNo` varchar(20) NOT NULL,
  `studentName` varchar(40) NOT NULL,
  `studentDOB` date NOT NULL,
  `studentImgUrl` varchar(512) DEFAULT NULL,
  `studentID` int(10) NOT NULL,
  PRIMARY KEY (`profileID`),
  UNIQUE KEY `studentID` (`studentID`),
  CONSTRAINT `studentzone_student_rofile_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_student_profile: ~6 rows (approximately)
/*!40000 ALTER TABLE `studentzone_student_profile` DISABLE KEYS */;
INSERT INTO `studentzone_student_profile` (`profileID`, `studentRollNo`, `studentName`, `studentDOB`, `studentImgUrl`, `studentID`) VALUES
	(7, 'MT2012009', 'Rahul', '2013-02-19', 'uploads/profilepictures/249a99cd-4b14-4430-b791-423d8e275c85-anand.jpg', 9),
	(8, 'MT2012117', 'Ritu Sharma', '2013-02-12', 'uploads/profilepictures/59461bad-4e53-4859-861e-13135c277c03-ritu.jpg', 10),
	(9, 'MT2012148', 'Suvadra Tripathy', '1988-06-26', 'uploads/profilepictures/162f85f1-4b50-46c8-8784-229fe5995e6a-suvadra.jpg', 11),
	(10, 'MT2012088', 'Neha Gupta', '1987-02-10', 'uploads/profilepictures/fb09d510-d767-4de5-ba15-43254b3ba10d-neha.jpg', 12),
	(12, 'MT2012043', 'Dipanjan Sarkar', '1990-12-18', 'uploads/profilepictures/c59aa1b3-495d-444c-92c2-2a5a342e03b8-dipanjan.jpg', 14),
	(13, 'MT2012029', 'Avipsa Nayak', '1988-06-23', 'uploads/profilepictures/0ea5e6dc-ade1-42a4-b897-db7f1c98eee4-avipsa.jpg', 15);
/*!40000 ALTER TABLE `studentzone_student_profile` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_student_subject
CREATE TABLE IF NOT EXISTS `studentzone_student_subject` (
  `student_subjectID` int(10) NOT NULL AUTO_INCREMENT,
  `studentID` int(10) NOT NULL,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`student_subjectID`),
  KEY `studentID` (`studentID`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `studentzone_student_subject_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `studentzone_student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentzone_student_subject_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_student_subject: ~16 rows (approximately)
/*!40000 ALTER TABLE `studentzone_student_subject` DISABLE KEYS */;
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
	(24, 15, 3),
	(25, 15, 5);
/*!40000 ALTER TABLE `studentzone_student_subject` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_subject
CREATE TABLE IF NOT EXISTS `studentzone_subject` (
  `subjectID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) NOT NULL,
  `subjectCode` varchar(10) NOT NULL,
  `subjectSemester` varchar(20) NOT NULL,
  PRIMARY KEY (`subjectID`),
  KEY `subjectName` (`subjectName`,`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_subject: ~8 rows (approximately)
/*!40000 ALTER TABLE `studentzone_subject` DISABLE KEYS */;
INSERT INTO `studentzone_subject` (`subjectID`, `subjectName`, `subjectCode`, `subjectSemester`) VALUES
	(1, 'Data Modelling', 'DB210', 'Semester 2'),
	(2, 'OOAD', 'SE210', 'Semester 2'),
	(3, 'SE', 'SE211', 'Semester 2'),
	(4, 'OS', 'OS210', 'Semester 2'),
	(5, 'Data Management', 'DB110', 'Semester 1'),
	(6, 'Network and Comm', 'NC101', 'Semester 1'),
	(7, 'Java Programming', 'PAS110', 'Semester 1'),
	(8, 'ABC', 'ABC211', 'Semester 2');
/*!40000 ALTER TABLE `studentzone_subject` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_subject_faculty
CREATE TABLE IF NOT EXISTS `studentzone_subject_faculty` (
  `subjectFacultyID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectID` int(10) DEFAULT NULL,
  `facultyID` int(10) DEFAULT NULL,
  PRIMARY KEY (`subjectFacultyID`),
  KEY `subjectID` (`subjectID`,`facultyID`),
  KEY `facultyID` (`facultyID`),
  CONSTRAINT `studentzone_subject_faculty_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentzone_subject_faculty_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `studentzone_faculty` (`facultyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_subject_faculty: ~7 rows (approximately)
/*!40000 ALTER TABLE `studentzone_subject_faculty` DISABLE KEYS */;
INSERT INTO `studentzone_subject_faculty` (`subjectFacultyID`, `subjectID`, `facultyID`) VALUES
	(1, 1, 1),
	(15, 2, 3),
	(17, 3, 5),
	(18, 4, 19),
	(5, 5, 1),
	(19, 6, 2),
	(16, 7, 3);
/*!40000 ALTER TABLE `studentzone_subject_faculty` ENABLE KEYS */;


-- Dumping structure for table studentzone.studentzone_syllabus
CREATE TABLE IF NOT EXISTS `studentzone_syllabus` (
  `syllabusID` int(10) NOT NULL AUTO_INCREMENT,
  `subjectSyllabus` longtext,
  `subjectID` int(10) NOT NULL,
  PRIMARY KEY (`syllabusID`),
  UNIQUE KEY `subjectID` (`subjectID`),
  CONSTRAINT `studentzone_syllabus_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `studentzone_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table studentzone.studentzone_syllabus: ~7 rows (approximately)
/*!40000 ALTER TABLE `studentzone_syllabus` DISABLE KEYS */;
INSERT INTO `studentzone_syllabus` (`syllabusID`, `subjectSyllabus`, `subjectID`) VALUES
	(1, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 1),
	(2, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 4),
	(3, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 7),
	(4, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 2),
	(5, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 6),
	(6, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 3),
	(7, 'Syllabus\r\n\r\nIntroduction to Data Models and the basics\r\n> The what, why and who of data models\r\n> The Layers: External Schema, Conceptual Schema, Internal Schema \r\n> The Big Picture: Enterprise Architecture \r\n\r\nReview of Traditional Data Models  \r\n> Hierarchical Data Model \r\n> Network (CODASYL) Data Model \r\n> Relational Data Model \r\n\r\nA review of semantic data models (Self-study) \r\n> (ER, EER, TAXIS, SDM, SAM, etc.) \r\n> Popular Tools (TOAD Modeler, ERWin) \r\n\r\nMore RDBMS \r\n> Codds Rules \r\n> Other normal forms (4NF, 5NF) \r\n\r\nAdvanced XML \r\n> Review of XML concepts \r\n> XML Schema \r\n> Supplemental Technologies (XPath, XQuery) \r\n> XML Databases \r\n> Mapping (Relational  XML, XML  Relational) \r\n> Tools \r\n> OO -> XML \r\n> Object-oriented data model and databases \r\n> Review of OO Modeling concepts \r\n> OODB Concepts \r\n> Object-Relational Databases \r\n> Architectures of OODBMS implementations \r\n> Application Development using OODB', 5);
/*!40000 ALTER TABLE `studentzone_syllabus` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
