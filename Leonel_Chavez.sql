CREATE DATABASE  IF NOT EXISTS `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `alumnosporcarrera`
--

DROP TABLE IF EXISTS `alumnosporcarrera`;
/*!50001 DROP VIEW IF EXISTS `alumnosporcarrera`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnosporcarrera` AS SELECT 
 1 AS `Carrera`,
 1 AS `Cantidad de estudiantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `alumnospormateria`
--

DROP TABLE IF EXISTS `alumnospormateria`;
/*!50001 DROP VIEW IF EXISTS `alumnospormateria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alumnospormateria` AS SELECT 
 1 AS `Materia`,
 1 AS `Cantidad de estudiantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cantidaddeaprobadospormateria`
--

DROP TABLE IF EXISTS `cantidaddeaprobadospormateria`;
/*!50001 DROP VIEW IF EXISTS `cantidaddeaprobadospormateria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cantidaddeaprobadospormateria` AS SELECT 
 1 AS `Materia`,
 1 AS `Cantidad de aprobados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cantidaddecursospormateria`
--

DROP TABLE IF EXISTS `cantidaddecursospormateria`;
/*!50001 DROP VIEW IF EXISTS `cantidaddecursospormateria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cantidaddecursospormateria` AS SELECT 
 1 AS `Materia`,
 1 AS `Cantidad de cursos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cantidaddedesaprobadospormateria`
--

DROP TABLE IF EXISTS `cantidaddedesaprobadospormateria`;
/*!50001 DROP VIEW IF EXISTS `cantidaddedesaprobadospormateria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cantidaddedesaprobadospormateria` AS SELECT 
 1 AS `Materia`,
 1 AS `Cantidad de desaprobados`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `codigo_carrera` int unsigned NOT NULL,
  `carrera` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Ingenieria en Sistemas'),(2,'Ingenieria Quimica '),(3,'Ingenieria Mecanica'),(4,'Ingenieria Civil'),(5,'Ingenieria Industrial'),(6,'Ingenieria Electronica'),(7,'Ingenieria Textil'),(8,'Ingenieria Mecatronica'),(9,'Ingenieria Aeronautica'),(10,'Ingenieria Electrica'),(11,'Ingenieria Naval');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catedra`
--

