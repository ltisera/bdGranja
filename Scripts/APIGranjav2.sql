CREATE DATABASE  IF NOT EXISTS `bdgranja` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bdgranja`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdgranja
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `cabaña`
--

DROP TABLE IF EXISTS `cabaña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabaña` (
  `cuit` varchar(45) NOT NULL,
  `razonSocial` varchar(45) NOT NULL,
  `domicilio` int(11) NOT NULL,
  PRIMARY KEY (`cuit`),
  KEY `fk_cabaña_Domicilio1_idx` (`domicilio`),
  CONSTRAINT `fk_cabaña_Domicilio1` FOREIGN KEY (`domicilio`) REFERENCES `domicilio` (`idDomicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cuit` varchar(45) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `domicilio` int(11) NOT NULL,
  PRIMARY KEY (`cuit`),
  KEY `fk_cliente_Domicilio1_idx` (`domicilio`),
  CONSTRAINT `fk_cliente_Domicilio1` FOREIGN KEY (`domicilio`) REFERENCES `domicilio` (`idDomicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilio` (
  `idDomicilio` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `numero` int(11) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`idDomicilio`),
  KEY `indiceLocalidad` (`localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Factura_Cliente1_idx` (`cliente`),
  KEY `indiceClientePorFactura` (`cliente`),
  CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cuit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factura_has_producto`
--

DROP TABLE IF EXISTS `factura_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_has_producto` (
  `factura` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`factura`,`producto`),
  KEY `fk_factura_has_producto_producto1_idx` (`producto`),
  KEY `fk_factura_has_producto_factura1_idx` (`factura`),
  CONSTRAINT `fk_factura_has_producto_factura1` FOREIGN KEY (`factura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_has_producto_producto1` FOREIGN KEY (`producto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `galpon`
--

DROP TABLE IF EXISTS `galpon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galpon` (
  `idGalpon` int(11) NOT NULL,
  `cantidadDeGallinas` int(11) DEFAULT NULL,
  `plantel` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGalpon`),
  KEY `fk_Galpon_Plantel_idx` (`plantel`),
  CONSTRAINT `fk_Galpon_Plantel` FOREIGN KEY (`plantel`) REFERENCES `plantel` (`idPlantel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genetica`
--

DROP TABLE IF EXISTS `genetica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genetica` (
  `idGenetica` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `cabaña` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenetica`),
  KEY `fk_Genetica_Cabaña1_idx` (`cabaña`),
  CONSTRAINT `fk_Genetica_Cabaña1` FOREIGN KEY (`cabaña`) REFERENCES `cabaña` (`cuit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `idLog` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cantidadHuevosObtenidos` int(11) DEFAULT NULL,
  `cantidadGallinasMuertas` int(11) DEFAULT NULL,
  `cantidadAlimento` float DEFAULT NULL,
  `tipoAlimento` varchar(45) DEFAULT NULL,
  `galpon` int(11) NOT NULL,
  `novedades` mediumtext,
  `planilla` int(11) NOT NULL,
  `fechaModificado` date DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  PRIMARY KEY (`idLog`),
  KEY `fk_Planilla_Galpon1_idx` (`galpon`),
  KEY `fk_log_usuario1_idx` (`usuario`),
  CONSTRAINT `fk_Planilla_Galpon10` FOREIGN KEY (`galpon`) REFERENCES `galpon` (`idGalpon`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`cuil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planilla`
--

DROP TABLE IF EXISTS `planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planilla` (
  `idPlanilla` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cantidadHuevosObtenidos` int(11) DEFAULT NULL,
  `cantidadGallinasMuertas` int(11) DEFAULT NULL,
  `cantidadAlimento` float DEFAULT NULL,
  `tipoAlimento` varchar(45) DEFAULT NULL,
  `galpon` int(11) NOT NULL,
  `novedades` mediumtext,
  PRIMARY KEY (`idPlanilla`),
  KEY `fk_Planilla_Galpon1_idx` (`galpon`),
  KEY `indiceGallinasFecha` (`fecha`),
  KEY `indiceGalponFecha` (`galpon`,`fecha`),
  CONSTRAINT `fk_Planilla_Galpon1` FOREIGN KEY (`galpon`) REFERENCES `galpon` (`idGalpon`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plantel`
--

DROP TABLE IF EXISTS `plantel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plantel` (
  `idPlantel` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `edadEntrada` int(11) DEFAULT NULL,
  `genetica` int(11) NOT NULL,
  `fechaEntrada` date DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`idPlantel`),
  KEY `fk_Plantel_Genetica1_idx` (`genetica`),
  CONSTRAINT `fk_Plantel_Genetica1` FOREIGN KEY (`genetica`) REFERENCES `genetica` (`idGenetica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `indiceProductosPorEmpaque` (`cantidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `cuil` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `legajoInterno` int(11) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cuil`),
  UNIQUE KEY `legajoInterno_UNIQUE` (`legajoInterno`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13 19:11:38
