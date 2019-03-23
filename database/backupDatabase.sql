-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: splitwise
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` varchar(100) DEFAULT NULL,
  `user` bigint(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'flag the entry for deletion',
  `invoice` bigint(20) DEFAULT NULL COMMENT 'the invoice if one already exists',
  `change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_users_FK` (`user`),
  KEY `bills_invoices_FK` (`invoice`),
  CONSTRAINT `bills_invoices_FK` FOREIGN KEY (`invoice`) REFERENCES `invoices` (`id`),
  CONSTRAINT `bills_users_FK` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (80,11.68,'2019-01-20 10:15:44','spar 19.01.',2,0,23,'2019-02-13 17:41:35'),(81,21.08,'2019-01-20 10:16:19','merkur 18.01',2,0,23,'2019-02-13 17:41:35'),(82,42.54,'2019-01-20 10:17:15','merkur 17.01',2,0,23,'2019-02-13 17:41:35'),(83,22.74,'2019-01-20 10:18:02','spar 14.01',2,0,23,'2019-02-13 17:41:35'),(84,30.54,'2019-01-20 10:18:37','eurospar 16.01',2,0,23,'2019-02-13 17:41:35'),(85,66.07,'2019-01-20 10:19:48','spar 09.01',2,0,23,'2019-02-13 17:41:35'),(86,51.13,'2019-01-20 10:21:55','merkur 02.01',1,0,23,'2019-02-13 17:41:35'),(87,43.49,'2019-01-25 17:33:14','merkur 24.01',2,0,23,'2019-02-13 17:41:35'),(88,26.2,'2019-01-26 18:05:19','biofrische',1,0,23,'2019-02-13 17:41:35'),(89,27.79,'2019-01-26 18:41:58','merkur',2,0,23,'2019-02-13 17:41:35'),(90,12.24,'2019-01-28 16:46:54','spar',1,0,23,'2019-02-13 17:41:35'),(91,33.58,'2019-01-30 16:10:30','spar',2,0,23,'2019-02-13 17:41:35'),(92,10.99,'2019-02-02 16:28:22','bipa',2,0,23,'2019-02-13 17:41:35'),(93,16.72,'2019-02-04 16:46:43','spar',1,0,23,'2019-02-13 17:41:35'),(94,12.47,'2019-02-05 17:38:02','spar',1,0,23,'2019-02-13 17:41:35'),(95,52.82,'2019-02-07 12:30:55','Spar',2,0,23,'2019-02-13 17:41:35'),(96,21.6,'2019-02-07 20:47:23','mjam biofrische',1,0,23,'2019-02-13 17:41:35'),(97,14.7,'2019-02-10 21:10:38','mc donalds',1,0,23,'2019-02-13 17:41:35'),(98,44.02,'2019-02-12 17:22:23','Merkur',2,0,23,'2019-02-13 17:41:35'),(99,3.99,'2019-02-12 17:22:49','Müller - Glühbirne',2,0,23,'2019-02-13 17:41:35'),(100,12.54,'2019-02-13 17:32:33','spar',1,0,23,'2019-02-13 17:41:35'),(101,10.51,'2019-02-13 18:01:57','spar',2,0,NULL,NULL),(102,55,'2019-02-14 21:56:07','therme wien',1,0,NULL,NULL),(103,21,'2019-02-14 22:57:31','speedy pizza',1,0,NULL,NULL),(104,20.4,'2019-02-15 15:49:48','mjam korean street food',1,0,NULL,NULL),(105,19.65,'2019-02-16 11:20:58','spar',1,0,NULL,NULL),(106,17.4,'2019-02-21 19:30:06','da casa mama',1,0,NULL,NULL),(107,34.45,'2019-02-22 20:00:44','Spar 20.02.',2,0,NULL,NULL),(108,50.66,'2019-02-23 12:54:18','spar und spieleabend',1,0,NULL,NULL),(109,10,'2019-02-23 12:54:35','spar',1,0,NULL,NULL),(110,15.34,'2019-02-25 18:26:10','merkur',2,0,NULL,NULL),(111,20.12,'2019-02-28 13:34:25','Spar 28.2.',2,0,NULL,NULL),(112,6.82,'2019-02-28 19:53:38','spar 25.02.',1,0,NULL,NULL),(113,36.94,'2019-03-02 18:09:12','merkur 2.3.',2,0,NULL,NULL),(114,25.02,'2019-03-04 16:42:44','spar 4.3.',2,0,NULL,NULL),(115,2.75,'2019-03-04 19:12:10','spar',1,0,NULL,NULL),(116,28.2,'2019-03-05 18:09:19','biofrische',1,0,NULL,NULL),(117,42.93,'2019-03-06 13:01:43','merkur 06.03.',2,0,NULL,NULL),(118,8.33,'2019-03-08 11:39:54','Hofer 7.3.',2,0,NULL,NULL),(119,24.63,'2019-03-09 13:05:12','spar',1,0,NULL,NULL),(120,7.5,'2019-03-14 09:06:37','kopierpapier und einweghandschuhe',2,0,NULL,NULL),(121,23.56,'2019-03-15 09:39:54','Merkur 11.3.',2,0,NULL,NULL),(122,16.02,'2019-03-15 19:15:55','Billa',2,0,NULL,NULL),(123,18.42,'2019-03-17 14:53:07','holy chicken',1,0,NULL,NULL),(124,18.31,'2019-03-18 17:28:25','spar',1,0,NULL,NULL),(125,14.9,'2019-03-19 17:00:33','da casa mama pizza',1,0,NULL,NULL),(126,36.36,'2019-03-21 12:30:30','Spar 21.3.',2,0,NULL,NULL),(127,5.18,'2019-03-21 17:34:01','spar',1,0,NULL,NULL);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`splituser`@`localhost`*/ /*!50003 TRIGGER change_date
BEFORE UPDATE
ON bills FOR EACH ROW
SET NEW.change_date = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (23,'2019-02-13 17:41:35','standard note');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Users for Splitwise';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex'),(2,'Manu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-23 22:11:41