DROP TABLE IF EXISTS `catedra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catedra` (
  `codigo_de_catedra` int unsigned NOT NULL AUTO_INCREMENT,
  `legajo_docente` int unsigned NOT NULL,
  `catedra` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_de_catedra`),
  KEY `catedra_docente` (`legajo_docente`),
  CONSTRAINT `catedra_docente` FOREIGN KEY (`legajo_docente`) REFERENCES `docente` (`legajo_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catedra`
--

LOCK TABLES `catedra` WRITE;
/*!40000 ALTER TABLE `catedra` DISABLE KEYS */;
INSERT INTO `catedra` VALUES (1,14,'Analisis Matematico 1'),(2,14,'Analisis Matematico 2'),(3,13,'Matematica Discreta'),(4,4,'Sistemas y Organizaciones'),(5,11,'Matematica Superior'),(6,10,'Algebra');
/*!40000 ALTER TABLE `catedra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `codigo_de_curso` int unsigned NOT NULL AUTO_INCREMENT,
  `legajo_docente` int unsigned NOT NULL,
  `codigo_de_catedra` int unsigned NOT NULL,
  `fecha_de_inicio` date DEFAULT NULL,
  PRIMARY KEY (`codigo_de_curso`),
  KEY `curso_docente` (`legajo_docente`),
  KEY `curso_catedra` (`codigo_de_catedra`),
  CONSTRAINT `curso_catedra` FOREIGN KEY (`codigo_de_catedra`) REFERENCES `catedra` (`codigo_de_catedra`),
  CONSTRAINT `curso_docente` FOREIGN KEY (`legajo_docente`) REFERENCES `docente` (`legajo_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,3,1,'2022-03-01'),(2,5,1,'2022-07-04'),(3,8,1,'2022-04-01'),(4,6,2,'2022-03-01'),(5,9,2,'2022-07-01'),(6,11,3,'2022-03-01'),(7,12,3,'2022-07-01'),(8,2,4,'2022-03-01'),(9,4,4,'2022-03-01'),(10,12,5,'2022-03-01'),(11,13,5,'2022-07-07'),(12,7,6,'2022-03-15'),(13,10,6,'2022-07-17');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_estudiante`
--

DROP TABLE IF EXISTS `curso_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_estudiante` (
  `codigo_de_curso` int unsigned NOT NULL,
  `legajo_estudiante` int unsigned NOT NULL,
  PRIMARY KEY (`codigo_de_curso`,`legajo_estudiante`),
  KEY `legajo_de_estudiante` (`legajo_estudiante`),
  CONSTRAINT `codigo_de_curso` FOREIGN KEY (`codigo_de_curso`) REFERENCES `curso` (`codigo_de_curso`),
  CONSTRAINT `legajo_de_estudiante` FOREIGN KEY (`legajo_estudiante`) REFERENCES `estudiante` (`legajo_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_estudiante`
--

LOCK TABLES `curso_estudiante` WRITE;
/*!40000 ALTER TABLE `curso_estudiante` DISABLE KEYS */;
INSERT INTO `curso_estudiante` VALUES (1,1),(5,1),(6,1),(8,1),(10,1),(12,1),(1,2),(5,2),(6,2),(8,2),(10,2),(12,2),(1,3),(5,3),(12,3),(1,4),(5,4),(6,4),(8,4),(10,4),(12,4),(1,5),(5,5),(12,5),(1,6),(5,6),(12,6),(1,7),(5,7),(12,7),(1,8),(5,8),(12,8),(1,9),(5,9),(6,9),(8,9),(10,9),(12,9),(1,10),(5,10),(12,10),(1,11),(5,11),(12,11),(1,12),(5,12),(12,12),(1,13),(5,13),(12,13),(1,14),(5,14),(6,14),(8,14),(10,14),(12,14),(1,15),(5,15),(12,15),(1,16),(5,16),(12,16),(1,17),(5,17),(12,17),(1,18),(5,18),(12,18),(1,19),(5,19),(6,19),(8,19),(10,19),(12,19),(1,20),(5,20),(12,20),(1,21),(5,21),(12,21),(1,22),(5,22),(12,22),(1,23),(5,23),(12,23),(1,24),(5,24),(12,24),(1,25),(5,25),(12,25),(1,26),(5,26),(12,26),(1,27),(5,27),(12,27),(1,28),(5,28),(12,28),(1,29),(5,29),(6,29),(8,29),(10,29),(12,29),(1,30),(5,30),(12,30),(2,31),(5,31),(13,31),(2,32),(5,32),(13,32),(2,33),(5,33),(13,33),(2,34),(5,34),(13,34),(2,35),(5,35),(13,35),(2,36),(5,36),(13,36),(2,37),(4,37),(13,37),(2,38),(4,38),(6,38),(8,38),(10,38),(13,38),(2,39),(4,39),(13,39),(2,40),(4,40),(13,40),(2,41),(4,41),(13,41),(2,42),(4,42),(13,42),(2,43),(4,43),(7,43),(9,43),(11,43),(13,43),(2,44),(4,44),(7,44),(9,44),(11,44),(13,44),(2,45),(4,45),(13,45),(2,46),(4,46),(13,46),(2,47),(4,47),(13,47),(2,48),(4,48),(13,48),(2,49),(4,49),(7,49),(9,49),(11,49),(13,49),(2,50),(4,50),(13,50),(2,51),(4,51),(13,51),(2,52),(4,52),(13,52),(2,53),(4,53),(13,53),(2,54),(4,54),(13,54),(2,55),(4,55),(13,55),(2,56),(4,56),(13,56),(2,57),(4,57),(13,57),(2,58),(4,58),(13,58),(2,59),(4,59),(13,59),(2,60),(4,60),(13,60),(2,61),(4,61),(7,61),(9,61),(11,61),(13,61),(2,62),(4,62),(13,62),(2,63),(4,63),(13,63),(2,64),(4,64),(13,64),(2,65),(4,65),(7,65),(9,65),(11,65),(13,65),(2,66),(4,66),(13,66),(2,67),(4,67),(13,67),(2,68),(4,68),(13,68),(2,69),(4,69),(7,69),(9,69),(11,69),(13,69),(2,70),(4,70),(13,70),(2,71),(4,71),(13,71),(2,72),(4,72),(7,72),(9,72),(11,72),(13,72),(2,73),(4,73),(13,73),(2,74),(4,74),(13,74),(2,75),(4,75),(13,75),(2,76),(4,76),(13,76),(2,77),(4,77),(13,77);
/*!40000 ALTER TABLE `curso_estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `darBajaEstudianteDeUnCurso` BEFORE DELETE ON `curso_estudiante` FOR EACH ROW DELETE FROM examen
    WHERE old.legajo_estudiante = legajo_estudiante AND old.codigo_de_curso = codigo_de_curso */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `darBajaEstudianteDeUnCursoRegistro` AFTER DELETE ON `curso_estudiante` FOR EACH ROW INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT(CONCAT("Se dio de baja el estudiante con el legajo de ",old.legajo_estudiante)," de un curso"),user(),current_date()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `darBajaEstudianteDeUniversidadRegistro` AFTER DELETE ON `curso_estudiante` FOR EACH ROW INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT("Se dio de baja el estudiante con el legajo de ",old.legajo_estudiante),user(),current_date()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `legajo_docente` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`legajo_docente`),
  UNIQUE KEY `apellido_docente` (`apellido`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Oscar','Bruno','oscarQuemero@gmail.com'),(2,'Silvina','Ortega','silviOrtega98@hotmail.com'),(3,'Damian','Silvestre','elDami75@hotmail.com'),(4,'Florencia','Pollo','florP@utn.frba.edu'),(5,'Ernesto','Fiorante','ernFioranteAm1@hotmail.com'),(6,'Martin','Pavon','martinPavon@hotmail.com'),(7,'Silvia','Seminara','silviaSeminara@yahoo.com'),(8,'Maria Elena','Trumbich','mElenaTrumbich@gmail.com'),(9,'Edith','Amed','edithAmed@hotmail.com'),(10,'Silvia','Del Puerto','sDelPuerto@yahoo.com'),(11,'Santiago','Ferreiros','santiFerreriros@hotmail.com'),(12,'Alicia','Piñero','aliciaPiñero@hotmail.com'),(13,'Susana','Granado Peralta','susanaGPeralta@gmail.com'),(14,'Alfredo','Santamartina','alfredSantamartina@hotmail.com');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `legajo_estudiante` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `codigo_carrera` int unsigned NOT NULL,
  PRIMARY KEY (`legajo_estudiante`),
  UNIQUE KEY `apellido_estudiante` (`apellido`),
  KEY `estudiante_carerra` (`codigo_carrera`),
  CONSTRAINT `estudiante_carerra` FOREIGN KEY (`codigo_carrera`) REFERENCES `carrera` (`codigo_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Juan Ezequiel','Brea','juanBrea@yahoo.com',1),(2,'Abril Andrea','Rusas','abrilRusas@hotmail.com',1),(3,'Franco Esteban','Meira','franMeira',2),(4,'Lucia','Idañez','luciaIdañez@gmail.com',1),(5,'Fabian','Ponce De Leon','elFabiUBA98@gmail.com',6),(6,'Juan Pedro','Yanarico','juanYanarico96@gmail.com',3),(7,'Michael','Gerez','michaelssj@hotmail.com',7),(8,'Nicolas Alejandro','Marchessi','nikusher@hotmail.com',7),(9,'Joselin','Condori','joCondoria24@hotmail.com',1),(10,'Felipe Gabriel','Villan','feVillan@hotmail.com',5),(11,'Carolina','Burstein','caroRoitman@gmail.com',5),(12,'Valentin','Alsina','valenAlsina',5),(13,'Agustina','Malarini','agusMalarini78@gmail.com',2),(14,'Chiara','Berreta','chiaraSBerreta@gmail.com',1),(15,'Lucia','Salvador','lucySalvador254@gmail.com',2),(16,'Tomas','Pereyra','thomasPereyra',3),(17,'Martina','Rodriguez','mRodriguez@gmail.com',5),(18,'Florencia','Barros','florcitaBarros98@gmail.com',4),(19,'Gustavo','Apaza','gustavoApaza@gmail.com',1),(20,'Guido','Mamani','guidito78@hotmail.com',4),(21,'Sebastian','Ravecca','raveccaSebastian@hotmail.com',6),(22,'Mariano German','Videla Sola','marianoVidela@hotmail.com',4),(23,'Bruno','Mamome','brunoMamone@hotmail.com',4),(24,'Camila','Marmoni','cMarmoni@hotmail.com',5),(25,'Mora','Santana','moraS@outloook.com',3),(26,'Maria','Moreno','mMoreno@hotmail.com',6),(27,'Enzo','Ayala','enzitoCabj98@hotmail.com',6),(28,'Debora','Suarez','debiBarracas@hotmail.com',5),(29,'Andrea','Marzetti','andreaMarzetti@gmail.com',1),(30,'Zulma','Cataldi','zulmaCataldi@hotmail.com',2),(31,'Martin','Fernandez','tinchoFernandez@gmail.com',4),(32,'Ariel Ezequiel','Talledo','ariTalledo@hotmail.com',2),(33,'Lucas Ariel','Boccia','bochita98@hotmail.com',7),(34,'Daniela','Carro','daniCarro@yahoo.com',5),(35,'Ximena','Tolaba','ximeTolaba@hotmail.com',5),(36,'Lucia','Rossini','luRossini@yahoo.com',5),(37,'Maria','Mortini','mMortini@gmail.com',7),(38,'Juan Ezequiel','Brian','juanBrea@yahoo.com',1),(39,'Fabiana','Hartman','sabriHartman.com',4),(40,'Juana','Andrea','juanaA96@gmail.com',3),(41,'Michael','Porsetti','michaelPorsetti@hotmail.com',3),(42,'Nicolas Alejandro','Marchetti','nikusher@hotmail.com',7),(43,'Joselin','Mara','jMara24@hotmail.com',1),(44,'Agustina','Toledo','agustinaToledo@gmail.com',1),(45,'Felipe','Esposito','fEsposito75@hotmail.com',3),(46,'Carolina','Reyna','caroReyna@gmail.com',4),(47,'Valentin','Valiente','vValiente@outlook.com',6),(48,'Agustin','Marcelo','agusM78@gmail.com',2),(49,'Chiara','Corso','chiaracorso@gmail.com',1),(50,'Tomas','Perez','thomasP@hotmail.com',3),(51,'Laura','Garcia','lauraGarcia@gmail.com',4),(52,'Florencia','Gauna','florGauna98@gmail.com',3),(53,'Esteban','Maro','EstabaMaru@hotmail.com',4),(54,'Ezequiel German','Brazzi','EBrazzi@yahoo.com',3),(55,'Fabiana','De Leon','FabianaUTN98@gmail.com',6),(56,'Juan','Diaz','juanDias876@gmail.com',2),(57,'Michael','Gran','michaelG@hotmail.com',7),(58,'Nicolas Matias','Porosi','nicoPorosi@hotmail.com',7),(59,'Josela','Copa','joCopa25@hotmail.com',4),(60,'Agustin Tomas','Gavilan','agusGavilan@gmail.com',7),(61,'Gerardo','Romano','gerardRomano@hotmail.com',1),(62,'Alan','Falete','alanF@gmail.com',4),(63,'Nataly Gabriela','Reyes','natiReyes@hotmail.com',4),(64,'Micaela','Vera','micaVera@yahoo.com',6),(65,'Lucia','Ortega','lucyOrtega@hotmail.com',1),(66,'Andrea','Loria','andreLoria@gmail.com',4),(67,'Jaqueline','Lopez','jaqueline2009@hotmail.com',2),(68,'Dario','Juarez','darioJuares@gmail.com',4),(69,'German','Vautier','gVautier@hotmail.com',1),(70,'Ignacio','Rios','nachoAKD@hotmail.com',3),(71,'Eduardo','Santillan','eduSantillan@hotmail.com',6),(72,'Giuliana','Micheloud','giuliMicheloud@hotmail.com',1),(73,'Natalia','Manganaro','natiManganaro@hotmail.com',3),(74,'Melina','Campagnucci','meliCampagnucci@gmail.com',4),(75,'Irina','Arias','iriArias@yahoo.com',4),(76,'Maria','Rodrigues','mariR@hotmail.com',2),(77,'Noelia','Chavez','noeChavez95@gmail.com',3);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insercionEstudiantes` AFTER INSERT ON `estudiante` FOR EACH ROW INSERT INTO usuarioAcciones (descripcion,usuario,fecha) VALUES (CONCAT("Se dio de alta al estudiante con el legajo de : ",new.legajo_estudiante),user(),current_date()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `darBajaEstudianteDeUniversidad` BEFORE DELETE ON `estudiante` FOR EACH ROW DELETE FROM curso_estudiante
    WHERE old.legajo_estudiante = legajo_estudiante */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examen` (
  `numero_examen` int unsigned NOT NULL,
  `legajo_estudiante` int unsigned NOT NULL,
  `codigo_de_curso` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `nota` int unsigned NOT NULL,
  PRIMARY KEY (`legajo_estudiante`,`codigo_de_curso`,`numero_examen`),
  KEY `examen_curso` (`codigo_de_curso`),
  CONSTRAINT `examen_curso` FOREIGN KEY (`codigo_de_curso`) REFERENCES `curso` (`codigo_de_curso`),
  CONSTRAINT `examen_estudiante` FOREIGN KEY (`legajo_estudiante`) REFERENCES `estudiante` (`legajo_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
INSERT INTO `examen` VALUES (1,1,1,'2022-06-17','Primer Parcial',8),(2,1,1,'2022-08-17','Segundo Parcial',9),(1,1,5,'2022-07-10','Primer Parcial',7),(2,1,5,'2022-09-17','Segundo Parcial',9),(1,1,6,'2022-06-09','Primer Parcial',8),(2,1,6,'2022-11-17','Segundo Parcial',10),(1,1,8,'2022-06-20','Primer Parcial',8),(2,1,8,'2022-11-25','Segundo Parcial',9),(1,1,10,'2022-08-17','Primer Parcial',8),(2,1,10,'2022-12-02','Segundo Parcial',6),(1,1,12,'2022-07-15','Primer Parcial',8),(2,1,12,'2022-11-29','Segundo Parcial',7),(1,2,1,'2022-06-17','Primer Parcial',6),(2,2,1,'2022-08-17','Segundo Parcial',9),(1,2,5,'2022-07-10','Primer Parcial',10),(2,2,5,'2022-09-17','Segundo Parcial',7),(1,2,6,'2022-06-09','Primer Parcial',5),(2,2,6,'2022-11-17','Segundo Parcial',4),(1,2,8,'2022-06-20','Primer Parcial',3),(2,2,8,'2022-11-25','Segundo Parcial',9),(1,2,10,'2022-08-17','Primer Parcial',10),(2,2,10,'2022-12-02','Segundo Parcial',6),(1,2,12,'2022-07-15','Primer Parcial',8),(2,2,12,'2022-11-29','Segundo Parcial',9),(1,3,1,'2022-06-17','Primer Parcial',8),(2,3,1,'2022-08-17','Segundo Parcial',9),(1,3,5,'2022-07-10','Primer Parcial',7),(2,3,5,'2022-09-17','Segundo Parcial',9),(1,3,12,'2022-07-15','Primer Parcial',8),(2,3,12,'2022-11-29','Segundo Parcial',9),(1,4,1,'2022-06-17','Primer Parcial',6),(2,4,1,'2022-08-17','Segundo Parcial',9),(1,4,5,'2022-07-10','Primer Parcial',7),(2,4,5,'2022-09-17','Segundo Parcial',4),(1,4,6,'2022-06-09','Primer Parcial',8),(2,4,6,'2022-11-17','Segundo Parcial',7),(1,4,8,'2022-06-20','Primer Parcial',9),(2,4,8,'2022-11-25','Segundo Parcial',9),(1,4,10,'2022-08-17','Primer Parcial',3),(2,4,10,'2022-12-02','Segundo Parcial',3),(1,4,12,'2022-07-15','Primer Parcial',1),(2,4,12,'2022-11-29','Segundo Parcial',10),(1,5,1,'2022-06-17','Primer Parcial',9),(2,5,1,'2022-08-17','Segundo Parcial',10),(1,5,5,'2022-07-10','Primer Parcial',7),(2,5,5,'2022-09-17','Segundo Parcial',9),(1,5,12,'2022-07-15','Primer Parcial',10),(2,5,12,'2022-11-29','Segundo Parcial',9),(1,6,1,'2022-06-17','Primer Parcial',9),(2,6,1,'2022-08-17','Segundo Parcial',7),(1,6,5,'2022-07-10','Primer Parcial',8),(2,6,5,'2022-09-17','Segundo Parcial',1),(1,6,12,'2022-07-15','Primer Parcial',10),(2,6,12,'2022-11-29','Segundo Parcial',10),(1,7,1,'2022-06-17','Primer Parcial',9),(2,7,1,'2022-08-17','Segundo Parcial',7),(1,7,5,'2022-07-10','Primer Parcial',8),(2,7,5,'2022-09-17','Segundo Parcial',1),(1,7,12,'2022-07-15','Primer Parcial',1),(2,7,12,'2022-11-29','Segundo Parcial',1),(1,8,1,'2022-06-17','Primer Parcial',9),(2,8,1,'2022-08-17','Segundo Parcial',7),(1,8,5,'2022-07-10','Primer Parcial',7),(2,8,5,'2022-09-17','Segundo Parcial',6),(1,8,12,'2022-07-15','Primer Parcial',5),(2,8,12,'2022-11-29','Segundo Parcial',8),(1,9,1,'2022-06-17','Primer Parcial',8),(2,9,1,'2022-08-17','Segundo Parcial',9),(1,9,5,'2022-07-10','Primer Parcial',7),(2,9,5,'2022-09-17','Segundo Parcial',6),(1,9,6,'2022-06-09','Primer Parcial',8),(2,9,6,'2022-11-17','Segundo Parcial',10),(1,9,8,'2022-06-20','Primer Parcial',10),(2,9,8,'2022-11-25','Segundo Parcial',9),(1,9,10,'2022-08-17','Primer Parcial',10),(2,9,10,'2022-12-02','Segundo Parcial',6),(1,9,12,'2022-07-15','Primer Parcial',10),(2,9,12,'2022-11-29','Segundo Parcial',7),(1,10,1,'2022-06-17','Primer Parcial',9),(2,10,1,'2022-08-17','Segundo Parcial',5),(1,10,5,'2022-07-10','Primer Parcial',7),(2,10,5,'2022-09-17','Segundo Parcial',10),(1,10,12,'2022-07-15','Primer Parcial',10),(2,10,12,'2022-11-29','Segundo Parcial',10),(1,11,1,'2022-06-17','Primer Parcial',1),(2,11,1,'2022-08-17','Segundo Parcial',5),(1,11,5,'2022-07-10','Primer Parcial',7),(2,11,5,'2022-09-17','Segundo Parcial',1),(1,11,12,'2022-07-15','Primer Parcial',1),(2,11,12,'2022-11-29','Segundo Parcial',10),(1,12,1,'2022-06-17','Primer Parcial',10),(2,12,1,'2022-08-17','Segundo Parcial',5),(1,12,5,'2022-07-10','Primer Parcial',7),(2,12,5,'2022-09-17','Segundo Parcial',5),(1,12,12,'2022-07-15','Primer Parcial',5),(2,12,12,'2022-11-29','Segundo Parcial',7),(1,13,1,'2022-06-17','Primer Parcial',7),(2,13,1,'2022-08-17','Segundo Parcial',8),(1,13,5,'2022-07-10','Primer Parcial',8),(2,13,5,'2022-09-17','Segundo Parcial',9),(1,13,12,'2022-07-15','Primer Parcial',5),(2,13,12,'2022-11-29','Segundo Parcial',7),(1,14,1,'2022-06-17','Primer Parcial',8),(2,14,1,'2022-08-17','Segundo Parcial',9),(1,14,5,'2022-07-10','Primer Parcial',8),(2,14,5,'2022-09-17','Segundo Parcial',9),(1,14,6,'2022-06-09','Primer Parcial',8),(2,14,6,'2022-11-17','Segundo Parcial',10),(1,14,8,'2022-06-20','Primer Parcial',8),(2,14,8,'2022-11-25','Segundo Parcial',7),(1,14,10,'2022-08-17','Primer Parcial',8),(2,14,10,'2022-12-02','Segundo Parcial',10),(1,14,12,'2022-07-15','Primer Parcial',8),(2,14,12,'2022-11-29','Segundo Parcial',7),(1,15,1,'2022-06-17','Primer Parcial',10),(2,15,1,'2022-08-17','Segundo Parcial',5),(1,15,5,'2022-07-10','Primer Parcial',7),(2,15,5,'2022-09-17','Segundo Parcial',5),(1,15,12,'2022-07-15','Primer Parcial',5),(2,15,12,'2022-11-29','Segundo Parcial',7),(1,16,1,'2022-06-17','Primer Parcial',1),(2,16,1,'2022-08-17','Segundo Parcial',5),(1,16,5,'2022-07-10','Primer Parcial',4),(2,16,5,'2022-09-17','Segundo Parcial',1),(1,16,12,'2022-07-15','Primer Parcial',1),(2,16,12,'2022-11-29','Segundo Parcial',7),(1,17,1,'2022-06-17','Primer Parcial',10),(2,17,1,'2022-08-17','Segundo Parcial',10),(1,17,5,'2022-07-10','Primer Parcial',10),(2,17,5,'2022-09-17','Segundo Parcial',10),(1,17,12,'2022-07-15','Primer Parcial',10),(2,17,12,'2022-11-29','Segundo Parcial',10),(1,18,1,'2022-06-17','Primer Parcial',1),(2,18,1,'2022-08-17','Segundo Parcial',1),(1,18,5,'2022-07-10','Primer Parcial',1),(2,18,5,'2022-09-17','Segundo Parcial',1),(1,18,12,'2022-07-15','Primer Parcial',1),(2,18,12,'2022-11-29','Segundo Parcial',1),(1,19,1,'2022-06-17','Primer Parcial',8),(2,19,1,'2022-08-17','Segundo Parcial',9),(1,19,5,'2022-07-10','Primer Parcial',8),(2,19,5,'2022-09-17','Segundo Parcial',2),(1,19,6,'2022-06-09','Primer Parcial',5),(2,19,6,'2022-11-17','Segundo Parcial',10),(1,19,8,'2022-06-20','Primer Parcial',8),(2,19,8,'2022-11-25','Segundo Parcial',7),(1,19,10,'2022-08-17','Primer Parcial',8),(2,19,10,'2022-12-02','Segundo Parcial',7),(1,19,12,'2022-07-15','Primer Parcial',10),(2,19,12,'2022-11-29','Segundo Parcial',10),(1,20,1,'2022-06-17','Primer Parcial',1),(2,20,1,'2022-08-17','Segundo Parcial',7),(1,20,5,'2022-07-10','Primer Parcial',10),(2,20,5,'2022-09-17','Segundo Parcial',8),(1,20,12,'2022-07-15','Primer Parcial',7),(2,20,12,'2022-11-29','Segundo Parcial',2),(1,21,1,'2022-06-17','Primer Parcial',1),(2,21,1,'2022-08-17','Segundo Parcial',7),(1,21,5,'2022-07-10','Primer Parcial',10),(2,21,5,'2022-09-17','Segundo Parcial',8),(1,21,12,'2022-07-15','Primer Parcial',7),(2,21,12,'2022-11-29','Segundo Parcial',2),(1,22,1,'2022-06-17','Primer Parcial',10),(2,22,1,'2022-08-17','Segundo Parcial',10),(1,22,5,'2022-07-10','Primer Parcial',10),(2,22,5,'2022-09-17','Segundo Parcial',8),(1,22,12,'2022-07-15','Primer Parcial',6),(2,22,12,'2022-11-29','Segundo Parcial',6),(1,23,1,'2022-06-17','Primer Parcial',6),(2,23,1,'2022-08-17','Segundo Parcial',7),(1,23,5,'2022-07-10','Primer Parcial',10),(2,23,5,'2022-09-17','Segundo Parcial',10),(1,23,12,'2022-07-15','Primer Parcial',7),(2,23,12,'2022-11-29','Segundo Parcial',2),(1,24,1,'2022-06-17','Primer Parcial',9),(2,24,1,'2022-08-17','Segundo Parcial',10),(1,24,5,'2022-07-10','Primer Parcial',9),(2,24,5,'2022-09-17','Segundo Parcial',10),(1,24,12,'2022-07-15','Primer Parcial',7),(2,24,12,'2022-11-29','Segundo Parcial',10),(1,25,1,'2022-06-17','Primer Parcial',9),(2,25,1,'2022-08-17','Segundo Parcial',10),(1,25,5,'2022-07-10','Primer Parcial',10),(2,25,5,'2022-09-17','Segundo Parcial',10),(1,25,12,'2022-07-15','Primer Parcial',7),(2,25,12,'2022-11-29','Segundo Parcial',2),(1,26,1,'2022-06-17','Primer Parcial',7),(2,26,1,'2022-08-17','Segundo Parcial',5),(1,26,5,'2022-07-10','Primer Parcial',10),(2,26,5,'2022-09-17','Segundo Parcial',1),(1,26,12,'2022-07-15','Primer Parcial',7),(2,26,12,'2022-11-29','Segundo Parcial',10),(1,27,1,'2022-06-17','Primer Parcial',7),(2,27,1,'2022-08-17','Segundo Parcial',6),(1,27,5,'2022-07-10','Primer Parcial',1),(2,27,5,'2022-09-17','Segundo Parcial',1),(1,27,12,'2022-07-15','Primer Parcial',6),(2,27,12,'2022-11-29','Segundo Parcial',1),(1,28,1,'2022-06-17','Primer Parcial',7),(2,28,1,'2022-08-17','Segundo Parcial',7),(1,28,5,'2022-07-10','Primer Parcial',10),(2,28,5,'2022-09-17','Segundo Parcial',8),(1,28,12,'2022-07-15','Primer Parcial',6),(2,28,12,'2022-11-29','Segundo Parcial',5),(1,29,1,'2022-06-17','Primer Parcial',8),(2,29,1,'2022-08-17','Segundo Parcial',9),(1,29,5,'2022-07-10','Primer Parcial',10),(2,29,5,'2022-09-17','Segundo Parcial',10),(1,29,6,'2022-06-09','Primer Parcial',5),(2,29,6,'2022-11-17','Segundo Parcial',2),(1,29,8,'2022-06-20','Primer Parcial',8),(2,29,8,'2022-11-25','Segundo Parcial',7),(1,29,10,'2022-08-17','Primer Parcial',8),(2,29,10,'2022-12-02','Segundo Parcial',3),(1,29,12,'2022-07-15','Primer Parcial',3),(2,29,12,'2022-11-29','Segundo Parcial',7),(1,30,1,'2022-06-17','Primer Parcial',6),(2,30,1,'2022-08-17','Segundo Parcial',8),(1,30,5,'2022-07-10','Primer Parcial',10),(2,30,5,'2022-09-17','Segundo Parcial',9),(1,30,12,'2022-07-15','Primer Parcial',6),(2,30,12,'2022-11-29','Segundo Parcial',8),(1,31,2,'2022-06-17','Primer Parcial',6),(2,31,2,'2022-08-17','Segundo Parcial',8),(1,31,5,'2022-07-10','Primer Parcial',10),(2,31,5,'2022-09-17','Segundo Parcial',9),(1,31,13,'2022-07-15','Primer Parcial',6),(2,31,13,'2022-11-29','Segundo Parcial',8),(1,32,2,'2022-06-17','Primer Parcial',6),(2,32,2,'2022-08-17','Segundo Parcial',8),(1,32,5,'2022-07-10','Primer Parcial',8),(2,32,5,'2022-09-17','Segundo Parcial',9),(1,32,13,'2022-07-15','Primer Parcial',10),(2,32,13,'2022-11-29','Segundo Parcial',8),(1,33,2,'2022-06-17','Primer Parcial',1),(2,33,2,'2022-08-17','Segundo Parcial',1),(1,33,5,'2022-07-10','Primer Parcial',1),(2,33,5,'2022-09-17','Segundo Parcial',1),(1,33,13,'2022-07-15','Primer Parcial',1),(2,33,13,'2022-11-29','Segundo Parcial',1),(1,34,2,'2022-06-17','Primer Parcial',1),(2,34,2,'2022-08-17','Segundo Parcial',7),(1,34,5,'2022-07-10','Primer Parcial',7),(2,34,5,'2022-09-17','Segundo Parcial',8),(1,34,13,'2022-07-15','Primer Parcial',1),(2,34,13,'2022-11-29','Segundo Parcial',1),(1,35,2,'2022-06-17','Primer Parcial',1),(2,35,2,'2022-08-17','Segundo Parcial',7),(1,35,5,'2022-07-10','Primer Parcial',7),(2,35,5,'2022-09-17','Segundo Parcial',8),(1,35,13,'2022-07-15','Primer Parcial',1),(2,35,13,'2022-11-29','Segundo Parcial',1),(1,36,2,'2022-06-17','Primer Parcial',1),(2,36,2,'2022-08-17','Segundo Parcial',7),(1,36,5,'2022-07-10','Primer Parcial',7),(2,36,5,'2022-09-17','Segundo Parcial',8),(1,36,13,'2022-07-15','Primer Parcial',1),(2,36,13,'2022-11-29','Segundo Parcial',1),(1,37,2,'2022-06-17','Primer Parcial',1),(2,37,2,'2022-08-17','Segundo Parcial',7),(1,37,4,'2022-07-10','Primer Parcial',7),(2,37,4,'2022-09-17','Segundo Parcial',8),(1,37,13,'2022-07-15','Primer Parcial',1),(2,37,13,'2022-11-29','Segundo Parcial',1),(1,38,1,'2022-06-17','Primer Parcial',8),(2,38,1,'2022-08-17','Segundo Parcial',9),(1,38,5,'2022-07-10','Primer Parcial',10),(2,38,5,'2022-09-17','Segundo Parcial',1),(1,38,6,'2022-06-09','Primer Parcial',5),(2,38,6,'2022-11-17','Segundo Parcial',8),(1,38,8,'2022-06-20','Primer Parcial',8),(2,38,8,'2022-11-25','Segundo Parcial',7),(1,38,10,'2022-08-17','Primer Parcial',8),(2,38,10,'2022-12-02','Segundo Parcial',3),(1,38,13,'2022-07-15','Primer Parcial',2),(2,38,13,'2022-11-29','Segundo Parcial',7),(1,39,2,'2022-06-17','Primer Parcial',1),(2,39,2,'2022-08-17','Segundo Parcial',7),(1,39,4,'2022-07-10','Primer Parcial',7),(2,39,4,'2022-09-17','Segundo Parcial',8),(1,39,13,'2022-07-15','Primer Parcial',1),(2,39,13,'2022-11-29','Segundo Parcial',1),(1,40,2,'2022-06-17','Primer Parcial',1),(2,40,2,'2022-08-17','Segundo Parcial',7),(1,40,4,'2022-07-10','Primer Parcial',5),(2,40,4,'2022-09-17','Segundo Parcial',8),(1,40,13,'2022-07-15','Primer Parcial',10),(2,40,13,'2022-11-29','Segundo Parcial',1),(1,41,2,'2022-06-17','Primer Parcial',8),(2,41,2,'2022-08-17','Segundo Parcial',10),(1,41,4,'2022-07-10','Primer Parcial',5),(2,41,4,'2022-09-17','Segundo Parcial',2),(1,41,13,'2022-07-15','Primer Parcial',10),(2,41,13,'2022-11-29','Segundo Parcial',1),(1,42,2,'2022-06-17','Primer Parcial',8),(2,42,2,'2022-08-17','Segundo Parcial',12),(1,42,4,'2022-07-10','Primer Parcial',5),(2,42,4,'2022-09-17','Segundo Parcial',2),(1,42,13,'2022-07-15','Primer Parcial',10),(2,42,13,'2022-11-29','Segundo Parcial',6),(1,43,2,'2022-06-17','Primer Parcial',8),(2,43,2,'2022-08-17','Segundo Parcial',9),(1,43,4,'2022-07-10','Primer Parcial',10),(2,43,4,'2022-09-17','Segundo Parcial',1),(1,43,7,'2022-06-09','Primer Parcial',5),(2,43,7,'2022-11-17','Segundo Parcial',8),(1,43,9,'2022-06-20','Primer Parcial',8),(2,43,9,'2022-11-25','Segundo Parcial',7),(1,43,11,'2022-08-17','Primer Parcial',8),(2,43,11,'2022-12-02','Segundo Parcial',3),(1,43,13,'2022-07-15','Primer Parcial',2),(2,43,13,'2022-11-29','Segundo Parcial',7),(1,44,2,'2022-06-17','Primer Parcial',6),(2,44,2,'2022-08-17','Segundo Parcial',9),(1,44,4,'2022-07-10','Primer Parcial',10),(2,44,4,'2022-09-17','Segundo Parcial',10),(1,44,7,'2022-06-09','Primer Parcial',5),(2,44,7,'2022-11-17','Segundo Parcial',8),(1,44,9,'2022-06-20','Primer Parcial',9),(2,44,9,'2022-11-25','Segundo Parcial',10),(1,44,11,'2022-08-17','Primer Parcial',8),(2,44,11,'2022-12-02','Segundo Parcial',5),(1,44,13,'2022-07-15','Primer Parcial',2),(2,44,13,'2022-11-29','Segundo Parcial',10),(1,45,2,'2022-06-17','Primer Parcial',8),(2,45,2,'2022-08-17','Segundo Parcial',10),(1,45,4,'2022-07-10','Primer Parcial',5),(2,45,4,'2022-09-17','Segundo Parcial',7),(1,45,13,'2022-07-15','Primer Parcial',10),(2,45,13,'2022-11-29','Segundo Parcial',6),(1,46,2,'2022-06-17','Primer Parcial',8),(2,46,2,'2022-08-17','Segundo Parcial',10),(1,46,4,'2022-07-10','Primer Parcial',5),(2,46,4,'2022-09-17','Segundo Parcial',7),(1,46,13,'2022-07-15','Primer Parcial',10),(2,46,13,'2022-11-29','Segundo Parcial',6),(1,47,2,'2022-06-17','Primer Parcial',8),(2,47,2,'2022-08-17','Segundo Parcial',10),(1,47,4,'2022-07-10','Primer Parcial',10),(2,47,4,'2022-09-17','Segundo Parcial',7),(1,47,13,'2022-07-15','Primer Parcial',10),(2,47,13,'2022-11-29','Segundo Parcial',10),(1,48,2,'2022-06-17','Primer Parcial',8),(2,48,2,'2022-08-17','Segundo Parcial',10),(1,48,4,'2022-07-10','Primer Parcial',10),(2,48,4,'2022-09-17','Segundo Parcial',7),(1,48,13,'2022-07-15','Primer Parcial',10),(2,48,13,'2022-11-29','Segundo Parcial',10),(1,49,2,'2022-06-17','Primer Parcial',6),(2,49,2,'2022-08-17','Segundo Parcial',9),(1,49,4,'2022-07-10','Primer Parcial',1),(2,49,4,'2022-09-17','Segundo Parcial',1),(1,49,7,'2022-06-09','Primer Parcial',5),(2,49,7,'2022-11-17','Segundo Parcial',10),(1,49,9,'2022-06-20','Primer Parcial',9),(2,49,9,'2022-11-25','Segundo Parcial',10),(1,49,11,'2022-08-17','Primer Parcial',5),(2,49,11,'2022-12-02','Segundo Parcial',10),(1,49,13,'2022-07-15','Primer Parcial',7),(2,49,13,'2022-11-29','Segundo Parcial',9),(1,50,2,'2022-06-17','Primer Parcial',8),(2,50,2,'2022-08-17','Segundo Parcial',10),(1,50,4,'2022-07-10','Primer Parcial',10),(2,50,4,'2022-09-17','Segundo Parcial',7),(1,50,13,'2022-07-15','Primer Parcial',10),(2,50,13,'2022-11-29','Segundo Parcial',10),(1,51,2,'2022-06-17','Primer Parcial',8),(2,51,2,'2022-08-17','Segundo Parcial',10),(1,51,4,'2022-07-10','Primer Parcial',10),(2,51,4,'2022-09-17','Segundo Parcial',10),(1,51,13,'2022-07-15','Primer Parcial',10),(2,51,13,'2022-11-29','Segundo Parcial',10),(1,52,2,'2022-06-17','Primer Parcial',8),(2,52,2,'2022-08-17','Segundo Parcial',7),(1,52,4,'2022-07-10','Primer Parcial',1),(2,52,4,'2022-09-17','Segundo Parcial',3),(1,52,13,'2022-07-15','Primer Parcial',7),(2,52,13,'2022-11-29','Segundo Parcial',7),(1,53,2,'2022-06-17','Primer Parcial',8),(2,53,2,'2022-08-17','Segundo Parcial',1),(1,53,4,'2022-07-10','Primer Parcial',1),(2,53,4,'2022-09-17','Segundo Parcial',1),(1,53,13,'2022-07-15','Primer Parcial',1),(2,53,13,'2022-11-29','Segundo Parcial',1),(1,54,2,'2022-06-17','Primer Parcial',5),(2,54,2,'2022-08-17','Segundo Parcial',7),(1,54,4,'2022-07-10','Primer Parcial',8),(2,54,4,'2022-09-17','Segundo Parcial',9),(1,54,13,'2022-07-15','Primer Parcial',5),(2,54,13,'2022-11-29','Segundo Parcial',3),(1,55,2,'2022-06-17','Primer Parcial',5),(2,55,2,'2022-08-17','Segundo Parcial',7),(1,55,4,'2022-07-10','Primer Parcial',8),(2,55,4,'2022-09-17','Segundo Parcial',9),(1,55,13,'2022-07-15','Primer Parcial',5),(2,55,13,'2022-11-29','Segundo Parcial',3),(1,56,2,'2022-06-17','Primer Parcial',5),(2,56,2,'2022-08-17','Segundo Parcial',7),(1,56,4,'2022-07-10','Primer Parcial',10),(2,56,4,'2022-09-17','Segundo Parcial',9),(1,56,13,'2022-07-15','Primer Parcial',6),(2,56,13,'2022-11-29','Segundo Parcial',7),(1,57,2,'2022-06-17','Primer Parcial',5),(2,57,2,'2022-08-17','Segundo Parcial',7),(1,57,4,'2022-07-10','Primer Parcial',8),(2,57,4,'2022-09-17','Segundo Parcial',9),(1,57,13,'2022-07-15','Primer Parcial',5),(2,57,13,'2022-11-29','Segundo Parcial',3),(1,58,2,'2022-06-17','Primer Parcial',4),(2,58,2,'2022-08-17','Segundo Parcial',9),(1,58,4,'2022-07-10','Primer Parcial',8),(2,58,4,'2022-09-17','Segundo Parcial',9),(1,58,13,'2022-07-15','Primer Parcial',10),(2,58,13,'2022-11-29','Segundo Parcial',5),(1,59,2,'2022-06-17','Primer Parcial',5),(2,59,2,'2022-08-17','Segundo Parcial',7),(1,59,4,'2022-07-10','Primer Parcial',8),(2,59,4,'2022-09-17','Segundo Parcial',9),(1,59,13,'2022-07-15','Primer Parcial',5),(2,59,13,'2022-11-29','Segundo Parcial',3),(1,60,2,'2022-06-17','Primer Parcial',8),(2,60,2,'2022-08-17','Segundo Parcial',10),(1,60,4,'2022-07-10','Primer Parcial',9),(2,60,4,'2022-09-17','Segundo Parcial',9),(1,60,13,'2022-07-15','Primer Parcial',5),(2,60,13,'2022-11-29','Segundo Parcial',8),(1,61,2,'2022-06-17','Primer Parcial',6),(2,61,2,'2022-08-17','Segundo Parcial',5),(1,61,4,'2022-07-10','Primer Parcial',2),(2,61,4,'2022-09-17','Segundo Parcial',9),(1,61,7,'2022-06-09','Primer Parcial',4),(2,61,7,'2022-11-17','Segundo Parcial',10),(1,61,9,'2022-06-20','Primer Parcial',9),(2,61,9,'2022-11-25','Segundo Parcial',10),(1,61,11,'2022-08-17','Primer Parcial',9),(2,61,11,'2022-12-02','Segundo Parcial',10),(1,61,13,'2022-07-15','Primer Parcial',9),(2,61,13,'2022-11-29','Segundo Parcial',9),(1,62,2,'2022-06-17','Primer Parcial',8),(2,62,2,'2022-08-17','Segundo Parcial',4),(1,62,4,'2022-07-10','Primer Parcial',8),(2,62,4,'2022-09-17','Segundo Parcial',9),(1,62,13,'2022-07-15','Primer Parcial',9),(2,62,13,'2022-11-29','Segundo Parcial',3),(1,63,2,'2022-06-17','Primer Parcial',1),(2,63,2,'2022-08-17','Segundo Parcial',4),(1,63,4,'2022-07-10','Primer Parcial',5),(2,63,4,'2022-09-17','Segundo Parcial',4),(1,63,13,'2022-07-15','Primer Parcial',9),(2,63,13,'2022-11-29','Segundo Parcial',1),(1,64,2,'2022-06-17','Primer Parcial',10),(2,64,2,'2022-08-17','Segundo Parcial',3),(1,64,4,'2022-07-10','Primer Parcial',10),(2,64,4,'2022-09-17','Segundo Parcial',7),(1,64,13,'2022-07-15','Primer Parcial',9),(2,64,13,'2022-11-29','Segundo Parcial',10),(1,65,2,'2022-06-17','Primer Parcial',6),(2,65,2,'2022-08-17','Segundo Parcial',10),(1,65,4,'2022-07-10','Primer Parcial',7),(2,65,4,'2022-09-17','Segundo Parcial',9),(1,65,7,'2022-06-09','Primer Parcial',4),(2,65,7,'2022-11-17','Segundo Parcial',7),(1,65,9,'2022-06-20','Primer Parcial',6),(2,65,9,'2022-11-25','Segundo Parcial',10),(1,65,11,'2022-08-17','Primer Parcial',9),(2,65,11,'2022-12-02','Segundo Parcial',10),(1,65,13,'2022-07-15','Primer Parcial',9),(2,65,13,'2022-11-29','Segundo Parcial',9),(1,66,2,'2022-06-17','Primer Parcial',10),(2,66,2,'2022-08-17','Segundo Parcial',3),(1,66,4,'2022-07-10','Primer Parcial',10),(2,66,4,'2022-09-17','Segundo Parcial',6),(1,66,13,'2022-07-15','Primer Parcial',9),(2,66,13,'2022-11-29','Segundo Parcial',10),(1,67,2,'2022-06-17','Primer Parcial',8),(2,67,2,'2022-08-17','Segundo Parcial',7),(1,67,4,'2022-07-10','Primer Parcial',8),(2,67,4,'2022-09-17','Segundo Parcial',6),(1,67,13,'2022-07-15','Primer Parcial',9),(2,67,13,'2022-11-29','Segundo Parcial',10),(1,68,2,'2022-06-17','Primer Parcial',8),(2,68,2,'2022-08-17','Segundo Parcial',10),(1,68,4,'2022-07-10','Primer Parcial',8),(2,68,4,'2022-09-17','Segundo Parcial',10),(1,68,13,'2022-07-15','Primer Parcial',9),(2,68,13,'2022-11-29','Segundo Parcial',10),(1,69,2,'2022-06-17','Primer Parcial',3),(2,69,2,'2022-08-17','Segundo Parcial',10),(1,69,4,'2022-07-10','Primer Parcial',10),(2,69,4,'2022-09-17','Segundo Parcial',9),(1,69,7,'2022-06-09','Primer Parcial',10),(2,69,7,'2022-11-17','Segundo Parcial',7),(1,69,9,'2022-06-20','Primer Parcial',8),(2,69,9,'2022-11-25','Segundo Parcial',10),(1,69,11,'2022-08-17','Primer Parcial',9),(2,69,11,'2022-12-02','Segundo Parcial',10),(1,69,13,'2022-07-15','Primer Parcial',9),(2,69,13,'2022-11-29','Segundo Parcial',10),(1,70,2,'2022-06-17','Primer Parcial',8),(2,70,2,'2022-08-17','Segundo Parcial',6),(1,70,4,'2022-07-10','Primer Parcial',8),(2,70,4,'2022-09-17','Segundo Parcial',7),(1,70,13,'2022-07-15','Primer Parcial',9),(2,70,13,'2022-11-29','Segundo Parcial',6),(1,71,2,'2022-06-17','Primer Parcial',8),(2,71,2,'2022-08-17','Segundo Parcial',8),(1,71,4,'2022-07-10','Primer Parcial',9),(2,71,4,'2022-09-17','Segundo Parcial',7),(1,71,13,'2022-07-15','Primer Parcial',10),(2,71,13,'2022-11-29','Segundo Parcial',7),(1,72,2,'2022-06-17','Primer Parcial',3),(2,72,2,'2022-08-17','Segundo Parcial',10),(1,72,4,'2022-07-10','Primer Parcial',10),(2,72,4,'2022-09-17','Segundo Parcial',9),(1,72,7,'2022-06-09','Primer Parcial',10),(2,72,7,'2022-11-17','Segundo Parcial',8),(1,72,9,'2022-06-20','Primer Parcial',8),(2,72,9,'2022-11-25','Segundo Parcial',2),(1,72,11,'2022-08-17','Primer Parcial',9),(2,72,11,'2022-12-02','Segundo Parcial',3),(1,72,13,'2022-07-15','Primer Parcial',9),(2,72,13,'2022-11-29','Segundo Parcial',3),(1,73,2,'2022-06-17','Primer Parcial',8),(2,73,2,'2022-08-17','Segundo Parcial',8),(1,73,4,'2022-07-10','Primer Parcial',9),(2,73,4,'2022-09-17','Segundo Parcial',8),(1,73,13,'2022-07-15','Primer Parcial',2),(2,73,13,'2022-11-29','Segundo Parcial',7),(1,74,2,'2022-06-17','Primer Parcial',8),(2,74,2,'2022-08-17','Segundo Parcial',5),(1,74,4,'2022-07-10','Primer Parcial',9),(2,74,4,'2022-09-17','Segundo Parcial',5),(1,74,13,'2022-07-15','Primer Parcial',10),(2,74,13,'2022-11-29','Segundo Parcial',7),(1,75,2,'2022-06-17','Primer Parcial',8),(2,75,2,'2022-08-17','Segundo Parcial',5),(1,75,4,'2022-07-10','Primer Parcial',9),(2,75,4,'2022-09-17','Segundo Parcial',5),(1,75,13,'2022-07-15','Primer Parcial',10),(2,75,13,'2022-11-29','Segundo Parcial',7),(1,76,2,'2022-06-17','Primer Parcial',8),(2,76,2,'2022-08-17','Segundo Parcial',10),(1,76,4,'2022-07-10','Primer Parcial',9),(2,76,4,'2022-09-17','Segundo Parcial',10),(1,76,13,'2022-07-15','Primer Parcial',10),(2,76,13,'2022-11-29','Segundo Parcial',7),(1,77,2,'2022-06-17','Primer Parcial',8),(2,77,2,'2022-08-17','Segundo Parcial',10),(1,77,4,'2022-07-10','Primer Parcial',8),(2,77,4,'2022-09-17','Segundo Parcial',5),(1,77,13,'2022-07-15','Primer Parcial',1),(2,77,13,'2022-11-29','Segundo Parcial',5);
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioacciones`
--

DROP TABLE IF EXISTS `usuarioacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioacciones` (
  `accion_id` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`accion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioacciones`
--

LOCK TABLES `usuarioacciones` WRITE;
/*!40000 ALTER TABLE `usuarioacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'universidad'
--

--
-- Dumping routines for database 'universidad'
--
/*!50003 DROP FUNCTION IF EXISTS `notaDeExamen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `notaDeExamen`(legajo_estudiante INT,codigo_de_curso INT,nro_de_examen INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT nota
			FROM examen AS e
			WHERE e.legajo_estudiante = legajo_estudiante 
			AND e.codigo_de_curso = codigo_de_curso
			AND e.numero_examen = nro_de_examen );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `promedio_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `promedio_nota`(legajo_estudiante INT,codigo_de_curso INT) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE nota1 INT;
    DECLARE nota2 INT;
    -- uso la funcion notaDeExamen para que me devuelva la nota del primer parcial y del segundo parcial del alumno 
    -- en un determinado curso
    SET nota1 = notaDeExamen(legajo_estudiante,codigo_de_curso,1);
    SET nota2 = notaDeExamen(legajo_estudiante,codigo_de_curso,2);
RETURN (nota1+nota2)/2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregarNuevoEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarNuevoEstudiante`(IN nombreIngresado VARCHAR(30),IN apellidoIngresado VARCHAR(30),IN carrera VARCHAR(30),IN emailIngresado VARCHAR(30))
BEGIN
	-- es necesario que se ingrese el nombre de la carrera del estudiante, caso contrario no se registra a la persona
	IF carrera <> ' '
    THEN
		-- en caso de que la persona ingrese el nombre de la carrera , yo le asigno a la variable @codigo_carrera 
        -- el numero de carrera que es la PK de la tabla carrera y a su vez la FK en la tabla estudiante
		SET @codigo_carrera = (
			SELECT codigo_carrera
			FROM carrera AS c
			WHERE c.carrera LIKE carrera
		);
        -- Y finalmente inserto los datos del nuevo alumno
        -- El numero de legajo no lo ingreso, porque es autoincrementable
		INSERT INTO estudiante (nombre,apellido,email,codigo_carrera) VALUES
        (nombreIngresado,apellidoIngresado,emailIngresado,@codigo_carrera);
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `alumnosSegunCriterio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnosSegunCriterio`(IN campo VARCHAR(20),IN orden VARCHAR(4))
BEGIN
	IF campo <> ''
    THEN
		SET @criterio = CONCAT(' ORDER BY ',campo);
		SET @criterio = CONCAT(@criterio,' ');
        SET @criterio = CONCAT(@criterio,orden);
    ELSE
		SET @criterio = '';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM estudiante ',@criterio);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `alumnosporcarrera`
--

/*!50001 DROP VIEW IF EXISTS `alumnosporcarrera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnosporcarrera` AS select `c`.`carrera` AS `Carrera`,count(`e`.`legajo_estudiante`) AS `Cantidad de estudiantes` from (`estudiante` `e` join `carrera` `c` on((`e`.`codigo_carrera` = `c`.`codigo_carrera`))) group by `c`.`carrera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `alumnospormateria`
--

/*!50001 DROP VIEW IF EXISTS `alumnospormateria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alumnospormateria` AS select `ca`.`catedra` AS `Materia`,count(`e`.`legajo_estudiante`) AS `Cantidad de estudiantes` from (((`estudiante` `e` join `curso_estudiante` `ce` on((`e`.`legajo_estudiante` = `ce`.`legajo_estudiante`))) join `curso` `c` on((`c`.`codigo_de_curso` = `ce`.`codigo_de_curso`))) join `catedra` `ca` on((`ca`.`codigo_de_catedra` = `c`.`codigo_de_catedra`))) group by `ca`.`catedra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cantidaddeaprobadospormateria`
--

/*!50001 DROP VIEW IF EXISTS `cantidaddeaprobadospormateria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cantidaddeaprobadospormateria` AS select `ca`.`catedra` AS `Materia`,count(`e`.`legajo_estudiante`) AS `Cantidad de aprobados` from (((`estudiante` `e` join `curso_estudiante` `ce` on((`e`.`legajo_estudiante` = `ce`.`legajo_estudiante`))) join `curso` `c` on((`c`.`codigo_de_curso` = `ce`.`codigo_de_curso`))) join `catedra` `ca` on((`ca`.`codigo_de_catedra` = `c`.`codigo_de_catedra`))) where (`e`.`legajo_estudiante` in (select `ex`.`legajo_estudiante` from `examen` `ex` where ((`c`.`codigo_de_curso` = `ex`.`codigo_de_curso`) and (`ex`.`numero_examen` = 1) and (`ex`.`nota` >= 6))) and `e`.`legajo_estudiante` in (select `ex`.`legajo_estudiante` from `examen` `ex` where ((`c`.`codigo_de_curso` = `ex`.`codigo_de_curso`) and (`ex`.`numero_examen` = 2) and (`ex`.`nota` >= 6)))) group by `ca`.`catedra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cantidaddecursospormateria`
--

/*!50001 DROP VIEW IF EXISTS `cantidaddecursospormateria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cantidaddecursospormateria` AS select `ca`.`catedra` AS `Materia`,count(`c`.`codigo_de_curso`) AS `Cantidad de cursos` from (`curso` `c` join `catedra` `ca` on((`c`.`codigo_de_catedra` = `ca`.`codigo_de_catedra`))) group by `ca`.`catedra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cantidaddedesaprobadospormateria`
--

/*!50001 DROP VIEW IF EXISTS `cantidaddedesaprobadospormateria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cantidaddedesaprobadospormateria` AS select `ca`.`catedra` AS `Materia`,count(`e`.`legajo_estudiante`) AS `Cantidad de desaprobados` from (((`estudiante` `e` join `curso_estudiante` `ce` on((`e`.`legajo_estudiante` = `ce`.`legajo_estudiante`))) join `curso` `c` on((`c`.`codigo_de_curso` = `ce`.`codigo_de_curso`))) join `catedra` `ca` on((`ca`.`codigo_de_catedra` = `c`.`codigo_de_catedra`))) where (`e`.`legajo_estudiante` in (select `ex`.`legajo_estudiante` from `examen` `ex` where ((`c`.`codigo_de_curso` = `ex`.`codigo_de_curso`) and (`ex`.`numero_examen` = 1) and (`ex`.`nota` < 6))) and `e`.`legajo_estudiante` in (select `ex`.`legajo_estudiante` from `examen` `ex` where ((`c`.`codigo_de_curso` = `ex`.`codigo_de_curso`) and (`ex`.`numero_examen` = 2) and (`ex`.`nota` < 6)))) group by `ca`.`catedra` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13 21:07:31
