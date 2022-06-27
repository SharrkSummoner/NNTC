-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2018 at 09:31 AM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emsh_h01`
--

-- --------------------------------------------------------

--
-- Table structure for table `Exam`
--


-- --------------------------------------------------------

--
-- Table structure for table `EXAM_MARKS`
--

CREATE TABLE `EXAM_MARKS` (
  `EXAM_ID` decimal(10,0) NOT NULL,
  `STUDENT_ID` decimal(10,0) NOT NULL,
  `SUBJ_ID` decimal(10,0) NOT NULL,
  `MARK` decimal(10,0) DEFAULT NULL,
  `EXAM_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LECTURER`
--

CREATE TABLE `LECTURER` (
  `LECTURER_ID` decimal(10,0) NOT NULL,
  `SURNAME` varchar(60) DEFAULT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `CITY` varchar(60) DEFAULT NULL,
  `UNIV_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LECTURER`
--

INSERT INTO `LECTURER` (`LECTURER_ID`, `SURNAME`, `NAME`, `CITY`, `UNIV_ID`) VALUES
('1', 'Бабкина', 'Надежда', 'Красный Холм', '1'),
('2', 'Бугрим', 'Наталья', 'Урюпинск', '3'),
('3', 'Каданцева', 'Наталья', 'Яхрома', '1'),
('4', 'Данилова', 'Елена', 'Мелединская', '5'),
('5', 'Красникова', 'Ольга', 'Семенов', '7'),
('6', 'Антонова', 'Наталья', NULL, '4'),
('7', 'Подкопаева', 'Елена', 'Пошехонье', '3'),
('8', 'Комова', 'Екатерина', 'Туапсе', '3'),
('9', 'Круглова', 'Екатерина', 'Бавлы', '3'),
('10', 'Кузнецова', 'Ольга', 'Никольск', '1'),
('11', 'Гашникова', 'Анастасия', 'Находка', '3');

-- --------------------------------------------------------

--
-- Table structure for table `Marks`
--


-- --------------------------------------------------------

--
-- Table structure for table `Post`
--



-- --------------------------------------------------------

--
-- Table structure for table `STUDENT`
--

CREATE TABLE `STUDENT` (
  `STUDENT_ID` decimal(10,0) NOT NULL,
  `SURNAME` varchar(60) DEFAULT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `STIPEND` decimal(16,2) DEFAULT NULL,
  `KURS` decimal(10,0) DEFAULT NULL,
  `CITY` varchar(60) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `UNIV_ID` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STUDENT`
--

INSERT INTO `STUDENT` (`STUDENT_ID`, `SURNAME`, `NAME`, `STIPEND`, `KURS`, `CITY`, `BIRTHDAY`, `UNIV_ID`) VALUES
('1', 'Сергеев', 'Сергей', '520.00', '1', 'Одинцово', '1983-03-21', '3'),
('2', 'Клюквина', 'Вера', '140.00', '3', 'Сатка', '1987-03-15', '6'),
('4', 'Водопьянова', 'Виктория', '170.00', '2', 'Костерево', '2000-01-09', '6'),
('5', 'Тимашов', 'Дмитрий', '90.00', '2', 'Горячий Ключ', '2000-01-09', '2'),
('6', 'Авраменко', 'Владислав', '480.00', '3', 'Павловское', '2000-01-09', '2');

-- --------------------------------------------------------

--
-- Table structure for table `Student1`
--


-- --------------------------------------------------------

--
-- Table structure for table `SUBJECT`
--

