-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: localhost    Database: splitwisedev
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (9,14,'2019-01-04 09:56:11','spar',1,0,6,'2019-01-17 18:08:37'),(19,777.55,'2019-01-06 11:15:10','komische dinge',2,0,7,'2019-01-12 17:26:34'),(20,500.23,'2019-01-06 14:23:13','bipa',2,0,7,'2019-01-12 17:26:34'),(21,200.2,'2019-01-10 21:39:39','netto',1,0,7,'2019-01-12 17:26:34'),(26,44,'2019-01-11 16:18:20','billiger123',2,0,7,'2019-01-12 15:58:45'),(27,44,'2019-01-11 16:18:25','nein',2,0,7,'2019-01-12 15:58:45'),(28,12,'2019-01-11 16:22:14','asda',2,0,7,'2019-01-12 15:58:45'),(30,12,'2019-01-11 16:27:29','sdf',2,0,7,'2019-01-12 15:58:45'),(32,25,'2019-01-11 16:29:20','bipa',1,0,7,'2019-01-12 15:58:45'),(34,55,'2019-01-11 16:31:48','55',2,0,7,'2019-01-12 15:58:45'),(36,55,'2019-01-11 16:38:47','dinge',2,0,7,'2019-01-12 17:26:34'),(38,19,'2019-01-11 16:47:17','rot',2,0,7,'2019-01-12 17:26:34'),(39,9,'2019-01-11 16:48:35','gelb',1,0,7,'2019-01-12 17:26:34'),(40,99,'2019-01-11 16:50:36','jetz geht es endlich, es ist so geil xD',2,0,7,'2019-01-12 15:58:45'),(47,20,'2019-01-11 18:30:52','irgendwelche sachen',2,0,7,'2019-01-12 17:26:34'),(50,50,'2019-01-11 22:24:36','bipa',1,0,7,'2019-01-12 15:58:45'),(52,59,'2019-01-12 12:17:53','validate this!!!',1,0,7,'2019-01-12 15:58:45'),(55,17,'2019-01-12 12:20:30','sdf',1,0,7,'2019-01-12 15:58:45'),(56,25.54,'2019-01-12 15:27:49','one try',2,0,7,'2019-01-12 15:58:45'),(60,10,'2019-01-12 17:07:21','billa',1,0,18,'2019-01-13 13:41:52'),(61,15.5,'2019-01-12 17:08:25','billa2',1,0,18,'2019-01-13 13:41:52'),(62,10,'2019-01-12 17:08:54','schminksachen',2,0,18,'2019-01-13 13:41:52'),(63,20,'2019-01-12 18:32:56','dinge eben',2,0,18,'2019-01-13 13:41:52'),(64,10.5,'2019-01-13 15:13:17','billa',1,0,19,'2019-01-13 15:45:47'),(66,20.5,'2019-01-13 15:14:09','bipa',2,0,19,'2019-01-13 15:45:47'),(67,13,'2019-01-13 15:14:21','schachtel',2,0,19,'2019-01-13 15:45:47'),(68,20,'2019-01-13 15:47:27','schnarch',1,0,20,'2019-01-13 15:48:30'),(69,20.5,'2019-01-13 15:49:08','so viel geld',2,0,21,'2019-01-13 15:51:27'),(70,82,'2019-01-13 15:49:41','notesss!!!',1,0,21,'2019-01-13 15:51:27'),(71,47,'2019-01-13 15:51:08','zillertaler',2,0,21,'2019-01-13 15:51:27'),(72,20,'2019-01-13 15:52:59','merkur gratis einkauf xD',2,0,22,'2019-01-17 18:14:13'),(73,20,'2019-01-13 15:53:35','nochmal billa',1,0,22,'2019-01-17 18:14:13'),(74,16.8,'2019-01-14 07:11:03','Noch was update',1,0,22,'2019-01-17 18:14:13'),(75,700,'2019-01-17 18:10:10','löschen dieses eintrages',2,1,NULL,'2019-01-18 16:29:16'),(76,40.68,'2019-01-17 18:14:33','merkur',1,0,23,'2019-01-20 10:40:32'),(77,25,'2019-01-17 18:14:52','eine notiz',2,0,23,'2019-01-20 10:40:32'),(78,7888,'2019-01-17 18:15:07','delete',2,1,NULL,'2019-01-18 16:29:16'),(79,12.4,'2019-01-18 16:27:31','dsdf',1,0,23,'2019-01-20 10:40:32'),(80,50000,'2019-01-19 18:55:39','devdatatest',2,0,23,'2019-01-20 10:40:32'),(81,120,'2019-01-20 10:33:20','grindig',1,0,23,'2019-01-20 10:40:32'),(82,120,'2019-01-20 10:33:37','123',2,0,23,'2019-01-20 10:40:32'),(83,120.5,'2019-01-20 10:37:03','gehts jetzt?',1,0,23,'2019-01-20 10:40:32'),(84,12051,'2019-01-20 10:37:21','das auch?',1,0,23,'2019-01-20 10:40:32'),(85,12054,'2019-01-20 10:37:55','jetzt aber',1,0,23,'2019-01-20 10:40:32'),(86,120.56,'2019-01-20 10:38:45','hmm',2,1,NULL,'2019-01-20 10:40:28'),(87,120.5,'2019-01-20 10:40:55','efdg',1,0,24,'2019-01-20 10:49:02'),(88,120.11,'2019-01-20 10:42:47','xy',1,0,24,'2019-01-20 10:49:02'),(89,120.44,'2019-01-20 10:43:04','111',1,0,24,'2019-01-20 10:49:02'),(90,120.54,'2019-01-20 10:43:16','222',2,0,24,'2019-01-20 10:49:02'),(91,1200000.54,'2019-01-20 10:44:17','wie ist das?',2,0,24,'2019-01-20 10:49:02'),(92,45.77,'2019-01-20 10:47:09','tic tac',1,0,24,'2019-01-20 10:49:02'),(93,151.5,'2019-01-20 10:49:12','testdata',1,0,25,'2019-02-02 19:25:37'),(94,54.45,'2019-01-20 10:49:53','billa',2,0,25,'2019-02-02 19:25:37'),(95,22,'2019-01-22 21:07:37','dfs',1,1,NULL,'2019-02-02 17:59:12'),(96,15.3,'2019-02-02 17:57:53','schreiben',1,0,25,'2019-02-02 19:25:37'),(97,10.36,'2019-02-02 19:26:56','soso',1,0,26,'2019-02-02 19:34:52'),(98,10,'2019-02-02 19:35:11','nochwas',1,0,27,'2019-02-03 19:31:19'),(99,50,'2019-02-02 22:41:49','sort check',2,0,27,'2019-02-03 19:31:19'),(100,12.59,'2019-02-03 19:32:17','nix gekauft',2,0,28,'2019-02-04 16:45:24'),(101,50,'2019-02-04 16:45:45','sowas',1,1,NULL,'2019-04-06 10:12:59'),(102,200,'2019-04-06 11:57:30','teest1',1,0,NULL,'2019-04-06 12:42:02'),(103,51,'2019-04-09 20:53:05','hose',2,0,NULL,'2019-04-11 20:43:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (6,'2019-01-06 10:53:04','erste abrechnung'),(7,'2019-01-12 15:58:03','invoice from today'),(8,'2019-01-12 15:59:04','invoice from today 2'),(9,'2019-01-13 13:16:47','standard note'),(10,'2019-01-13 13:18:22','standard note'),(11,'2019-01-13 13:20:44','standard note'),(12,'2019-01-13 13:33:42','standard note'),(13,'2019-01-13 13:38:52','standard note'),(14,'2019-01-13 13:38:52','standard note'),(15,'2019-01-13 13:39:31','standard note'),(16,'2019-01-13 13:39:31','standard note'),(17,'2019-01-13 13:41:52','standard note'),(18,'2019-01-13 13:41:52','standard note'),(19,'2019-01-13 15:45:47','standard note'),(20,'2019-01-13 15:48:30','standard note'),(21,'2019-01-13 15:51:27','standard note'),(22,'2019-01-17 18:14:13','standard note'),(23,'2019-01-20 10:40:32','standard note'),(24,'2019-01-20 10:49:02','standard note'),(25,'2019-02-02 19:25:37','standard note'),(26,'2019-02-02 19:34:51','standard note'),(27,'2019-02-03 19:31:19','standard note'),(28,'2019-02-04 16:45:24','standard note');
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

-- Dump completed on 2019-06-07 11:28:08
