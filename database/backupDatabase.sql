-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnueabihf (armv7l)
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (80,11.68,'2019-01-20 10:15:44','spar 19.01.',2,0,23,'2019-02-13 17:41:35'),(81,21.08,'2019-01-20 10:16:19','merkur 18.01',2,0,23,'2019-02-13 17:41:35'),(82,42.54,'2019-01-20 10:17:15','merkur 17.01',2,0,23,'2019-02-13 17:41:35'),(83,22.74,'2019-01-20 10:18:02','spar 14.01',2,0,23,'2019-02-13 17:41:35'),(84,30.54,'2019-01-20 10:18:37','eurospar 16.01',2,0,23,'2019-02-13 17:41:35'),(85,66.07,'2019-01-20 10:19:48','spar 09.01',2,0,23,'2019-02-13 17:41:35'),(86,51.13,'2019-01-20 10:21:55','merkur 02.01',1,0,23,'2019-02-13 17:41:35'),(87,43.49,'2019-01-25 17:33:14','merkur 24.01',2,0,23,'2019-02-13 17:41:35'),(88,26.2,'2019-01-26 18:05:19','biofrische',1,0,23,'2019-02-13 17:41:35'),(89,27.79,'2019-01-26 18:41:58','merkur',2,0,23,'2019-02-13 17:41:35'),(90,12.24,'2019-01-28 16:46:54','spar',1,0,23,'2019-02-13 17:41:35'),(91,33.58,'2019-01-30 16:10:30','spar',2,0,23,'2019-02-13 17:41:35'),(92,10.99,'2019-02-02 16:28:22','bipa',2,0,23,'2019-02-13 17:41:35'),(93,16.72,'2019-02-04 16:46:43','spar',1,0,23,'2019-02-13 17:41:35'),(94,12.47,'2019-02-05 17:38:02','spar',1,0,23,'2019-02-13 17:41:35'),(95,52.82,'2019-02-07 12:30:55','Spar',2,0,23,'2019-02-13 17:41:35'),(96,21.6,'2019-02-07 20:47:23','mjam biofrische',1,0,23,'2019-02-13 17:41:35'),(97,14.7,'2019-02-10 21:10:38','mc donalds',1,0,23,'2019-02-13 17:41:35'),(98,44.02,'2019-02-12 17:22:23','Merkur',2,0,23,'2019-02-13 17:41:35'),(99,3.99,'2019-02-12 17:22:49','Müller - Glühbirne',2,0,23,'2019-02-13 17:41:35'),(100,12.54,'2019-02-13 17:32:33','spar',1,0,23,'2019-02-13 17:41:35'),(101,10.51,'2019-02-13 18:01:57','spar',2,0,NULL,NULL),(102,55,'2019-02-14 21:56:07','therme wien',1,0,NULL,NULL),(103,21,'2019-02-14 22:57:31','speedy pizza',1,0,NULL,NULL),(104,20.4,'2019-02-15 15:49:48','mjam korean street food',1,0,NULL,NULL),(105,19.65,'2019-02-16 11:20:58','spar',1,0,NULL,NULL),(106,17.4,'2019-02-21 19:30:06','da casa mama',1,0,NULL,NULL),(107,34.45,'2019-02-22 20:00:44','Spar 20.02.',2,0,NULL,NULL),(108,50.66,'2019-02-23 12:54:18','spar und spieleabend',1,0,NULL,NULL),(109,10,'2019-02-23 12:54:35','spar',1,0,NULL,NULL),(110,15.34,'2019-02-25 18:26:10','merkur',2,0,NULL,NULL),(111,20.12,'2019-02-28 13:34:25','Spar 28.2.',2,0,NULL,NULL),(112,6.82,'2019-02-28 19:53:38','spar 25.02.',1,0,NULL,NULL),(113,36.94,'2019-03-02 18:09:12','merkur 2.3.',2,0,NULL,NULL),(114,25.02,'2019-03-04 16:42:44','spar 4.3.',2,0,NULL,NULL),(115,2.75,'2019-03-04 19:12:10','spar',1,0,NULL,NULL),(116,28.2,'2019-03-05 18:09:19','biofrische',1,0,NULL,NULL),(117,42.93,'2019-03-06 13:01:43','merkur 06.03.',2,0,NULL,NULL),(118,8.33,'2019-03-08 11:39:54','Hofer 7.3.',2,0,NULL,NULL),(119,24.63,'2019-03-09 13:05:12','spar',1,0,NULL,NULL),(120,7.5,'2019-03-14 09:06:37','kopierpapier und einweghandschuhe',2,0,NULL,NULL),(121,23.56,'2019-03-15 09:39:54','Merkur 11.3.',2,0,NULL,NULL),(122,16.02,'2019-03-15 19:15:55','Billa',2,0,NULL,NULL),(123,18.42,'2019-03-17 14:53:07','holy chicken',1,0,NULL,NULL),(124,18.31,'2019-03-18 17:28:25','spar',1,0,NULL,NULL),(125,14.9,'2019-03-19 17:00:33','da casa mama pizza',1,0,NULL,NULL),(126,36.36,'2019-03-21 12:30:30','Spar 21.3.',2,0,NULL,NULL),(127,5.18,'2019-03-21 17:34:01','spar',1,0,NULL,NULL),(128,23.87,'2019-03-25 11:03:47','Adamah Biokistl',2,0,NULL,NULL),(129,7.01,'2019-03-25 17:26:43','spar',1,0,NULL,NULL),(130,24.44,'2019-03-27 18:50:44','spar',1,0,NULL,NULL),(131,21.8,'2019-03-28 18:30:34','holy chicken',1,0,NULL,NULL),(132,33.95,'2019-03-29 10:48:10','Spar 29.3.',2,0,NULL,NULL),(133,4.2,'2019-03-30 13:42:31','brot',2,0,NULL,NULL),(134,2.58,'2019-03-30 13:43:11','schokohasen',2,0,NULL,'2019-03-30 13:43:33'),(135,3.17,'2019-03-30 13:44:20','dm',2,0,NULL,NULL),(136,30.71,'2019-04-02 18:07:58','Spar 2.4.',2,0,NULL,NULL),(137,9.15,'2019-04-04 16:29:20','spar',1,0,NULL,NULL),(138,9.85,'2019-04-05 11:07:16','hofer 4.4.',2,0,NULL,NULL),(139,32.9,'2019-04-05 11:08:01','Tchibo 4.4.',2,0,NULL,NULL),(140,26.8,'2019-04-05 17:12:25','biofrische',1,0,NULL,NULL),(141,51.25,'2019-04-06 13:25:53','Merkur',2,0,NULL,NULL),(142,5,'2019-04-06 13:26:03','Zuckererbsen',2,0,NULL,NULL),(143,22.5,'2019-04-07 17:20:12','mc donalds',1,0,NULL,NULL),(144,9.42,'2019-04-11 16:26:20','spar',1,0,NULL,NULL),(145,38.5,'2019-04-12 23:36:00','essen pfadis',1,0,NULL,NULL),(146,7,'2019-04-13 09:34:31','taxi',2,0,NULL,NULL),(147,29.98,'2019-04-13 13:20:02','asia shop nippon ya',2,0,NULL,NULL),(148,24.01,'2019-04-13 13:20:24','merkur',2,0,NULL,NULL),(149,70,'2019-04-14 11:23:50','tiki bar',2,0,NULL,NULL),(150,13.9,'2019-04-14 11:24:07','da casa mama',1,0,NULL,NULL),(151,25.23,'2019-04-15 10:53:40','spar',2,0,NULL,NULL),(152,20.12,'2019-04-16 15:56:51','spar',1,0,NULL,NULL),(153,6.65,'2019-04-16 15:57:34','spar',2,0,NULL,NULL),(154,5.35,'2019-04-17 16:09:15','spar',1,0,NULL,NULL),(155,8.44,'2019-04-18 18:10:15','billa',2,0,NULL,NULL),(156,6,'2019-04-18 19:20:46','kartenreservierung',1,0,NULL,NULL),(157,6,'2019-04-22 17:10:16','kartenreservierung retour',1,0,NULL,NULL),(158,124,'2019-04-22 17:12:11','karten öbb goldegg',1,0,NULL,NULL),(159,14.88,'2019-04-22 17:12:50','anker salzburg',2,0,NULL,NULL),(160,25.8,'2019-04-22 17:14:18','biofrische',1,0,NULL,NULL),(161,21.03,'2019-04-23 16:50:38','merkur',2,0,NULL,NULL),(162,14.9,'2019-04-24 16:42:35','da casa mama',1,0,NULL,NULL),(163,18.11,'2019-04-26 16:09:41','spar',1,0,NULL,NULL),(164,32.19,'2019-04-27 10:59:07','spar',1,0,NULL,NULL),(165,31.47,'2019-04-30 16:56:11','spar eltern essen',1,0,NULL,NULL),(166,12.6,'2019-05-03 13:12:21','spar',1,0,NULL,NULL),(167,15,'2019-05-03 20:16:13','billa',2,0,NULL,NULL),(168,11.32,'2019-05-04 07:53:06','spar',1,0,NULL,NULL),(169,41.61,'2019-05-05 20:02:03','Amazon Druckertinte und Thermoskanne',2,0,NULL,NULL),(170,22.37,'2019-05-06 16:34:18','spar',1,0,NULL,NULL),(171,59.95,'2019-05-13 08:48:32','Tchibo Koffer',2,0,NULL,NULL),(172,12.99,'2019-05-13 08:49:00','Toilett Tasche für Reise BIPA',2,0,NULL,NULL),(173,26.63,'2019-05-13 11:22:08','Spar',2,0,NULL,NULL),(174,10.45,'2019-05-16 16:33:34','spar',1,0,NULL,NULL),(175,41.43,'2019-05-18 12:24:45','merkur',1,0,NULL,NULL),(176,6.43,'2019-05-18 12:25:03','spar',1,0,NULL,NULL);
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

-- Dump completed on 2019-05-18 18:28:59
