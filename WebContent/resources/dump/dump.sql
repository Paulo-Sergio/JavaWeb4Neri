CREATE DATABASE  IF NOT EXISTS `javaweb4neri` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `javaweb4neri`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: javaweb4neri
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'São José'),(2,'Boa Vista'),(3,'Setubal'),(6,'Boa Viagem'),(7,'Piedade'),(8,'Candeias'),(9,'Alto José do Pinho'),(10,'Arruda'),(11,'Aflitos'),(12,'Vasco da Gama'),(13,'Espinheiro'),(14,'Ilha do Leite'),(15,'Derby'),(16,'Cordeiro'),(17,'Caxanga'),(18,'Barra de Jangada'),(19,'Prazeres'),(20,'Cajueiro Seco'),(21,'Ipsep'),(22,'Ibura'),(23,'Varzea'),(24,'Roda de Fogo'),(25,'Barbalho'),(26,'Engenho do Meio');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Recife','PE'),(2,'Jaboatão dos Guararapes','PE'),(3,'Olinda','PE');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logradouro`
--

DROP TABLE IF EXISTS `logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logradouro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouro`
--

LOCK TABLES `logradouro` WRITE;
/*!40000 ALTER TABLE `logradouro` DISABLE KEYS */;
INSERT INTO `logradouro` VALUES (1,'Rua Caraçatuba'),(2,'Rua Cel. Anizio Rodrigues Coelho'),(3,'Rua Rosa Amelia da Paz');
/*!40000 ALTER TABLE `logradouro` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `usuarios` VALUES ('aaa','123',1,'ZZZ teste'),('abc','456',1,'ABC Alfabeto'),('abcd','123',1,'ABCD Alfabeto'),('asfaff','123',2,'OKOK'),('Fernanda','123',2,'Fernanda Saraiva 3'),('gabriel','123',3,'Gabriel Eugenio'),('loko','1234',2,'Paulo Franca'),('Neri','neri',2,'Neri Professor'),('paulo','1234',3,'Paulo Sergio Borba de França'),('paulo03','1234',2,'Paulo Franca'),('paulo04','1234',2,'Paulo Franca'),('paulo05','1234',2,'Paulo Franca'),('paulo06','1234',2,'Paulo Franca'),('paulo07','1234',2,'Paulo Franca'),('paulo08','1234',2,'Paulo Franca'),('paulo09','1234',2,'Paulo Franca'),('paulo10','1234',2,'Paulo Franca'),('paulo11','1234',2,'Paulo Franca'),('paulo12','1234',2,'Paulo Franca'),('paulo13','1234',2,'Paulo Franca'),('paulo14','1234',2,'Paulo Franca'),('paulo15','1234',2,'Paulo Franca'),('paulo16','1234',2,'Paulo Franca'),('paulo17','1234',2,'Paulo Franca'),('paulo18','1234',2,'Paulo Franca'),('paulo19','1234',2,'Paulo Franca'),('paulo20','1234',2,'Paulo Franca'),('paulo21','1234',2,'Paulo Franca'),('paulo22','1234',2,'Paulo Franca'),('paulo23','1234',2,'Paulo Franca'),('paulo24','1234',2,'Paulo Franca'),('paulo25','1234',2,'Paulo Franca'),('paulo26','1234',2,'Paulo Franca'),('paulo27','1234',2,'Paulo Franca'),('paulo28','1234',2,'Paulo Franca'),('paulo29','1234',2,'Paulo Franca'),('paulo30','1234',2,'Paulo Franca'),('paulo31','1234',2,'Paulo Franca'),('paulo32','1234',2,'Paulo Franca'),('paulo33','1234',2,'Paulo Franca'),('paulo34','1234',2,'Paulo Franca'),('paulo35','1234',2,'Paulo Franca'),('paulo36','1234',2,'Paulo Franca'),('Teste','123',3,'Teste 2'),('zzz','123',2,'AAA');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'javaweb4neri'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 16:29:22
