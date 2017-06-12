CREATE DATABASE  IF NOT EXISTS `javaweb4neri` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `javaweb4neri`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: javaweb4neri
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `nomecompleto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('paulo','1234',3,'Paulo Sergio Borba de França'),('paulo02','1234',2,'Paulo França'),('paulo03','1234',2,'Paulo Franca'),('paulo04','1234',2,'Paulo Franca'),('paulo05','1234',2,'Paulo Franca'),('paulo06','1234',2,'Paulo Franca'),('paulo07','1234',2,'Paulo Franca'),('paulo08','1234',2,'Paulo Franca'),('paulo09','1234',2,'Paulo Franca'),('paulo10','1234',2,'Paulo Franca'),('paulo11','1234',2,'Paulo Franca'),('paulo12','1234',2,'Paulo Franca'),('paulo13','1234',2,'Paulo Franca'),('paulo14','1234',2,'Paulo Franca'),('paulo15','1234',2,'Paulo Franca'),('paulo16','1234',2,'Paulo Franca'),('paulo17','1234',2,'Paulo Franca'),('paulo18','1234',2,'Paulo Franca'),('paulo19','1234',2,'Paulo Franca'),('paulo20','1234',2,'Paulo Franca'),('paulo21','1234',2,'Paulo Franca'),('paulo22','1234',2,'Paulo Franca'),('paulo23','1234',2,'Paulo Franca'),('paulo24','1234',2,'Paulo Franca'),('paulo25','1234',2,'Paulo Franca'),('paulo26','1234',2,'Paulo Franca'),('paulo27','1234',2,'Paulo Franca'),('paulo28','1234',2,'Paulo Franca'),('paulo29','1234',2,'Paulo Franca'),('paulo30','1234',2,'Paulo Franca'),('paulo31','1234',2,'Paulo Franca'),('paulo32','1234',2,'Paulo Franca'),('paulo33','1234',2,'Paulo Franca'),('paulo34','1234',2,'Paulo Franca'),('paulo35','1234',2,'Paulo Franca'),('paulo36','1234',2,'Paulo Franca'),('paulo37','1234',2,'Paulo Franca'),('paulo38','1234',2,'Paulo Franca'),('paulo39','1234',2,'Paulo Franca'),('paulo40','1234',2,'Paulo Franca'),('paulo41','1234',2,'Paulo Franca'),('paulo42','1234',2,'Paulo Franca'),('paulo43','1234',2,'Paulo Franca');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-11 22:23:04