CREATE TABLE `SUBJECT` (
  `SUBJ_ID` decimal(10,0) NOT NULL,
  `SUBJ_NAME` varchar(60) DEFAULT NULL,
  `HOUR` decimal(10,0) DEFAULT NULL,
  `SEMESTER` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SUBJECT`
--

INSERT INTO `SUBJECT` (`SUBJ_ID`, `SUBJ_NAME`, `HOUR`, `SEMESTER`) VALUES
('1', 'Биология', '119', '1'),
('2', 'Химия', '65', '4'),
('3', 'Сочинение', '95', '2'),
('4', 'География', '74', '2'),
('5', 'Собеседование', '102', '4'),
('6', 'Изложение', '107', '4'),
('7', 'Физика', '69', '1'),
('8', 'История России', '73', '3'),
('9', 'Литература', '104', '3');

-- --------------------------------------------------------

--
-- Table structure for table `SUBJ_LECT`
--

CREATE TABLE `SUBJ_LECT` (
  `LECTURER_ID` decimal(10,0) NOT NULL,
  `SUBJ_ID` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SUBJ_LECT`
--

INSERT INTO `SUBJ_LECT` (`LECTURER_ID`, `SUBJ_ID`) VALUES
('3', '1'),
('1', '2'),
('2', '3'),
('6', '3'),
('3', '4'),
('1', '5'),
('2', '5'),
('3', '5'),
('4', '5'),
('4', '6'),
('5', '7'),
('6', '7');

-- --------------------------------------------------------

--
-- Table structure for table `UNIVERSITY`
--

CREATE TABLE `UNIVERSITY` (
  `UNIV_ID` decimal(10,0) NOT NULL,
  `UNIV_NAME` varchar(160) DEFAULT NULL,
  `RATING` decimal(10,0) DEFAULT NULL,
  `CITY` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UNIVERSITY`
--

INSERT INTO `UNIVERSITY` (`UNIV_ID`, `UNIV_NAME`, `RATING`, `CITY`) VALUES
('1', 'Академия народного хозяйства при Правительстве РФ', '542', 'Москва'),
('2', 'Московский физико-технический институт', '470', 'Москва'),
('3', 'Российская экономическая академия им. Г.В. Плеханова', '429', 'Москва'),
('4', 'Финансовая академия при правительстве РФ', '421', 'Москва'),
('5', 'Московский государственный институт международных отношений', '392', 'Москва'),
('6', 'Самарский муниципальный университет', '383', 'Самара'),
('7', 'Московская государственная юридическая академия', '381', 'Москва');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Exam`
--


--
-- Indexes for table `EXAM_MARKS`
--
ALTER TABLE `EXAM_MARKS`
  ADD PRIMARY KEY (`EXAM_ID`,`STUDENT_ID`,`SUBJ_ID`),
  ADD KEY `SUBJECT_FOR_KEY` (`SUBJ_ID`),
  ADD KEY `STUDENT_ID_1` (`STUDENT_ID`);

--
-- Indexes for table `LECTURER`
--
ALTER TABLE `LECTURER`
  ADD PRIMARY KEY (`LECTURER_ID`),
  ADD KEY `UNIVLECT_FOR_KEY` (`UNIV_ID`);

--
-- Indexes for table `Marks`
--

--
-- Indexes for table `Post`
--


--
-- Indexes for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD PRIMARY KEY (`STUDENT_ID`),
  ADD KEY `UNIV_FOR_KEY` (`UNIV_ID`);

--
-- Indexes for table `SUBJECT`
--
ALTER TABLE `SUBJECT`
  ADD PRIMARY KEY (`SUBJ_ID`);

--
-- Indexes for table `SUBJ_LECT`
--
ALTER TABLE `SUBJ_LECT`
  ADD PRIMARY KEY (`LECTURER_ID`,`SUBJ_ID`),
  ADD KEY `SUBJ_FOR_KEY` (`SUBJ_ID`);

--
-- Indexes for table `UNIVERSITY`
--
ALTER TABLE `UNIVERSITY`
  ADD PRIMARY KEY (`UNIV_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Exam`
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EXAM_MARKS`
--
ALTER TABLE `EXAM_MARKS`
  ADD CONSTRAINT `STUDENT_FOR_KEY` FOREIGN KEY (`STUDENT_ID`) REFERENCES `STUDENT` (`STUDENT_ID`),
  ADD CONSTRAINT `SUBJECT_FOR_KEY` FOREIGN KEY (`SUBJ_ID`) REFERENCES `SUBJECT` (`SUBJ_ID`);

--
-- Constraints for table `LECTURER`
--
ALTER TABLE `LECTURER`
  ADD CONSTRAINT `UNIVLECT_FOR_KEY` FOREIGN KEY (`UNIV_ID`) REFERENCES `UNIVERSITY` (`UNIV_ID`);

--
-- Constraints for table `Marks`
--
-- Constraints for table `STUDENT`
--
ALTER TABLE `STUDENT`
  ADD CONSTRAINT `UNIV_FOR_KEY` FOREIGN KEY (`UNIV_ID`) REFERENCES `UNIVERSITY` (`UNIV_ID`);

--
-- Constraints for table `SUBJ_LECT`
--
ALTER TABLE `SUBJ_LECT`
  ADD CONSTRAINT `LECT_FOR_KEY` FOREIGN KEY (`LECTURER_ID`) REFERENCES `LECTURER` (`LECTURER_ID`),
  ADD CONSTRAINT `SUBJ_FOR_KEY` FOREIGN KEY (`SUBJ_ID`) REFERENCES `SUBJECT` (`SUBJ_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
