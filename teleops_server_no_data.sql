-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: db-teleops.tortops.com    Database: teleops
-- ------------------------------------------------------
-- Server version	5.7.33-google-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `api_key` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `apiclient_id` char(16) CHARACTER SET ascii NOT NULL,
  `apiclient_type` enum('SERVER','OPERATOR','VEHICLE','MONITOR','FRONTEND') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`api_key`),
  UNIQUE KEY `apiclient_id` (`apiclient_id`),
  KEY `apiclient_type` (`apiclient_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command_file`
--

DROP TABLE IF EXISTS `command_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command_file` (
  `UID_COMMAND_FILE` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(15) NOT NULL,
  `URL` text NOT NULL,
  PRIMARY KEY (`UID_COMMAND_FILE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deb_file`
--

DROP TABLE IF EXISTS `deb_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deb_file` (
  `UID_DEB_FILE` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(15) NOT NULL,
  `URL` text NOT NULL,
  PRIMARY KEY (`UID_DEB_FILE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_data`
--

DROP TABLE IF EXISTS `deploy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deploy_data` (
  `UID_DEPLOY` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_DEPLOY` date NOT NULL,
  `VERSION_DEPLOY` varchar(50) NOT NULL,
  `BINARIO_DEPLOY` varchar(200) NOT NULL,
  `BRAIN_DEPLOY` varchar(200) NOT NULL,
  `IP_VEHICULO` varchar(15) NOT NULL,
  `TIPO_VEHICULO` varchar(50) NOT NULL,
  PRIMARY KEY (`UID_DEPLOY`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_estatus`
--

DROP TABLE IF EXISTS `error_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_estatus` (
  `ID_ERROR` int(11) NOT NULL AUTO_INCREMENT,
  `ERROR_DESCRIPCION` text NOT NULL,
  PRIMARY KEY (`ID_ERROR`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacion` (
  `UID_ESTACION` int(11) NOT NULL,
  `UID_OPERADOR` int(11) NOT NULL,
  `UBICACION_GPS_LAT` double NOT NULL,
  `UBICACION_GPS_LON` double NOT NULL,
  `CAPACIDAD` int(11) NOT NULL,
  `ID_ESTATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`UID_ESTACION`),
  KEY `UID_OPERADOR_idx` (`UID_OPERADOR`),
  KEY `ID_ESTATUS_idx` (`ID_ESTATUS`),
  CONSTRAINT `ID_ESTATUS` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UID_OPERADOR` FOREIGN KEY (`UID_OPERADOR`) REFERENCES `operador` (`UID_OPERADOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `ID_ESTATUS` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION_ESTATUS` varchar(50) NOT NULL,
  `TIPO_ESTATUS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ESTATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hex_file`
--

DROP TABLE IF EXISTS `hex_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hex_file` (
  `UID_HEX_FILE` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(15) NOT NULL,
  `URL` text NOT NULL,
  PRIMARY KEY (`UID_HEX_FILE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operador`
--

DROP TABLE IF EXISTS `operador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operador` (
  `UID_OPERADOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_OPERADOR` varchar(90) NOT NULL,
  `FABRICANTE` varchar(90) NOT NULL,
  `MODELO` varchar(90) NOT NULL,
  `URL_TRACKING` varchar(100) DEFAULT NULL,
  `URL_WEBHOOK` varchar(100) DEFAULT NULL,
  `PRIVATE_KEY` varchar(90) DEFAULT NULL,
  `ESTATUS_ACTIVO` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UID_OPERADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payload`
--

DROP TABLE IF EXISTS `payload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payload` (
  `UID_PAYLOAD` int(11) NOT NULL AUTO_INCREMENT,
  `CELLPHONE` varchar(20) DEFAULT NULL,
  `UID_SESION_TELEOPS` int(11) DEFAULT NULL,
  `ETA` double DEFAULT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  `UID_RUTA` int(11) DEFAULT NULL,
  `REQUESTED_LATITUDE` double NOT NULL,
  `REQUESTED_LONGITUDE` double NOT NULL,
  `REQUESTED_DATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `START_LATITUDE` double DEFAULT NULL,
  `START_LONGITUDE` double DEFAULT NULL,
  `START_DATETIME` timestamp NULL DEFAULT NULL,
  `END_LATITUDE` double DEFAULT NULL,
  `END_LONGITUDE` double DEFAULT NULL,
  `END_DATETIME` timestamp NULL DEFAULT NULL,
  `UID_VEHICULO` int(11) DEFAULT NULL,
  `ONFLEET_UID` varchar(100) DEFAULT NULL,
  `TYPE` enum('PICK UP','DROP OFF') DEFAULT NULL,
  `UID_STOP` bigint(20) DEFAULT NULL,
  `UID_ASSIGMENT` bigint(20) DEFAULT NULL,
  `UID_SHIPMENT` bigint(20) DEFAULT NULL,
  `UID_CLIENT` int(11) DEFAULT NULL,
  `CLIENT_NAME` varchar(100) DEFAULT NULL,
  `CLIENT_EMAIL` varchar(100) DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `UID_OPERADOR` int(11) DEFAULT NULL,
  `LABEL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UID_PAYLOAD`),
  KEY `ID_ESTATUS` (`ID_ESTATUS`),
  KEY `UID_RUTA` (`UID_RUTA`),
  KEY `payload_FK` (`UID_VEHICULO`),
  KEY `payload_FK_1` (`UID_SESION_TELEOPS`),
  KEY `payload_FK_2` (`UID_OPERADOR`),
  CONSTRAINT `payload_FK` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`),
  CONSTRAINT `payload_FK_1` FOREIGN KEY (`UID_SESION_TELEOPS`) REFERENCES `sesion_teleops` (`UID_SESION_TELEOPS`),
  CONSTRAINT `payload_FK_2` FOREIGN KEY (`UID_OPERADOR`) REFERENCES `operador` (`UID_OPERADOR`),
  CONSTRAINT `payload_ibfk_1` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`),
  CONSTRAINT `payload_ibfk_2` FOREIGN KEY (`UID_RUTA`) REFERENCES `ruta` (`UID_RUTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2574 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puerto_sesion`
--

DROP TABLE IF EXISTS `puerto_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puerto_sesion` (
  `UID_PUERTO_SESION` int(11) NOT NULL,
  `UID_SERVIDOR` int(11) NOT NULL,
  `PUERTO_IMAGENES_UI` int(11) NOT NULL,
  `PUERTO_JOYSTICK_UI` int(11) NOT NULL,
  `PUERTO_CONTROL` int(11) NOT NULL,
  `PUERTO_SENSOR` int(11) NOT NULL,
  `PUERTO_VIDEO` int(11) NOT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  `PUERTO_LATENCY` int(11) NOT NULL,
  `PUERTO_LATENCY_UI` int(11) NOT NULL,
  `PUERTO_SENSOR_UI` int(11) NOT NULL,
  PRIMARY KEY (`UID_PUERTO_SESION`),
  KEY `IDSERVIDOR_idx` (`UID_SERVIDOR`),
  KEY `IDESTATUS_idx` (`ID_ESTATUS`,`UID_SERVIDOR`),
  CONSTRAINT `IDSERVIDOR` FOREIGN KEY (`UID_SERVIDOR`) REFERENCES `servidor` (`UID_SERVIDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_IDESTATUS` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta` (
  `UID_RUTA` int(11) NOT NULL AUTO_INCREMENT,
  `GPS_LAT_INICIO` double DEFAULT NULL,
  `GPS_LAT_FINAL` double NOT NULL,
  `FECHA_INICIO` datetime NOT NULL,
  `FECHA_FIN` datetime DEFAULT NULL,
  `GPS_LON_INICIO` double DEFAULT NULL,
  `GPS_LON_FINAL` double NOT NULL,
  `UID_PHYSICAL` varchar(50) DEFAULT NULL,
  `ID_RIDE_REQUEST_EXT` int(11) DEFAULT NULL,
  `ID_ESTATUS_SOLICITUD` int(11) DEFAULT NULL,
  `UID_OPERADOR` int(11) DEFAULT NULL,
  `UID_ESTATUS_FINALIZACION` int(11) DEFAULT NULL,
  `GPS_LAT_CIERRE` double DEFAULT NULL,
  `GPS_LON_CIERRE` double DEFAULT NULL,
  PRIMARY KEY (`UID_RUTA`),
  KEY `fk_UID_VEHICULO_idx` (`UID_PHYSICAL`),
  KEY `fk_ID_ESTATUS_SOLICITUD_idx` (`ID_ESTATUS_SOLICITUD`),
  KEY `fk_UID_OPERADOR_idx` (`UID_OPERADOR`),
  CONSTRAINT `fk_ID_ESTATUS_SOLICITUD` FOREIGN KEY (`ID_ESTATUS_SOLICITUD`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_OPERADOR` FOREIGN KEY (`UID_OPERADOR`) REFERENCES `operador` (`UID_OPERADOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_VEHICULO` FOREIGN KEY (`UID_PHYSICAL`) REFERENCES `vehiculo` (`UID_PHYSICAL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9815 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servidor`
--

DROP TABLE IF EXISTS `servidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servidor` (
  `UID_SERVIDOR` int(11) NOT NULL AUTO_INCREMENT,
  `IP_SERVIDOR` varchar(15) NOT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  `NUM_VEHIC_CONECTADOS` int(11) DEFAULT '0',
  `NOMBRE_SERVDOR` varchar(45) NOT NULL,
  `DOMINIO` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UID_SERVIDOR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sesion_teleops`
--

DROP TABLE IF EXISTS `sesion_teleops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion_teleops` (
  `UID_SESION_TELEOPS` int(11) NOT NULL AUTO_INCREMENT,
  `UID_VEHICULO` int(11) NOT NULL,
  `UID_TELEOPERADOR` int(11) NOT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  `FECHA_INICIO_SESION` datetime NOT NULL,
  `FECHA_FIN_SESION` datetime DEFAULT NULL,
  `UID_PUERTO_SESION` int(11) NOT NULL,
  `CONFIG_VIDEO` int(11) NOT NULL DEFAULT '1',
  `BUCKET_SESION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UID_SESION_TELEOPS`),
  KEY `fk_CONEXION_TELEOPS_VEHICULO1_idx` (`UID_VEHICULO`),
  KEY `fk_CONEXION_TELEOPS_TELEOPERADOR1_idx` (`UID_TELEOPERADOR`),
  KEY `fk_ESTATUS_idx` (`ID_ESTATUS`),
  KEY `fk_PUERTO_SESION_idx` (`UID_PUERTO_SESION`),
  CONSTRAINT `fk_CONEXION_TELEOPS_TELEOPERADOR1` FOREIGN KEY (`UID_TELEOPERADOR`) REFERENCES `teleoperador` (`UID_TELEOPERADOR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONEXION_TELEOPS_VEHICULO1` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESTATUS` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PUERTO_SESION` FOREIGN KEY (`UID_PUERTO_SESION`) REFERENCES `puerto_sesion` (`UID_PUERTO_SESION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10831 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `UID_STORAGE` int(11) NOT NULL AUTO_INCREMENT,
  `MAC_STORAGE` varchar(17) NOT NULL,
  `UID_VEHICULO` int(11) DEFAULT NULL,
  `UID_PAYLOAD` int(11) DEFAULT NULL,
  `UID_OPERADOR` int(11) NOT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  PRIMARY KEY (`UID_STORAGE`),
  KEY `UID_VEHICULO` (`UID_VEHICULO`),
  KEY `UID_PAYLOAD` (`UID_PAYLOAD`),
  KEY `storage_FK` (`UID_OPERADOR`),
  KEY `storage_FK_1` (`ID_ESTATUS`),
  CONSTRAINT `storage_FK` FOREIGN KEY (`UID_OPERADOR`) REFERENCES `operador` (`UID_OPERADOR`),
  CONSTRAINT `storage_FK_1` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`),
  CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`),
  CONSTRAINT `storage_ibfk_2` FOREIGN KEY (`UID_PAYLOAD`) REFERENCES `payload` (`UID_PAYLOAD`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_log` (
  `ID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `code` smallint(3) NOT NULL,
  `details` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `code_idx` (`code`),
  CONSTRAINT `code` FOREIGN KEY (`code`) REFERENCES `system_log_codes` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log para eventos de sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_log_codes`
--

DROP TABLE IF EXISTS `system_log_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_log_codes` (
  `code` smallint(4) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Códigos para el log del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teleoperador`
--

DROP TABLE IF EXISTS `teleoperador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teleoperador` (
  `UID_TELEOPERADOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_TELEOPERADOR` varchar(250) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UID_TELEOPERADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` char(8) CHARACTER SET ascii NOT NULL,
  `user_email` char(254) CHARACTER SET ascii NOT NULL,
  `user_hash` char(64) NOT NULL,
  `user_profile` char(8) CHARACTER SET ascii NOT NULL,
  `user_name` char(48) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UID_OPERADOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  KEY `user_profile_idx` (`user_profile`),
  CONSTRAINT `user_profile` FOREIGN KEY (`user_profile`) REFERENCES `user_profiles` (`user_profile`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_profile_permissions`
--

DROP TABLE IF EXISTS `user_profile_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile_permissions` (
  `user_profile` char(8) CHARACTER SET ascii NOT NULL,
  `profile_permission` char(16) CHARACTER SET ascii NOT NULL,
  `pos` tinyint(3) unsigned NOT NULL,
  `val` char(16) DEFAULT NULL,
  `low` char(16) DEFAULT NULL,
  `high` char(16) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_profile`,`profile_permission`,`pos`),
  KEY `user_permission` (`user_profile`,`profile_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profiles` (
  `user_profile` char(8) CHARACTER SET ascii NOT NULL,
  `profile_name` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_profile`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_deploy_version`
--

DROP TABLE IF EXISTS `vehicle_deploy_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_deploy_version` (
  `UID_VERSION_DEPLOY` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_DEPLOY_VERSION` date NOT NULL,
  `SOFTWARE_VERSION` varchar(50) NOT NULL,
  `HOSTS_DEPLOY` varchar(50) NOT NULL,
  PRIMARY KEY (`UID_VERSION_DEPLOY`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `UID_VEHICULO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_VEHICULO` varchar(50) DEFAULT 'Scooter',
  `UID_OPERADOR` int(11) DEFAULT NULL,
  `CIUDAD` varchar(100) DEFAULT NULL,
  `ID_ESTATUS` int(11) NOT NULL,
  `FECHA_ESTATUS` datetime DEFAULT NULL,
  `UID_PHYSICAL` varchar(50) DEFAULT NULL,
  `ID_ESTATUS_CONEXION` int(11) NOT NULL,
  `FECHA_ESTATUS_CONEXION` datetime DEFAULT NULL,
  `UID_LAST_SESION_TELEOPS` int(11) DEFAULT NULL,
  `UID_LAST_VEHICULO_ESTATUS` int(11) DEFAULT NULL,
  `UID_LAST_RUTA` int(11) DEFAULT NULL,
  `UID_EXTERNAL` varchar(50) DEFAULT NULL,
  `VERSION_BRAIN` varchar(50) DEFAULT NULL,
  `VERSION_FIRMWARE` varchar(50) DEFAULT NULL,
  `DEBUG_MODE` int(11) NOT NULL DEFAULT '0',
  `ALARM_STATUS` int(11) DEFAULT '0',
  `IP_ADDRESS` int(11) unsigned DEFAULT NULL,
  `TELEOP_UI_SETUP` int(11) DEFAULT '23',
  `NUM_CELULAR` varchar(50) DEFAULT NULL,
  `UID_DEB_FILE` int(11) DEFAULT NULL,
  `UID_HEX_FILE` int(11) DEFAULT NULL,
  `UID_COMMAND_FILE` int(11) DEFAULT NULL,
  `UID_ESTACION` int(11) DEFAULT NULL,
  `SIM_ICCID` varchar(50) DEFAULT '0',
  `UID_SERVIDOR` int(11) DEFAULT '1',
  `REMOTEIT_DEVICENAME` varchar(32) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  PRIMARY KEY (`UID_VEHICULO`),
  UNIQUE KEY `VEHICLE_MAC_UNIQUE` (`UID_PHYSICAL`),
  UNIQUE KEY `UID_EXTERNAL_UNIQUE` (`UID_EXTERNAL`),
  KEY `fk_VEHICULO_OPERADOR1_idx` (`UID_OPERADOR`),
  KEY `ID_ESTATUS` (`ID_ESTATUS`),
  KEY `fk_ID_ESTATUS_idx` (`ID_ESTATUS_CONEXION`),
  KEY `fk_UID_LAST_SESION_TELEOPS_idx` (`UID_LAST_SESION_TELEOPS`),
  KEY `fk_UID_LAST_VEHICULO_ESTATUS_idx` (`UID_LAST_VEHICULO_ESTATUS`),
  KEY `fk_UID_RUTA_idx` (`UID_LAST_RUTA`),
  KEY `IP_ADDRESS` (`IP_ADDRESS`),
  KEY `fk_UID_DEB_FILE` (`UID_DEB_FILE`),
  KEY `fk_UID_HEX_FILE` (`UID_HEX_FILE`),
  KEY `fk_UID_COMMAND_FILE` (`UID_COMMAND_FILE`),
  KEY `fk_UID_SERVIDOR_idx` (`UID_SERVIDOR`),
  CONSTRAINT `fk_ID_ESTATUS` FOREIGN KEY (`ID_ESTATUS`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ID_ESTATUS_CONEXION` FOREIGN KEY (`ID_ESTATUS_CONEXION`) REFERENCES `estatus` (`ID_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_COMMAND_FILE` FOREIGN KEY (`UID_COMMAND_FILE`) REFERENCES `command_file` (`UID_COMMAND_FILE`),
  CONSTRAINT `fk_UID_DEB_FILE` FOREIGN KEY (`UID_DEB_FILE`) REFERENCES `deb_file` (`UID_DEB_FILE`),
  CONSTRAINT `fk_UID_HEX_FILE` FOREIGN KEY (`UID_HEX_FILE`) REFERENCES `hex_file` (`UID_HEX_FILE`),
  CONSTRAINT `fk_UID_LAST_SESION_TELEOPS` FOREIGN KEY (`UID_LAST_SESION_TELEOPS`) REFERENCES `sesion_teleops` (`UID_SESION_TELEOPS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_LAST_VEHICULO_ESTATUS` FOREIGN KEY (`UID_LAST_VEHICULO_ESTATUS`) REFERENCES `vehiculo_estatus` (`ID_VEHICULO_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_RUTA` FOREIGN KEY (`UID_LAST_RUTA`) REFERENCES `ruta` (`UID_RUTA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UID_SERVIDOR` FOREIGN KEY (`UID_SERVIDOR`) REFERENCES `servidor` (`UID_SERVIDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo_error`
--

DROP TABLE IF EXISTS `vehiculo_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo_error` (
  `ID_VEHICULO_ERROR` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` date NOT NULL,
  `ID_ERROR` int(11) NOT NULL,
  `ID_VEHICULO_ESTATUS` int(11) NOT NULL,
  PRIMARY KEY (`ID_VEHICULO_ERROR`),
  KEY `fk_VEHICULO_ERROR_ERROR1_idx` (`ID_ERROR`),
  KEY `fk_VEHICULO_ERROR_VEHICULO_ESTATUS1_idx` (`ID_VEHICULO_ESTATUS`),
  CONSTRAINT `fk_VEHICULO_ERROR_ERROR1` FOREIGN KEY (`ID_ERROR`) REFERENCES `error_estatus` (`ID_ERROR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VEHICULO_ERROR_VEHICULO_ESTATUS1` FOREIGN KEY (`ID_VEHICULO_ESTATUS`) REFERENCES `vehiculo_estatus` (`ID_VEHICULO_ESTATUS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo_estatus`
--

DROP TABLE IF EXISTS `vehiculo_estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo_estatus` (
  `ID_VEHICULO_ESTATUS` int(11) NOT NULL AUTO_INCREMENT,
  `UID_VEHICULO` int(11) NOT NULL,
  `UBICACION_GPS_LAT` double NOT NULL,
  `NIVEL_BATERIA` int(11) NOT NULL,
  `FECHA_REGISTRO` datetime NOT NULL,
  `UBICACION_GPS_LON` double NOT NULL,
  `INTENSIDAD_RED` int(11) DEFAULT NULL,
  `ERROR_BITRATE` int(11) DEFAULT NULL,
  `GPS_ALTITUD` double DEFAULT NULL,
  `BANDWIDTH` int(11) DEFAULT NULL,
  `MODULE_CONNECTED` int(11) DEFAULT NULL,
  `SIM` int(11) DEFAULT NULL,
  `GPS_FIXED` int(11) DEFAULT NULL,
  `CAMERA_FRONT` int(11) DEFAULT NULL,
  `CAMERA_BACK` int(11) DEFAULT NULL,
  `PERFORMANCE` int(11) DEFAULT NULL,
  `VIDEO_CLIENT_CONNECTION` int(11) DEFAULT NULL,
  `VIDEO_FRAME_SENT` int(11) DEFAULT NULL,
  `SENSOR_CLIENT_CONNECTION` int(11) DEFAULT NULL,
  `SENSOR_BUFFER_SENT` int(11) DEFAULT NULL,
  `CONTROL_CLIENT_CONNECTION` int(11) DEFAULT NULL,
  `CONTROL_BUFFER_RECEIVED` int(11) DEFAULT NULL,
  `CHARGING_STATUS` int(11) DEFAULT '0',
  `GPS_SIGNAL` int(11) DEFAULT '0',
  PRIMARY KEY (`ID_VEHICULO_ESTATUS`),
  KEY `fk_VEHICULO_ESTATUS_VEHICULO1_idx` (`UID_VEHICULO`),
  CONSTRAINT `fk_VEHICULO_ESTATUS_VEHICULO1` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3531968 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo_hardware_log`
--

DROP TABLE IF EXISTS `vehiculo_hardware_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo_hardware_log` (
  `UID_VEHICULO_HARDWARE_LOG` int(11) NOT NULL AUTO_INCREMENT,
  `UID_VEHICULO` int(11) NOT NULL,
  `HARDWARE_LOG_URL` text NOT NULL,
  `FECHA_LOG` datetime NOT NULL,
  PRIMARY KEY (`UID_VEHICULO_HARDWARE_LOG`),
  KEY `UID_VEHICULO` (`UID_VEHICULO`),
  CONSTRAINT `vehiculo_hardware_log_ibfk_1` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`)
) ENGINE=InnoDB AUTO_INCREMENT=31131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehiculo_log`
--

DROP TABLE IF EXISTS `vehiculo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo_log` (
  `UID_LOG` int(11) NOT NULL AUTO_INCREMENT,
  `UID_VEHICULO` int(11) NOT NULL,
  `FILE_URL` varchar(100) NOT NULL,
  `FECHA_LOG` datetime NOT NULL,
  PRIMARY KEY (`UID_LOG`),
  KEY `fk_UID_VEHICULO_idx` (`UID_VEHICULO`),
  KEY `fk_UID_VEHICULO` (`UID_VEHICULO`),
  CONSTRAINT `fk_UID_VEHICULO_VEHICULO` FOREIGN KEY (`UID_VEHICULO`) REFERENCES `vehiculo` (`UID_VEHICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_sesion`
--

DROP TABLE IF EXISTS `video_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_sesion` (
  `UID_VIDEO_SESION` int(11) NOT NULL AUTO_INCREMENT,
  `UID_SESION_TELEOPS` int(11) NOT NULL,
  `TIPO_VIDEO` int(11) NOT NULL,
  `VIDEO_URL` text NOT NULL,
  PRIMARY KEY (`UID_VIDEO_SESION`),
  KEY `UID_SESION_TELEOPS` (`UID_SESION_TELEOPS`),
  CONSTRAINT `video_sesion_ibfk_1` FOREIGN KEY (`UID_SESION_TELEOPS`) REFERENCES `sesion_teleops` (`UID_SESION_TELEOPS`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vpn_information`
--

DROP TABLE IF EXISTS `vpn_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vpn_information` (
  `UID_VPN` varchar(24) NOT NULL,
  `NAME_VPN` varchar(100) NOT NULL,
  `IP_VPN` varchar(15) DEFAULT NULL,
  `CONNECTED_VPN` tinyint(1) DEFAULT NULL,
  `TEMPORAL_VPN` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`UID_VPN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'teleops'
--
/*!50003 DROP PROCEDURE IF EXISTS `ABRIR_CONTENEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ABRIR_CONTENEDOR`(_storageMAC VARCHAR(17))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	UPDATE storage 
	SET ID_ESTATUS = 33
	WHERE MAC_STORAGE =_storageMAC;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_CONFIG_VIDEO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ACTUALIZAR_CONFIG_VIDEO`(_idTeleoperador INT,_idVehiculo INT,_configVideo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS ( SELECT *
		FROM sesion_teleops
		WHERE sesion_teleops.UID_SESION_TELEOPS = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.ID_ESTATUS = 6)) THEN
        
		UPDATE sesion_teleops
        SET sesion_teleops.CONFIG_VIDEO=_configVideo
        WHERE sesion_teleops.UID_SESION_TELEOPS = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.ID_ESTATUS = 6;
	ELSE
		SELECT -1,'No hay sesion valida entre teleoperador y vehiculo';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_INICIO_RUTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ACTUALIZAR_INICIO_RUTA`(_idRuta INT, _latInicio DOUBLE, _lonInicio DOUBLE)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    START TRANSACTION;
    UPDATE ruta
    SET GPS_LAT_INICIO=_latInicio,
    GPS_LON_INICIO=_lonInicio
    WHERE ruta.UID_RUTA=_idRuta;
    
    SELECT 1 AS ID_ESTATUS, 'Inicio de ruta actualizado' AS DESCRIPCION_ESTATUS;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ACTUALIZAR_VEHICULO`(_idVehiculo INT,_nombreOperador VARCHAR(90), _fabricante VARCHAR(90), _modelo VARCHAR(90), _idExternal VARCHAR(50),_ciudad VARCHAR(50))
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;
    
    UPDATE operador, vehiculo
    SET
    vehiculo.UID_EXTERNAL = _idExternal,
    operador.NOMBRE_OPERADOR = _nombreOperador,
    operador.FABRICANTE = _fabricante,
    operador.MODELO = _modelo,
    vehiculo.CIUDAD = _ciudad
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_VEHICULO=_idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ACTUALIZA_VEHICULO_MODE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ACTUALIZA_VEHICULO_MODE`(_idVehiculo INT,_debug_mode VARCHAR(100))
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF EXISTS (SELECT * FROM vehiculo WHERE UID_VEHICULO = _idVehiculo) THEN
		UPDATE vehiculo
        SET DEBUG_MODE = _debug_mode
        WHERE vehiculo.UID_VEHICULO = _idVehiculo;
		
		SELECT 1 AS ID_ESTATUS, 'Debug mode actualizado correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT 2 AS ID_ESTATUS,'Id vehiculo no encontrado' AS DESCRIPCION_ESTATUS;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_ERROR_STATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ADD_ERROR_STATUS`(_UID VARCHAR(100), _MSG TEXT)
BEGIN

	DECLARE _uid_physical INT;

	DECLARE _id_vehiculo INT;

	DECLARE _id_error INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION

	

	BEGIN

		SHOW ERRORS;

		ROLLBACK;

		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;

	END;



	IF EXISTS (select id_error from error_estatus where ERROR_DESCRIPCION like _MSG ) THEN

		select id_error into _id_error from error_estatus where ERROR_DESCRIPCION = _MSG limit 1;

	ELSE

		INSERT INTO error_estatus (ERROR_DESCRIPCION) VALUES(_MSG);

		select id_error into _id_error from error_estatus where ERROR_DESCRIPCION = _MSG limit 1;

    END IF;
   

	SELECT UID_VEHICULO INTO _uid_physical FROM vehiculo where UID_PHYSICAL = _UID LIMIT 1;

	select id_vehiculo_estatus into _id_vehiculo from vehiculo_estatus ve where UID_VEHICULO = _uid_physical LIMIT 1;

    

	IF NOT EXISTS (SELECT * FROM vehiculo_error WHERE ID_ERROR = _id_error AND ID_VEHICULO_ESTATUS = _id_vehiculo ) THEN 

		INSERT INTO vehiculo_error (FECHA, ID_ERROR, ID_VEHICULO_ESTATUS)

		VALUES(NOW(), _id_error, _id_vehiculo);

    END IF;

   

	

	SELECT * FROM vehiculo_error WHERE ID_ERROR = _id_error AND ID_VEHICULO_ESTATUS = _id_vehiculo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_CONTAINER_INFO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_CONTAINER_INFO`(_uidStorage INT, _uidVehiculo INT, _uidPayload INT)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

    UPDATE storage
    SET	ID_ESTATUS=31,
    	UID_VEHICULO = _uidVehiculo,
    	UID_PAYLOAD = _uidPayload
   	WHERE UID_STORAGE=_uidStorage;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_DEPLOY_DATA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_DEPLOY_DATA`(_versionDeploy VARCHAR(50), _binarioDeploy VARCHAR(200),_brainDeploy VARCHAR(200),_ip VARCHAR(15), _tipoVehiculo VARCHAR(50))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    INSERT INTO deploy_data (FECHA_DEPLOY, VERSION_DEPLOY, BINARIO_DEPLOY, BRAIN_DEPLOY, IP_VEHICULO, TIPO_VEHICULO)
	VALUES(CURDATE(), _versionDeploy, _binarioDeploy, _brainDeploy, _ip, _tipoVehiculo);
	SELECT 1 AS ID_ESTATUS,'Deploy agregado correctamente' AS DESCRIPCION_ESTATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_DEPLOY_VERSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_DEPLOY_VERSION`(_binarioCommit VARCHAR(200), _hosts VARCHAR(50))
BEGIN
    DECLARE _softwareVersion VARCHAR(50);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF EXISTS(SELECT VERSION_DEPLOY FROM deploy_data WHERE BINARIO_DEPLOY = _binarioCommit) THEN
		SELECT VERSION_DEPLOY INTO _softwareVersion
        FROM deploy_data
        WHERE deploy_data.BINARIO_DEPLOY = _binarioCommit;
        
		INSERT INTO vehicle_deploy_version (FECHA_DEPLOY_VERSION, SOFTWARE_VERSION, HOSTS_DEPLOY)
		VALUES(CURDATE(), _softwareVersion, _hosts);
		SELECT 1 AS ID_ESTATUS,'Deploy agregado correctamente' AS DESCRIPCION_ESTATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_HARDWARE_LOG_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_HARDWARE_LOG_URL`(_idPhysical VARCHAR(50), _hardware_log_url text)
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	IF (EXISTS (SELECT UID_VEHICULO FROM vehiculo WHERE UID_PHYSICAL = _idPhysical)) THEN
		
		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
		
		INSERT INTO teleops.vehiculo_hardware_log (UID_VEHICULO, HARDWARE_LOG_URL, FECHA_LOG)
		VALUES(_idVehiculo, _hardware_log_url, NOW());
	    
		SELECT 1 AS ID_ESTATUS, 'Log registrado correctamente' AS DESCRIPCION_ESTATUS;	   
	ELSE
	   
		SELECT -1 AS ID_ESTATUS,'Id vehiculo no encontrado' AS DESCRIPCION_ESTATUS;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_OPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_OPERADOR`(_email VARCHAR(50),_nombreOperador VARCHAR(50),_passwordHash VARCHAR(100),_apiKey VARCHAR(50))
BEGIN
	DECLARE _user_id char(8);
    DECLARE _idOperador INT(11);
    
	INSERT INTO operador
	(NOMBRE_OPERADOR, FABRICANTE, MODELO, URL_TRACKING, URL_WEBHOOK, PRIVATE_KEY)
	VALUES( _nombreOperador, 'No definido', 'No definido', NULL, NULL, NULL);
    
	SELECT LAST_INSERT_ID() INTO _idOperador;
	SET _user_id = concat('u' , LEFT(UUID(), 7));
    
	INSERT INTO `user`(`user_id`,`user_email`,`user_hash`,`user_profile`,`user_name`,UID_OPERADOR)
          VALUES(_user_id, _email, _passwordHash,'p32602b2',_nombreOperador,_idOperador); 
		/*VALUES(_user_id, _email, _user_hash,'p32602b2',_nombreOperador,_idOperador); */
    INSERT INTO teleops.teleoperador
	(NOMBRE_TELEOPERADOR, EMAIL, PASSWORD)
	VALUES(_nombreOperador, _email, _passwordHash);
    
    INSERT INTO teleops.api_keys
	(api_key, apiclient_id, apiclient_type)
	VALUES(_apiKey, _idOperador, 'OPERATOR');
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_RUTA_SOLICITUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_RUTA_SOLICITUD`(_latFinal DOUBLE, _lonFinal DOUBLE, _idPhysical VARCHAR(50), _rideRequest INT)
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
    DECLARE _idRuta INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
		
	IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
		SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
        FROM vehiculo_estatus,vehiculo
        WHERE vehiculo.UID_PHYSICAL=_idPhysical AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO
        ORDER BY FECHA_REGISTRO DESC
        LIMIT 1;
        
		IF NOT EXISTS (SELECT ruta.UID_RUTA
		FROM ruta
		WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
		
			INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN)
			VALUES(_latInicio,_lonInicio,_latFinal,_lonFinal,NOW(),_idPhysical,_rideRequest,14,NULL);
			
			UPDATE vehiculo
			SET UID_LAST_RUTA = LAST_INSERT_ID()
			WHERE UID_PHYSICAL = _idPhysical;
		ELSE
		
			UPDATE ruta
			SET ID_ESTATUS_SOLICITUD=14,
			GPS_LAT_FINAL = _latFinal,
			GPS_LON_FINAL = _lonFinal,
			FECHA_INICIO = NOW(),
			FECHA_FIN = NULL,
			GPS_LAT_INICIO = _latInicio,
			GPS_LON_INICIO = _lonInicio,
			UID_PHYSICAL = _idPhysical
			WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
			
			SELECT UID_RUTA INTO _idRuta FROM ruta WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
			
			UPDATE vehiculo
			SET UID_LAST_RUTA = _idRuta
			WHERE UID_PHYSICAL = _idPhysical;
            END IF;
            SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT 2 AS ID_ESTATUS, 'Vehicle id not found' AS DESCRIPCION_ESTATUS;
	END IF;
    
    
	
   /* IF EXISTS (SELECT vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS) THEN
			SELECT vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON INTO _latInicio,_lonInicio
			FROM vehiculo,vehiculo_estatus
			WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;

			INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_VEHICULO)
			VALUES(_latInicio,_lonInicio,_latFinal,_lonFinal,NOW(),_idVehiculo);
			
			UPDATE vehiculo 
			SET ID_ESTATUS_REGISTRO=16,
			UID_LAST_RUTA = LAST_INSERT_ID()
			WHERE vehiculo.UID_VEHICULO=_idVehiculo;
            
            SELECT 1 AS ID_ESTATUS,'Ruta agregada correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS,'Ubicacion de inicio no conocida' AS DESCRIPCION_ESTATUS;
	END IF;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD`(_latFinal DOUBLE, _lonFinal DOUBLE, _rideRequest INT,_operatorName VARCHAR(90))
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
    DECLARE _idRuta,_idOperador INT;
   

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

    IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
		SELECT 2, 'Operador no registrado';
	ELSE
		SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
        
		IF NOT EXISTS (SELECT ruta.UID_RUTA
		FROM ruta
		WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
			INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN,UID_OPERADOR)
			VALUES(NULL,NULL,_latFinal,_lonFinal,NOW(),NULL,_rideRequest,14,NULL,_idOperador);
			
		ELSE
			UPDATE ruta
			SET ID_ESTATUS_SOLICITUD=14,
			GPS_LAT_FINAL = _latFinal,
			GPS_LON_FINAL = _lonFinal,
			FECHA_INICIO = NOW(),
			FECHA_FIN = NULL,
			GPS_LAT_INICIO = NULL,
			GPS_LON_INICIO = NULL,
			UID_PHYSICAL = NULL,
            UID_OPERADOR = _idOperador
			WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
		END IF;
	END IF;
    
    SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS, 
    ruta.UID_RUTA as UID, ruta.FECHA_INICIO as FECHA_INICIO from `ruta` WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_DROPOFF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_DROPOFF`(_latFinal DOUBLE, _lonFinal DOUBLE, _operatorName VARCHAR(90), _stop BIGINT, _assigment BIGINT, _shipment BIGINT, _client INT, _name varchar(100), _email varchar(100), _cellphone varchar(20), _notes varchar(100), _label VARCHAR(100))
BEGIN
  	DECLARE _idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
	    SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
	    SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
	   	INSERT INTO payload(ID_ESTATUS, REQUESTED_LATITUDE, REQUESTED_LONGITUDE, REQUESTED_DATETIME, UID_OPERADOR, `TYPE`, UID_STOP, UID_ASSIGMENT, UID_SHIPMENT, UID_CLIENT, CLIENT_NAME, CLIENT_EMAIL, CELLPHONE, NOTES, LABEL) VALUES(25, _latFinal, _lonFinal, CURRENT_TIMESTAMP, _idOperador, 'DROP OFF', _stop, _assigment, _shipment, _client, _name, _email, _cellphone, _notes, _label);
	   	SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS DeliveryID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_PICKUP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_PICKUP`(_latFinal DOUBLE, _lonFinal DOUBLE, _operatorName VARCHAR(90), _stop BIGINT, _assigment BIGINT, _shipment BIGINT, _client INT, _label VARCHAR(100))
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
  	DECLARE _idRuta,_idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
	    SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
	    SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
	   	INSERT INTO payload(ID_ESTATUS, REQUESTED_LATITUDE, REQUESTED_LONGITUDE, REQUESTED_DATETIME, UID_OPERADOR, `TYPE`, UID_STOP, UID_ASSIGMENT, UID_SHIPMENT, UID_CLIENT, LABEL) VALUES(25, _latFinal, _lonFinal, CURRENT_TIMESTAMP, _idOperador, 'PICK UP', _stop, _assigment, _shipment, _client, _label);
	   	SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS DeliveryID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_ROUTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_ROUTE`(_payload INT, _rideRequest INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
  	DECLARE _idRuta,_idOperador INT;
  
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
	    SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
		IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _payload) THEN
	    	SELECT -1 as ID_ESTATUS, 'PAYLOAD no encontrado';
	  	ELSE
			SELECT REQUESTED_LATITUDE, REQUESTED_LONGITUDE, UID_OPERADOR INTO _latInicio,_lonInicio,_idOperador FROM payload WHERE UID_PAYLOAD = _payload;
		
			IF NOT EXISTS (SELECT ruta.UID_RUTA FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
			    INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN,UID_OPERADOR) VALUES(NULL,NULL,_latInicio, _lonInicio,NOW(),NULL,_rideRequest,14,NULL,_idOperador);
			    SELECT LAST_INSERT_ID() INTO _idRuta;
			   	UPDATE payload
			   		SET UID_RUTA = _idRuta
			   	WHERE UID_PAYLOAD = _payload;
			ELSE
		        SELECT ruta.UID_RUTA INTO _idRuta FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest;		
				UPDATE ruta
				    SET ID_ESTATUS_SOLICITUD=14,
						GPS_LAT_FINAL = _latInicio,
					    GPS_LON_FINAL = _lonInicio,
					    FECHA_INICIO = NOW(),
					    FECHA_FIN = NULL,
					   	GPS_LAT_INICIO = NULL,
					    GPS_LON_INICIO = NULL,
					    UID_PHYSICAL = NULL ,
			            UID_OPERADOR = _idOperador
				WHERE UID_RUTA=_idRuta;
				SELECT LAST_INSERT_ID() INTO _idRuta;
				UPDATE payload
			   		SET UID_RUTA = _idRuta
			   	WHERE UID_PAYLOAD = _payload;
			END IF;
	  	END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_TELEOPS`(_latFinal DOUBLE, _lonFinal DOUBLE, _rideRequest INT)
BEGIN
	DECLARE _latInicio,_lonInicio,_distance DOUBLE;
    DECLARE _idRuta INT;
    DECLARE _idPhysical VARCHAR(50) DEFAULT '861641041150300';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    
	SELECT vehiculo.UID_PHYSICAL,
		111.111 *
					DEGREES(ACOS(LEAST(1.0, COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LAT))
						 * COS(RADIANS(_latFinal))
						 * COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LON - _lonFinal))
						 + SIN(RADIANS(_latFinal))
						 * SIN(RADIANS(_latFinal))))) AS DISTANCE_KM
		INTO _idPhysical,_distance
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.ID_ESTATUS=3 AND vehiculo.UID_VEHICULO = vehiculo_estatus.UID_VEHICULO  AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0
		ORDER BY vehiculo_estatus.FECHA_REGISTRO DESC, DISTANCE_KM LIMIT 1;
		
	IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
		SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
        FROM vehiculo_estatus,vehiculo
        WHERE vehiculo.UID_PHYSICAL=_idPhysical AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO
        ORDER BY FECHA_REGISTRO DESC
        LIMIT 1;
        
		IF NOT EXISTS (SELECT ruta.UID_RUTA
		FROM ruta
		WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
		
			INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN)
			VALUES(_latInicio,_lonInicio,_latFinal,_lonFinal,NOW(),_idPhysical,_rideRequest,14,NULL);
			
			UPDATE vehiculo
			SET UID_LAST_RUTA = LAST_INSERT_ID()
			WHERE UID_PHYSICAL = _idPhysical;
		ELSE
		
			UPDATE ruta
			SET ID_ESTATUS_SOLICITUD=14,
			GPS_LAT_FINAL = _latFinal,
			GPS_LON_FINAL = _lonFinal,
			FECHA_INICIO = NOW(),
			FECHA_FIN = NULL,
			GPS_LAT_INICIO = _latInicio,
			GPS_LON_INICIO = _lonInicio,
			UID_PHYSICAL = _idPhysical
			WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
			
			SELECT UID_RUTA INTO _idRuta FROM ruta WHERE ID_RIDE_REQUEST_EXT=_rideRequest;
			
			UPDATE vehiculo
			SET UID_LAST_RUTA = _idRuta
			WHERE UID_PHYSICAL = _idPhysical;
            END IF;
            SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT 2 AS ID_ESTATUS, 'Unable to find a vehicle' AS DESCRIPCION_ESTATUS;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_WAGON` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_WAGON`(_latFinal DOUBLE, _lonFinal DOUBLE, _rideRequest INT,_operatorName VARCHAR(90), _uidVehiculo INT, _cellphone VARCHAR(13))
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
  	DECLARE _idRuta,_idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
	    SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
	    SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
		IF NOT EXISTS (SELECT ruta.UID_RUTA FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
		    INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN,UID_OPERADOR) VALUES(NULL,NULL,_latFinal,_lonFinal,NOW(),NULL,_rideRequest,14,NULL,_idOperador);
		    SELECT LAST_INSERT_ID() INTO _idRuta;
	        INSERT INTO payload(CELLPHONE, ETA, ID_ESTATUS, UID_RUTA, REQUESTED_LATITUDE, REQUESTED_LONGITUDE, REQUESTED_DATETIME, START_LATITUDE, START_LONGITUDE, START_DATETIME, END_LATITUDE, END_LONGITUDE, END_DATETIME, UID_VEHICULO) VALUES(_cellphone, NULL, 25, _idRuta, _latFinal, _lonFinal, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL, NULL, NULL);			
		    SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS DeliveryID;		
		ELSE
	        SELECT ruta.UID_RUTA INTO _idRuta FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest;		
			UPDATE ruta
			    SET ID_ESTATUS_SOLICITUD=14,
					GPS_LAT_FINAL = _latFinal,
				    GPS_LON_FINAL = _lonFinal,
				    FECHA_INICIO = NOW(),
				    FECHA_FIN = NULL,
				   	GPS_LAT_INICIO = NULL,
				    GPS_LON_INICIO = NULL,
				    UID_PHYSICAL = NULL ,
		            UID_OPERADOR = _idOperador
			WHERE UID_RUTA=_idRuta;
			SELECT LAST_INSERT_ID() INTO _idRuta;
			INSERT INTO payload(CELLPHONE, ETA, ID_ESTATUS, UID_RUTA, REQUESTED_LATITUDE, REQUESTED_LONGITUDE, REQUESTED_DATETIME, START_LATITUDE, START_LONGITUDE, START_DATETIME, END_LATITUDE, END_LONGITUDE, END_DATETIME, UID_VEHICULO) VALUES(_cellphone, NULL, 25, _idRuta, _latFinal, _lonFinal, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL, NULL, NULL);			
			SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS DeliveryID;		
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_SOLICITUD_W_UID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_SOLICITUD_W_UID`(_latFinal DOUBLE, _lonFinal DOUBLE, _rideRequest INT,_operatorName VARCHAR(90), _uidVehiculo INT)
BEGIN
	DECLARE _latInicio,_lonInicio DOUBLE;
  	DECLARE _idRuta,_idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
		SELECT 2, 'Operador no registrado';
	ELSE
		SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
        
		IF NOT EXISTS (SELECT ruta.UID_RUTA FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest) THEN
			
			INSERT INTO ruta(GPS_LAT_INICIO,GPS_LON_INICIO,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,UID_PHYSICAL,ID_RIDE_REQUEST_EXT,ID_ESTATUS_SOLICITUD,FECHA_FIN,UID_OPERADOR) VALUES(NULL,NULL,_latFinal,_lonFinal,NOW(),NULL,_rideRequest,14,NULL,_idOperador);
			UPDATE vehiculo SET UID_LAST_RUTA = LAST_INSERT_ID() WHERE UID_VEHICULO = _uidVehiculo;

		ELSE
			SELECT ruta.UID_RUTA INTO _idRuta FROM ruta WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest;

			UPDATE ruta
			SET ID_ESTATUS_SOLICITUD=14,
			    GPS_LAT_FINAL = _latFinal,
			    GPS_LON_FINAL = _lonFinal,
			    FECHA_INICIO = NOW(),
			    FECHA_FIN = NULL,
		      	GPS_LAT_INICIO = NULL,
			    GPS_LON_INICIO = NULL,
			    UID_PHYSICAL = NULL ,
          		UID_OPERADOR = _idOperador
			WHERE UID_RUTA=_idRuta;
			
			UPDATE vehiculo SET UID_LAST_RUTA = LAST_INSERT_ID() WHERE UID_VEHICULO = _uidVehiculo;
			
		END IF;
	END IF;

  SELECT 1 AS ID_ESTATUS,'Solicitud agregada correctamente' AS DESCRIPCION_ESTATUS;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_VIDEO_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_VIDEO_URL`(_sesion_teleops int(11), _video_tipo int(11), _video_url text)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
   	INSERT INTO teleops.video_sesion(UID_SESION_TELEOPS, TIPO_VIDEO, VIDEO_URL)
	VALUES(_sesion_teleops, _video_tipo, _video_url);
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGAR_WEBHOOK_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGAR_WEBHOOK_URL`(_operator_name varchar(90), _url varchar(100))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	UPDATE teleops.operador SET URL_WEBHOOK=_url WHERE NOMBRE_OPERADOR=_operator_name;
	SELECT 1 AS ID_ESTATUS,'URL agregada correctamente' AS DESCRIPCION_ESTATUS FROM operador WHERE NOMBRE_OPERADOR =_operator_name AND URL_WEBHOOK = _url;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AGREGA_VEHICULO_LOG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AGREGA_VEHICULO_LOG`(_idPhysical VARCHAR(50),_rutaArchivo VARCHAR(100))
BEGIN

	DECLARE _idVehiculo INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    
    IF EXISTS (SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
    
		SELECT vehiculo.UID_VEHICULO INTO _idVehiculo 
		FROM vehiculo
		WHERE vehiculo.UID_PHYSICAL = _idPhysical;
        
		INSERT INTO vehiculo_log(UID_VEHICULO, FILE_URL, FECHA_LOG)
		VALUES(_idVehiculo, _rutaArchivo, NOW());
		
		SELECT 1 AS ID_ESTATUS, 'Log registrado correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT 2 AS ID_ESTATUS,'Id vehiculo no encontrado' AS DESCRIPCION_ESTATUS;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_AUTHENTICATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `API_AUTHENTICATE`(_api_key char(32))
BEGIN
	
    DECLARE l_apiclient_id char(16);
	DECLARE l_apiclient_type char(32);

	SELECT `apiclient_id`, `apiclient_type` INTO l_apiclient_id, l_apiclient_type
    FROM `api_keys` 
    WHERE `api_key` = _api_key;
	
    /* Si es operador, obtener el nombre */
	IF ( l_apiclient_type = 'OPERATOR' ) THEN
		SELECT l_apiclient_id AS id, l_apiclient_type as client_type,
		NOMBRE_OPERADOR as operator_name
		FROM `operador` 
		WHERE `UID_OPERADOR` = l_apiclient_id;	
	ELSE
		SELECT l_apiclient_id AS id, l_apiclient_type as client_type;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_AUTHENTICATE_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `API_AUTHENTICATE_EXTERNAL`(_api_key char(32))
BEGIN
	SELECT NOMBRE_OPERADOR AS operatorName
	FROM teleops.operador
	WHERE UID_OPERADOR IN
	(SELECT `apiclient_id` AS UID_OPERADOR
    FROM `api_keys` 
    WHERE `api_key` = _api_key);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `API_GET_KEY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `API_GET_KEY`(_idOperador INT)
BEGIN
	SELECT api_key AS operatorKey
	FROM api_keys
	WHERE apiclient_id = _idOperador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BORRAR_WEBHOOK_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `BORRAR_WEBHOOK_URL`(_operator_name varchar(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	UPDATE operador SET URL_WEBHOOK=NULL WHERE NOMBRE_OPERADOR=_operator_name;
   	SELECT 1 AS ID_ESTATUS,'URL borrada correctamente' AS DESCRIPCION_ESTATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CANCELAR_PAYLOAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CANCELAR_PAYLOAD`(_deliveryID INT)
BEGIN
	DECLARE _countDelivery,_idRuta INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _deliveryID) THEN
		SELECT -1 as ID_ESTATUS, 'Delivery run not found!';
	ELSE
		IF EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _deliveryID AND (ID_ESTATUS = 28 OR ID_ESTATUS = 27)) THEN
			SELECT -2 as ID_ESTATUS, 'Delivery run has already ended!';
		ELSE
			SELECT UID_RUTA INTO _idRuta FROM payload WHERE UID_PAYLOAD = _deliveryID;
			SELECT COUNT(UID_PAYLOAD) INTO _countDelivery FROM payload WHERE UID_RUTA = _idRuta AND (ID_ESTATUS = 25 OR ID_ESTATUS = 26);
			IF(_countDelivery > 1) THEN
				UPDATE payload SET ID_ESTATUS = 28 WHERE UID_PAYLOAD = _deliveryID;
				UPDATE storage SET ID_ESTATUS = 30, UID_VEHICULO = NULL, UID_PAYLOAD = NULL WHERE UID_PAYLOAD = _deliveryID;
            	SELECT 1 AS ID_ESTATUS, 'Delivery run canceled correctly!' AS DESCRIPCION_ESTATUS, ONFLEET_UID as taskID FROM payload WHERE UID_PAYLOAD = _deliveryID;
			ELSE
				UPDATE payload SET ID_ESTATUS = 28 WHERE UID_PAYLOAD = _deliveryID;
				UPDATE ruta SET ID_ESTATUS_SOLICITUD = 17, FECHA_FIN = NOW(), UID_ESTATUS_FINALIZACION = 21 WHERE UID_RUTA = _idRuta;
				UPDATE storage SET ID_ESTATUS = 30, UID_VEHICULO = NULL, UID_PAYLOAD = NULL WHERE UID_PAYLOAD = _deliveryID;
            	SELECT 1 AS ID_ESTATUS, 'Delivery run canceled correctly!' AS DESCRIPCION_ESTATUS, ONFLEET_UID as taskID FROM payload WHERE UID_PAYLOAD = _deliveryID;
			END IF;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CANCELAR_SESION_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CANCELAR_SESION_TELEOPS`(_idVehiculo INT)
BEGIN

 DECLARE _idSesionTeleops INT(11);
 DECLARE _id_puerto_sesion INT(11);
 DECLARE _idServidor INT(11);
 DECLARE _idRuta INT(11);
 DECLARE _last_GPS_LAT DOUBLE DEFAULT NULL ;
 DECLARE _last_GPS_LON DOUBLE DEFAULT NULL;
 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	START TRANSACTION;
  /*  SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_PUERTO_SESION INTO _idSesionTeleops,_id_puerto_sesion
    FROM vehiculo,sesion_teleops
    WHERE vehiculo.UID_VEHICULO = _idVehiculo
    AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS; 
*/

   SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_PUERTO_SESION, 
   vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON
    INTO _idSesionTeleops,_id_puerto_sesion ,_last_GPS_LAT , _last_GPS_LON
    FROM vehiculo,sesion_teleops,vehiculo_estatus
    WHERE vehiculo.UID_VEHICULO = _idVehiculo
    AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
    AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS; 

	SELECT UID_LAST_RUTA INTO _idRuta
    FROM vehiculo
    WHERE vehiculo.UID_VEHICULO = _idVehiculo;
    
    /*Actualizar estatus de vehiculo viaje sin mover y disponible para teleoperar (requiere nueva ruta)*/
    UPDATE vehiculo
    SET vehiculo.ID_ESTATUS = 3,
    vehiculo.FECHA_ESTATUS= NOW()
    WHERE vehiculo.UID_VEHICULO=_idVehiculo;

    UPDATE sesion_teleops
    SET ID_ESTATUS = 7
    WHERE sesion_teleops.UID_SESION_TELEOPS = _idSesionTeleops;

    UPDATE puerto_sesion
    SET ID_ESTATUS = 9
    WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion ;
    
    SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
    
	UPDATE servidor
	SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
	WHERE servidor.UID_SERVIDOR = _idServidor;
    
    UPDATE ruta
    SET ID_ESTATUS_SOLICITUD = 17,
    FECHA_FIN = NOW(),
    UID_ESTATUS_FINALIZACION = 22,
    GPS_LAT_CIERRE = _last_GPS_LAT,
    GPS_LON_CIERRE = _last_GPS_LON
    WHERE UID_RUTA = _idRuta;

    
    SELECT UID_LAST_SESION_TELEOPS, 1 AS ID_ESTATUS, 'Sesion de teleops finalizada' AS DESCRIPCION_ESTATUS,
	vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'delivered' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
	vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
	FROM vehiculo,vehiculo_estatus,ruta
	WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
                
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CANCELAR_SOLICITUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CANCELAR_SOLICITUD`(_rideRequest INT)
BEGIN

	DECLARE _idRuta INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
     
    

	IF  EXISTS (SELECT ruta.UID_RUTA
		FROM ruta
		WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest AND ID_ESTATUS_SOLICITUD=14) THEN
			SELECT ruta.UID_RUTA INTO _idRuta FROM ruta WHERE ID_RIDE_REQUEST_EXT = _rideRequest LIMIT 1;
            UPDATE ruta
			SET ID_ESTATUS_SOLICITUD = 17,
			FECHA_FIN = NOW(),
            UID_ESTATUS_FINALIZACION = 21
			WHERE UID_RUTA = _idRuta;
            SELECT 1 AS ID_ESTATUS, 'Solicitud cancelada' AS DESCRIPCION_ESTATUS;
			
		ELSE
			IF  EXISTS (SELECT ruta.UID_RUTA
			FROM ruta
			WHERE ruta.ID_RIDE_REQUEST_EXT=_rideRequest AND ID_ESTATUS_SOLICITUD=15) THEN            
				SELECT 2 AS ID_ESTATUS, 'Solicitud en progreso, notificar a teleoperador' AS DESCRIPCION_ESTATUS;
			ELSE
				SELECT 1 AS ID_ESTATUS, 'Solicitud no encontrada o ya finalizada' AS DESCRIPCION_ESTATUS;
            END IF;
		END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONEXION_TELEOPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONEXION_TELEOPERADOR`(_idTeleoperador INT,_idVehiculo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS ( SELECT *
		FROM puerto_sesion,servidor,sesion_teleops
		WHERE sesion_teleops.UID_TELEOPERADOR = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR
        AND sesion_teleops.ID_ESTATUS = 6)) THEN
        
		SELECT servidor.IP_SERVIDOR,
        (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE sesion_teleops.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_SESION_TELEOPS,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE servidor.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_SERVIDOR,
        sesion_teleops.UID_SESION_TELEOPS,
        sesion_teleops.FECHA_INICIO_SESION,
        puerto_sesion.UID_PUERTO_SESION,
		puerto_sesion.PUERTO_IMAGENES_UI,
		puerto_sesion.PUERTO_JOYSTICK_UI,
		puerto_sesion.PUERTO_CONTROL,
		puerto_sesion.PUERTO_SENSOR,
		puerto_sesion.PUERTO_VIDEO,
        vehiculo.UID_PHYSICAL,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE puerto_sesion.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_PUERTO_SESION
		FROM puerto_sesion,servidor,sesion_teleops, vehiculo
		WHERE sesion_teleops.UID_TELEOPERADOR = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR
        AND sesion_teleops.ID_ESTATUS = 6
        AND sesion_teleops.UID_VEHICULO = vehiculo.UID_VEHICULO
        GROUP BY sesion_teleops.UID_SESION_TELEOPS;
        

	ELSE
		SELECT -1 AS ID_ESTATUS,'No hay sesion valida entre teleoperador y vehiculo' AS DESCRIPCION_ESTATUS;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONEXION_TELEOPERADOR_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONEXION_TELEOPERADOR_v1`(_idTeleoperador INT,_idVehiculo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS ( SELECT *
		FROM puerto_sesion,servidor,sesion_teleops
		WHERE sesion_teleops.UID_TELEOPERADOR = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR
        AND sesion_teleops.ID_ESTATUS = 6)) THEN
        
		SELECT servidor.IP_SERVIDOR,
        (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE sesion_teleops.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_SESION_TELEOPS,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE servidor.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_SERVIDOR,
        sesion_teleops.UID_SESION_TELEOPS,
        sesion_teleops.FECHA_INICIO_SESION,
        puerto_sesion.UID_PUERTO_SESION,
		puerto_sesion.PUERTO_IMAGENES_UI,
		puerto_sesion.PUERTO_JOYSTICK_UI,
		puerto_sesion.PUERTO_CONTROL,
		puerto_sesion.PUERTO_SENSOR,
		puerto_sesion.PUERTO_VIDEO,
		puerto_sesion.PUERTO_LATENCY,
		puerto_sesion.PUERTO_LATENCY_UI,
        puerto_sesion.PUERTO_SENSOR_UI,
        SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
        vehiculo.UID_PHYSICAL AS IMEI,
        vehiculo.TIPO_VEHICULO,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE puerto_sesion.ID_ESTATUS = estatus.ID_ESTATUS) AS ESTATUS_PUERTO_SESION
		FROM puerto_sesion,servidor,sesion_teleops, vehiculo
		WHERE sesion_teleops.UID_TELEOPERADOR = _idTeleoperador
        AND sesion_teleops.UID_VEHICULO = _idVehiculo
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR
        AND sesion_teleops.ID_ESTATUS = 6
        AND sesion_teleops.UID_VEHICULO = vehiculo.UID_VEHICULO
        GROUP BY sesion_teleops.UID_SESION_TELEOPS;
        

	ELSE
		SELECT -1,'No hay sesion valida entre teleoperador y vehiculo';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONEXION_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONEXION_VEHICULO`(_idVehiculo INT)
BEGIN
	DECLARE _idEstatus INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;
	
    IF (EXISTS ( SELECT * FROM vehiculo,sesion_teleops,puerto_sesion,servidor
        WHERE vehiculo.UID_VEHICULO = _idVehiculo
        AND vehiculo.ID_ESTATUS=5
        AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR)) THEN /*Vehicle needs to be teleoperated*/
        
		SELECT DISTINCT vehiculo.ID_ESTATUS AS ID_ESTATUS,
        (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS=vehiculo.ID_ESTATUS) AS DESCRIPCION_ESTATUS,
        vehiculo.UID_LAST_SESION_TELEOPS,
        puerto_sesion.PUERTO_CONTROL,
        puerto_sesion.PUERTO_SENSOR,
        puerto_sesion.PUERTO_VIDEO,
        servidor.IP_SERVIDOR
        
        FROM vehiculo,sesion_teleops,puerto_sesion,servidor
        WHERE vehiculo.UID_VEHICULO = _idVehiculo
        AND vehiculo.ID_ESTATUS=5
        AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR;

	ELSE
		IF(EXISTS(SELECT * FROM vehiculo WHERE vehiculo.UID_VEHICULO = _idVehiculo)) THEN/*Return vehicle status*/
			SELECT vehiculo.ID_ESTATUS AS ID_ESTATUS,
            (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS=vehiculo.ID_ESTATUS) AS DESCRIPCION_ESTATUS
            FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;
		ELSE
			SELECT -1 AS ID_ESTATUS,'Vehiculo id no encontrado' AS DESCRIPCION_ESTATUS;
		END IF;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONEXION_VEHICULO_MAC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONEXION_VEHICULO_MAC`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE _idEstatus INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;
	
    IF (EXISTS ( SELECT * FROM vehiculo,sesion_teleops,puerto_sesion,servidor
        WHERE vehiculo.UID_PHYSICAL = _idPhysical
        AND vehiculo.ID_ESTATUS=5
        AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR)) THEN /*Vehicle needs to be teleoperated*/
        
		SELECT 
        vehiculo.UID_VEHICULO,
        vehiculo.ID_ESTATUS AS ID_ESTATUS,
        vehiculo.TIPO_VEHICULO,
        (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS=vehiculo.ID_ESTATUS) AS DESCRIPCION_ESTATUS,
        vehiculo.UID_LAST_SESION_TELEOPS,
        puerto_sesion.PUERTO_CONTROL,
        puerto_sesion.PUERTO_SENSOR,
        puerto_sesion.PUERTO_VIDEO,
        /*---MODIFICACION 04/05/20---*/
        puerto_sesion.PUERTO_LATENCY,
        /*---------------------------*/
        servidor.IP_SERVIDOR,
        vehiculo.ALARM_STATUS,
        sesion_teleops.UID_SESION_TELEOPS,
        sesion_teleops.UID_TELEOPERADOR
        FROM vehiculo,sesion_teleops,puerto_sesion,servidor
        WHERE vehiculo.UID_PHYSICAL = _idPhysical
        AND vehiculo.ID_ESTATUS=5
        AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
        AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION
        AND puerto_sesion.UID_SERVIDOR = servidor.UID_SERVIDOR
        GROUP BY vehiculo.UID_VEHICULO
        LIMIT 1;

	ELSE
		IF(EXISTS(SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL = _idPhysical)) THEN/*Return vehicle status*/
			SELECT vehiculo.UID_VEHICULO,vehiculo.ID_ESTATUS AS ID_ESTATUS,vehiculo.ALARM_STATUS,
            (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS=vehiculo.ID_ESTATUS) AS DESCRIPCION_ESTATUS
            FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical;
		ELSE
			SELECT -1 AS ID_ESTATUS,'Vehiculo physical id no encontrado' AS DESCRIPCION_ESTATUS;
		END IF;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONNECT_VPN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONNECT_VPN`(_idVPN VARCHAR(24),_temporalVPN VARCHAR(24))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	IF EXISTS(SELECT UID_VPN FROM vpn_information WHERE UID_VPN = _idVPN) THEN
		UPDATE vpn_information
		SET CONNECTED_VPN = 1,
			TEMPORAL_VPN = _temporalVPN
		WHERE UID_VPN = _idVPN;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULTA_ESTACIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONSULTA_ESTACIONES`(_idOperador INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT UID_ESTACION, UBICACION_GPS_LAT,UBICACION_GPS_LON
    FROM estacion
    WHERE UID_OPERADOR = _idOperador;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CONSULTA_RESULTADOS_SESIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CONSULTA_RESULTADOS_SESIONES`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT 
		(SELECT COUNT(*)
		FROM ruta
		WHERE UID_ESTATUS_FINALIZACION=20) AS FINALIZADA_CORRECTAMENTE,
		(SELECT COUNT(*)
		FROM ruta
		WHERE UID_ESTATUS_FINALIZACION=21) AS CANCELADA_USUARIO,
        (SELECT COUNT(*)
		FROM ruta
		WHERE UID_ESTATUS_FINALIZACION=22) AS CANCELADA_TELEOPERADOR;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `COUNT_TELEOPERATION_SESION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `COUNT_TELEOPERATION_SESION`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
    
   		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL=_idPhysical;
       
   		SELECT 1 AS ID_ESTATUS, COUNT(*) AS NUMBER_ROWS FROM sesion_teleops WHERE UID_VEHICULO=_idVehiculo;
   		
   	ELSE 
       
   		SELECT -2 AS ID_ESTATUS,'SCOOTER WITH PROVIDED IMEI NOT FOUND' AS DESCRIPCION_ESTATUS;
   	
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CREAR_STATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CREAR_STATION`(_operatorName VARCHAR(90), _lat DOUBLE, _lon DOUBLE)
BEGIN
	DECLARE _idOperador INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
	INSERT INTO estacion (UID_OPERADOR, UBICACION_GPS_LAT, UBICACION_GPS_LON, CAPACIDAD, ID_ESTATUS)
	VALUES(_idOperador, _lat, _lon, 20, 18);
 	SELECT 1 AS ID_ESTATUS,'Estación agregada correctamente' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS STATIONID;		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DEJAR_TELEOPERACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DEJAR_TELEOPERACION`(_idVehiculo INT)
BEGIN 
	DECLARE _idSesionTeleops INT(11);
	DECLARE _id_puerto_sesion INT(11);
	DECLARE _idServidor INT(11);
 	DECLARE _idRuta INT(11);
	DECLARE _last_GPS_LAT DOUBLE DEFAULT NULL;
	DECLARE _last_GPS_LON DOUBLE DEFAULT NULL;	
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS, 'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	SELECT sesion_teleops.UID_SESION_TELEOPS, sesion_teleops.UID_PUERTO_SESION, vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON 
		INTO _idSesionTeleops, _id_puerto_sesion, _last_GPS_LAT, _last_GPS_LON
	FROM vehiculo, sesion_teleops, vehiculo_estatus
	WHERE vehiculo.UID_VEHICULO = _idVehiculo
		AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
		AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
	
	SELECT UID_LAST_RUTA INTO _idRuta
    FROM vehiculo
    WHERE vehiculo.UID_VEHICULO = _idVehiculo;
	
	UPDATE vehiculo
	SET vehiculo.ID_ESTATUS = 3,
  		vehiculo.FECHA_ESTATUS = NOW()
	WHERE vehiculo.UID_VEHICULO = _idVehiculo;

	UPDATE sesion_teleops
	SET ID_ESTATUS = 7
	WHERE sesion_teleops.UID_SESION_TELEOPS = _idSesionTeleops;

	UPDATE puerto_sesion
	SET ID_ESTATUS = 9
	WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;

	SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor
	FROM puerto_sesion
	WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;

	UPDATE servidor
	SET servidor.NUM_VEHIC_CONECTADOS = ( SELECT COUNT(*) FROM sesion_teleops, puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR = _idServidor)
	WHERE servidor.UID_SERVIDOR = _idServidor;

	UPDATE ruta
    SET ID_ESTATUS_SOLICITUD = 14
    WHERE UID_RUTA = _idRuta;

	SELECT 1 AS ID_ESTATUS, 'Sesion de teleops dejada' AS DESCRIPCION_ESTATUS;

	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELIVERY_LIST_ACTIVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DELIVERY_LIST_ACTIVE`()
BEGIN
	SELECT payload.`UID_PAYLOAD`, `STORAGE`, `UID_RUTA`, `REQUESTED_LONGITUDE`, `REQUESTED_LATITUDE`,  `REQUESTED_DATETIME`, `ID_ESTATUS`, `storage`.UID_VEHICULO 
FROM teleops.payload
INNER JOIN `storage` ON payload.`UID_PAYLOAD` = `storage`.`UID_PAYLOAD`
WHERE ID_ESTATUS = 25 OR ID_ESTATUS = 26;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DELIVERY_LIST_STANDBY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DELIVERY_LIST_STANDBY`()
BEGIN
	SELECT payload.`UID_PAYLOAD`, `STORAGE`, `UID_RUTA`, `REQUESTED_LONGITUDE`, `REQUESTED_LATITUDE`,  `REQUESTED_DATETIME`, `storage`.UID_VEHICULO 
FROM teleops.payload
INNER JOIN `storage` ON payload.`UID_PAYLOAD` = `storage`.`UID_PAYLOAD`
WHERE ID_ESTATUS = 25;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DISCONNECT_VPN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DISCONNECT_VPN`(_temporalVPN VARCHAR(24))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	IF EXISTS(SELECT UID_VPN FROM vpn_information WHERE TEMPORAL_VPN = _temporalVPN) THEN
		UPDATE vpn_information
		SET CONNECTED_VPN = 0,
			TEMPORAL_VPN = NULL
		WHERE TEMPORAL_VPN = _temporalVPN;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ELIMINAR_OPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ELIMINAR_OPERADOR`(_email VARCHAR(50))
BEGIN

    DECLARE _idOperador INT(11);

   	DECLARE _nombreOperador VARCHAR(50);

  	DECLARE EXIT HANDLER FOR SQLEXCEPTION

	

	BEGIN

		SHOW ERRORS;

		ROLLBACK;

		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;

	END;

	select user_name into _nombreOperador from `user` WHERE user_email = _email;

   	

   	select UID_OPERADOR into _idOperador from operador where NOMBRE_OPERADOR = _nombreOperador limit 1;

   

   	delete from operador where NOMBRE_OPERADOR = _nombreOperador;

	

    DELETE from `user` WHERE user_name = _nombreOperador and user_email = _email;

   	DELETE from teleoperador where NOMBRE_TELEOPERADOR = _nombreOperador AND EMAIL = _email;

   

   	DELETE from api_keys WHERE apiclient_id = CONCAT("", _idOperador, "") ;

		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `END_EXTERNAL_PAYLOAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `END_EXTERNAL_PAYLOAD`(_payload INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _payload) THEN
		SELECT -1 as ID_ESTATUS, 'PAYLOAD no encontrado';
	ELSE
		UPDATE payload
			SET ID_ESTATUS = 27
		WHERE UID_PAYLOAD = _payload;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `END_PAYLOAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `END_PAYLOAD`(_idVehiculo INT)
BEGIN
  	DECLARE _idRuta,_idOperador,_idPayload, _idPayloadNuevo INT;
	DECLARE _idEstacion, _countDelivery INT(11);

	DECLARE _idSesionTeleops INT(11);
	DECLARE _idRutaNueva INT(11);
	DECLARE _latFinal,_last_GPS_LAT DOUBLE DEFAULT NULL ;
	DECLARE _lonFinal,_last_GPS_LON DOUBLE DEFAULT NULL;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	SELECT sesion_teleops.UID_SESION_TELEOPS,
   			vehiculo_estatus.UBICACION_GPS_LAT, 
   			vehiculo_estatus.UBICACION_GPS_LON
    INTO 	_idSesionTeleops,
    		_last_GPS_LAT,
    		_last_GPS_LON
    FROM vehiculo, sesion_teleops, vehiculo_estatus
    WHERE vehiculo.UID_VEHICULO =  _idVehiculo
    AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
	AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;

	SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO = _idVehiculo;

	IF EXISTS (SELECT UID_PAYLOAD FROM payload WHERE UID_RUTA = _idRuta AND UID_SESION_TELEOPS = _idSesionTeleops) THEN
		UPDATE payload 
	   	SET END_LATITUDE = _last_GPS_LAT,
	   		END_LONGITUDE = _last_GPS_LON,
	   		END_DATETIME = NOW()
		WHERE UID_RUTA = _idRuta AND UID_SESION_TELEOPS = _idSesionTeleops;
	END IF;

	UPDATE storage SET ID_ESTATUS = 30, UID_VEHICULO = NULL, UID_PAYLOAD = NULL WHERE UID_VEHICULO = _idVehiculo;
	SELECT CELLPHONE FROM payload WHERE UID_RUTA = _idRuta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXPRESS_TELEOP_END` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EXPRESS_TELEOP_END`(_idVehiculo INT)
BEGIN
 DECLARE _idSesionTeleops INT(11);
 DECLARE _id_puerto_sesion INT(11);
 DECLARE _idServidor INT(11);
 DECLARE _idRuta INT(11);
 DECLARE _last_GPS_LAT DOUBLE DEFAULT NULL ;
 DECLARE _last_GPS_LON DOUBLE DEFAULT NULL;
 

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_PUERTO_SESION
    INTO _idSesionTeleops,_id_puerto_sesion
    FROM vehiculo,sesion_teleops
    WHERE vehiculo.UID_VEHICULO =  _idVehiculo
    AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS; 
 
	UPDATE vehiculo
	SET vehiculo.ID_ESTATUS = 3,
    vehiculo.FECHA_ESTATUS= NOW()
    WHERE vehiculo.UID_VEHICULO=_idVehiculo;

    UPDATE sesion_teleops
    SET ID_ESTATUS = 7
    WHERE sesion_teleops.UID_SESION_TELEOPS = _idSesionTeleops;

    UPDATE puerto_sesion
    SET ID_ESTATUS = 9
    WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion ;
    
    SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
    
	UPDATE servidor
	SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
	WHERE servidor.UID_SERVIDOR = _idServidor;
    
	SELECT _idSesionTeleops;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXPRESS_TELEOP_START` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EXPRESS_TELEOP_START`(_idVehiculo INT,_idTeleoperador INT, _idServidor INT, _id_puerto_sesion INT)
_sp:BEGIN
 DECLARE _status INT(11);
 DECLARE _id_sesion_teleops INT(11);
 DECLARE _uid_teleoperador  INT(11);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    /*
		GET DIAGNOSTICS CONDITION 1
@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
SELECT @p1 as RETURNED_SQLSTATE  , @p2 as MESSAGE_TEXT;
    */
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
			
			SELECT vehiculo.ID_ESTATUS, vehiculo.UID_LAST_SESION_TELEOPS, sesion_teleops.UID_TELEOPERADOR
            INTO  _status, _id_sesion_teleops,_uid_teleoperador FROM vehiculo 
            LEFT JOIN sesion_teleops ON UID_SESION_TELEOPS = vehiculo.UID_LAST_SESION_TELEOPS 
            WHERE vehiculo.UID_VEHICULO=_idVehiculo ;
            
            IF _status = 5 THEN
				IF _uid_teleoperador <> _idTeleoperador THEN
					SET _id_sesion_teleops = NULL;
				END IF;
				SELECT _id_sesion_teleops as UID_SESION_TELEOPS,
                        puerto_sesion.UID_PUERTO_SESION,
						puerto_sesion.PUERTO_IMAGENES_UI,
						puerto_sesion.PUERTO_JOYSTICK_UI,
						puerto_sesion.PUERTO_CONTROL,
						puerto_sesion.PUERTO_SENSOR,
						puerto_sesion.PUERTO_VIDEO,
						puerto_sesion.PUERTO_LATENCY,
						puerto_sesion.PUERTO_LATENCY_UI,
						puerto_sesion.PUERTO_SENSOR_UI FROM puerto_sesion WHERE 
						puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
                LEAVE _sp;
            END IF;
	 
				INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
				VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
                
                SELECT LAST_INSERT_ID() into _id_sesion_teleops;
                
				UPDATE sesion_teleops
                SET sesion_teleops.BUCKET_SESION = CONCAT('sesionteleops',_id_sesion_teleops)
                WHERE sesion_teleops.UID_SESION_TELEOPS=_id_sesion_teleops;
                
				UPDATE servidor
				SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
				WHERE servidor.UID_SERVIDOR = _idServidor;
                
                UPDATE puerto_sesion
				SET ID_ESTATUS = 8,UID_SERVIDOR = _idServidor
				WHERE puerto_sesion.UID_PUERTO_SESION= _id_puerto_sesion;
                
                UPDATE vehiculo
				SET vehiculo.ID_ESTATUS = 5,
				UID_LAST_RUTA = 0, /* Como valida llave foránea aquí debe apuntar a una ruta real, la ruta 0 es dummy */
				vehiculo.FECHA_ESTATUS= NOW(),
				vehiculo.UID_LAST_SESION_TELEOPS = _id_sesion_teleops
				WHERE vehiculo.UID_VEHICULO=_idVehiculo;
             
             SELECT _id_sesion_teleops as UID_SESION_TELEOPS,
				puerto_sesion.UID_PUERTO_SESION,
				puerto_sesion.PUERTO_IMAGENES_UI,
				puerto_sesion.PUERTO_JOYSTICK_UI,
				puerto_sesion.PUERTO_CONTROL,
				puerto_sesion.PUERTO_SENSOR,
				puerto_sesion.PUERTO_VIDEO,
				puerto_sesion.PUERTO_LATENCY,
				puerto_sesion.PUERTO_LATENCY_UI,
				puerto_sesion.PUERTO_SENSOR_UI FROM puerto_sesion WHERE 
				puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXTERNAL_GET_TOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `EXTERNAL_GET_TOKEN`(_idUser CHAR(8))
BEGIN
	SELECT api_key AS TOKEN FROM api_keys WHERE apiclient_id = (SELECT UID_OPERADOR FROM user WHERE user_id = _idUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FINALIZAR_SESION_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `FINALIZAR_SESION_TELEOPS`(_idVehiculo INT)
BEGIN

 DECLARE _idSesionTeleops INT(11);
 DECLARE _id_puerto_sesion INT(11);
 DECLARE _idServidor INT(11);
 DECLARE _idRuta INT(11);
 DECLARE _last_GPS_LAT DOUBLE DEFAULT NULL ;
 DECLARE _last_GPS_LON DOUBLE DEFAULT NULL;
 
 
 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

    SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_PUERTO_SESION,
   vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON
    INTO _idSesionTeleops,_id_puerto_sesion,_last_GPS_LAT,_last_GPS_LON
    FROM vehiculo,sesion_teleops,vehiculo_estatus
    WHERE vehiculo.UID_VEHICULO =  _idVehiculo
    AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS
	AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS; 

	SELECT UID_LAST_RUTA INTO _idRuta
    FROM vehiculo
    WHERE vehiculo.UID_VEHICULO = _idVehiculo;
    
    /*Actualizar estatus de vehiculo viaje sin mover y disponible para teleoperar (requiere nueva ruta)*/
    UPDATE vehiculo
    SET vehiculo.ID_ESTATUS = 3,
    vehiculo.FECHA_ESTATUS= NOW()
    WHERE vehiculo.UID_VEHICULO=_idVehiculo;

    UPDATE sesion_teleops
    SET ID_ESTATUS = 7
    WHERE sesion_teleops.UID_SESION_TELEOPS = _idSesionTeleops;

    UPDATE puerto_sesion
    SET ID_ESTATUS = 9
    WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion ;
    
    SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
    
	UPDATE servidor
	SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
	WHERE servidor.UID_SERVIDOR = _idServidor;
    
    UPDATE ruta
    SET ID_ESTATUS_SOLICITUD = 16,
    FECHA_FIN = NOW(),
    UID_ESTATUS_FINALIZACION = 20,
    GPS_LAT_CIERRE = _last_GPS_LAT,
    GPS_LON_CIERRE = _last_GPS_LON
    WHERE UID_RUTA = _idRuta;

    
    SELECT UID_LAST_SESION_TELEOPS, 1 AS ID_ESTATUS, 'Sesion de teleops finalizada' AS DESCRIPCION_ESTATUS,
	vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'delivered' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
	vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
	FROM vehiculo,vehiculo_estatus,ruta
	WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
                
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_GEOPOINTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GET_GEOPOINTS`(id_operador INT, _fecha DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT GPS_LAT_INICIO, GPS_LON_INICIO, GPS_LAT_FINAL, GPS_LON_FINAL
    FROM ruta AS r
    JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND r.FECHA_INICIO = _fecha; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_VEHICLE_W_STATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GET_VEHICLE_W_STATUS`(_token VARCHAR(32))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	SELECT DISTINCT 1 AS STATUS, v.UID_VEHICULO AS ID, ve.GPS_ALTITUD AS ALTITUD, ve.UBICACION_GPS_LAT AS LATITUD, ve.UBICACION_GPS_LON AS LONGITUD
	FROM vehiculo v
	INNER JOIN vehiculo_estatus ve ON v.UID_LAST_VEHICULO_ESTATUS = ve.ID_VEHICULO_ESTATUS
	WHERE v.UID_OPERADOR = (SELECT apiclient_id FROM api_keys ak WHERE ak.api_key = _token); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INHABILITAR_STORAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INHABILITAR_STORAGE`(_storageID INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE _idOperador INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
	IF NOT EXISTS(SELECT UID_STORAGE FROM storage WHERE UID_STORAGE = _storageID AND UID_OPERADOR = _idOperador) THEN
		SELECT -1 as ID_ESTATUS, 'Storage not found!';
	ELSE
		IF EXISTS(SELECT UID_PAYLOAD FROM storage WHERE UID_STORAGE = _storageID AND UID_OPERADOR = _idOperador) THEN
			UPDATE payload SET ID_ESTATUS = 28 WHERE UID_PAYLOAD = (SELECT UID_PAYLOAD FROM storage WHERE UID_STORAGE = _storageID AND UID_OPERADOR = _idOperador);
			UPDATE storage SET ID_ESTATUS = 30, UID_VEHICULO = NULL, UID_PAYLOAD = NULL WHERE UID_PAYLOAD = (SELECT UID_PAYLOAD FROM storage WHERE UID_STORAGE = _storageID AND UID_OPERADOR = _idOperador);
		END IF;
		UPDATE storage SET ID_ESTATUS = 29, UID_VEHICULO = NULL, UID_PAYLOAD = NULL WHERE UID_STORAGE = _storageID;
	    SELECT 1 AS ID_ESTATUS, 'Storage disabled correctly!' AS DESCRIPCION_ESTATUS, ONFLEET_UID as taskID FROM payload WHERE UID_PAYLOAD = _deliveryID;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SESION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SESION`(_email VARCHAR(100),_password VARCHAR(100))
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF EXISTS (SELECT UID_TELEOPERADOR FROM
            teleoperador
            WHERE teleoperador.EMAIL = _email AND teleoperador.PASSWORD=_password) THEN
			SELECT UID_TELEOPERADOR FROM
            teleoperador
            WHERE teleoperador.EMAIL = _email AND teleoperador.PASSWORD=_password;
	ELSE
		SELECT -1 AS ID_ESTATUS,'Email y password no encontrado' AS DESCRIPCION_ESTATUS;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SESION_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SESION_TELEOPS`(_idVehiculo INT,_idTeleoperador INT)
BEGIN

 DECLARE _id_puerto_sesion INT(11);
 DECLARE _idServidor INT(11);
 DECLARE _idRuta INT(11);
 DECLARE _gpsLat DOUBLE DEFAULT NULL;
 DECLARE _gpsLon DOUBLE DEFAULT NULL;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;

	START TRANSACTION;
   
    /*Get free seson ports from server*/
   IF (EXISTS (SELECT * FROM puerto_sesion WHERE ID_ESTATUS=9)) THEN
   
		IF( NOT EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6)) THEN
			 /*Actualizar estatus de vehiculo en teleops*/
			
					
            SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
			WHERE ID_ESTATUS=9 LIMIT 1 ;
			
			UPDATE puerto_sesion
			SET ID_ESTATUS = 8
			WHERE puerto_sesion.UID_PUERTO_SESION=_id_puerto_sesion;
			
			INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
			VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
			
			SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
		
			UPDATE servidor
			SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
			WHERE servidor.UID_SERVIDOR = _idServidor;
		
			UPDATE vehiculo
			SET vehiculo.ID_ESTATUS = 5,
			vehiculo.FECHA_ESTATUS= NOW(),
            vehiculo.UID_LAST_SESION_TELEOPS = LAST_INSERT_ID()
			WHERE vehiculo.UID_VEHICULO=_idVehiculo;
            
            SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;
            
            SELECT vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON INTO _gpsLat,_gpsLon FROM vehiculo,vehiculo_estatus WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
            
            UPDATE ruta
            SET ruta.ID_ESTATUS_SOLICITUD = 15,
            FECHA_INICIO = NOW(),
            GPS_LAT_INICIO = IFNULL(_gpsLat,0),
            GPS_LON_INICIO =IFNULL(_gpsLon,0)
            WHERE ruta.UID_RUTA = _idRuta;
            
			/*SELECT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS UID_SESION_TELEOPS;*/
            
            IF EXISTS(SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,LAST_INSERT_ID() AS UID_SESION_TELEOPS,
				vehiculo.UID_VEHICULO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
				vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,vehiculo.UID_EXTERNAL
				FROM vehiculo, vehiculo_estatus, ruta
				WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA) THEN
			
				SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
                LAST_INSERT_ID() AS UID_SESION_TELEOPS,
				vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
				vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
				FROM vehiculo, vehiculo_estatus, ruta
				WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
			ELSE
				SELECT 4 AS ID_ESTATUS, 'Sesion iniciada estatus GPS no disponible' AS DESCRIPCION_ESTATUS;
			END IF;

		ELSE
			IF EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador) THEN
				SELECT UID_LAST_SESION_TELEOPS, 3 AS ID_ESTATUS, 'El vehiculo tiene una sesion activa' AS DESCRIPCION_ESTATUS,
                vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
				vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
				FROM vehiculo,vehiculo_estatus,ruta
				WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
			ELSE
				SELECT 5 AS ID_ESTATUS, 'Vehiculo en sesion con otro teleoperador' AS DESCRIPCION_ESTATUS;
			END IF;
		END IF;
    ELSE
		SELECT 2 AS ID_ESTATUS,'No free ports availabe for session' AS DESCRIPCION_ESTATUS;
    END IF;
    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SOLICITUD_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SOLICITUD_TELEOPS`(_idVehiculo INT,_idTeleoperador INT,_idRuta INT)
BEGIN
 DECLARE _id_sesion_teleops INT(11);
 DECLARE _id_puerto_sesion INT(11);
 DECLARE _idServidor INT(11);
 DECLARE _gpsLat,_latInicio DOUBLE DEFAULT NULL;
 DECLARE _gpsLon,_lonInicio DOUBLE DEFAULT NULL;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;

	START TRANSACTION;
    
    /*Route has already been asigned to a vehicle use that vehicle instead of the one selected*/
    IF EXISTS (SELECT ruta.UID_RUTA FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD =15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA) THEN
		SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    END IF;
	
    IF EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador) THEN
		SELECT UID_LAST_SESION_TELEOPS AS UID_SESION_TELEOPS, 3 AS ID_ESTATUS, 'El vehiculo tiene una sesion activa' AS DESCRIPCION_ESTATUS,
		vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
		vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus,ruta
		WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
	ELSE
		IF( EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.UID_TELEOPERADOR!=_idTeleoperador AND sesion_teleops.ID_ESTATUS=6)) THEN
			SELECT 5 AS ID_ESTATUS, 'Vehiculo en sesion con otro teleoperador' AS DESCRIPCION_ESTATUS;
		ELSE
			
			 /*Validate there is a free seson ports from server*/
             IF (EXISTS (SELECT UID_PUERTO_SESION FROM puerto_sesion
					WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
					(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
					FROM puerto_sesion,sesion_teleops
					WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
					ORDER BY UID_PUERTO_SESION
					LIMIT 1)) THEN
                    
				SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
				WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
				(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
				FROM puerto_sesion,sesion_teleops
				WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
				ORDER BY UID_PUERTO_SESION
				LIMIT 1;
                    
				 SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
				FROM vehiculo_estatus,vehiculo
				WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0
				ORDER BY FECHA_REGISTRO DESC
				LIMIT 1;

		/*SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
		WHERE ID_ESTATUS=9 LIMIT 1 ;*/
		
				UPDATE puerto_sesion
				SET ID_ESTATUS = 8
				WHERE puerto_sesion.UID_PUERTO_SESION=_id_puerto_sesion;
				
				INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
				VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
                
                SELECT LAST_INSERT_ID() INTO _id_sesion_teleops;
                
                UPDATE sesion_teleops
                SET sesion_teleops.BUCKET_SESION = CONCAT('sesionteleops',_id_sesion_teleops)
                WHERE sesion_teleops.UID_SESION_TELEOPS=_id_sesion_teleops;
				
				SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;
			
				UPDATE servidor
				SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
				WHERE servidor.UID_SERVIDOR = _idServidor;
			
				UPDATE vehiculo
				SET vehiculo.ID_ESTATUS = 5,
				UID_LAST_RUTA = _idRuta,
				vehiculo.FECHA_ESTATUS= NOW(),
				vehiculo.UID_LAST_SESION_TELEOPS = _id_sesion_teleops
				WHERE vehiculo.UID_VEHICULO=_idVehiculo;
				
				/*SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;*/
				
				SELECT vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON INTO _gpsLat,_gpsLon FROM vehiculo,vehiculo_estatus WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
				
				UPDATE ruta
				SET ruta.ID_ESTATUS_SOLICITUD = 15,
				FECHA_INICIO = NOW(),
				GPS_LAT_INICIO = _latInicio,
				GPS_LON_INICIO = _lonInicio
				WHERE ruta.UID_RUTA = _idRuta;
				
				/*SELECT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS UID_SESION_TELEOPS;*/
				
				IF EXISTS(SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_VEHICULO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,vehiculo.UID_EXTERNAL
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1) THEN
				
					SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1;
				ELSE
					SELECT 4 AS ID_ESTATUS, 'Sesion iniciada estatus GPS no disponible' AS DESCRIPCION_ESTATUS;
				END IF;
			ELSE
				SELECT 2 AS ID_ESTATUS,'No free ports availabe for session' AS DESCRIPCION_ESTATUS;
			END IF;
        END IF;
	END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SOLICITUD_TELEOPS_SERVIDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SOLICITUD_TELEOPS_SERVIDOR`(_idVehiculo INT,_idTeleoperador INT,_idRuta INT, _idServidor INT)
BEGIN
 DECLARE _id_sesion_teleops INT(11);
 DECLARE _id_puerto_sesion INT(11);

 DECLARE _gpsLat,_latInicio DOUBLE DEFAULT NULL;
 DECLARE _gpsLon,_lonInicio DOUBLE DEFAULT NULL;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;

	START TRANSACTION;
    
    /*Route has already been asigned to a vehicle use that vehicle instead of the one selected*/
    IF EXISTS (SELECT ruta.UID_RUTA FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD =15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA) THEN
		SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    END IF;
	
    IF EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador) THEN
		SELECT UID_LAST_SESION_TELEOPS AS UID_SESION_TELEOPS, 3 AS ID_ESTATUS, 'El vehiculo tiene una sesion activa' AS DESCRIPCION_ESTATUS,
		vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
		vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus,ruta
		WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
	ELSE
		IF( EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.UID_TELEOPERADOR!=_idTeleoperador AND sesion_teleops.ID_ESTATUS=6)) THEN
			SELECT 5 AS ID_ESTATUS, 'Vehiculo en sesion con otro teleoperador' AS DESCRIPCION_ESTATUS;
		ELSE
			
			 /*Validate there is a free seson ports from server*/
             IF (EXISTS (SELECT UID_PUERTO_SESION FROM puerto_sesion
					WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
					(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
					FROM puerto_sesion,sesion_teleops
					WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
					ORDER BY UID_PUERTO_SESION
					LIMIT 1)) THEN
                    
				SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
				WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
				(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
				FROM puerto_sesion,sesion_teleops
				WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
				ORDER BY UID_PUERTO_SESION
				LIMIT 1;
                    
				 SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
				FROM vehiculo_estatus,vehiculo
				WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0
				ORDER BY FECHA_REGISTRO DESC
				LIMIT 1;

		/*SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
		WHERE ID_ESTATUS=9 LIMIT 1 ;*/
		
				UPDATE puerto_sesion
				SET ID_ESTATUS = 8,UID_SERVIDOR = _idServidor
				WHERE puerto_sesion.UID_PUERTO_SESION=_id_puerto_sesion;
				
				INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
				VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
                
                SELECT LAST_INSERT_ID() INTO _id_sesion_teleops;
                
                UPDATE sesion_teleops
                SET sesion_teleops.BUCKET_SESION = CONCAT('sesionteleops',_id_sesion_teleops)
                WHERE sesion_teleops.UID_SESION_TELEOPS=_id_sesion_teleops;
				
				/*SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;*/
			
				UPDATE servidor
				SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
				WHERE servidor.UID_SERVIDOR = _idServidor;
			
				UPDATE vehiculo
				SET vehiculo.ID_ESTATUS = 5,
				UID_LAST_RUTA = _idRuta,
				vehiculo.FECHA_ESTATUS= NOW(),
				vehiculo.UID_LAST_SESION_TELEOPS = _id_sesion_teleops
				WHERE vehiculo.UID_VEHICULO=_idVehiculo;
				
				/*SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;*/
				
				SELECT vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON INTO _gpsLat,_gpsLon FROM vehiculo,vehiculo_estatus WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
				
				UPDATE ruta
				SET ruta.ID_ESTATUS_SOLICITUD = 15,
				FECHA_INICIO = NOW(),
				GPS_LAT_INICIO = _latInicio,
				GPS_LON_INICIO = _lonInicio
				WHERE ruta.UID_RUTA = _idRuta;
				
				/*SELECT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS UID_SESION_TELEOPS;*/
				
				IF EXISTS(SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_VEHICULO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,vehiculo.UID_EXTERNAL
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1) THEN
				
					SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1;
				ELSE
					SELECT 4 AS ID_ESTATUS, 'Sesion iniciada estatus GPS no disponible' AS DESCRIPCION_ESTATUS;
				END IF;
			ELSE
				SELECT 2 AS ID_ESTATUS,'No free ports availabe for session' AS DESCRIPCION_ESTATUS;
			END IF;
        END IF;
	END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SOLICITUD_TELEOPS_SERVIDOR2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SOLICITUD_TELEOPS_SERVIDOR2`(_idVehiculo INT,_idTeleoperador INT,_idRuta INT, _idServidor INT)
BEGIN
 DECLARE _id_sesion_teleops INT(11);
 DECLARE _id_puerto_sesion INT(11);

 DECLARE _gpsLat,_latInicio DOUBLE DEFAULT NULL;
 DECLARE _gpsLon,_lonInicio DOUBLE DEFAULT NULL;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;

	START TRANSACTION;
    
    /*Route has already been asigned to a vehicle use that vehicle instead of the one selected*/
    IF EXISTS (SELECT ruta.UID_RUTA FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD =15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA) THEN
		SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    END IF;
	
    IF EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador) THEN
		SELECT UID_LAST_SESION_TELEOPS AS UID_SESION_TELEOPS, 3 AS ID_ESTATUS, 'El vehiculo tiene una sesion activa' AS DESCRIPCION_ESTATUS,
		vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
		vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus,ruta
		WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
	ELSE
		IF( EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.UID_TELEOPERADOR!=_idTeleoperador AND sesion_teleops.ID_ESTATUS=6)) THEN
			SELECT 5 AS ID_ESTATUS, 'Vehiculo en sesion con otro teleoperador' AS DESCRIPCION_ESTATUS;
		ELSE
			
			 /*Validate there is a free seson ports from server*/
             IF (EXISTS (SELECT UID_PUERTO_SESION FROM puerto_sesion
					WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
					(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
					FROM puerto_sesion,sesion_teleops
					WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
					ORDER BY UID_PUERTO_SESION
					LIMIT 1)) THEN
                    
				SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
				WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
				(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
				FROM puerto_sesion,sesion_teleops
				WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
				ORDER BY UID_PUERTO_SESION
				LIMIT 1;
				SELECT 10 INTO _id_puerto_sesion;
                
                
				 SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
				FROM vehiculo_estatus,vehiculo
				WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0
				ORDER BY FECHA_REGISTRO DESC
				LIMIT 1;
			SELECT 10 INTO _id_puerto_sesion;
		/*SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
		WHERE ID_ESTATUS=9 LIMIT 1 ;*/
		SELECT 10 INTO _id_puerto_sesion;
				UPDATE puerto_sesion
				SET ID_ESTATUS = 8,UID_SERVIDOR = _idServidor
				WHERE puerto_sesion.UID_PUERTO_SESION= _id_puerto_sesion;
				
				INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
				VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
                
                SELECT LAST_INSERT_ID() INTO _id_sesion_teleops;
                
                UPDATE sesion_teleops
                SET sesion_teleops.BUCKET_SESION = CONCAT('sesionteleops',_id_sesion_teleops)
                WHERE sesion_teleops.UID_SESION_TELEOPS=_id_sesion_teleops;
				
				/*SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;*/
			
				UPDATE servidor
				SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
				WHERE servidor.UID_SERVIDOR = _idServidor;
			
				UPDATE vehiculo
				SET vehiculo.ID_ESTATUS = 5,
				UID_LAST_RUTA = _idRuta,
				vehiculo.FECHA_ESTATUS= NOW(),
				vehiculo.UID_LAST_SESION_TELEOPS = _id_sesion_teleops
				WHERE vehiculo.UID_VEHICULO=_idVehiculo;
				
				/*SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;*/
				
				SELECT vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON INTO _gpsLat,_gpsLon FROM vehiculo,vehiculo_estatus WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
				
				UPDATE ruta
				SET ruta.ID_ESTATUS_SOLICITUD = 15,
				FECHA_INICIO = NOW(),
				GPS_LAT_INICIO = _latInicio,
				GPS_LON_INICIO = _lonInicio
				WHERE ruta.UID_RUTA = _idRuta;
				
				/*SELECT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS UID_SESION_TELEOPS;*/
				
				IF EXISTS(SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_VEHICULO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,vehiculo.UID_EXTERNAL
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1) THEN
				
					SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1;
				ELSE
					SELECT 4 AS ID_ESTATUS, 'Sesion iniciada estatus GPS no disponible' AS DESCRIPCION_ESTATUS;
				END IF;
			ELSE
				SELECT 2 AS ID_ESTATUS,'No free ports availabe for session' AS DESCRIPCION_ESTATUS;
			END IF;
        END IF;
	END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INICIAR_SOLICITUD_TELEOPS_SERVIDOR_PUERTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `INICIAR_SOLICITUD_TELEOPS_SERVIDOR_PUERTO`(_idVehiculo INT,_idTeleoperador INT,_idRuta INT, _idServidor INT, _id_puerto_sesion INT)
BEGIN
 DECLARE _id_sesion_teleops INT(11);
 DECLARE _idPayload INT(11);
 DECLARE _gpsLat,_latInicio DOUBLE DEFAULT NULL;
 DECLARE _gpsLon,_lonInicio DOUBLE DEFAULT NULL;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;

	START TRANSACTION;
    
    /*Route has already been asigned to a vehicle use that vehicle instead of the one selected*/
    IF EXISTS (SELECT ruta.UID_RUTA FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD =15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA) THEN
		SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM ruta,vehiculo WHERE ruta.UID_RUTA = _idRuta AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    END IF;
	
    IF EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador) THEN
		SELECT UID_LAST_SESION_TELEOPS AS UID_SESION_TELEOPS, 3 AS ID_ESTATUS, 'El vehiculo tiene una sesion activa' AS DESCRIPCION_ESTATUS,
		vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
		vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus,ruta
		WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
	ELSE
		IF( EXISTS (SELECT * FROM sesion_teleops WHERE sesion_teleops.UID_VEHICULO=_idVehiculo AND sesion_teleops.UID_TELEOPERADOR!=_idTeleoperador AND sesion_teleops.ID_ESTATUS=6)) THEN
			SELECT 5 AS ID_ESTATUS, 'Vehiculo en sesion con otro teleoperador' AS DESCRIPCION_ESTATUS;
		ELSE
			
			 /*Validate there is a free seson ports from server*/
             IF (EXISTS (SELECT UID_PUERTO_SESION FROM puerto_sesion
					WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
					(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
					FROM puerto_sesion,sesion_teleops
					WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
					ORDER BY UID_PUERTO_SESION
					LIMIT 1)) THEN
                    
/*				SELECT UID_PUERTO_SESION INTO _id_puerto_sesion FROM puerto_sesion
				WHERE ID_ESTATUS=9 AND UID_PUERTO_SESION NOT IN
				(SELECT DISTINCT puerto_sesion.UID_PUERTO_SESION
				FROM puerto_sesion,sesion_teleops
				WHERE sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_PUERTO_SESION = puerto_sesion.UID_PUERTO_SESION)
				ORDER BY UID_PUERTO_SESION
				LIMIT 1;*/
			
                
                
				 SELECT UBICACION_GPS_LAT, UBICACION_GPS_LON INTO _latInicio,_lonInicio
				FROM vehiculo_estatus,vehiculo
				WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_VEHICULO=vehiculo_estatus.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0
				ORDER BY FECHA_REGISTRO DESC
				LIMIT 1;

				UPDATE puerto_sesion
				SET ID_ESTATUS = 8,UID_SERVIDOR = _idServidor
				WHERE puerto_sesion.UID_PUERTO_SESION= _id_puerto_sesion;
				
				INSERT INTO sesion_teleops(UID_VEHICULO, UID_TELEOPERADOR,ID_ESTATUS,FECHA_INICIO_SESION, FECHA_FIN_SESION, UID_PUERTO_SESION)
				VALUES (_idVehiculo, _idTeleoperador, 6,NOW(), NULL, _id_puerto_sesion);
                
                SELECT LAST_INSERT_ID() INTO _id_sesion_teleops;
                
                UPDATE sesion_teleops
                SET sesion_teleops.BUCKET_SESION = CONCAT('sesionteleops',_id_sesion_teleops)
                WHERE sesion_teleops.UID_SESION_TELEOPS=_id_sesion_teleops;
				
				/*SELECT puerto_sesion.UID_SERVIDOR INTO _idServidor FROM puerto_sesion WHERE puerto_sesion.UID_PUERTO_SESION = _id_puerto_sesion;*/
			
				UPDATE servidor
				SET servidor.NUM_VEHIC_CONECTADOS = (SELECT COUNT(*) FROM sesion_teleops,puerto_sesion WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION AND puerto_sesion.UID_SERVIDOR=_idServidor)
				WHERE servidor.UID_SERVIDOR = _idServidor;
			
				UPDATE vehiculo
				SET vehiculo.ID_ESTATUS = 5,
				UID_LAST_RUTA = _idRuta,
				vehiculo.FECHA_ESTATUS= NOW(),
				vehiculo.UID_LAST_SESION_TELEOPS = _id_sesion_teleops
				WHERE vehiculo.UID_VEHICULO=_idVehiculo;
				
				/*SELECT UID_LAST_RUTA INTO _idRuta FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehiculo;*/
				
				SELECT vehiculo_estatus.UBICACION_GPS_LAT, vehiculo_estatus.UBICACION_GPS_LON INTO _gpsLat,_gpsLon FROM vehiculo,vehiculo_estatus WHERE vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS;
				
				UPDATE ruta
				SET ruta.ID_ESTATUS_SOLICITUD = 15,
				FECHA_INICIO = NOW(),
				GPS_LAT_INICIO = _latInicio,
				GPS_LON_INICIO = _lonInicio
				WHERE ruta.UID_RUTA = _idRuta;
				
				/*SELECT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS, LAST_INSERT_ID() AS UID_SESION_TELEOPS;*/
			
				IF( EXISTS (SELECT UID_PAYLOAD FROM payload WHERE UID_RUTA = _idRuta)) THEN
				
					UPDATE payload 
					SET UID_SESION_TELEOPS = _id_sesion_teleops, 
						ID_ESTATUS = 26,
						START_LATITUDE = _latInicio,
						START_LONGITUDE = _lonInicio,
						START_DATETIME = NOW()
					WHERE UID_RUTA = _idRuta;
				
				END IF;
				
				IF EXISTS(SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_VEHICULO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,vehiculo.UID_EXTERNAL
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1) THEN
				
					SELECT DISTINCT 1 AS ID_ESTATUS, 'Sesion de teleops iniciada' AS DESCRIPCION_ESTATUS,
					LAST_INSERT_ID() AS UID_SESION_TELEOPS,
                    _id_puerto_sesion AS UID_PUERTO_SESION,
					vehiculo.UID_PHYSICAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,'in_transit' AS STATUS_SCOOTER,ruta.ID_RIDE_REQUEST_EXT,
					vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON, ruta.GPS_LAT_FINAL AS LATITUDE, ruta.GPS_LON_FINAL AS LONGITUDE
					FROM vehiculo, vehiculo_estatus, ruta
					WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA
                    LIMIT 1;
				ELSE
					SELECT 4 AS ID_ESTATUS, 'Sesion iniciada estatus GPS no disponible' AS DESCRIPCION_ESTATUS;
				END IF;
			ELSE
				SELECT 2 AS ID_ESTATUS,'No free ports availabe for session' AS DESCRIPCION_ESTATUS;
			END IF;
        END IF;
	END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LIBERAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `LIBERAR_VEHICULO`(_idVehiculo INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	UPDATE vehiculo
    SET vehiculo.ID_ESTATUS = 3,
		vehiculo.FECHA_ESTATUS = NOW()
    WHERE vehiculo.UID_VEHICULO=_idVehiculo;
    SELECT 1 AS ID_ESTATUS, 'Estatus de vehiculo actualizado' AS DESCRIPCION_ESTATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANEJAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `MANEJAR_VEHICULO`(_idVehiculo INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	UPDATE vehiculo
    SET vehiculo.ID_ESTATUS = 5,
    vehiculo.FECHA_ESTATUS= NOW()
    WHERE vehiculo.UID_VEHICULO=_idVehiculo;
    SELECT 1 AS ID_ESTATUS, 'Estatus de vehiculo actualizado' AS DESCRIPCION_ESTATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBETENER_WEBHOOK_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBETENER_WEBHOOK_URL`(_api_key varchar(32))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	SELECT URL_WEBHOOK as webhookURL
	FROM teleops.operador
	WHERE UID_OPERADOR IN
	(SELECT `apiclient_id` AS UID_OPERADOR
    FROM `api_keys` 
    WHERE `api_key` = _api_key);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_ESPECIFICO_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_ESPECIFICO_EXTERNAL`(_operatorName VARCHAR(90))
BEGIN
	DECLARE _idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
	    SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
	   	SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
		SELECT 
			p.UID_OPERADOR, 
			p.REQUESTED_LATITUDE, 
			p.REQUESTED_LONGITUDE, 
			p.REQUESTED_DATETIME, 
			p.CLIENT_NAME, 
			p.CLIENT_EMAIL, 
			p.NOTES,
			p.LABEL,
			p.UID_RUTA,
			p.ID_ESTATUS AS STATUS_PAYLOAD,
			r.ID_ESTATUS_SOLICITUD AS STATUS_RUTA,
			st.UID_TELEOPERADOR,
			t.NOMBRE_TELEOPERADOR,
			p.UID_VEHICULO,
			v.UID_PHYSICAL,
			p.UID_PAYLOAD,
			p.`TYPE`,
			p.UID_STOP,
			p.UID_ASSIGMENT,
			p.UID_SHIPMENT,
			p.UID_CLIENT
		FROM payload as p
		LEFT JOIN ruta as r
		ON p.UID_RUTA = r.UID_RUTA
		LEFT JOIN sesion_teleops as st
		ON p.UID_SESION_TELEOPS = st.UID_SESION_TELEOPS
		LEFT JOIN teleoperador as t
		ON st.UID_TELEOPERADOR = t.UID_TELEOPERADOR
		LEFT JOIN vehiculo as v
		ON p.UID_VEHICULO = v.UID_VEHICULO
		WHERE p.UID_OPERADOR = _idOperador AND (p.ID_ESTATUS = 25 OR p.ID_ESTATUS = 26);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_ESPECIFICO_STATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_ESPECIFICO_STATION`(_stationID INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	SELECT 	e.UID_ESTACION AS STATIONID,
			e.UBICACION_GPS_LAT AS LATITUDE,
			e.UBICACION_GPS_LON AS LONGITUDE,
			v.UID_VEHICULO AS UNITID,
			v.UID_PHYSICAL AS IMEI
	FROM estacion AS e
	INNER JOIN vehiculo AS v
		ON v.UID_ESTACION = e.UID_ESTACION 
	WHERE e.UID_OPERADOR = ( SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName ) AND e.UID_ESTACION = _stationID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_ESTACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_ESTACION`(_operatorName VARCHAR(90), _uidEstacion INT)
BEGIN
  	DECLARE _idOperador INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
		
		SELECT 2 AS ID_ESTATUS, 'Operador no registrado' AS DESCRIPCION_ESTATUS;
		
	ELSE
		
		SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
        
		IF EXISTS (SELECT UID_ESTACION FROM estacion WHERE UID_ESTACION = _uidEstacion AND UID_OPERADOR = _idOperador) THEN
			
			SELECT 1 AS ID_ESTATUS, UBICACION_GPS_LAT,UBICACION_GPS_LON FROM estacion WHERE UID_ESTACION = _uidEstacion AND UID_OPERADOR = _idOperador;

		ELSE

			SELECT -1 AS ID_ESTATUS,'Can\'t find specified charging hub' AS DESCRIPCION_ESTATUS;
			
		END IF;
		
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_HARDWARE_LOG_URL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_HARDWARE_LOG_URL`(_idPhysical VARCHAR(50), _fechaIncicio datetime, _fechaFin datetime)
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	IF (EXISTS (SELECT UID_VEHICULO FROM vehiculo WHERE UID_PHYSICAL = _idPhysical)) THEN
	
		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
		
		SELECT * FROM teleops.vehiculo_hardware_log 
		WHERE UID_VEHICULO = _idVehiculo AND ( FECHA_LOG BETWEEN _fechaIncicio AND _fechaFin );
	
	ELSE
	   
		SELECT -1 AS ID_ESTATUS,'Id vehiculo no encontrado' AS DESCRIPCION_ESTATUS;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_INFO_DELIVERY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_INFO_DELIVERY`(_idRuta INT, _idVehiculo INT)
BEGIN
	DECLARE _idPayload, _idOperador INT;
	DECLARE _apikey CHAR(32);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	SELECT UID_OPERADOR INTO _idOperador FROM vehiculo WHERE UID_VEHICULO = _idVehiculo;
	SELECT UID_PAYLOAD INTO _idPayload FROM payload WHERE UID_RUTA = _idRuta;
	SELECT api_key INTO _apikey FROM api_keys WHERE apiclient_id = _idOperador;
	IF EXISTS(SELECT _idPayload) THEN
		UPDATE payload SET UID_VEHICULO = _idVehiculo WHERE UID_PAYLOAD = _idPayload;
	END IF;

	SELECT _idPayload AS DeliveryID, _apikey AS TOKEN, 1 AS ID_ESTATUS;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_INFO_NOT_DELIVERY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_INFO_NOT_DELIVERY`(_idVehiculo INT)
BEGIN
	DECLARE _idPayload, _idRuta, _idOperador INT;
	DECLARE _apikey CHAR(32);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	SELECT UID_OPERADOR, UID_LAST_RUTA INTO _idOperador,_idRuta FROM vehiculo WHERE UID_VEHICULO = _idVehiculo;
	SELECT UID_PAYLOAD INTO _idPayload FROM payload WHERE UID_RUTA = _idRuta;
	SELECT api_key INTO _apikey FROM api_keys WHERE apiclient_id = _idOperador;

	SELECT _idPayload AS DeliveryID, _apikey AS TOKEN, 1 AS ID_ESTATUS;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_MAC_DESDE_SESION_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_MAC_DESDE_SESION_TELEOPS`(_sesionTeleopsID INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT MAC_STORAGE as MAC FROM storage WHERE UID_PAYLOAD = (SELECT UID_PAYLOAD FROM payload WHERE UID_SESION_TELEOPS = _sesionTeleopsID);
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_OPERADORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_OPERADORES`()
BEGIN
	SELECT operador.UID_OPERADOR,operador.NOMBRE_OPERADOR FROM operador WHERE ESTATUS_ACTIVO=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_PAYLOAD_ESPECIFICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_PAYLOAD_ESPECIFICO`(_deliveryID INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

	IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _deliveryID) THEN
		SELECT -1 as ID_ESTATUS, 'Delivery run not found!';
	ELSE
		SELECT 	p.UID_PAYLOAD AS DELIVERYID,
				v.UID_VEHICULO AS UNITID,
				e.DESCRIPCION_ESTATUS AS STATE,
				p.REQUESTED_LATITUDE,
				p.REQUESTED_LONGITUDE,
				p.REQUESTED_DATETIME,
				p.START_LATITUDE,
				p.START_LONGITUDE,
				p.START_DATETIME,
				p.END_LATITUDE,
				p.END_LONGITUDE,
				p.END_DATETIME,
				ve.UBICACION_GPS_LAT AS VEHICLE_LATITUDE,
				ve.UBICACION_GPS_LON AS VEHICLE_LONGITUDE,
				GROUP_CONCAT(DISTINCT s.UID_STORAGE SEPARATOR ',') AS STORAGE
		FROM payload AS p
		INNER JOIN ruta AS r 
		ON p.UID_RUTA = r.UID_RUTA
		INNER JOIN vehiculo AS v
		ON p.UID_VEHICULO = v.UID_VEHICULO
		INNER JOIN estatus AS e
		ON p.ID_ESTATUS = e.ID_ESTATUS
		INNER JOIN vehiculo_estatus AS ve
		ON ve.ID_VEHICULO_ESTATUS = ( SELECT ID_VEHICULO_ESTATUS FROM vehiculo_estatus WHERE UID_VEHICULO = p.UID_VEHICULO LIMIT 1 )
		LEFT JOIN storage AS s
		ON p.UID_PAYLOAD = s.UID_PAYLOAD
		WHERE v.UID_OPERADOR = ( SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName) AND p.UID_PAYLOAD = _deliveryID
		GROUP BY p.UID_PAYLOAD;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_RUTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_RUTA`(_idVehiculo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    
    IF EXISTS (SELECT vehiculo.UID_VEHICULO,vehiculo.UID_LAST_RUTA,vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,ruta.GPS_LAT_INICIO,ruta.GPS_LON_INICIO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,ruta.FECHA_INICIO
            FROM vehiculo,vehiculo_estatus,ruta
            WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA) THEN
			SELECT vehiculo.UID_VEHICULO,vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON,ruta.GPS_LAT_INICIO,ruta.GPS_LON_INICIO,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,ruta.FECHA_INICIO
            FROM vehiculo,vehiculo_estatus,ruta
            WHERE vehiculo.UID_VEHICULO = _idVehiculo AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA;
	ELSE
		SELECT -1 AS ID_ESTATUS,'Ruta o ubicacion no disponible' AS DESCRIPCION_ESTATUS;
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_SERVIDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_SERVIDORES`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	IF (EXISTS ( SELECT servidor.UID_SERVIDOR,servidor.IP_SERVIDOR,servidor.NOMBRE_SERVDOR,
			(SELECT DESCRIPCION_ESTATUS FROM estatus WHERE ID_ESTATUS=servidor.ID_ESTATUS) AS ESTATUS_SERVIDOR,
			servidor.NUM_VEHIC_CONECTADOS
			FROM servidor)) THEN

			SELECT servidor.UID_SERVIDOR,servidor.IP_SERVIDOR,servidor.NOMBRE_SERVDOR,
			(SELECT DESCRIPCION_ESTATUS FROM estatus WHERE ID_ESTATUS=servidor.ID_ESTATUS) AS ESTATUS_SERVIDOR,
			servidor.NUM_VEHIC_CONECTADOS
			FROM servidor;


	ELSE
			SELECT -1,'No servers active';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_SESIONES_SERVIDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_SESIONES_SERVIDOR`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    SELECT puerto_sesion.UID_PUERTO_SESION,PUERTO_IMAGENES_UI,PUERTO_JOYSTICK_UI,PUERTO_CONTROL,PUERTO_SENSOR,PUERTO_VIDEO
    FROM puerto_sesion;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_SESIONES_SERVIDOR_v1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_SESIONES_SERVIDOR_v1`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    SELECT puerto_sesion.UID_PUERTO_SESION,PUERTO_IMAGENES_UI,PUERTO_JOYSTICK_UI,PUERTO_CONTROL,PUERTO_SENSOR,PUERTO_VIDEO,PUERTO_LATENCY,PUERTO_LATENCY_UI,PUERTO_SENSOR_UI
    FROM puerto_sesion;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_SESIONES_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_SESIONES_TELEOPS`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;
	IF (EXISTS ( SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_VEHICULO,SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
           sesion_teleops.UID_TELEOPERADOR,
           (SELECT teleoperador.NOMBRE_TELEOPERADOR FROM teleoperador WHERE teleoperador.UID_TELEOPERADOR = sesion_teleops.UID_TELEOPERADOR) AS TELEOPERADOR,
           (SELECT operador.NOMBRE_OPERADOR FROM operador WHERE operador.UID_OPERADOR=ruta.UID_OPERADOR) AS NOMBRE_OPERADOR,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS ) AS ESTATUS_VEHICULO,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = sesion_teleops.ID_ESTATUS) AS ESTATUS_SESION,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = puerto_sesion.ID_ESTATUS) AS ESTATUS_PUERTO,
           puerto_sesion.PUERTO_IMAGENES_UI,
           puerto_sesion.PUERTO_JOYSTICK_UI,
           puerto_sesion.PUERTO_CONTROL,
           puerto_sesion.PUERTO_SENSOR,
           puerto_sesion.PUERTO_VIDEO
		   FROM sesion_teleops,vehiculo,puerto_sesion, ruta
		   WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_VEHICULO = vehiculo.UID_VEHICULO AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION
           AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA)) THEN

		  /* SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_VEHICULO,SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
           sesion_teleops.UID_TELEOPERADOR,
           (SELECT teleoperador.NOMBRE_TELEOPERADOR FROM teleoperador WHERE teleoperador.UID_TELEOPERADOR = sesion_teleops.UID_TELEOPERADOR) AS TELEOPERADOR,
           (SELECT operador.NOMBRE_OPERADOR FROM operador WHERE operador.UID_OPERADOR=vehiculo.UID_OPERADOR) AS NOMBRE_OPERADOR,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS ) AS ESTATUS_VEHICULO,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = sesion_teleops.ID_ESTATUS) AS ESTATUS_SESION,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = puerto_sesion.ID_ESTATUS) AS ESTATUS_PUERTO,
           puerto_sesion.PUERTO_IMAGENES_UI,
           puerto_sesion.PUERTO_JOYSTICK_UI,
           puerto_sesion.PUERTO_CONTROL,
           puerto_sesion.PUERTO_SENSOR,
           puerto_sesion.PUERTO_VIDEO
		   FROM sesion_teleops,vehiculo,puerto_sesion
		   WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_VEHICULO = vehiculo.UID_VEHICULO AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION;*/
           SELECT sesion_teleops.UID_SESION_TELEOPS,sesion_teleops.UID_VEHICULO,SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
           sesion_teleops.UID_TELEOPERADOR,
           (SELECT teleoperador.NOMBRE_TELEOPERADOR FROM teleoperador WHERE teleoperador.UID_TELEOPERADOR = sesion_teleops.UID_TELEOPERADOR) AS TELEOPERADOR,
           (SELECT operador.NOMBRE_OPERADOR FROM operador WHERE operador.UID_OPERADOR=ruta.UID_OPERADOR) AS NOMBRE_OPERADOR,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS ) AS ESTATUS_VEHICULO,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = sesion_teleops.ID_ESTATUS) AS ESTATUS_SESION,
		   (SELECT DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = puerto_sesion.ID_ESTATUS) AS ESTATUS_PUERTO,
           puerto_sesion.PUERTO_IMAGENES_UI,
           puerto_sesion.PUERTO_JOYSTICK_UI,
           puerto_sesion.PUERTO_CONTROL,
           puerto_sesion.PUERTO_SENSOR,
           puerto_sesion.PUERTO_VIDEO
		   FROM sesion_teleops,vehiculo,puerto_sesion, ruta
		   WHERE sesion_teleops.ID_ESTATUS = 6 AND sesion_teleops.UID_VEHICULO = vehiculo.UID_VEHICULO AND sesion_teleops.UID_PUERTO_SESION=puerto_sesion.UID_PUERTO_SESION
           AND vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_SOLICITUDES_RUTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_SOLICITUDES_RUTA`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT UID_RUTA,GPS_LAT_FINAL,GPS_LON_FINAL,FECHA_INICIO,ID_RIDE_REQUEST_EXT,ID_SCOOTER_EXT
    FROM ruta
    WHERE ID_ESTATUS_SOLICITUD = 14;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_STATUS_STORAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_STATUS_STORAGE`(_idStorage INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	IF EXISTS (SELECT s.UID_STORAGE FROM storage s WHERE s.UID_STORAGE = _idStorage AND s.ID_ESTATUS = '30' AND s.UID_OPERADOR = (SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName)) THEN
		SELECT 1 AS ID_ESTATUS,'Storage disponible' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS, e.DESCRIPCION_ESTATUS
		FROM storage AS s1
			INNER JOIN estatus e on s1.ID_ESTATUS = e.ID_ESTATUS
		WHERE  s1.UID_STORAGE = _idStorage;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_STATUS_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_STATUS_VEHICULO`(_idVehiculo INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	IF EXISTS (SELECT v.UID_VEHICULO FROM vehiculo v WHERE v.UID_VEHICULO = _idVehiculo AND v.ID_ESTATUS = '3' AND v.ID_ESTATUS_CONEXION = '12') THEN
		SELECT 1 AS ID_ESTATUS,'Vehiculo conectado y disponible' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS, e.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTADO, r.DESCRIPCION_ESTATUS AS DESCRIPCION_CONEXION
		FROM vehiculo v
			INNER JOIN estatus e on v.ID_ESTATUS = e.ID_ESTATUS
			INNER JOIN estatus r on v.ID_ESTATUS_CONEXION = r.ID_ESTATUS
		WHERE  v.UID_VEHICULO = _idVehiculo;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_STORAGE_ESPECIFICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_STORAGE_ESPECIFICO`(_storageID INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

	IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _deliveryID) THEN
		SELECT -1 as ID_ESTATUS, 'Delivery run not found!';
	ELSE
		SELECT  s.UID_PAYLOAD AS DELIVERYID, 
				s.UID_STORAGE AS STORAGEID, 
				s.UID_VEHICULO AS UNITID,
				e.DESCRIPCION_ESTATUS AS STATE
		FROM storage AS s
		INNER JOIN estatus AS e
		ON s.ID_ESTATUS = e.ID_ESTATUS
		WHERE s.UID_STORAGE = _storageID AND s.UID_OPERADOR = (SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TELEOPERADORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TELEOPERADORES`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	SELECT DISTINCT teleoperador.UID_TELEOPERADOR, teleoperador.NOMBRE_TELEOPERADOR,teleoperador.EMAIL
    FROM teleoperador;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TODOS_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TODOS_EXTERNAL`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT 
		p.UID_OPERADOR, 
		p.REQUESTED_LATITUDE, 
		p.REQUESTED_LONGITUDE, 
		p.REQUESTED_DATETIME, 
		p.CLIENT_NAME, 
		p.CLIENT_EMAIL, 
		p.NOTES,
		p.LABEL,
		p.UID_RUTA,
		p.ID_ESTATUS AS STATUS_PAYLOAD,
		r.ID_ESTATUS_SOLICITUD AS STATUS_RUTA,
		st.UID_TELEOPERADOR,
		st.UID_SESION_TELEOPS,
		t.NOMBRE_TELEOPERADOR,
		p.UID_VEHICULO,
		v.UID_PHYSICAL,
		p.UID_PAYLOAD,
		p.`TYPE`,
		p.UID_STOP,
		p.UID_ASSIGMENT,
		p.UID_SHIPMENT,
		p.UID_CLIENT
	FROM payload as p
	LEFT JOIN ruta as r
	ON p.UID_RUTA = r.UID_RUTA
	LEFT JOIN sesion_teleops as st
	ON p.UID_SESION_TELEOPS = st.UID_SESION_TELEOPS
	LEFT JOIN teleoperador as t
	ON st.UID_TELEOPERADOR = t.UID_TELEOPERADOR
	LEFT JOIN vehiculo as v
	ON p.UID_VEHICULO = v.UID_VEHICULO
	WHERE p.ID_ESTATUS = 25 OR p.ID_ESTATUS = 26;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TODOS_PAYLOAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TODOS_PAYLOAD`(_operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT 	p.UID_PAYLOAD AS DELIVERYID,
			v.UID_VEHICULO AS UNITID,
			e.DESCRIPCION_ESTATUS AS STATE,
			p.REQUESTED_LATITUDE,
			p.REQUESTED_LONGITUDE,
			p.REQUESTED_DATETIME,
			p.START_LATITUDE,
			p.START_LONGITUDE,
			p.START_DATETIME,
			p.END_LATITUDE,
			p.END_LONGITUDE,
			p.END_DATETIME,
			ve.UBICACION_GPS_LAT AS VEHICLE_LATITUDE,
			ve.UBICACION_GPS_LON AS VEHICLE_LONGITUDE,
			GROUP_CONCAT(DISTINCT s.UID_STORAGE SEPARATOR ',') AS STORAGE
	FROM payload AS p
	INNER JOIN ruta AS r 
	ON p.UID_RUTA = r.UID_RUTA
	INNER JOIN vehiculo AS v
	ON p.UID_VEHICULO = v.UID_VEHICULO
	INNER JOIN estatus AS e
	ON p.ID_ESTATUS = e.ID_ESTATUS
	INNER JOIN vehiculo_estatus AS ve
	ON ve.ID_VEHICULO_ESTATUS = ( SELECT ID_VEHICULO_ESTATUS FROM vehiculo_estatus WHERE UID_VEHICULO = p.UID_VEHICULO LIMIT 1 )
	LEFT JOIN storage AS s
	ON p.UID_PAYLOAD = s.UID_PAYLOAD
	WHERE v.UID_OPERADOR = ( SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName)
	GROUP BY p.UID_PAYLOAD;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TODOS_STATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TODOS_STATION`(_operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	SELECT 	e.UID_ESTACION AS STATIONID,
			e.UBICACION_GPS_LAT AS LATITUDE,
			e.UBICACION_GPS_LON AS LONGITUDE,
			v.UID_VEHICULO AS UNITID,
			v.UID_PHYSICAL AS IMEI
	FROM estacion AS e
	INNER JOIN vehiculo AS v
		ON v.UID_ESTACION = e.UID_ESTACION
	WHERE e.UID_OPERADOR = ( SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TODOS_STORAGE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TODOS_STORAGE`(_operatorName VARCHAR(90))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    

	IF NOT EXISTS(SELECT UID_PAYLOAD FROM payload WHERE UID_PAYLOAD = _deliveryID) THEN
		SELECT -1 as ID_ESTATUS, 'Delivery run not found!';
	ELSE
		SELECT  s.UID_PAYLOAD AS DELIVERYID, 
				s.UID_STORAGE AS STORAGEID, 
				s.UID_VEHICULO AS UNITID,
				e.DESCRIPCION_ESTATUS AS STATE
		FROM storage AS s
		INNER JOIN estatus AS e
		ON s.ID_ESTATUS = e.ID_ESTATUS
		WHERE s.UID_OPERADOR = (SELECT UID_OPERADOR FROM operador WHERE NOMBRE_OPERADOR = _operatorName);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_TODOS_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_TODOS_VEHICULO`(_operatorName VARCHAR(90))
BEGIN
	DECLARE _idOperador INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
		SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
		SELECT UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
	
		SELECT 	v.UID_VEHICULO AS UNITID,
				v.UID_PHYSICAL AS IMEI,
				ve.NIVEL_BATERIA AS BATTERY,
				ve.UBICACION_GPS_LAT AS LATITUDE,
				ve.UBICACION_GPS_LON AS LONGITUDE,
				ve.GPS_ALTITUD AS ALTITUDE,
				e.DESCRIPCION_ESTATUS AS STATE,
				GROUP_CONCAT(DISTINCT p.UID_PAYLOAD SEPARATOR ',') AS DELIVERY,
				ve.FECHA_REGISTRO AS ReportedTS,
				GROUP_CONCAT(DISTINCT s.UID_STORAGE SEPARATOR ',') AS STORAGE
		FROM vehiculo AS v
		INNER JOIN vehiculo_estatus AS ve 
		ON v.UID_LAST_VEHICULO_ESTATUS = ve.ID_VEHICULO_ESTATUS
		INNER JOIN estatus AS e 
		ON v.ID_ESTATUS = e.ID_ESTATUS
		LEFT JOIN payload AS p 
		ON v.UID_VEHICULO = p.UID_VEHICULO AND ( p.ID_ESTATUS = 26 OR p.ID_ESTATUS = 25 )
		LEFT JOIN storage AS s
		ON v.UID_VEHICULO = s.UID_VEHICULO
		WHERE v.UID_OPERADOR = _idOperador
		GROUP BY v.UID_VEHICULO ;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_VEHICULOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_VEHICULOS`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT DISTINCT vehiculo.UID_VEHICULO,operador.NOMBRE_OPERADOR,vehiculo.CIUDAD,
	(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
    TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS) AS 'LAST_ESTATUS_UPDATE',
    TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION) AS 'LAST_CONNECTION_UPDATE',
    vehiculo.UID_PHYSICAL
    FROM vehiculo, operador
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OBTENER_VEHICULO_ESPECIFICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OBTENER_VEHICULO_ESPECIFICO`(_uidVehiculo INT,_operatorName VARCHAR(90))
BEGIN
	DECLARE _idOperador INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	IF NOT EXISTS(SELECT operador.UID_OPERADOR  FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName) THEN
		SELECT -1 as ID_ESTATUS, 'Operador no registrado';
	ELSE
		SELECT UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
		IF EXISTS(SELECT UID_VEHICULO FROM vehiculo WHERE UID_VEHICULO = _uidVehiculo AND UID_OPERADOR = _idOperador) THEN
			SELECT 	v.UID_VEHICULO AS UNITID,
					v.UID_PHYSICAL AS IMEI,
					ve.NIVEL_BATERIA AS BATTERY,
					ve.UBICACION_GPS_LAT AS LATITUDE,
					ve.UBICACION_GPS_LON AS LONGITUDE,
					ve.GPS_ALTITUD AS ALTITUDE,
					e.DESCRIPCION_ESTATUS AS STATE,
					GROUP_CONCAT(DISTINCT p.UID_PAYLOAD SEPARATOR ',') AS DELIVERY,
					ve.FECHA_REGISTRO AS ReportedTS,
					GROUP_CONCAT(DISTINCT s.UID_STORAGE SEPARATOR ',') AS STORAGE
			FROM vehiculo AS v
			INNER JOIN vehiculo_estatus AS ve 
			ON v.UID_LAST_VEHICULO_ESTATUS = ve.ID_VEHICULO_ESTATUS
			INNER JOIN estatus AS e 
			ON v.ID_ESTATUS = e.ID_ESTATUS
			LEFT JOIN payload AS p 
			ON v.UID_VEHICULO = p.UID_VEHICULO AND ( p.ID_ESTATUS = 26 OR p.ID_ESTATUS = 25 )
			LEFT JOIN storage AS s
			ON v.UID_VEHICULO = s.UID_VEHICULO
			WHERE v.UID_VEHICULO = _uidVehiculo
			GROUP BY v.UID_VEHICULO;
		ELSE
			SELECT -1 as ID_ESTATUS, 'Vehicle not found!';
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_CLEAR_PERMISSIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_CLEAR_PERMISSIONS`(_user_profile CHAR(8))
BEGIN
	DELETE FROM `user_profile_permissions` WHERE user_profile = _user_profile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_CREATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_CREATE`(_profile_name char(16))
BEGIN
	DECLARE _user_profile char(8);
	SET _user_profile = concat('p' , LEFT(UUID(), 7));
	INSERT INTO `user_profiles`(`user_profile`,`profile_name`)  VALUES(_user_profile, _profile_name); 
    
    IF ROW_COUNT() = 1 THEN
		SELECT * FROM `user_profiles` WHERE `user_profile` = _user_profile;
    ELSE
		SELECT 'ERROR' as error;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_DELETE`(_user_profile char(8))
BEGIN
	IF EXISTS  (SELECT `user_id` FROM `user` WHERE `user_profile` = _user_profile) THEN
		SELECT `user_id`,`user_email`,`user_name` FROM `user` WHERE `user_profile` = _user_profile;
    ELSE
		DELETE FROM `user_profile_permissions` WHERE `user_profile` = _user_profile;
        DELETE FROM `user_profiles` WHERE `user_profile` = _user_profile;
		SELECT '1' as success;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_GET`(_user_profile CHAR(8))
BEGIN
	SELECT * FROM `user_profiles` WHERE `user_profile` = _user_profile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_GET_PERMISSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_GET_PERMISSION`(_user_profile CHAR(8), _profile_permission CHAR(16))
BEGIN
	SELECT * FROM `user_profile_permissions` WHERE user_profile = _user_profile AND `profile_permission` = _profile_permission;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_LIST`()
BEGIN
	SELECT * FROM `user_profiles`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_LIST_PERMISSIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_LIST_PERMISSIONS`(_user_profile char(8))
BEGIN
	SELECT `profile_permission` as permission, `pos`, `val`,`low`,`high` FROM `user_profile_permissions` WHERE user_profile = _user_profile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROFILE_SET_PERMISSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PROFILE_SET_PERMISSION`(_user_profile CHAR(8), _permission CHAR(16), _pos INT,_val CHAR(16), _low CHAR(16), _high CHAR(16))
BEGIN
	INSERT INTO `user_profile_permissions`(`user_profile`,`profile_permission`,`pos`,`val`,`low`,`high`) 
			VALUES(_user_profile,_permission,_pos,_val,_low,_high);
	UPDATE `user_profiles` set `modified` = CURRENT_TIMESTAMP WHERE `user_profile` = _user_profile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `REGISTRAR_VEHICULO`(_idPhysical VARCHAR(50),_tipoVehiculo VARCHAR(50),_idExternal VARCHAR(50),_numCelular VARCHAR(50),_idOperador INT(11))
BEGIN

	DECLARE _idVehiculo INT(11);

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
		UPDATE vehiculo
        SET vehiculo.TIPO_VEHICULO = _tipoVehiculo,
			vehiculo.UID_EXTERNAL = _idExternal,
            vehiculo.NUM_CELULAR = _numCelular,
            vehiculo.UID_OPERADOR = _idOperador
        WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        
         SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
        SELECT 1 AS ID_ESTATUS,_idVehiculo AS UID_VEHICULO,'Vehiculo actualizado!' AS DESCRIPCION_ESTATUS;
	ELSE
		INSERT INTO vehiculo(TIPO_VEHICULO,UID_OPERADOR,CIUDAD,ID_ESTATUS,FECHA_ESTATUS,UID_PHYSICAL,ID_ESTATUS_CONEXION)
        VALUES(_tipoVehiculo,_idOperador,'No definida',3,NOW(),_idPhysical,12);/*Por default disponible para teleoperacion*/
        SELECT LAST_INSERT_ID() INTO _idVehiculo;
        
        SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
    
		INSERT INTO vehiculo_estatus(UID_VEHICULO, UBICACION_GPS_LAT,UBICACION_GPS_LON,GPS_ALTITUD, NIVEL_BATERIA, INTENSIDAD_RED,ERROR_BITRATE,FECHA_REGISTRO,BANDWIDTH)
		VALUES (_idVehiculo, 0, 0,0, 0, 0,0,NOW(),0);
        
        UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = LAST_INSERT_ID()
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;
        
        SELECT 1 AS ID_ESTATUS,_idVehiculo AS UID_VEHICULO,'Vehiculo registrado!' AS DESCRIPCION_ESTATUS;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCH_EMAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SEARCH_EMAIL`(_email VARCHAR(50))
BEGIN

    DECLARE _idOperador INT(11);

  	DECLARE EXIT HANDLER FOR SQLEXCEPTION

	

	BEGIN

		SHOW ERRORS;

		ROLLBACK;

		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;

	END;

    

   	select * from `user` WHERE user_email = _email;

		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SELECT_DEPLOY_VERSIONS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SELECT_DEPLOY_VERSIONS`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT dd.FECHA_DEPLOY, dd.VERSION_DEPLOY, dd.BINARIO_DEPLOY,  dd.BRAIN_DEPLOY, dd.IP_VEHICULO, dd.TIPO_VEHICULO
    FROM deploy_data AS dd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SESIONES_TELEOPS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SESIONES_TELEOPS`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	SELECT  *
    FROM sesion_teleops
    WHERE sesion_teleops.ID_ESTATUS=6 ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_ACTIVAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_ACTIVAS`(_idTeleoperador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
   /*vehiculos en progreso (con sesion iniciada previamente)*/
    SELECT DISTINCT vehiculo.UID_VEHICULO,ruta.ID_RIDE_REQUEST_EXT,operador.NOMBRE_OPERADOR,vehiculo.CIUDAD,
	(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
	IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS),'No disponible') AS LAST_ESTATUS_UPDATE,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
    vehiculo.UID_PHYSICAL,
    vehiculo.UID_LAST_RUTA,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL
    FROM vehiculo, operador,ruta,sesion_teleops
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_POR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_POR_CLIENTE`(id_operador INT, fecha1 DATETIME, fecha2 DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS total_solicitudes
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
    WHERE r.UID_OPERADOR = id_operador AND FECHA_INICIO BETWEEN fecha1 AND fecha2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_SEMANALES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_SEMANALES`(id_operador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS total_solicitudes_semanales
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND FECHA_INICIO >= NOW() + INTERVAL -7 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_SEMANALES_CANCELADAS_OPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_SEMANALES_CANCELADAS_OPERADOR`(id_operador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_semanales_canceladas_operador
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND UID_ESTATUS_FINALIZACION = '22'
	AND FECHA_INICIO >= NOW() + INTERVAL -7 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_SEMANALES_CANCELADAS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_SEMANALES_CANCELADAS_USUARIO`(id_operador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_semanales_canceladas_usuario
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND UID_ESTATUS_FINALIZACION = '21'
	AND FECHA_INICIO >= NOW() + INTERVAL -7 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_SEMANALES_TERMINADAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_SEMANALES_TERMINADAS`(id_operador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_completadas_semanales
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND UID_ESTATUS_FINALIZACION = '20'
	AND FECHA_INICIO >= NOW() + INTERVAL -7 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SOLICITUDES_TELEOPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SOLICITUDES_TELEOPERADOR`(_idTeleoperador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    /*Sesiones en progreso no muestra solicitudes abiertas*/
    IF (EXISTS(SELECT DISTINCT ruta.ID_RIDE_REQUEST_EXT,ruta.UID_RUTA,IFNULL(TIMEDIFF(NOW(),ruta.FECHA_INICIO),'No disponible') AS FECHA_INICIO, ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,operador.NOMBRE_OPERADOR, vehiculo.UID_VEHICULO AS UID_VEHICULO,ruta.ID_ESTATUS_SOLICITUD, SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL
				FROM vehiculo, operador,ruta,sesion_teleops
				WHERE ruta.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador))THEN

        SELECT DISTINCT ruta.ID_RIDE_REQUEST_EXT,ruta.UID_RUTA,IFNULL(TIMEDIFF(NOW(),ruta.FECHA_INICIO),'No disponible') AS FECHA_INICIO, ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,operador.NOMBRE_OPERADOR, vehiculo.UID_VEHICULO AS UID_VEHICULO,ruta.ID_ESTATUS_SOLICITUD, SUBSTRING(vehiculo.UID_PHYSICAL,-6)  AS UID_PHYSICAL
				FROM vehiculo, operador,ruta,sesion_teleops
				WHERE ruta.UID_OPERADOR=operador.UID_OPERADOR 
					AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA 
					AND ruta.ID_ESTATUS_SOLICITUD=15 
					AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS 
					AND sesion_teleops.ID_ESTATUS=6 
					AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador
        ORDER BY UID_PHYSICAL;
    
		ELSE /*Solicitudes en espera*/
    
		SELECT r.ID_RIDE_REQUEST_EXT, r.UID_RUTA, IFNULL(TIMEDIFF(NOW(),r.FECHA_INICIO),'No disponible') AS FECHA_INICIO, r.GPS_LAT_FINAL, r.GPS_LON_FINAL, o.NOMBRE_OPERADOR, IFNULL(v.UID_VEHICULO, 'No definido') as UID_VEHICULO, r.ID_ESTATUS_SOLICITUD, IFNULL(SUBSTRING(v.UID_PHYSICAL,-6), 'No definido') AS UID_PHYSICAL
		FROM ruta r
			INNER JOIN operador o ON o.UID_OPERADOR = r.UID_OPERADOR
			LEFT JOIN vehiculo v ON v.UID_LAST_RUTA = r.UID_RUTA
		WHERE r.ID_ESTATUS_SOLICITUD='14';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STATS_GET_STATS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `STATS_GET_STATS`(_startDate date,
						    _endDate date)
BEGIN
SELECT * FROM ruta WHERE 
(FECHA_INICIO BETWEEN _startDate AND _endDate) AND
 ( UID_ESTATUS_FINALIZACION = '20' OR 
   UID_ESTATUS_FINALIZACION = '21' OR 
   UID_ESTATUS_FINALIZACION = '22') 
   AND  UID_OPERADOR <> '4' 
   ORDER BY FECHA_INICIO ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STORAGE_EXTERNAL_LIST_AVAILABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `STORAGE_EXTERNAL_LIST_AVAILABLE`(_idUser CHAR(8))
BEGIN
	SELECT * FROM storage WHERE ID_ESTATUS  = 30 AND UID_OPERADOR = (SELECT UID_OPERADOR FROM user WHERE user_id = _idUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STORAGE_LIST_AVAILABLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `STORAGE_LIST_AVAILABLE`()
BEGIN
	SELECT * FROM `storage` WHERE ID_ESTATUS  = 30;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TELEOPERACIONES_CANCELADAS_OPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TELEOPERACIONES_CANCELADAS_OPERADOR`(id_operador INT, fecha1 DATETIME, fecha2 DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_canceladas_operador
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
    WHERE r.UID_OPERADOR = id_operador AND FECHA_FIN BETWEEN fecha1 AND fecha2 AND UID_ESTATUS_FINALIZACION = '22';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TELEOPERACIONES_CANCELADAS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TELEOPERACIONES_CANCELADAS_USUARIO`(id_operador INT, fecha1 DATETIME, fecha2 DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_canceladas_usuario
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
    WHERE r.UID_OPERADOR = id_operador AND FECHA_FIN BETWEEN fecha1 AND fecha2 AND UID_ESTATUS_FINALIZACION = '21';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TELEOPERACIONES_COMPLETADAS_POR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TELEOPERACIONES_COMPLETADAS_POR_CLIENTE`(id_operador INT, fecha1 DATETIME, fecha2 DATETIME)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT COUNT(*) AS teleoperaciones_completadas
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
    WHERE r.UID_OPERADOR = id_operador AND FECHA_FIN BETWEEN fecha1 AND fecha2 AND UID_ESTATUS_FINALIZACION = '20';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TELEOPREQUEST_CHECK_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TELEOPREQUEST_CHECK_EXTERNAL`(_external_id INT(11))
BEGIN
	SELECT ruta.UID_RUTA,  ruta.GPS_LAT_FINAL, ruta.GPS_LON_FINAL, ruta.FECHA_INICIO,
		ruta.ID_RIDE_REQUEST_EXT, ruta.UID_OPERADOR, ruta.ID_ESTATUS_SOLICITUD,
		vehiculo.UID_VEHICULO, vehiculo.UID_PHYSICAL,
        sesion_teleops.UID_TELEOPERADOR
		FROM `ruta`
		LEFT JOIN `vehiculo`
		ON vehiculo.UID_LAST_RUTA =  ruta.UID_RUTA
		LEFT JOIN `sesion_teleops`
		ON ruta.ID_RIDE_REQUEST_EXT = _external_id
		WHERE ruta.ID_RIDE_REQUEST_EXT = _external_id LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TELEOPREQUEST_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TELEOPREQUEST_LIST`()
BEGIN
	SELECT ruta.UID_RUTA,  ruta.GPS_LAT_FINAL, ruta.GPS_LON_FINAL, ruta.FECHA_INICIO,
		ruta.ID_RIDE_REQUEST_EXT, ruta.UID_OPERADOR, ruta.ID_ESTATUS_SOLICITUD,
		vehiculo.UID_VEHICULO, vehiculo.UID_PHYSICAL,
        sesion_teleops.UID_TELEOPERADOR
		FROM `ruta`
		LEFT JOIN `vehiculo`
		ON vehiculo.UID_LAST_RUTA =  ruta.UID_RUTA
		LEFT JOIN `sesion_teleops`
		ON sesion_teleops.UID_SESION_TELEOPS = vehiculo.UID_LAST_SESION_TELEOPS
		WHERE ruta.ID_ESTATUS_SOLICITUD=14 OR ruta.ID_ESTATUS_SOLICITUD=15
		ORDER BY FECHA_INICIO ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TIEMPO_ENTREGA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `TIEMPO_ENTREGA`(id_operador INT, _fecha DATETIME)
BEGIN
	DECLARE hora_inicio TIME;
    DECLARE hora_fin TIME;
    DECLARE _fecha_inicio DATETIME;
    DECLARE _fecha_fin DATETIME;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT FECHA_INICIO
    INTO _fecha_inicio
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND r.FECHA_INICIO BETWEEN _fecha AND _fecha;
    
    SELECT FECHA_FIN
    INTO _fecha_fin
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND r.FECHA_INICIO BETWEEN _fecha AND _fecha;
    
    SELECT TIME(`FECHA_INICIO`)
    INTO hora_inicio
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND r.FECHA_INICIO  = _fecha_inicio;
    
    SELECT TIME(`FECHA_FIN`)
    INTO hora_fin
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND r.FECHA_FIN = _fecha_fin;
    
    SELECT DISTINCT TIMEDIFF(hora_fin, hora_inicio) AS tiempo_entrega
	FROM ruta AS r
	JOIN operador AS o ON r.UID_OPERADOR = o.UID_OPERADOR
	WHERE r.UID_OPERADOR = id_operador AND (UID_ESTATUS_FINALIZACION = '20' OR 
	UID_ESTATUS_FINALIZACION = '21' OR 
	UID_ESTATUS_FINALIZACION = '22');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PASS_OPERATOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_PASS_OPERATOR`(_email VARCHAR(50),_passwordHash VARCHAR(100))
BEGIN

    DECLARE _user_name varchar(50);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

	

	BEGIN

		SHOW ERRORS;

		ROLLBACK;

		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;

	END;

	UPDATE teleops.`user` 

	SET `user_hash`= _passwordHash

	WHERE user_email = _email;

	

	UPDATE teleops.teleoperador 

	SET PASSWORD = _passwordHash

	WHERE EMAIL = _email;

		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_USER`(_email VARCHAR(50),_nombreOperador VARCHAR(50))
BEGIN

    DECLARE _user_name varchar(50);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION

	

	BEGIN

		SHOW ERRORS;

		ROLLBACK;

		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;

	END;

   	select user_name into _user_name from `user` WHERE user_email = _email;

   	

   	UPDATE teleops.operador

	SET NOMBRE_OPERADOR=_nombreOperador

	WHERE UID_OPERADOR=_user_name;

    

	UPDATE teleops.`user` 

	SET user_name = _nombreOperador

	WHERE user_email = _email;

	

	UPDATE teleops.teleoperador 

	SET NOMBRE_TELEOPERADOR = _nombreOperador

	WHERE EMAIL = _email;

		

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_VEHICLE_STATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `UPDATE_VEHICLE_STATION`(_uidVehicle INT, _uidStation INT, _operatorName VARCHAR(90))
BEGIN
	DECLARE _idOperador INT;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
	SELECT operador.UID_OPERADOR INTO _idOperador FROM operador WHERE operador.NOMBRE_OPERADOR = _operatorName;
    
	UPDATE vehiculo SET	UID_ESTACION = _uidStation WHERE UID_VEHICULO = _uidVehicle AND UID_OPERADOR = _idOperador;

 	SELECT 1 AS ID_ESTATUS,'Vehiculo modificado correctamente' AS DESCRIPCION_ESTATUS;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_CHPWD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_CHPWD`(_uid VARCHAR(100), _password VARCHAR(100))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    UPDATE teleoperador SET `PASSWORD` = _password
    WHERE teleoperador.UID_TELEOPERADOR = _uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_CREATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_CREATE`(_user_email CHAR(254) , _user_hash CHAR(64), _user_profile CHAR(8), _user_name CHAR(48))
BEGIN
	DECLARE _user_id char(8);
	SET _user_id = concat('u' , LEFT(UUID(), 7));
	INSERT INTO `user`(`user_id`,`user_email`,`user_hash`,`user_profile`,`user_name`)
          VALUES(_user_id, _user_email, _user_hash,_user_profile,_user_name); 
	
    IF ROW_COUNT() = 1 THEN
		SELECT * FROM `user` WHERE `user_id` = _user_id;
    ELSE
		SELECT 'ERROR' as error;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_ENDS_RIDE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_ENDS_RIDE`(_idPhysical VARCHAR(50))
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	START TRANSACTION;
    
    IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
		IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND (vehiculo.ID_ESTATUS=3 OR vehiculo.ID_ESTATUS=2)) THEN
			UPDATE vehiculo
			SET ID_ESTATUS=3
			WHERE vehiculo.UID_PHYSICAL = _idPhysical;
			
			SELECT 1 AS ID_ESTATUS, 'Vehiculo termino viaje de usuario' AS DESCRIPCION_ESTATUS;
		ELSE
			SELECT 3 AS ID_ESTATUS, 'Vehiculo en teleoperacion o no disponible' AS DESCRIPCION_ESTATUS;
        END IF;
	ELSE
		SELECT 2 AS ID_ESTATUS, 'Id de vehiculo no registrado' AS DESCRIPCION_ESTATUS;
    END IF;
        
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_GET`(_user_id CHAR(8))
BEGIN
	SELECT * FROM `user`
    WHERE `user_id` = _user_id LIMIT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_GET_BY_EMAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_GET_BY_EMAIL`(_email CHAR(254))
BEGIN
	SELECT `user_id`,`user_email`,`user_hash`,`user_profile`,`user_name`, `UID_TELEOPERADOR`  FROM `user`
    LEFT OUTER JOIN `teleoperador` ON `EMAIL` = `user_email`
    WHERE `user_email` = _email LIMIT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_LIST`()
BEGIN
	SELECT `user_id`,`user_email`,`user_profile`, `user_name` , `UID_TELEOPERADOR`, `created`,`modified`
    FROM `user`
    LEFT JOIN teleoperador ON `user_email` = `EMAIL`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_LOGIN`(_email VARCHAR(100))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    /* Este procedimiento solo se debe utilizar cuando los passwords utilizan algoritmo brcyrpt
	   Si se utiliza otro tipode hash, quizas no sea seguro hacer select al campo password.
    */
    SELECT user.user_id, user.user_hash as 'PASSWORD', user.user_name, user.user_profile, user.user_email as 'EMAIL' , teleoperador.UID_TELEOPERADOR  FROM `user` 
    LEFT OUTER JOIN  teleoperador on  user.user_email  = teleoperador.EMAIL
    WHERE user.user_email = _email LIMIT 1; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_SET_PROFILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_SET_PROFILE`(_user_id CHAR(8),_profile CHAR(8))
BEGIN
	UPDATE `user` SET `user_profile` = _profile WHERE `user_id` = _user_id;
    SELECT ROW_COUNT()  as affected_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USER_STARTS_RIDE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `USER_STARTS_RIDE`(_idPhysical VARCHAR(50))
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	START TRANSACTION;
	IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
		IF EXISTS(SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND (vehiculo.ID_ESTATUS=3 OR vehiculo.ID_ESTATUS=2)) THEN
			UPDATE vehiculo
			SET ID_ESTATUS=2
			WHERE vehiculo.UID_PHYSICAL = _idPhysical;

			SELECT 1 AS ID_ESTATUS, 'Vehiculo inicio viaje de usuario' AS DESCRIPCION_ESTATUS;
		ELSE
			SELECT 3 AS ID_ESTATUS, 'Vehiculo en teleoperacion o no disponible' AS DESCRIPCION_ESTATUS;
        END IF;
	ELSE
		SELECT 2 AS ID_ESTATUS, 'Id de vehiculo no registrado' AS DESCRIPCION_ESTATUS;
	END IF;

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_ALL_TELEOPERATION_SESION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_ALL_TELEOPERATION_SESION`(_idPhysical VARCHAR(50), _skip int, _numPerPage int)
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
    
   		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL=_idPhysical;
       
   		SELECT 1 AS ID_ESTATUS, st.UID_SESION_TELEOPS, tl.NOMBRE_TELEOPERADOR, es.DESCRIPCION_ESTATUS, st.FECHA_INICIO_SESION, st.FECHA_FIN_SESION 
   		FROM sesion_teleops st
   		INNER JOIN teleoperador AS tl
			ON st.UID_TELEOPERADOR = tl.UID_TELEOPERADOR 
		INNER JOIN estatus AS es
			ON st.ID_ESTATUS = es.ID_ESTATUS
   		WHERE st.UID_VEHICULO=_idVehiculo 
   		ORDER BY UID_SESION_TELEOPS DESC
   		LIMIT _skip,_numPerPage;
   		
   	ELSE 
       
   		SELECT -1 AS ID_ESTATUS,'SCOOTER WITH PROVIDED IMEI NOT FOUND' AS DESCRIPCION_ESTATUS;
   	
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_EDITOR_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_EDITOR_GET`(_uid int)
BEGIN
	SELECT UID_OPERADOR, TIPO_VEHICULO, CIUDAD, NUM_CELULAR FROM vehiculo WHERE UID_VEHICULO = _uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_EDITOR_SAVE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_EDITOR_SAVE`(_uid int, _tipo char(50), _uid_operador int, _ciudad CHAR(100), _num_celular char(50))
BEGIN
	UPDATE vehiculo SET TIPO_VEHICULO = _tipo, UID_OPERADOR = _uid_operador, CIUDAD = _ciudad, NUM_CELULAR = _num_celular WHERE UID_VEHICULO = _uid;
    SELECT UID_OPERADOR, TIPO_VEHICULO, CIUDAD, NUM_CELULAR FROM vehiculo WHERE UID_VEHICULO = _uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_EXTERNAL_STORAGE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_EXTERNAL_STORAGE_LIST`(_idUser CHAR(8))
BEGIN
	SELECT v.UID_VEHICULO, v.UID_OPERADOR, v.UID_PHYSICAL, ve.UBICACION_GPS_LAT AS 'LAT', ve.UBICACION_GPS_LON AS 'LON', ve.NIVEL_BATERIA, 0, 0 AS 'STORAGE_COUNT'
	FROM vehiculo AS v
	INNER JOIN vehiculo_estatus AS ve
		ON ve.ID_VEHICULO_ESTATUS = v.UID_LAST_VEHICULO_ESTATUS
	WHERE v.TIPO_VEHICULO = 'Wagon' AND v.ID_ESTATUS = 3 AND v.UID_OPERADOR = (SELECT UID_OPERADOR FROM user WHERE user_id = _idUser);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_GET_IMEI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_GET_IMEI`(_idVehiculo INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN		
		SHOW ERRORS;

	END;
	SELECT UID_PHYSICAL AS IMEI FROM vehiculo WHERE UID_VEHICULO = _idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_GET_IP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_GET_IP`(_uid_vehiculo INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
   SELECT INET_NTOA(IP_ADDRESS) AS ip
			FROM vehiculo
			WHERE vehiculo.UID_VEHICULO = _uid_vehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_HEARTBEAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_HEARTBEAT`(_ipAddress VARCHAR(64), _idPhysical VARCHAR(50),_gpslat DOUBLE, _gpslon DOUBLE,_altitud DOUBLE, _nivelbateria INT, _nivel_red INT, _error_bitrate INT,_bandwidth INT, _versionBrain VARCHAR(50), _versionFirmware VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
		UPDATE vehiculo
        SET vehiculo.ID_ESTATUS_CONEXION = 12,
			vehiculo.FECHA_ESTATUS_CONEXION = NOW(),
            vehiculo.VERSION_BRAIN = _versionBrain,
            vehiculo.VERSION_FIRMWARE = _versionFirmware,
            vehiculo.IP_ADDRESS = INET_ATON(_ipAddress)
        WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        
	ELSE
		INSERT INTO vehiculo(TIPO_VEHICULO,UID_OPERADOR,CIUDAD,ID_ESTATUS,FECHA_ESTATUS,UID_PHYSICAL,ID_ESTATUS_CONEXION)
        VALUES('No definido',1,'No definida',3,NOW(),_idPhysical,12);/*Por default disponible para teleoperacion*/
        SELECT LAST_INSERT_ID() INTO _idVehiculo;
        
       
    END IF;
    
    SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
    
    INSERT INTO vehiculo_estatus(UID_VEHICULO, UBICACION_GPS_LAT,UBICACION_GPS_LON,GPS_ALTITUD, NIVEL_BATERIA, INTENSIDAD_RED,ERROR_BITRATE,FECHA_REGISTRO,BANDWIDTH)
    VALUES (_idVehiculo, _gpslat, _gpslon,_altitud, _nivelbateria, _nivel_red,_error_bitrate,NOW(),_bandwidth);
    
    /*Si tiene valores validos de lectura de gps y bateria*/
    
	UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = LAST_INSERT_ID()
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;

    
    /*Si el vehiculo tiene ruta, regresar el destino*/
    IF (EXISTS(SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA)) THEN
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    ELSE
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
			vehiculo.UID_EXTERNAL,0 AS DISTANCE_KM
			FROM vehiculo, estatus,ruta
			WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
					vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_HEARTBEAT_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_HEARTBEAT_UPDATE`(_ipAddress VARCHAR(64), _idPhysical VARCHAR(50),_gpslat DOUBLE, _gpslon DOUBLE,_altitud DOUBLE, _nivelbateria INT, _nivel_red INT, _error_bitrate INT,_bandwidth INT, _versionBrain VARCHAR(50), _versionFirmware VARCHAR(50), _module_connected INT, _sim INT, _gps_fixed INT, _camera_front INT, _camera_back INT, _performance INT, _video_client_connection INT, _video_frame_set INT, _sensor_client_connection INT, _sensor_buffer_sent INT, _control_client_connection INT, _control_buffer_received INT)
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
		UPDATE vehiculo
        SET vehiculo.ID_ESTATUS_CONEXION = 12,
			vehiculo.FECHA_ESTATUS_CONEXION = NOW(),
            vehiculo.VERSION_BRAIN = _versionBrain,
            vehiculo.VERSION_FIRMWARE = _versionFirmware,
            vehiculo.IP_ADDRESS = INET_ATON(_ipAddress)
        WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        
	ELSE
		INSERT INTO vehiculo(TIPO_VEHICULO,UID_OPERADOR,CIUDAD,ID_ESTATUS,FECHA_ESTATUS,UID_PHYSICAL,ID_ESTATUS_CONEXION)
        VALUES('No definido',1,'No definida',3,NOW(),_idPhysical,12);/*Por default disponible para teleoperacion*/
        SELECT LAST_INSERT_ID() INTO _idVehiculo;
        
       
    END IF;
    
    SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
    
    IF (EXISTS(SELECT vehiculo_estatus.ID_VEHICULO_ESTATUS FROM vehiculo_estatus 
    		   WHERE vehiculo_estatus.UID_VEHICULO =_idVehiculo)) THEN
    		   
   		SET @update_id := 0;
		
   		UPDATE vehiculo_estatus SET 
			UBICACION_GPS_LAT = _gpslat,
			UBICACION_GPS_LON = _gpslon,
			GPS_ALTITUD = _altitud,
			NIVEL_BATERIA = _nivelbateria,
			INTENSIDAD_RED = _nivel_red,
			ERROR_BITRATE = _error_bitrate,
			FECHA_REGISTRO = NOW(),
			BANDWIDTH = _bandwidth,
			MODULE_CONNECTED = _module_connected,
			SIM = _sim,
			GPS_FIXED = _gps_fixed,
			CAMERA_FRONT = _camera_front,
			CAMERA_BACK = _camera_back,
			PERFORMANCE = _performance,
			VIDEO_CLIENT_CONNECTION = _video_client_connection,
			VIDEO_FRAME_SENT = _video_frame_set,
			SENSOR_CLIENT_CONNECTION = _sensor_client_connection,
			SENSOR_BUFFER_SENT = _sensor_buffer_sent,
			CONTROL_CLIENT_CONNECTION = _control_client_connection,
			CONTROL_BUFFER_RECEIVED = _control_buffer_received,
			ID_VEHICULO_ESTATUS = (SELECT @update_id := ID_VEHICULO_ESTATUS)
		WHERE UID_VEHICULO = _idVehiculo LIMIT 1; 
    	
    	UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = @update_id
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;
    
    ELSE
		
    	INSERT INTO vehiculo_estatus(UID_VEHICULO, UBICACION_GPS_LAT,UBICACION_GPS_LON,GPS_ALTITUD, NIVEL_BATERIA, INTENSIDAD_RED,ERROR_BITRATE,FECHA_REGISTRO,BANDWIDTH, MODULE_CONNECTED, SIM, GPS_FIXED, CAMERA_FRONT, CAMERA_BACK, PERFORMANCE, VIDEO_CLIENT_CONNECTION, VIDEO_FRAME_SENT, SENSOR_CLIENT_CONNECTION, SENSOR_BUFFER_SENT, CONTROL_CLIENT_CONNECTION, CONTROL_BUFFER_RECEIVED)
    	VALUES (_idVehiculo, _gpslat, _gpslon,_altitud, _nivelbateria, _nivel_red,_error_bitrate, NOW(), _bandwidth, _module_connected, _sim, _gps_fixed, _camera_front, _camera_back, _performance, _video_client_connection, _video_frame_set, _sensor_client_connection, _sensor_buffer_sent, _control_client_connection, _control_buffer_received);
    
    	UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = LAST_INSERT_ID()
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;
    
    END IF;
    
    /*Si el vehiculo tiene ruta, regresar el destino*/
    IF (EXISTS(SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA)) THEN
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    ELSE
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
			vehiculo.UID_EXTERNAL,0 AS DISTANCE_KM
			FROM vehiculo, estatus,ruta
			WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
					vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_IP_LOOKUP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_IP_LOOKUP`(_ipAddress VARCHAR(64))
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
   SELECT UID_VEHICULO, UID_PHYSICAL, FECHA_ESTATUS
			FROM vehiculo
			WHERE vehiculo.IP_ADDRESS = INET_ATON(_ipAddress);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_LIST`()
BEGIN
SELECT  
    vehiculo.UID_VEHICULO AS uid,
    vehiculo.TIPO_VEHICULO AS 'type',
	vehiculo.UID_PHYSICAL AS IMEI,
    vehiculo.UID_EXTERNAL AS externalUid,
    vehiculo.ID_ESTATUS AS statusId,
    vehiculo_estatus.NIVEL_BATERIA AS battery,
	vehiculo_estatus.UBICACION_GPS_LAT as gps_lat,
	vehiculo_estatus.UBICACION_GPS_LON as gps_lon,
    vehiculo_estatus.GPS_ALTITUD as gps_alt,
    vehiculo_estatus.FECHA_REGISTRO as status_timestamp,
    vehiculo.CIUDAD AS city,
    vehiculo.UID_OPERADOR AS operatorId,
    operador.NOMBRE_OPERADOR AS operatorName,
    vehiculo.VERSION_BRAIN AS brainVersion,
    vehiculo.VERSION_FIRMWARE as firmwareVersion,
    vehiculo.REMOTEIT_DEVICENAME as remoteItDeviceName
    FROM vehiculo
    LEFT OUTER JOIN vehiculo_estatus ON vehiculo.UID_LAST_VEHICULO_ESTATUS =  vehiculo_estatus.ID_VEHICULO_ESTATUS
    LEFT OUTER JOIN operador ON vehiculo.UID_OPERADOR=operador.UID_OPERADOR
    WHERE vehiculo.ID_ESTATUS!=1
    GROUP BY vehiculo.UID_VEHICULO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_LIST_SERVER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_LIST_SERVER`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT  
    vehiculo.UID_VEHICULO AS uid,
    vehiculo.TIPO_VEHICULO AS 'type',
	vehiculo.UID_PHYSICAL AS IMEI,
    vehiculo.UID_EXTERNAL AS iotCode,
    vehiculo.CIUDAD AS city,
    vehiculo.NUM_CELULAR AS mobileNumber,
    vehiculo.UID_OPERADOR AS operatorId,
    vehiculo.UID_ESTACION AS operatorId,
    operador.NOMBRE_OPERADOR AS operatorName,
    servidor.IP_SERVIDOR as serverIP,
    servidor.DOMINIO as serverDomain
    
    FROM vehiculo, operador,servidor, vehiculo_estatus
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.ID_ESTATUS!=1  AND vehiculo.UID_SERVIDOR = servidor.UID_SERVIDOR AND vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS
    GROUP BY vehiculo.UID_VEHICULO;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_PREREGISTER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_PREREGISTER`(_imei CHAR(50), _ip CHAR(32))
BEGIN	
	DECLARE _ip_n int(11) UNsigned;
    SET _ip_n = INET_ATON(_ip);
    INSERT INTO vehiculo (`TIPO_VEHICULO`,`UID_OPERADOR`,`ID_ESTATUS`,`UID_PHYSICAL`,`ID_ESTATUS_CONEXION`,`IP_ADDRESS`) 
    VALUES ('NEW','5','3',_imei,'12',_ip_n);
    
    SELECT
    vehiculo.UID_VEHICULO AS uid,
	vehiculo.UID_PHYSICAL AS IMEI,
    vehiculo.UID_EXTERNAL AS externalUid,
    vehiculo.ID_ESTATUS AS statusId,
    vehiculo_estatus.NIVEL_BATERIA AS battery,
	vehiculo_estatus.UBICACION_GPS_LAT as gps_lat,
	vehiculo_estatus.UBICACION_GPS_LON as gps_lon,
    vehiculo_estatus.GPS_ALTITUD as gps_alt,
    vehiculo_estatus.FECHA_REGISTRO as status_timestamp,
    vehiculo.CIUDAD AS city,
    vehiculo.UID_OPERADOR AS operatorId,
    operador.NOMBRE_OPERADOR AS operatorName,
    vehiculo.VERSION_BRAIN AS brainVersion,
    vehiculo.VERSION_FIRMWARE as firmwareVersion
    
    FROM vehiculo
    LEFT OUTER JOIN vehiculo_estatus ON vehiculo_estatus.ID_VEHICULO_ESTATUS = vehiculo.UID_LAST_VEHICULO_ESTATUS
    LEFT OUTER JOIN operador ON vehiculo.UID_OPERADOR=operador.UID_OPERADOR
    WHERE vehiculo.UID_PHYSICAL = _imei
    GROUP BY vehiculo.UID_VEHICULO;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_SET_REMOTEIT_DEVICENAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_SET_REMOTEIT_DEVICENAME`(_idVehiculo INT, _devicename char(32))
BEGIN
	UPDATE `vehiculo` SET `REMOTEIT_DEVICENAME` = _devicename WHERE `UID_VEHICULO` = _idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_STATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_STATUS`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	START TRANSACTION;

        SELECT  vehiculo.UID_VEHICULO,
        vehiculo.ID_ESTATUS,
		vehiculo.UID_PHYSICAL AS UID_PHYSICAL,
        vehiculo_estatus.ID_VEHICULO_ESTATUS,
		vehiculo_estatus.NIVEL_BATERIA,
		vehiculo_estatus.UBICACION_GPS_LAT,
        vehiculo_estatus.UBICACION_GPS_LON,
        IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION
  
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.ID_ESTATUS <> 1 AND vehiculo.ID_ESTATUS_CONEXION = 12 AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS
        ORDER BY vehiculo.UID_PHYSICAL;

				
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_STORAGE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_STORAGE_LIST`()
BEGIN
	SELECT `vehiculo`.UID_VEHICULO, `vehiculo`.UID_OPERADOR, `vehiculo`.UID_PHYSICAL,
    `vehiculo_estatus`.UBICACION_GPS_LAT AS 'LAT', `vehiculo_estatus`.UBICACION_GPS_LON AS 'LON',
    `vehiculo_estatus`.NIVEL_BATERIA,
    0, 0 AS 'STORAGE_COUNT'
    FROM `vehiculo`
    INNER JOIN `vehiculo_estatus` ON `vehiculo_estatus`.ID_VEHICULO_ESTATUS = `vehiculo`.UID_LAST_VEHICULO_ESTATUS
  /*  LEFT OUTER JOIN `storage` ON `vehiculo`.UID_VEHICULO = `storage`.UID_VEHICULO*/
    WHERE `vehiculo`.TIPO_VEHICULO = 'Wagon' AND `vehiculo`.ID_ESTATUS = 3 
    /*GROUP BY `storage`.ID_ESTATUS;*/ ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICLE_TELEOPERATION_SESION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICLE_TELEOPERATION_SESION`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical AND vehiculo.ID_ESTATUS='5')) THEN
    
   		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL=_idPhysical;
       
   		SELECT 1 AS ID_ESTATUS, UID_SESION_TELEOPS FROM sesion_teleops WHERE UID_VEHICULO=_idVehiculo ORDER BY UID_SESION_TELEOPS DESC LIMIT 1;
      	
        
	ELSEIF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
	
		SELECT -1 AS ID_ESTATUS,'SCOOTER NOT IN A TELEOPERATION SESION' AS DESCRIPCION_ESTATUS;
        
   	ELSE 
       
   		SELECT -2 AS ID_ESTATUS,'SCOOTER WITH PROVIDED IMEI NOT FOUND' AS DESCRIPCION_ESTATUS;
   	
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULE_UPDATE_ALARM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULE_UPDATE_ALARM`(_idPhysical VARCHAR(50),_alarm_status INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		/*ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;*/
	END;
    
    IF EXISTS (SELECT * FROM vehiculo WHERE UID_PHYSICAL = _idPhysical) THEN
		UPDATE vehiculo
        SET ALARM_STATUS = _alarm_status
        WHERE vehiculo.UID_PHYSICAL = _idPhysical;
		
		SELECT 1 AS ID_ESTATUS, 'Debug mode actualizado correctamente' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT 2 AS ID_ESTATUS,'Id vehiculo no encontrado' AS DESCRIPCION_ESTATUS;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULOS_DISPONIBLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULOS_DISPONIBLES`()
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	START TRANSACTION;
		
        
        SELECT  vehiculo.UID_VEHICULO,
		SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
        vehiculo_estatus.ID_VEHICULO_ESTATUS,
		vehiculo_estatus.NIVEL_BATERIA,
		vehiculo_estatus.UBICACION_GPS_LAT,
        vehiculo_estatus.UBICACION_GPS_LON,
        IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION
  
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.ID_ESTATUS=3 AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS
        ORDER BY vehiculo.UID_PHYSICAL;
       /* AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0;*/
        
       /* (SELECT vehiculo_estatus.ID_VEHICULO_ESTATUS
        FROM vehiculo_estatus 
        WHERE vehiculo_estatus.UID_VEHICULO = vehiculo.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0 AND vehiculo_estatus.NIVEL_BATERIA!=0 AND vehiculo_estatus.NIVEL_BATERIA<=100
        GROUP BY vehiculo_estatus.UID_VEHICULO
        ORDER BY FECHA_REGISTRO DESC)
        GROUP BY vehiculo.UID_VEHICULO;*/
        
        /*SELECT  vehiculo.UID_VEHICULO,
		SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
        vehiculo_estatus.ID_VEHICULO_ESTATUS,
		vehiculo_estatus.NIVEL_BATERIA,
		vehiculo_estatus.UBICACION_GPS_LAT,
        vehiculo_estatus.UBICACION_GPS_LON,
        IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION
  
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.ID_ESTATUS=3 AND vehiculo_estatus.ID_VEHICULO_ESTATUS IN
        (SELECT vehiculo_estatus.ID_VEHICULO_ESTATUS
        FROM vehiculo_estatus 
        WHERE vehiculo_estatus.UID_VEHICULO = vehiculo.UID_VEHICULO AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0 AND vehiculo_estatus.NIVEL_BATERIA!=0 AND vehiculo_estatus.NIVEL_BATERIA<=100
        GROUP BY vehiculo_estatus.UID_VEHICULO
        ORDER BY FECHA_REGISTRO DESC)
        GROUP BY vehiculo.UID_VEHICULO;*/
        
        /*SELECT vehiculo.UID_VEHICULO,vehiculo.UID_PHYSICAL,
        vehiculo.ID_ESTATUS,

         IF(EXISTS(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0),(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),'NA') AS NIVEL_BATERIA,
		IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LAT,
		IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LON,
		IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION

		FROM vehiculo
		WHERE vehiculo.ID_ESTATUS=3;
		*/
				
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULOS_REGISTRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULOS_REGISTRO`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
	
     SELECT  
	SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
	vehiculo.UID_VEHICULO,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL,
    estatus.DESCRIPCION_ESTATUS AS ESTATUS_VEHICULO,
    vehiculo_estatus.NIVEL_BATERIA,
	vehiculo_estatus.UBICACION_GPS_LAT,
	vehiculo_estatus.UBICACION_GPS_LON,

    vehiculo.CIUDAD,
    operador.NOMBRE_OPERADOR,
    operador.FABRICANTE,
    operador.MODELO,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
	IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION,
    vehiculo.VERSION_BRAIN,
    vehiculo.VERSION_FIRMWARE
    
    FROM vehiculo, operador, vehiculo_estatus, estatus
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.ID_ESTATUS!=1  AND estatus.ID_ESTATUS = vehiculo.ID_ESTATUS AND vehiculo_estatus.ID_VEHICULO_ESTATUS = vehiculo.UID_LAST_VEHICULO_ESTATUS /*IN
		(SELECT vehiculo_estatus.ID_VEHICULO_ESTATUS
		FROM vehiculo_estatus
		WHERE vehiculo_estatus.UID_VEHICULO = vehiculo.UID_VEHICULO  AND vehiculo_estatus.UBICACION_GPS_LAT!=0 AND vehiculo_estatus.UBICACION_GPS_LON!=0 AND vehiculo_estatus.NIVEL_BATERIA!=0 AND vehiculo_estatus.NIVEL_BATERIA<=100
		GROUP BY vehiculo_estatus.UID_VEHICULO
        ORDER BY FECHA_REGISTRO DESC)*/
       
    GROUP BY UID_VEHICULO
    ORDER BY UID_VEHICULO;
    
    
    /*SELECT DISTINCT 
	SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,
	vehiculo.UID_VEHICULO,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    IF(EXISTS(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0),(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),'NA') AS NIVEL_BATERIA,
	IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LAT,
	IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LON,
   
    vehiculo.CIUDAD,
    operador.NOMBRE_OPERADOR,
    operador.FABRICANTE,
    operador.MODELO,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
	IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION
    FROM vehiculo, operador
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.ID_ESTATUS!=1
    ORDER BY UID_PHYSICAL;*/
   /* SELECT DISTINCT vehiculo.UID_VEHICULO,
    vehiculo.UID_PHYSICAL,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    IF(EXISTS(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0),(SELECT vehiculo_estatus.NIVEL_BATERIA FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND NIVEL_BATERIA!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),'NA') AS NIVEL_BATERIA,
	IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LAT FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LAT!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LAT,
	IF(EXISTS(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0),(SELECT vehiculo_estatus.UBICACION_GPS_LON FROM vehiculo_estatus WHERE vehiculo_estatus.UID_VEHICULO=vehiculo.UID_VEHICULO AND UBICACION_GPS_LON!=0 ORDER BY FECHA_REGISTRO DESC LIMIT 1),0) AS UBICACION_GPS_LON,
   
    vehiculo.CIUDAD,
    operador.NOMBRE_OPERADOR,
    operador.FABRICANTE,
    operador.MODELO,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
	IF(TIME_TO_SEC(TIMEDIFF(NOW(), vehiculo.FECHA_ESTATUS_CONEXION))<500,12,13) AS ESTATUS_CONEXION
    FROM vehiculo, operador
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.ID_ESTATUS!=1;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULOS_RUTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULOS_RUTAS`()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT DISTINCT vehiculo.UID_VEHICULO,operador.NOMBRE_OPERADOR,vehiculo.CIUDAD,
	(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
    vehiculo.UID_PHYSICAL
    FROM vehiculo, operador
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.ID_ESTATUS_REGISTRO=15;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULOS_SOLICITUD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULOS_SOLICITUD`()
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	START TRANSACTION;
		/*SELECT vehiculo.UID_VEHICULO,SUBSTRING(vehiculo.UID_PHYSICAL,-6) AS UID_PHYSICAL,vehiculo_estatus.ID_VEHICULO_ESTATUS,MAX(vehiculo_estatus.FECHA_REGISTRO) AS LAST_VALID_DATETIME,vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON
		FROM vehiculo,vehiculo_estatus
		WHERE vehiculo.ID_ESTATUS=3 OR vehiculo.ID_ESTATUS=2 AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS
		GROUP BY vehiculo.UID_VEHICULO;*/
        SELECT vehiculo.UID_VEHICULO,vehiculo.UID_PHYSICAL
		FROM vehiculo
		WHERE vehiculo.ID_ESTATUS=3 OR vehiculo.ID_ESTATUS=2
        ORDER BY UID_PHYSICAL;
		
				
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULOS_TELEOPERADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULOS_TELEOPERADOR`(_idTeleoperador INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
	SELECT DISTINCT vehiculo.UID_VEHICULO,ruta.ID_RIDE_REQUEST_EXT,operador.NOMBRE_OPERADOR,vehiculo.CIUDAD,
	(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS),'No disponible') AS LAST_ESTATUS_UPDATE,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
    vehiculo.UID_PHYSICAL,
    vehiculo.UID_LAST_RUTA,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL,
    CASE WHEN EXISTS (SELECT ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON FROM ruta,vehiculo_estatus WHERE ruta.UID_RUTA=vehiculo.UID_LAST_RUTA AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS) THEN
		(SELECT 111.111 *
				DEGREES(ACOS(LEAST(1.0, COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LAT))
					 * COS(RADIANS(ruta.GPS_LAT_FINAL))
					 * COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LON - ruta.GPS_LON_FINAL))
					 + SIN(RADIANS(vehiculo_estatus.UBICACION_GPS_LAT))
					 * SIN(RADIANS(ruta.GPS_LAT_FINAL))))) AS DISTANCE_KM FROM ruta,vehiculo_estatus WHERE ruta.UID_RUTA=vehiculo.UID_LAST_RUTA AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS)
		ELSE
			'No disponible'
		END AS DISTANCIA
    FROM vehiculo, operador,ruta
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA AND ruta.ID_ESTATUS_SOLICITUD=14
    UNION/*Vehiculos con solicitud y vehiculos en progreso (con sesion iniciada previamente)*/
    SELECT DISTINCT vehiculo.UID_VEHICULO,ruta.ID_RIDE_REQUEST_EXT,operador.NOMBRE_OPERADOR,vehiculo.CIUDAD,
	(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
	IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS),'No disponible') AS LAST_ESTATUS_UPDATE,
    IFNULL(TIMEDIFF(NOW(),vehiculo.FECHA_ESTATUS_CONEXION),'No disponible') AS LAST_CONNECTION_UPDATE,
    vehiculo.UID_PHYSICAL,
    vehiculo.UID_LAST_RUTA,
    IFNULL(vehiculo.UID_EXTERNAL,'No disponible') AS UID_EXTERNAL,
    CASE WHEN EXISTS (SELECT ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL,vehiculo_estatus.UBICACION_GPS_LAT,vehiculo_estatus.UBICACION_GPS_LON FROM ruta,vehiculo_estatus WHERE ruta.UID_RUTA=vehiculo.UID_LAST_RUTA AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS) THEN
		(SELECT 111.111 *
				DEGREES(ACOS(LEAST(1.0, COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LAT))
					 * COS(RADIANS(ruta.GPS_LAT_FINAL))
					 * COS(RADIANS(vehiculo_estatus.UBICACION_GPS_LON - ruta.GPS_LON_FINAL))
					 + SIN(RADIANS(vehiculo_estatus.UBICACION_GPS_LAT))
					 * SIN(RADIANS(ruta.GPS_LAT_FINAL))))) AS DISTANCE_KM FROM ruta,vehiculo_estatus WHERE ruta.UID_RUTA=vehiculo.UID_LAST_RUTA AND vehiculo.UID_LAST_VEHICULO_ESTATUS=vehiculo_estatus.ID_VEHICULO_ESTATUS)
		ELSE
			'No disponible'
		END AS DISTANCIA
    FROM vehiculo, operador,ruta,sesion_teleops
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_LAST_RUTA=ruta.UID_RUTA AND ruta.ID_ESTATUS_SOLICITUD=15 AND vehiculo.UID_LAST_SESION_TELEOPS = sesion_teleops.UID_SESION_TELEOPS AND sesion_teleops.ID_ESTATUS=6 AND sesion_teleops.UID_TELEOPERADOR=_idTeleoperador;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_DETALLE`(_idVehiculo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    SELECT DISTINCT vehiculo.UID_VEHICULO,
    vehiculo.UID_PHYSICAL,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
    (SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
    vehiculo.CIUDAD,
    INET_NTOA(vehiculo.IP_ADDRESS) AS IP,
    operador.UID_OPERADOR,
    operador.NOMBRE_OPERADOR,
    operador.FABRICANTE,
    operador.MODELO
    FROM vehiculo, operador
    WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_VEHICULO=_idVehiculo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_DETALLE_W_ESTATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_DETALLE_W_ESTATUS`(_idVehiculo INT)
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

		/*SELECT DISTINCT vehiculo.UID_VEHICULO,
		vehiculo.UID_PHYSICAL,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS) AS ESTATUS_VEHICULO,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = vehiculo.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
		vehiculo.CIUDAD,
        IFNULL(vehiculo.NUM_CELULAR,0) AS NUM_CELULAR,
		operador.NOMBRE_OPERADOR,
        vehiculo_estatus.FECHA_REGISTRO,
        INET_NTOA(IFNULL(vehiculo.IP_ADDRESS,0)) AS IP,
		IFNULL(vehiculo_estatus.MODULE_CONNECTED,0) AS MODULE_CONNECTED,
		IFNULL(vehiculo_estatus.SIM,0) AS SIM,
		IFNULL(vehiculo_estatus.GPS_FIXED,0) AS GPS_FIXED,
		IFNULL(vehiculo_estatus.CAMERA_FRONT,0) AS CAMERA_FRONT,
		IFNULL(vehiculo_estatus.CAMERA_BACK,0) AS CAMERA_BACK,
		IFNULL(vehiculo_estatus.VIDEO_CLIENT_CONNECTION,0) AS VIDEO_CLIENT_CONNECTION,
		IFNULL(vehiculo_estatus.VIDEO_FRAME_SENT,0) AS VIDEO_FRAME_SENT,
		IFNULL(vehiculo_estatus.SENSOR_CLIENT_CONNECTION,0) AS SENSOR_CLIENT_CONNECTION,
		IFNULL(vehiculo_estatus.SENSOR_BUFFER_SENT,0) AS SENSOR_BUFFER_SENT,
		IFNULL(vehiculo_estatus.CONTROL_CLIENT_CONNECTION,0) AS CONTROL_CLIENT_CONNECTION,
		IFNULL(vehiculo_estatus.CONTROL_BUFFER_RECEIVED,0) AS CONTROL_BUFFER_RECEIVED
		FROM vehiculo, operador, vehiculo_estatus
		WHERE vehiculo.UID_OPERADOR=operador.UID_OPERADOR AND vehiculo.UID_VEHICULO=_idVehiculo AND vehiculo_estatus.ID_VEHICULO_ESTATUS = vehiculo.UID_LAST_VEHICULO_ESTATUS;*/
		
	SELECT DISTINCT v.UID_VEHICULO,
		v.UID_PHYSICAL,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = v.ID_ESTATUS) AS ESTATUS_VEHICULO,
		(SELECT estatus.DESCRIPCION_ESTATUS FROM estatus WHERE estatus.ID_ESTATUS = v.ID_ESTATUS_CONEXION) AS ESTATUS_CONEXION,
		v.CIUDAD,
        IFNULL(v.NUM_CELULAR,0) AS NUM_CELULAR,
		o.NOMBRE_OPERADOR,
        ve.FECHA_REGISTRO,
        v.REMOTEIT_DEVICENAME AS remoteit,
        INET_NTOA(IFNULL(v.IP_ADDRESS,0)) AS IP,
		IFNULL(ve.MODULE_CONNECTED,0) AS MODULE_CONNECTED,
		IFNULL(ve.SIM,0) AS SIM,
		IFNULL(ve.GPS_FIXED,0) AS GPS_FIXED,
		IFNULL(ve.CAMERA_FRONT,0) AS CAMERA_FRONT,
		IFNULL(ve.CAMERA_BACK,0) AS CAMERA_BACK,
		IFNULL(ve.VIDEO_CLIENT_CONNECTION,0) AS VIDEO_CLIENT_CONNECTION,
		IFNULL(ve.VIDEO_FRAME_SENT,0) AS VIDEO_FRAME_SENT,
		IFNULL(ve.SENSOR_CLIENT_CONNECTION,0) AS SENSOR_CLIENT_CONNECTION,
		IFNULL(ve.SENSOR_BUFFER_SENT,0) AS SENSOR_BUFFER_SENT,
		IFNULL(ve.CONTROL_CLIENT_CONNECTION,0) AS CONTROL_CLIENT_CONNECTION,
		IFNULL(ve.CONTROL_BUFFER_RECEIVED,0) AS CONTROL_BUFFER_RECEIVED,
		IFNULL(vi.CONNECTED_VPN,-1) AS vpnConnected,
		IFNULL(vi.IP_VPN,0) AS vpnIp
		FROM vehiculo v
		LEFT JOIN operador o ON o.UID_OPERADOR = v.UID_OPERADOR
		LEFT JOIN vehiculo_estatus ve ON ve.ID_VEHICULO_ESTATUS = v.UID_LAST_VEHICULO_ESTATUS 
		LEFT JOIN vpn_information vi ON vi.NAME_VPN = v.UID_PHYSICAL
		WHERE v.UID_VEHICULO=_idVehiculo;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_GET_HEARTBEAT_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_GET_HEARTBEAT_EXTERNAL`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
        SELECT DISTINCT vehiculo.UID_VEHICULO AS id_vehicle,vehiculo.UID_EXTERNAL AS iot_code,_idPhysical AS imei,IF(estatus.ID_ESTATUS=3,1,0) AS scooter_status, NIVEL_BATERIA AS battery_level,INTENSIDAD_RED AS network_signal,CHARGING_STATUS AS charge_status
		FROM vehiculo, vehiculo_estatus,estatus
		WHERE vehiculo.UID_PHYSICAL=_idPhysical AND
        vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS AND
        vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS,'Imei Vehicle not registered' AS DESCRIPCION_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_GET_IMEI_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_GET_IMEI_EXTERNAL`(_idExternal VARCHAR(50))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_EXTERNAL=_idExternal)) THEN
       SELECT UID_PHYSICAL AS IMEI FROM vehiculo WHERE UID_EXTERNAL = _idExternal;
	ELSE
		SELECT -1 AS ID_ESTATUS,'External code not registered' AS DESCRIPCION_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_GET_POSITIONING_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_GET_POSITIONING_EXTERNAL`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
        SELECT DISTINCT vehiculo.UID_VEHICULO AS id_vehicle,vehiculo.UID_EXTERNAL AS iot_code,_idPhysical AS imei,'A' AS positioning_status, UBICACION_GPS_LAT AS latitude,UBICACION_GPS_LON AS longitude,GPS_SIGNAL AS gps_signal
		FROM vehiculo, vehiculo_estatus,estatus
		WHERE vehiculo.UID_PHYSICAL=_idPhysical AND
        vehiculo.UID_LAST_VEHICULO_ESTATUS = vehiculo_estatus.ID_VEHICULO_ESTATUS AND
        vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS,'Imei Vehicle not registered' AS DESCRIPCION_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_HEARTBEAT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_HEARTBEAT`(_idVehicle INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_VEHICULO=_idVehicle)) THEN
		UPDATE vehiculo
        SET vehiculo.ID_ESTATUS_CONEXION = 12,
			vehiculo.FECHA_ESTATUS_CONEXION = NOW()
        WHERE vehiculo.UID_VEHICULO=_idVehicle;
        
        SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS
		FROM vehiculo, estatus
		WHERE vehiculo.UID_VEHICULO=_idVehicle AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS,'ID Vehiculo no registrado' AS DESCRIPCION_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_HEARTBEAT_EXTERNAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_HEARTBEAT_EXTERNAL`(_idExternal VARCHAR(50), _nivelbateria INT, _nivel_red INT,_charging_status INT,_gpsFixed INT,_gpslat DOUBLE, _gpslon DOUBLE,_gpsSignal INT)
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
   
    SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_EXTERNAL = _idExternal;
    
    IF (EXISTS(SELECT vehiculo_estatus.ID_VEHICULO_ESTATUS FROM vehiculo_estatus 
    		   WHERE vehiculo_estatus.UID_VEHICULO =_idVehiculo)) THEN
    		   
   		SET @update_id := 0;
   		UPDATE vehiculo_estatus SET 
			NIVEL_BATERIA = _nivelbateria,
			INTENSIDAD_RED = _nivel_red,
			FECHA_REGISTRO = NOW(),
			CHARGING_STATUS = _charging_status,
            GPS_FIXED=_gpsFixed,
            GPS_SIGNAL = _gpsSignal,
            UBICACION_GPS_LAT=_gpsLat,
            UBICACION_GPS_LON=_gpsLon,
			ID_VEHICULO_ESTATUS = (SELECT @update_id := ID_VEHICULO_ESTATUS)
		WHERE UID_VEHICULO = _idVehiculo LIMIT 1; 
    	
    	UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = @update_id
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;
        SELECT 1 AS ID_ESTATUS,'Vehicle status registered' AS DESCRIPCION_ESTATUS;
	ELSE
		SELECT -1 AS ID_ESTATUS,'ID Vehiculo no registrado' AS DESCRIPCION_ESTATUS;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_HEARTBEAT_MAC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_HEARTBEAT_MAC`(_idPhysical VARCHAR(50),_gpslat DOUBLE, _gpslon DOUBLE,_altitud DOUBLE, _nivelbateria INT, _nivel_red INT, _error_bitrate INT,_bandwidth INT, _versionBrain VARCHAR(50), _versionFirmware VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    
    IF (EXISTS (SELECT * FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical)) THEN
		UPDATE vehiculo
        SET vehiculo.ID_ESTATUS_CONEXION = 12,
			vehiculo.FECHA_ESTATUS_CONEXION = NOW(),
            vehiculo.VERSION_BRAIN = _versionBrain,
            vehiculo.VERSION_FIRMWARE = _versionFirmware
        WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        SELECT vehiculo.UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE vehiculo.UID_PHYSICAL=_idPhysical;
        
	ELSE
		INSERT INTO vehiculo(TIPO_VEHICULO,UID_OPERADOR,CIUDAD,ID_ESTATUS,FECHA_ESTATUS,UID_PHYSICAL,ID_ESTATUS_CONEXION)
        VALUES('No definido',1,'No definida',3,NOW(),_idPhysical,12);/*Por default disponible para teleoperacion*/
        SELECT LAST_INSERT_ID() INTO _idVehiculo;
        
       
    END IF;
    
    SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical;
    
    INSERT INTO vehiculo_estatus(UID_VEHICULO, UBICACION_GPS_LAT,UBICACION_GPS_LON,GPS_ALTITUD, NIVEL_BATERIA, INTENSIDAD_RED,ERROR_BITRATE,FECHA_REGISTRO,BANDWIDTH)
    VALUES (_idVehiculo, _gpslat, _gpslon,_altitud, _nivelbateria, _nivel_red,_error_bitrate,NOW(),_bandwidth);
    
    /*Si tiene valores validos de lectura de gps y bateria*/
    
	UPDATE vehiculo SET UID_LAST_VEHICULO_ESTATUS = LAST_INSERT_ID()
		WHERE vehiculo.UID_VEHICULO=_idVehiculo;

    
    /*Si el vehiculo tiene ruta, regresar el destino*/
    IF (EXISTS(SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA)) THEN
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
		vehiculo.UID_EXTERNAL,ruta.GPS_LAT_FINAL,ruta.GPS_LON_FINAL
		FROM vehiculo, estatus,ruta
		WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
				vehiculo.ID_ESTATUS=estatus.ID_ESTATUS AND
                vehiculo.UID_LAST_RUTA = ruta.UID_RUTA;
    ELSE
		SELECT DISTINCT vehiculo.UID_VEHICULO,estatus.ID_ESTATUS,estatus.DESCRIPCION_ESTATUS AS DESCRIPCION_ESTATUS,
			vehiculo.UID_EXTERNAL,0 AS DISTANCE_KM
			FROM vehiculo, estatus,ruta
			WHERE vehiculo.UID_VEHICULO=_idVehiculo AND
					vehiculo.ID_ESTATUS=estatus.ID_ESTATUS;
    END IF;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_ICCID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_ICCID`(_idPhysical VARCHAR(50))
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;
    SELECT vehiculo.SIM_ICCID AS iccid
    FROM vehiculo
    WHERE UID_PHYSICAL = _idPhysical;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_IMEI_ESTADO_DISPONIBLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_IMEI_ESTADO_DISPONIBLE`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	IF (EXISTS (SELECT UID_VEHICULO FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND ID_ESTATUS = 2)) THEN
		
		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND ID_ESTATUS = 2;
		
		UPDATE vehiculo
	    SET vehiculo.ID_ESTATUS = 3,
	    vehiculo.FECHA_ESTATUS= NOW()
	    WHERE vehiculo.UID_VEHICULO=_idVehiculo;
	    
	   	SELECT 1 AS ID_ESTATUS, 'Estatus de vehiculo actualizado' AS DESCRIPCION_ESTATUS;
	   
	ELSE
	    
		SELECT -1 AS ID_ESTATUS, 'Estatus de vehiculo no actualizado' AS DESCRIPCION_ESTATUS;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VEHICULO_IMEI_ESTADO_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `VEHICULO_IMEI_ESTADO_USUARIO`(_idPhysical VARCHAR(50))
BEGIN
	DECLARE _idVehiculo INT(11);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		/*SHOW ERRORS;*/
		ROLLBACK;
		SELECT 0 AS ID_ESTATUS,'Error en SQL Procedure' AS DESCRIPCION_ESTATUS;
	END;

	IF (EXISTS (SELECT UID_VEHICULO FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND ID_ESTATUS = 3)) THEN
		
		SELECT UID_VEHICULO INTO _idVehiculo FROM vehiculo WHERE UID_PHYSICAL = _idPhysical AND ID_ESTATUS = 3;
		
		UPDATE vehiculo
	    SET vehiculo.ID_ESTATUS = 2,
	    vehiculo.FECHA_ESTATUS= NOW()
	    WHERE vehiculo.UID_VEHICULO=_idVehiculo;
	    
	   	SELECT 1 AS ID_ESTATUS, 'Estatus de vehiculo actualizado' AS DESCRIPCION_ESTATUS;
	   
	ELSE
	    
		SELECT -1 AS ID_ESTATUS, 'Estatus de vehiculo no actualizado' AS DESCRIPCION_ESTATUS;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 13:51:55
