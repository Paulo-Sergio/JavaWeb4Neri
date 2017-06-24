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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Básico'),(2,'Intermediario'),(3,'Avançado');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bairro` int(11) NOT NULL,
  `id_logradouro` int(11) NOT NULL,
  `id_cidade` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(10) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `datacadastro` date DEFAULT NULL,
  `fonecel` varchar(16) DEFAULT NULL,
  `fone2` varchar(16) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `foto` varchar(40) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `obs` text,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_logradouro_idx` (`id_logradouro`),
  KEY `fk_cliente_bairro_idx` (`id_bairro`),
  KEY `fk_cliente_cidade_idx` (`id_cidade`),
  CONSTRAINT `fk_cliente_bairro` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_logradouro` FOREIGN KEY (`id_logradouro`) REFERENCES `logradouro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,1,1,'Paulo Sergio','362','casa','51110-050','7588022','079.351.744-31','1991-12-17','2017-06-15','988824977',NULL,'paulodesignn@gmail.com','paulo.png','m',NULL),(3,6,1,2,'Izabelly Santos','618','apt 2804','51021-130','1234567','111.111.222-33','1992-11-25','2017-06-16','988680609','12345678','bellynha_18@hotmail.com','iza.png','f','obs... obs... obs... obs...'),(4,7,5,2,'teste 2','45','345','','542342','5235235','2000-06-13','2017-06-16','','','teste@teste.com','teste.png',NULL,'ffasfgsdghshdf sfhshsgad'),(5,7,3,3,'outro','67547','casa A','513050465','56754','846754784','1991-06-04','2017-06-16','746754','754675463','abcdefg@gsdg','asfas.jpg','m','abc abc dafsgshsdr'),(9,7,5,2,'Cliente novidade','251','apt 203','','','079.351.744-32','1991-12-17','2017-06-19','(81)98882-4977','','paulodesignn@gmail.com','desert.jpg','M','teste');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_venda` (
  `id_produto` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_produto`,`id_venda`),
  KEY `fk_itens_venda_produtos1_idx` (`id_produto`),
  KEY `fk_itens_venda_venda1_idx` (`id_venda`),
  CONSTRAINT `fk_itens_venda_produtos1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_venda_venda1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` VALUES (1,40,1,NULL),(1,41,2,NULL),(1,46,1,NULL),(1,47,1,NULL),(2,40,1,NULL),(2,43,1,NULL),(2,44,1,NULL),(2,45,1,NULL),(2,47,2,NULL),(3,40,1,NULL),(3,42,1,NULL),(3,43,2,NULL),(3,45,1,NULL);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouro`
--

LOCK TABLES `logradouro` WRITE;
/*!40000 ALTER TABLE `logradouro` DISABLE KEYS */;
INSERT INTO `logradouro` VALUES (1,'Rua Caraçatuba'),(2,'Rua Cel. Anizio Rodrigues Coelho'),(3,'Rua Rosa Amelia da Paz'),(4,'Av Boa Viagem'),(5,'Av Bernardo Vieira de Melo');
/*!40000 ALTER TABLE `logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `qtdestoque` float NOT NULL,
  `precocusto` decimal(8,2) DEFAULT NULL,
  `perclucro` int(11) DEFAULT NULL,
  `precovenda` decimal(8,2) NOT NULL,
  `datacadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produtos_categoria1_idx` (`id_categoria`),
  CONSTRAINT `fk_produtos_categoria1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,'Curso Java Básico',10,80.00,30,104.00,'2014-05-30'),(2,2,'Curso Android I',20,50.00,40,70.00,'2014-04-30'),(3,2,'Curso PHP',10,40.00,35,65.00,'2015-12-15');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
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
INSERT INTO `usuarios` VALUES ('aaa','123',1,'ZZZ teste'),('aasfa','123',2,'gsrg etjh h'),('abc','456',1,'ABC Alfabeto'),('abcd','123',1,'ABCD Alfabeto'),('asfaff','123',2,'OKOK'),('Fernanda','123',2,'Fernanda Saraiva 3'),('gabriel','123',3,'Gabriel Eugenio'),('loko','1234',2,'Paulo Franca'),('Neri','neri',2,'Neri Professor'),('paulo','1234',3,'Paulo Sergio Borba de França'),('paulo03','1234',2,'Paulo Franca'),('paulo04','1234',2,'Paulo Franca'),('paulo05','1234',2,'Paulo Franca'),('paulo06','1234',2,'Paulo Franca'),('paulo07','1234',2,'Paulo Franca'),('paulo08','1234',2,'Paulo Franca'),('paulo09','1234',2,'Paulo Franca'),('paulo10','1234',2,'Paulo Franca'),('paulo11','1234',2,'Paulo Franca'),('paulo12','1234',2,'Paulo Franca'),('paulo13','1234',2,'Paulo Franca'),('paulo14','1234',2,'Paulo Franca'),('paulo15','1234',2,'Paulo Franca'),('paulo16','1234',2,'Paulo Franca'),('paulo17','1234',2,'Paulo Franca'),('paulo18','1234',2,'Paulo Franca'),('paulo19','1234',2,'Paulo Franca'),('paulo20','1234',2,'Paulo Franca'),('paulo21','1234',2,'Paulo Franca'),('paulo22','1234',2,'Paulo Franca'),('paulo23','1234',2,'Paulo Franca'),('paulo24','1234',2,'Paulo Franca'),('paulo25','1234',2,'Paulo Franca'),('paulo26','1234',2,'Paulo Franca'),('paulo27','1234',2,'Paulo Franca'),('paulo28','1234',2,'Paulo Franca'),('paulo29','1234',2,'Paulo Franca'),('paulo30','1234',2,'Paulo Franca'),('paulo31','1234',2,'Paulo Franca'),('paulo32','1234',2,'Paulo Franca'),('paulo33','1234',2,'Paulo Franca'),('paulo34','1234',2,'Paulo Franca'),('paulo35','1234',2,'Paulo Franca'),('paulo36','1234',2,'Paulo Franca'),('Teste','123',3,'Teste 2'),('zzz','123',2,'AAA');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `valortotal` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venda_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (40,1,'2017-06-23',0.00),(41,3,'2017-06-12',0.00),(42,9,'2017-06-23',0.00),(43,5,'2017-06-23',0.00),(44,1,'2017-06-12',0.00),(45,1,'2017-06-23',0.00),(46,9,'2017-06-23',0.00),(47,5,'2017-06-23',0.00);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-23 22:22:28
