-- MySQL dump 10.13  Distrib 5.6.20, for osx10.9 (x86_64)
--
-- Host: localhost    Database: mocla
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `aud`
--

DROP TABLE IF EXISTS `aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(100) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img_tiene_notas_idx` (`nota_id`),
  CONSTRAINT `aud_belongs_to_notes` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud`
--

LOCK TABLES `aud` WRITE;
/*!40000 ALTER TABLE `aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clip`
--

DROP TABLE IF EXISTS `clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clip` (
  `id` int(11) NOT NULL,
  `description` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clip`
--

LOCK TABLES `clip` WRITE;
/*!40000 ALTER TABLE `clip` DISABLE KEYS */;
/*!40000 ALTER TABLE `clip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clip_colabs`
--

DROP TABLE IF EXISTS `clip_colabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clip_colabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clip_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clip_has_colabs_idx` (`usuario_id`),
  KEY `user_colab_clip_idx` (`clip_id`),
  CONSTRAINT `clip_has_colabs` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_colab_clip` FOREIGN KEY (`clip_id`) REFERENCES `clip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clip_colabs`
--

LOCK TABLES `clip_colabs` WRITE;
/*!40000 ALTER TABLE `clip_colabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `clip_colabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clips_tiene_notas`
--

DROP TABLE IF EXISTS `clips_tiene_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clips_tiene_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notas_id` int(11) DEFAULT NULL,
  `clip_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clip_has_notes_idx` (`notas_id`),
  KEY `notes_belongs_to_clip_idx` (`clip_id`),
  CONSTRAINT `clip_has_notes` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notes_belongs_to_clip` FOREIGN KEY (`clip_id`) REFERENCES `clip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clips_tiene_notas`
--

LOCK TABLES `clips_tiene_notas` WRITE;
/*!40000 ALTER TABLE `clips_tiene_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `clips_tiene_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuaderno`
--

DROP TABLE IF EXISTS `cuaderno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuaderno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `diseno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuaderno_tiene_portada_idx` (`diseno_id`),
  CONSTRAINT `cuaderno_tiene_portada` FOREIGN KEY (`diseno_id`) REFERENCES `portada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuaderno`
--

LOCK TABLES `cuaderno` WRITE;
/*!40000 ALTER TABLE `cuaderno` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuaderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseno`
--

DROP TABLE IF EXISTS `diseno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diseno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) DEFAULT NULL,
  `disenador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `design_has_designer_idx` (`disenador_id`),
  CONSTRAINT `design_has_designer` FOREIGN KEY (`disenador_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseno`
--

LOCK TABLES `diseno` WRITE;
/*!40000 ALTER TABLE `diseno` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `evaluacion` float DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `note_has_evaluation_idx` (`nota_id`),
  KEY `evaluator_idx` (`usuario_id`),
  CONSTRAINT `evaluator` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `note_has_evaluation` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desripcion` varchar(200) DEFAULT 'Evento',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_tiene_notas`
--

DROP TABLE IF EXISTS `evento_tiene_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento_tiene_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_id` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `note_belongs_to_event_idx` (`nota_id`),
  KEY `event_has_notes_idx` (`evento_id`),
  CONSTRAINT `event_has_notes` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `note_belongs_to_event` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_tiene_notas`
--

LOCK TABLES `evento_tiene_notas` WRITE;
/*!40000 ALTER TABLE `evento_tiene_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento_tiene_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `moderador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_has_moderator_idx` (`moderador`),
  CONSTRAINT `group_has_moderator` FOREIGN KEY (`moderador`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(100) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img_tiene_notas_idx` (`nota_id`),
  CONSTRAINT `img_tiene_notas` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librero`
--

DROP TABLE IF EXISTS `librero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libero_pertencece_usuario_idx` (`user_id`),
  CONSTRAINT `libero_pertencece_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librero`
--

LOCK TABLES `librero` WRITE;
/*!40000 ALTER TABLE `librero` DISABLE KEYS */;
/*!40000 ALTER TABLE `librero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librero_colabs`
--

DROP TABLE IF EXISTS `librero_colabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librero_colabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `librero_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_colab_librero_idx` (`librero_id`),
  KEY `librerio_has_colabs_idx` (`usuario_id`),
  CONSTRAINT `librerio_has_colabs` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_colab_librero` FOREIGN KEY (`librero_id`) REFERENCES `librero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librero_colabs`
--

LOCK TABLES `librero_colabs` WRITE;
/*!40000 ALTER TABLE `librero_colabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `librero_colabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librero_tiene_cuaderno`
--

DROP TABLE IF EXISTS `librero_tiene_cuaderno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librero_tiene_cuaderno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `librero_id` int(11) DEFAULT NULL COMMENT '	',
  `cuaderno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mocla_has_notebook1_idx` (`cuaderno_id`),
  KEY `notebook_belongs_to_bookrack_idx` (`librero_id`),
  CONSTRAINT `bookrack_has_notebook` FOREIGN KEY (`cuaderno_id`) REFERENCES `cuaderno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notebook_belongs_to_bookrack` FOREIGN KEY (`librero_id`) REFERENCES `librero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librero_tiene_cuaderno`
--

LOCK TABLES `librero_tiene_cuaderno` WRITE;
/*!40000 ALTER TABLE `librero_tiene_cuaderno` DISABLE KEYS */;
/*!40000 ALTER TABLE `librero_tiene_cuaderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mocla`
--

DROP TABLE IF EXISTS `mocla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mocla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diseno_id` int(11) DEFAULT NULL,
  `capacity` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mocla_tiene_usuario_idx` (`user_id`),
  KEY `mocla_tiene_diseno_idx` (`diseno_id`),
  CONSTRAINT `mocla_tiene_diseno` FOREIGN KEY (`diseno_id`) REFERENCES `diseno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mocla_tiene_usuario` FOREIGN KEY (`user_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mocla`
--

LOCK TABLES `mocla` WRITE;
/*!40000 ALTER TABLE `mocla` DISABLE KEYS */;
/*!40000 ALTER TABLE `mocla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mocla_tiene_cuaderno`
--

DROP TABLE IF EXISTS `mocla_tiene_cuaderno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mocla_tiene_cuaderno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mocla_id` int(11) DEFAULT NULL COMMENT '	',
  `cuaderno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notebook_belongs_to_mocla_idx` (`mocla_id`),
  KEY `mocla_has_notebook_idx` (`cuaderno_id`),
  CONSTRAINT `mocla_has_notebook` FOREIGN KEY (`cuaderno_id`) REFERENCES `cuaderno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notebook_belongs_to_mocla` FOREIGN KEY (`mocla_id`) REFERENCES `mocla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mocla_tiene_cuaderno`
--

LOCK TABLES `mocla_tiene_cuaderno` WRITE;
/*!40000 ALTER TABLE `mocla_tiene_cuaderno` DISABLE KEYS */;
/*!40000 ALTER TABLE `mocla_tiene_cuaderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `titulo` longtext,
  `cuaderno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_pertenece_cuaderno_idx` (`cuaderno_id`),
  CONSTRAINT `nota_pertenece_cuaderno` FOREIGN KEY (`cuaderno_id`) REFERENCES `cuaderno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portada`
--

DROP TABLE IF EXISTS `portada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) DEFAULT NULL,
  `disenador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portada`
--

LOCK TABLES `portada` WRITE;
/*!40000 ALTER TABLE `portada` DISABLE KEYS */;
/*!40000 ALTER TABLE `portada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'user'),(2,'designer'),(3,'developer'),(4,'teacher'),(5,'GOD');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(65) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '	',
  `password` varchar(255) DEFAULT NULL COMMENT '					',
  `tipo_id` int(11) DEFAULT NULL,
  `profile_pic` varchar(200) DEFAULT '/assets/img/default.png',
  `fb_id` varchar(50) DEFAULT NULL,
  `tw_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usario_tiene_tipo_idx` (`tipo_id`),
  CONSTRAINT `usario_tiene_tipo` FOREIGN KEY (`tipo_id`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'pepepistolas','pepe@pistolas.com','0210',1,'/assets/img/default.png',NULL,NULL),(4,'the_Saideitor_122','diego.210@hotmail.es','0210',1,'/assets/img/default.png','10201496462973922',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_comparte_nota_usuario`
--

DROP TABLE IF EXISTS `usuario_comparte_nota_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_comparte_nota_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_has_note_idx` (`nota_id`),
  KEY `user_shares_note_idx` (`usuario_id`),
  CONSTRAINT `shared_note` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_shares_note` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_comparte_nota_usuario`
--

LOCK TABLES `usuario_comparte_nota_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_comparte_nota_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_comparte_nota_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tiene_grupo`
--

DROP TABLE IF EXISTS `usuario_tiene_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_tiene_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL COMMENT '	',
  `grupo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_belongs_to_group_idx` (`grupo_id`),
  KEY `group_has_user_idx` (`usuario_id`),
  CONSTRAINT `group_has_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_belongs_to_group` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tiene_grupo`
--

LOCK TABLES `usuario_tiene_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_tiene_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tiene_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vid`
--

DROP TABLE IF EXISTS `vid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(100) DEFAULT NULL,
  `nota_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `img_tiene_notas_idx` (`nota_id`),
  CONSTRAINT `vid_tiene_notas` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vid`
--

LOCK TABLES `vid` WRITE;
/*!40000 ALTER TABLE `vid` DISABLE KEYS */;
/*!40000 ALTER TABLE `vid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-26  0:53:38
