-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: praktich
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_surname` varchar(50) NOT NULL,
  `a_name` varchar(50) NOT NULL,
  `a_patronymic` varchar(50) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Алясев','Алексей','Михайлович'),(2,'Прокофьев','Даниил','Андреевич'),(3,'Воробева','Анастасия','Викторовна'),(4,'Киселева','Ангелина',''),(5,'Брагин','Александр',''),(6,'Полыскалов','Ахмед','Аброгимович'),(7,'Новиков','Николай',''),(8,'Фомичев','Иван','Романович'),(9,'Иванова','Елена','Дмитриевна'),(10,'Бармина','Полина','');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_book` (
  `ISBN` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  KEY `ISBN` (`ISBN`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `author_book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  CONSTRAINT `author_book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_book`
--

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;
INSERT INTO `author_book` VALUES (NULL,4),(2,2),(3,6),(4,8),(5,3),(6,1),(7,5),(NULL,7),(9,10),(10,9);
/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `ISBN` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `year_pub` int(11) NOT NULL,
  `num_pages` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Три товарища',2000,380),(3,'Гарри Поттер и тайная комната',1995,400),(4,'Психология общения',2020,230),(5,'Отцы и дети',1861,450),(6,'Биохакинг мозка',2018,280),(7,'Бессмертный',1999,140),(9,'Бездна',2004,410),(10,'Оно',2017,320);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_directory`
--

DROP TABLE IF EXISTS `books_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_directory` (
  `books_ISBN` int(11) NOT NULL,
  `directory_know_code` int(11) NOT NULL,
  KEY `books_directory_ibfk_1` (`books_ISBN`),
  KEY `books_directory_ibfk_2` (`directory_know_code`),
  CONSTRAINT `books_directory_ibfk_1` FOREIGN KEY (`books_ISBN`) REFERENCES `books` (`ISBN`),
  CONSTRAINT `books_directory_ibfk_2` FOREIGN KEY (`directory_know_code`) REFERENCES `sys_directory` (`know_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_directory`
--

LOCK TABLES `books_directory` WRITE;
/*!40000 ALTER TABLE `books_directory` DISABLE KEYS */;
INSERT INTO `books_directory` VALUES (2,5),(3,4),(4,1),(5,5),(6,3),(7,4),(9,4),(10,4);
/*!40000 ALTER TABLE `books_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `inventory_id` int(11) NOT NULL,
  `presence` int(11) NOT NULL,
  `capture_date` date NOT NULL,
  `return_date` date NOT NULL,
  `reader_libcard_id` int(2) NOT NULL,
  `books_ISBN` int(11) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `ISBN` (`books_ISBN`),
  KEY `libcard_id` (`reader_libcard_id`),
  CONSTRAINT `ISBN` FOREIGN KEY (`books_ISBN`) REFERENCES `books` (`ISBN`),
  CONSTRAINT `libcard_id` FOREIGN KEY (`reader_libcard_id`) REFERENCES `reader` (`libcard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (101,1,'2020-10-01','2020-10-07',11,2),(102,1,'2020-10-16','2020-10-23',12,9),(103,1,'2020-09-02','2020-09-09',13,10),(104,1,'2020-10-23','2020-10-30',14,5),(106,1,'2020-10-05','2020-10-12',16,3),(107,1,'2020-10-09','2020-10-16',11,4),(108,1,'2020-10-01','2020-10-07',14,6),(109,1,'2020-10-20','2020-10-27',13,7);
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del` AFTER DELETE ON `instance` FOR EACH ROW BEGIN
declare b int;
declare au int;
select count(*) into b from instance where books_ISBN=old.books_ISBN;
if (b=0) then 
delete from books_directory where books_ISBN=old.books_ISBN;
select author_id into au from author_book where ISBN=old.books_ISBN;
update author_book set ISBN=null where author_id=au;
delete from books where ISBN=old.books_ISBN;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reader` (
  `libcard_id` int(2) NOT NULL,
  `FIO` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_home` varchar(12) DEFAULT NULL,
  `phone_work` varchar(12) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`libcard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (11,'Деревяшкин А. И.','ул. Колотушкина','5553030',NULL,'2001-01-14'),(12,'Миронов Д. А.','улица Студеная дом 2','2313189','89507643434','1997-09-05'),(13,'Зотов А. П.','ул. Центральная ',NULL,NULL,'2010-09-01'),(14,'Куйдина К. А.','переулок Больничный д. 5 кв. 140',NULL,'87638765667','2014-10-01'),(15,'Кривенкова К. А.',NULL,'6789898','83473473473','2020-10-01'),(16,'Ахматов Е. К.','ул. Белая','7658787',NULL,'2004-03-02');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_directory`
--

DROP TABLE IF EXISTS `sys_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_directory` (
  `know_code` int(11) NOT NULL,
  `know_name` varchar(50) NOT NULL,
  PRIMARY KEY (`know_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_directory`
--

LOCK TABLES `sys_directory` WRITE;
/*!40000 ALTER TABLE `sys_directory` DISABLE KEYS */;
INSERT INTO `sys_directory` VALUES (1,'Психология'),(2,'Приключения'),(3,'Наука'),(4,'Фантастика'),(5,'Художественная литература');
/*!40000 ALTER TABLE `sys_directory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 20:37:36
