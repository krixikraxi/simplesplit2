-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: localhost    Database: splitwise
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0+deb9u1

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
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (80,11.68,'2019-01-20 10:15:44','spar 19.01.',2,0,23,'2019-02-13 17:41:35'),(81,21.08,'2019-01-20 10:16:19','merkur 18.01',2,0,23,'2019-02-13 17:41:35'),(82,42.54,'2019-01-20 10:17:15','merkur 17.01',2,0,23,'2019-02-13 17:41:35'),(83,22.74,'2019-01-20 10:18:02','spar 14.01',2,0,23,'2019-02-13 17:41:35'),(84,30.54,'2019-01-20 10:18:37','eurospar 16.01',2,0,23,'2019-02-13 17:41:35'),(85,66.07,'2019-01-20 10:19:48','spar 09.01',2,0,23,'2019-02-13 17:41:35'),(86,51.13,'2019-01-20 10:21:55','merkur 02.01',1,0,23,'2019-02-13 17:41:35'),(87,43.49,'2019-01-25 17:33:14','merkur 24.01',2,0,23,'2019-02-13 17:41:35'),(88,26.2,'2019-01-26 18:05:19','biofrische',1,0,23,'2019-02-13 17:41:35'),(89,27.79,'2019-01-26 18:41:58','merkur',2,0,23,'2019-02-13 17:41:35'),(90,12.24,'2019-01-28 16:46:54','spar',1,0,23,'2019-02-13 17:41:35'),(91,33.58,'2019-01-30 16:10:30','spar',2,0,23,'2019-02-13 17:41:35'),(92,10.99,'2019-02-02 16:28:22','bipa',2,0,23,'2019-02-13 17:41:35'),(93,16.72,'2019-02-04 16:46:43','spar',1,0,23,'2019-02-13 17:41:35'),(94,12.47,'2019-02-05 17:38:02','spar',1,0,23,'2019-02-13 17:41:35'),(95,52.82,'2019-02-07 12:30:55','Spar',2,0,23,'2019-02-13 17:41:35'),(96,21.6,'2019-02-07 20:47:23','mjam biofrische',1,0,23,'2019-02-13 17:41:35'),(97,14.7,'2019-02-10 21:10:38','mc donalds',1,0,23,'2019-02-13 17:41:35'),(98,44.02,'2019-02-12 17:22:23','Merkur',2,0,23,'2019-02-13 17:41:35'),(99,3.99,'2019-02-12 17:22:49','Müller - Glühbirne',2,0,23,'2019-02-13 17:41:35'),(100,12.54,'2019-02-13 17:32:33','spar',1,0,23,'2019-02-13 17:41:35'),(101,10.51,'2019-02-13 18:01:57','spar',2,0,NULL,NULL),(102,55,'2019-02-14 21:56:07','therme wien',1,0,NULL,NULL),(103,21,'2019-02-14 22:57:31','speedy pizza',1,0,NULL,NULL),(104,20.4,'2019-02-15 15:49:48','mjam korean street food',1,0,NULL,NULL),(105,19.65,'2019-02-16 11:20:58','spar',1,0,NULL,NULL),(106,17.4,'2019-02-21 19:30:06','da casa mama',1,0,NULL,NULL),(107,34.45,'2019-02-22 20:00:44','Spar 20.02.',2,0,NULL,NULL),(108,50.66,'2019-02-23 12:54:18','spar und spieleabend',1,0,NULL,NULL),(109,10,'2019-02-23 12:54:35','spar',1,0,NULL,NULL),(110,15.34,'2019-02-25 18:26:10','merkur',2,0,NULL,NULL),(111,20.12,'2019-02-28 13:34:25','Spar 28.2.',2,0,NULL,NULL),(112,6.82,'2019-02-28 19:53:38','spar 25.02.',1,0,NULL,NULL),(113,36.94,'2019-03-02 18:09:12','merkur 2.3.',2,0,NULL,NULL),(114,25.02,'2019-03-04 16:42:44','spar 4.3.',2,0,NULL,NULL),(115,2.75,'2019-03-04 19:12:10','spar',1,0,NULL,NULL),(116,28.2,'2019-03-05 18:09:19','biofrische',1,0,NULL,NULL),(117,42.93,'2019-03-06 13:01:43','merkur 06.03.',2,0,NULL,NULL),(118,8.33,'2019-03-08 11:39:54','Hofer 7.3.',2,0,NULL,NULL),(119,24.63,'2019-03-09 13:05:12','spar',1,0,NULL,NULL),(120,7.5,'2019-03-14 09:06:37','kopierpapier und einweghandschuhe',2,0,NULL,NULL),(121,23.56,'2019-03-15 09:39:54','Merkur 11.3.',2,0,NULL,NULL),(122,16.02,'2019-03-15 19:15:55','Billa',2,0,NULL,NULL),(123,18.42,'2019-03-17 14:53:07','holy chicken',1,0,NULL,NULL),(124,18.31,'2019-03-18 17:28:25','spar',1,0,NULL,NULL),(125,14.9,'2019-03-19 17:00:33','da casa mama pizza',1,0,NULL,NULL),(126,36.36,'2019-03-21 12:30:30','Spar 21.3.',2,0,NULL,NULL),(127,5.18,'2019-03-21 17:34:01','spar',1,0,NULL,NULL),(128,23.87,'2019-03-25 11:03:47','Adamah Biokistl',2,0,NULL,NULL),(129,7.01,'2019-03-25 17:26:43','spar',1,0,NULL,NULL),(130,24.44,'2019-03-27 18:50:44','spar',1,0,NULL,NULL),(131,21.8,'2019-03-28 18:30:34','holy chicken',1,0,NULL,NULL),(132,33.95,'2019-03-29 10:48:10','Spar 29.3.',2,0,NULL,NULL),(133,4.2,'2019-03-30 13:42:31','brot',2,0,NULL,NULL),(134,2.58,'2019-03-30 13:43:11','schokohasen',2,0,NULL,'2019-03-30 13:43:33'),(135,3.17,'2019-03-30 13:44:20','dm',2,0,NULL,NULL),(136,30.71,'2019-04-02 18:07:58','Spar 2.4.',2,0,NULL,NULL),(137,9.15,'2019-04-04 16:29:20','spar',1,0,NULL,NULL),(138,9.85,'2019-04-05 11:07:16','hofer 4.4.',2,0,NULL,NULL),(139,32.9,'2019-04-05 11:08:01','Tchibo 4.4.',2,0,NULL,NULL),(140,26.8,'2019-04-05 17:12:25','biofrische',1,0,NULL,NULL),(141,51.25,'2019-04-06 13:25:53','Merkur',2,0,NULL,NULL),(142,5,'2019-04-06 13:26:03','Zuckererbsen',2,0,NULL,NULL),(143,22.5,'2019-04-07 17:20:12','mc donalds',1,0,NULL,NULL),(144,9.42,'2019-04-11 16:26:20','spar',1,0,NULL,NULL),(145,38.5,'2019-04-12 23:36:00','essen pfadis',1,0,NULL,NULL),(146,7,'2019-04-13 09:34:31','taxi',2,0,NULL,NULL),(147,29.98,'2019-04-13 13:20:02','asia shop nippon ya',2,0,NULL,NULL),(148,24.01,'2019-04-13 13:20:24','merkur',2,0,NULL,NULL),(149,70,'2019-04-14 11:23:50','tiki bar',2,0,NULL,NULL),(150,13.9,'2019-04-14 11:24:07','da casa mama',1,0,NULL,NULL),(151,25.23,'2019-04-15 10:53:40','spar',2,0,NULL,NULL),(152,20.12,'2019-04-16 15:56:51','spar',1,0,NULL,NULL),(153,6.65,'2019-04-16 15:57:34','spar',2,0,NULL,NULL),(154,5.35,'2019-04-17 16:09:15','spar',1,0,NULL,NULL),(155,8.44,'2019-04-18 18:10:15','billa',2,0,NULL,NULL),(156,6,'2019-04-18 19:20:46','kartenreservierung',1,0,NULL,NULL),(157,6,'2019-04-22 17:10:16','kartenreservierung retour',1,0,NULL,NULL),(158,124,'2019-04-22 17:12:11','karten öbb goldegg',1,0,NULL,NULL),(159,14.88,'2019-04-22 17:12:50','anker salzburg',2,0,NULL,NULL),(160,25.8,'2019-04-22 17:14:18','biofrische',1,0,NULL,NULL),(161,21.03,'2019-04-23 16:50:38','merkur',2,0,NULL,NULL),(162,14.9,'2019-04-24 16:42:35','da casa mama',1,0,NULL,NULL),(163,18.11,'2019-04-26 16:09:41','spar',1,0,NULL,NULL),(164,32.19,'2019-04-27 10:59:07','spar',1,0,NULL,NULL),(165,31.47,'2019-04-30 16:56:11','spar eltern essen',1,0,NULL,NULL),(166,12.6,'2019-05-03 13:12:21','spar',1,0,NULL,NULL),(167,15,'2019-05-03 20:16:13','billa',2,0,NULL,NULL),(168,11.32,'2019-05-04 07:53:06','spar',1,0,NULL,NULL),(169,41.61,'2019-05-05 20:02:03','Amazon Druckertinte und Thermoskanne',2,0,NULL,NULL),(170,22.37,'2019-05-06 16:34:18','spar',1,0,NULL,NULL),(171,59.95,'2019-05-13 08:48:32','Tchibo Koffer',2,0,NULL,NULL),(172,12.99,'2019-05-13 08:49:00','Toilett Tasche für Reise BIPA',2,0,NULL,NULL),(173,26.63,'2019-05-13 11:22:08','Spar',2,0,NULL,NULL),(174,10.45,'2019-05-16 16:33:34','spar',1,0,NULL,NULL),(175,41.43,'2019-05-18 12:24:45','merkur',1,0,NULL,NULL),(176,6.43,'2019-05-18 12:25:03','spar',1,0,NULL,NULL),(177,27.7,'2019-05-22 18:00:13','Billa',2,0,NULL,NULL),(178,24.5,'2019-05-25 14:52:18','platte fuer zwei',1,0,NULL,NULL),(179,13.5,'2019-05-28 18:34:32','merkur',2,0,NULL,NULL),(180,17.98,'2019-06-01 14:58:23','pizza flitzer',1,0,NULL,NULL),(181,26.3,'2019-06-01 14:58:46','biofrische',1,0,NULL,NULL),(182,60.16,'2019-06-03 15:07:07','Spar',2,0,NULL,NULL),(183,6.91,'2019-06-05 06:59:56','billa 4.6.',2,0,NULL,NULL),(184,12.45,'2019-06-05 07:00:21','gewürze 4.6.',2,0,NULL,NULL),(185,18,'2019-06-06 11:36:42','liebeshut <3',2,0,NULL,NULL),(186,25.67,'2019-06-06 11:37:16','merkur',2,0,NULL,NULL),(187,21.03,'2019-06-06 11:38:51','kaffee',2,0,NULL,NULL),(188,16.03,'2019-06-07 17:48:05','spar',1,0,NULL,NULL),(189,30.95,'2019-06-08 10:25:56','apotheke',2,0,NULL,NULL),(190,19,'2019-06-09 21:32:18','dominos pizza',1,0,NULL,NULL),(191,6.87,'2019-06-10 09:09:20','tankstelle torte wolfgang',2,0,NULL,NULL),(192,18.85,'2019-06-11 16:52:30','spar',1,0,NULL,NULL),(193,12,'2019-06-12 15:52:24','spar',1,0,NULL,NULL),(194,28.5,'2019-06-14 13:32:41','spar',1,0,NULL,NULL),(195,39.96,'2019-06-15 09:59:52','spar',1,0,NULL,NULL),(196,20,'2019-06-16 11:28:52','dominos pizza',1,0,NULL,NULL),(197,11.63,'2019-06-17 15:59:38','spar',1,0,NULL,NULL),(198,13,'2019-06-22 14:08:18','subway',1,0,NULL,NULL),(199,13.8,'2019-06-22 14:09:07','mc donald breakfest',1,0,NULL,NULL),(200,19.12,'2019-06-22 14:09:45','spar',2,0,NULL,NULL),(201,4,'2019-06-22 14:10:05','eis',1,0,NULL,NULL),(202,6,'2019-06-24 16:09:06','eis',1,0,NULL,NULL),(203,3.98,'2019-06-25 17:50:36','Billa 19.6.',2,0,NULL,NULL),(204,30.92,'2019-06-25 17:50:55','merkur',2,0,NULL,NULL),(205,19,'2019-06-29 18:42:01','dominos',1,0,NULL,NULL),(206,28.26,'2019-06-29 18:42:44','spar',1,0,NULL,NULL),(207,7.5,'2019-07-05 17:43:50','Zitronella Kerzen',2,0,NULL,NULL),(208,37.19,'2019-07-05 17:44:12','Spar 4.7.',2,0,NULL,NULL),(209,13.98,'2019-07-06 16:49:22','subway',1,0,NULL,NULL),(210,20.72,'2019-07-06 16:50:16','merkur',2,0,NULL,NULL),(211,23,'2019-07-07 16:16:42','spareribs da casa mama',1,0,NULL,NULL),(212,19.5,'2019-07-10 17:34:27','dominos',1,0,NULL,NULL),(213,31.79,'2019-07-11 14:01:13','Spar',2,0,NULL,NULL),(214,12.93,'2019-07-15 16:11:19','spar',1,0,NULL,NULL),(215,16.08,'2019-07-17 12:57:46','spar',2,0,NULL,NULL),(216,24.51,'2019-07-18 16:24:34','spar',1,0,NULL,NULL),(217,18.2,'2019-07-26 08:12:50','Merkur 25.7.',2,0,NULL,NULL),(218,31.3,'2019-07-26 08:13:21','Japan Supermarkt Okonomiyaki',2,0,NULL,NULL),(219,22.4,'2019-07-27 09:02:34','merkur',2,0,NULL,NULL),(220,6.45,'2019-07-27 11:24:38','sonnenchreme',1,0,NULL,NULL),(221,63.16,'2019-07-27 11:25:23','merkur',2,0,NULL,NULL),(222,20.74,'2019-07-27 11:26:06','müller',2,0,NULL,NULL),(223,34.26,'2019-07-27 15:17:02','spar fuer feier',1,0,NULL,NULL),(224,30.48,'2019-07-29 14:31:44','spar',2,0,NULL,NULL),(225,13.43,'2019-08-02 10:24:42','merkur 1.8.',2,0,NULL,NULL),(226,20.5,'2019-08-02 16:02:21','da casa mama',1,0,NULL,NULL),(227,20,'2019-08-04 11:16:21','uber trumau',1,0,NULL,NULL),(228,4.99,'2019-08-04 15:55:30','kühltasche',2,0,NULL,NULL),(229,28.15,'2019-08-04 15:56:24','merkur 3.8.',2,0,NULL,NULL),(230,6.94,'2019-08-05 16:03:51','spar',1,0,NULL,NULL),(231,6.73,'2019-08-05 16:04:10','spar',1,0,NULL,NULL),(232,35.8,'2019-08-05 16:04:54','mci',1,0,NULL,NULL),(233,20.22,'2019-08-08 07:28:26','billa 7.8.',2,0,NULL,'2019-08-08 07:28:36'),(234,88,'2019-08-10 12:45:28','Zug Hinfahrt Vorarlberg',2,0,NULL,NULL),(235,205.6,'2019-08-10 13:12:04','Hotel Schruns',1,0,NULL,NULL),(236,85.6,'2019-08-10 13:12:25','ÖBB Ticket Heimfahrt',2,0,NULL,NULL),(237,24,'2019-08-10 13:26:16','mamacita',2,0,NULL,NULL),(238,268,'2019-08-10 15:24:03','Hotel Feldkirch',1,0,NULL,NULL),(239,419.5,'2019-08-10 17:59:40','Hotel Bregenz',1,0,NULL,NULL),(240,10,'2019-08-12 16:20:59','Stadionbad',1,0,NULL,NULL),(241,26,'2019-08-12 19:50:20','mci',2,0,NULL,NULL),(242,14.84,'2019-08-13 17:59:28','Spar',2,0,NULL,NULL),(243,13.9,'2019-08-14 11:23:21','da casa mama',1,0,NULL,NULL),(244,33.62,'2019-08-14 11:23:47','spar',1,0,NULL,NULL),(245,24.6,'2019-08-16 13:16:56','Mamacita',1,0,NULL,NULL),(246,26.7,'2019-08-16 13:17:31','Billa',2,0,NULL,NULL),(247,28.95,'2019-08-16 13:33:50','wiener börger',1,0,NULL,NULL),(248,24.6,'2019-08-16 13:34:16','mamacita',1,0,NULL,NULL),(249,24.7,'2019-08-24 18:43:06','litschi asiate schruns',1,0,NULL,NULL),(250,9,'2019-08-24 18:44:28','öbb schruns nach feldkirch',1,0,NULL,NULL),(251,6,'2019-08-24 18:45:01','öbb bregenz dornbirn und zurück',1,0,NULL,NULL),(252,7.54,'2019-08-24 19:13:34','billa schruns',2,0,NULL,NULL),(253,47.8,'2019-08-24 19:14:46','Wirtshaus am See 1',2,0,NULL,NULL),(254,14,'2019-08-24 19:15:09','Schattenburg',2,0,NULL,NULL),(255,45,'2019-08-24 19:15:43','Gasthaus Krone Schruns',2,0,NULL,NULL),(256,55,'2019-08-24 19:16:06','Wirtshaus am See 2',2,0,NULL,NULL),(257,6,'2019-08-24 19:16:21','Milchpilz 2mal',2,0,NULL,NULL),(258,18,'2019-08-24 19:16:47','Essen Bregenz',2,0,NULL,NULL),(259,14.2,'2019-08-24 19:18:00','Busskarten Feldkirch',2,0,NULL,NULL),(260,26.67,'2019-08-24 19:18:45','Interspar Essen Feldkirch',2,0,NULL,NULL),(261,38,'2019-08-24 19:19:38','Golm-Bahn Latschau',2,0,NULL,NULL),(262,55,'2019-08-24 19:19:52','Alm Essen',2,0,NULL,NULL),(263,9,'2019-08-24 19:20:38','ÖBB Ticket Feldkirch bis Bregenz',2,0,NULL,NULL),(264,25.34,'2019-08-24 19:21:02','Interspar Essen Feldkirch 2',2,0,NULL,NULL),(265,6.56,'2019-08-24 19:21:27','Interspar Feldkirch',2,0,NULL,NULL),(266,22.05,'2019-08-24 19:21:55','Interspar Feldkirch 2',2,0,NULL,NULL),(267,6.17,'2019-08-24 19:22:19','BIPA Schruns',2,0,NULL,NULL),(268,16.12,'2019-08-24 19:22:48','Spar Wien Hbf',2,0,NULL,NULL),(269,10.52,'2019-08-24 19:23:22','SPar Bregenz',2,0,NULL,NULL);
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

-- Dump completed on 2019-08-24 19:25:42
