-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: tabbekti
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_name` varchar(100) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `subject_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chapters_subject_id_index` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
INSERT INTO `chapters` VALUES (1,'Bilangan Cacah 0 Sampai 20',1,1),(2,'Penjumlahan Pengurangan Bilangan Sampai 20',1,1),(3,'Pengenalan Satuan Waktu dan Panjang',1,1),(4,'Color',1,2),(5,'Bedroom',1,2),(6,'Aku Dan Keluargaku',1,3),(7,'Permainan',1,3),(8,'Diri Sendiri',2,7),(9,'Keluargaku',2,7),(10,'My Family',2,6),(11,'Telling Time',2,6),(12,'Pengerjaan Hitung Bilangan (Bilangan Cacah, Penjumlahan dan Pengurangan)',2,5),(13,'Pengukuran (Waktu, Berat, dan Panjang)',2,5),(15,'Bilangan',3,9),(16,'Operasi Hitung Penjumlahan dan Pengurang',3,9),(17,'Food and Drink',3,10),(18,'Parts of Body',3,10),(19,'Diri Sendiri',3,11),(20,'Merawat Rumah',3,11),(21,'Makhluk Hidup',3,12),(22,'Lingkungan Dan Kesehatan',3,12),(23,'Operasi Hitung Bilangan',4,13),(24,'Kelipatan Dan Faktor Suatu Bilangan',4,13),(25,'Pets',4,14),(26,'Hobby',4,14),(27,'Tempat Umum',4,15),(28,'Pengalaman',4,15),(29,'Rangka Manusia, Fungsi, Dan Pemeliharaannya',4,16),(30,'Bagian-Bagian Tumbuhan Dan Fungsinya',4,16);
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `chapter_id` int(10) unsigned NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_student_id_index` (`student_id`),
  KEY `report_subject_id_index` (`subject_id`),
  KEY `report_chapter_id_index` (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,1,1,1,1,80),(2,1,1,1,2,60),(3,1,1,1,3,90),(4,1,1,2,4,75),(5,1,1,2,5,98),(6,1,1,3,6,65),(7,1,1,3,7,88),(8,3,1,1,1,90),(9,3,1,1,2,95),(10,3,1,1,3,80),(11,3,1,2,4,98),(12,3,1,2,5,75),(13,3,1,3,6,94),(14,3,1,3,7,86),(15,6,1,1,1,76),(16,6,1,1,2,65),(17,6,1,1,3,88),(18,6,1,2,4,90),(19,6,1,2,5,80),(20,6,1,3,6,78),(21,6,1,3,7,98),(22,9,1,1,1,67),(23,9,1,1,2,89),(24,9,1,1,3,70),(25,9,1,2,4,88),(26,9,1,2,5,90),(27,9,1,3,6,78),(28,9,1,3,7,90),(29,10,1,1,1,90),(30,10,1,1,2,80),(31,10,1,1,3,70),(32,10,1,2,4,89),(33,10,1,2,5,77),(34,10,1,3,6,98),(35,10,1,3,7,88),(36,2,3,9,15,99),(37,2,3,9,16,95),(38,2,3,10,17,88),(39,2,3,10,18,93),(40,2,3,11,19,92),(41,2,3,11,20,90),(42,2,3,12,21,86),(43,2,3,12,22,85),(44,8,3,9,15,89),(45,8,3,9,16,78),(46,8,3,10,17,65),(47,8,3,10,18,80),(48,8,3,11,19,88),(49,8,3,11,20,87),(50,8,3,12,21,85),(51,8,3,12,22,79),(52,4,4,13,23,90),(53,4,4,13,24,90),(54,4,4,14,25,80),(55,4,4,14,26,88),(56,4,4,15,27,78),(57,4,4,15,28,97),(58,4,4,16,29,85),(59,4,4,16,30,82),(60,5,4,13,23,87),(61,5,4,13,24,90),(62,5,4,14,25,81),(63,5,4,14,26,88),(64,5,4,15,27,90),(65,5,4,15,28,96),(66,5,4,16,29,84),(67,5,4,16,30,83);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Agus',1,NULL),(2,'Acong',3,2),(3,'Budi',1,3),(4,'Jono',4,NULL),(5,'Muflo',4,NULL),(6,'Bobi',1,NULL),(7,'Roni',9,NULL),(8,'Asep',3,NULL),(9,'Cucu',1,NULL),(10,'Joni',1,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Math',1),(2,'English',1),(3,'Indonesian',1),(4,'Science',1),(5,'Math',2),(6,'English',2),(7,'Indonesian',2),(8,'Science',2),(9,'Math',3),(10,'English',3),(11,'Indonesian',3),(12,'Science',3),(13,'Math',4),(14,'English',4),(15,'Indonesian',4),(16,'Science',4);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` char(60) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('Student','Teacher') DEFAULT 'Student',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testing1','$2a$10$oJCkjewRG6Fp.uEmFyiYZ.Il9gP7oGqJMh5w6kreZHfFGS/H5t7oe','Heri','testing@test.test','Teacher'),(2,'testing2','$2a$10$Rqvsi.rrFx.wfSsi4tqw1..OZVXqVLCa07yuyRKNzCrxCb9ICEMwi','Acong','testing2@test.test','Student'),(3,'testing3','$2a$10$oJCkjewRG6Fp.uEmFyiYZ.Il9gP7oGqJMh5w6kreZHfFGS/H5t7oe','Budi','testing3@test.test','Student');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-26 19:04:28
