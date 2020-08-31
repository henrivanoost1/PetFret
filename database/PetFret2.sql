CREATE DATABASE  IF NOT EXISTS `petfret` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petfret`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: petfret
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `gebruikersnaam` varchar(45) NOT NULL,
  `wachtwoord` varchar(45) NOT NULL,
  `geboortedatum` date NOT NULL,
  `mail` varchar(45) NOT NULL,
  `telnummer` varchar(45) DEFAULT NULL,
  `voornaam` varchar(45) NOT NULL,
  `achternaam` varchar(45) NOT NULL,
  PRIMARY KEY (`idAccount`),
  UNIQUE KEY `gebruikersnaam_UNIQUE` (`gebruikersnaam`),
  UNIQUE KEY `mail_UNIQUE` (`mail`),
  UNIQUE KEY `telnummer_UNIQUE` (`telnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'tempor','facilisis','1995-01-28','ante@Crasdolor.com','09 98 18 47 94','Laurel','Boone'),(2,'varius','Integer','2007-07-02','consectetuer.adipiscing@mifringilla.com','03 87 33 13 77','Bradley','Mcfadden'),(3,'ultrices','adipiscing','1992-07-12','eu.dui.Cum@Proin.edu','05 53 80 49 80','Slade','Cortez'),(4,'Suspendisse','magna.','2010-01-27','Integer.vitae@amet.net','03 24 04 59 36','Margaret','Robbins'),(5,'ornare','Nunc','2001-06-13','enim@antedictummi.com','04 74 29 50 30','Macy','Alexander'),(6,'lorem','magna','1989-01-22','euismod.mauris.eu@convallisin.net','04 80 74 38 79','Keefe','Wiley'),(7,'velit.','id,','1989-11-18','sagittis.Duis.gravida@maurisanunc.ca','01 30 03 00 51','Maya','Henry'),(8,'mattis','Nullam','2004-08-21','enim.Etiam@sollicitudincommodoipsum.co.uk','08 93 71 49 20','Amy','Davenport'),(9,'Vestibulum','aliquet','1995-09-21','tempus@MorbivehiculaPellentesque.co.uk','09 00 82 46 77','Maile','Rodriquez'),(10,'et,','adipiscing','2006-07-20','eu.arcu@Proin.org','09 51 78 15 76','Valentine','Rocha'),(11,'Aphroditenisl','nisl','2006-07-23','Aphroditenisl@gmail.com','09 72 42 40 39','Aphrodite','Noel'),(12,'Altheapenatibus','penatibus','2004-05-11','Altheapenatibus@gmail.com','08 57 68 15 87','Althea','Coffey'),(13,'Kadeemdictum','dictum','1991-08-27','Kadeemdictum@gmail.com','07 64 09 75 45','Kadeem','Newton'),(14,'DaraPellentesque','Pellentesque','1978-02-25','DaraPellentesque@gmail.com','01 29 82 91 06','Dara','Harper'),(15,'SarahSed','Sed','2000-07-11','SarahSed@gmail.com','04 18 70 38 45','Sarah','Roberts'),(16,'Cadeante','ante','1998-11-25','Cadeante@gmail.com','01 40 26 94 75','Cade','Monroe'),(17,'Yvetteorci','orci','2002-05-09','Yvetteorci@gmail.com','01 74 63 47 47','Yvette','Bush'),(18,'Addisonelementum','elementum','2003-09-28','Addisonelementum@gmail.com','05 35 26 82 41','Addison','Pugh'),(19,'Garretteros.','eros.','1984-09-29','Garretteros.@gmail.com','02 28 78 93 38','Garrett','Clarke'),(20,'Maggyenim','enim','1983-01-26','Maggyenim@gmail.com','05 10 29 10 24','Maggy','Parrish'),(21,'Phoebeturpis.','turpis.','2000-11-18','Phoebeturpis.@gmail.com','09 54 89 22 45','Phoebe','Gordon'),(22,'Kyleefeugiat.','feugiat.','1993-02-11','Kyleefeugiat.@gmail.com','09 30 73 24 85','Kylee','Clayton'),(23,'Malikvel','vel','2003-07-26','Malikvel@gmail.com','04 72 26 85 71','Malik','Sawyer'),(24,'Zeldanon,','non,','2011-02-01','Zeldanon,@gmail.com','06 67 83 02 55','Zelda','Conrad'),(25,'Marciaeget','eget','1994-09-14','Marciaeget@gmail.com','02 27 13 20 79','Marcia','Adams'),(26,'Kirstenconsectetuer','consectetuer','2008-08-04','Kirstenconsectetuer@gmail.com','07 42 60 98 12','Kirsten','Duncan'),(27,'Portialigula','ligula','1987-02-03','Portialigula@gmail.com','06 34 36 49 51','Portia','Hardin'),(28,'Stephenvel','vel','1988-04-05','Stephenvel@gmail.com','08 63 62 80 17','Stephen','Fletcher'),(29,'Leonon,','non,','1982-06-11','Leonon,@gmail.com','04 43 01 69 30','Leo','Orr'),(30,'CleoAliquam','Aliquam','1989-04-21','CleoAliquam@gmail.com','03 48 09 61 52','Cleo','Bray'),(31,'GriffithDonec','Donec','1981-07-13','GriffithDonec@gmail.com','03 76 95 36 36','Griffith','Buchanan'),(32,'Barclayeu','eu','1998-07-03','Barclayeu@gmail.com','07 49 20 84 47','Barclay','Alexander'),(33,'Orlandodolor.','dolor.','2011-08-16','Orlandodolor.@gmail.com','05 86 56 36 63','Orlando','Lynn'),(34,'MarvinDonec','Donec','2008-02-15','MarvinDonec@gmail.com','04 37 31 30 56','Marvin','Bailey'),(35,'Lucyaliquet','aliquet','1994-01-19','Lucyaliquet@gmail.com','02 78 34 82 94','Lucy','Lynn'),(36,'Emmasem','sem','1983-11-05','Emmasem@gmail.com','01 21 82 61 45','Emma','Dejesus'),(37,'Clarkeu','eu','2001-04-27','Clarkeu@gmail.com','09 94 98 97 48','Clark','Snider'),(38,'Kierantempus','tempus','2006-11-20','Kierantempus@gmail.com','09 49 57 32 77','Kieran','Solis'),(39,'Burtonconsectetuer','consectetuer','1994-08-19','Burtonconsectetuer@gmail.com','02 33 51 16 98','Burton','Pope'),(40,'Pearlvel','vel','2003-12-29','Pearlvel@gmail.com','05 04 35 02 38','Pearl','Russell'),(41,'Oliverrhoncus.','rhoncus.','2004-08-25','Oliverrhoncus.@gmail.com','02 91 52 77 21','Oliver','Saunders'),(42,'Leighsed','sed','2009-10-09','Leighsed@gmail.com','03 16 52 39 66','Leigh','Crawford'),(43,'ZephrMaecenas','Maecenas','1998-03-21','ZephrMaecenas@gmail.com','03 52 51 64 16','Zephr','Hurst'),(44,'AngelicaVivamus','Vivamus','1999-08-11','AngelicaVivamus@gmail.com','08 92 25 50 54','Angelica','Cochran'),(45,'Nissimaliquet','aliquet','2000-09-05','Nissimaliquet@gmail.com','04 97 84 57 58','Nissim','Yates'),(46,'Rhonaposuere,','posuere,','1999-03-08','Rhonaposuere,@gmail.com','03 59 42 94 30','Rhona','Preston'),(47,'Jasonmontes,','montes,','2010-01-14','Jasonmontes,@gmail.com','09 78 98 34 28','Jason','Patrick'),(48,'VivienNam','Nam','1992-09-11','VivienNam@gmail.com','08 17 30 83 05','Vivien','Maxwell'),(49,'Hilaryut','ut','1988-07-14','Hilaryut@gmail.com','05 60 43 00 09','Hilary','Sparks'),(50,'Kevinaliquet','aliquet','1999-08-19','Kevinaliquet@gmail.com','04 25 47 70 45','Kevin','Sanders'),(51,'Wynneeu,','eu,','2001-12-10','Wynneeu,@gmail.com','06 99 65 07 90','Wynne','King'),(52,'Isaiahblandit','blandit','1984-02-14','Isaiahblandit@gmail.com','09 05 08 76 90','Isaiah','Myers'),(53,'Borisodio','odio','1990-10-14','Borisodio@gmail.com','08 36 75 17 89','Boris','Britt'),(54,'Zahircongue','congue','1984-10-02','Zahircongue@gmail.com','07 52 81 70 02','Zahir','Gallegos'),(55,'Mirapharetra,','pharetra,','1989-04-29','Mirapharetra,@gmail.com','04 77 83 02 70','Mira','Faulkner'),(56,'SigourneySed','Sed','1992-03-26','SigourneySed@gmail.com','03 41 31 26 08','Sigourney','Avila'),(57,'Pricelacus.','lacus.','2010-03-05','Pricelacus.@gmail.com','06 91 25 98 61','Price','Andrews'),(58,'LilaIn','In','1982-03-03','LilaIn@gmail.com','02 19 91 29 07','Lila','Raymond'),(59,'KatoDuis','Duis','1988-12-25','KatoDuis@gmail.com','07 43 56 38 28','Kato','Bernard'),(60,'Walterelit,','elit,','1978-03-01','Walterelit,@gmail.com','06 88 79 68 12','Walter','Moses'),(61,'Jelanialiquam','aliquam','1977-08-22','Jelanialiquam@gmail.com','05 11 04 91 07','Jelani','Hahn'),(62,'Jesseegestas','egestas','1989-08-14','Jesseegestas@gmail.com','04 04 18 56 35','Jesse','Cook'),(63,'Kaseemmolestie.','molestie.','2003-06-01','Kaseemmolestie.@gmail.com','09 48 35 05 60','Kaseem','Montgomery'),(64,'Danieldictum','dictum','1984-02-06','Danieldictum@gmail.com','02 61 79 70 42','Daniel','Rich'),(65,'Stephaniedignissim','dignissim','1982-02-12','Stephaniedignissim@gmail.com','01 19 61 70 37','Stephanie','Gutierrez'),(66,'BrennanNullam','Nullam','2006-11-21','BrennanNullam@gmail.com','05 15 07 40 32','Brennan','Chan'),(67,'Nerometus.','metus.','2011-09-24','Nerometus.@gmail.com','06 86 27 52 12','Nero','Vinson'),(68,'ClintonFusce','Fusce','2004-07-26','ClintonFusce@gmail.com','06 20 84 91 72','Clinton','Head'),(69,'ClintonMaecenas','Maecenas','1998-04-21','ClintonMaecenas@gmail.com','07 11 96 99 00','Clinton','Ware'),(70,'Ahmedamet','amet','1997-03-08','Ahmedamet@gmail.com','07 34 57 99 32','Ahmed','Coffey'),(71,'Kanerisus.','risus.','2001-03-14','Kanerisus.@gmail.com','02 12 04 13 81','Kane','Adams'),(72,'Danielleeget','eget','2010-11-16','Danielleeget@gmail.com','07 57 13 14 81','Danielle','Rocha'),(73,'Louismagna','magna','2004-05-22','Louismagna@gmail.com','08 77 99 59 27','Louis','Wolfe'),(74,'Orensit','sit','1980-05-30','Orensit@gmail.com','02 81 63 92 81','Oren','Dillon'),(75,'IolaAliquam','Aliquam','1984-07-26','IolaAliquam@gmail.com','09 54 45 23 03','Iola','Finch'),(76,'Claudialacus.','lacus.','1984-06-01','Claudialacus.@gmail.com','02 16 92 06 90','Claudia','Love'),(77,'QuincyEtiam','Etiam','1990-02-28','QuincyEtiam@gmail.com','06 01 97 44 74','Quincy','Travis'),(78,'Stacyvestibulum,','vestibulum,','1983-04-04','Stacyvestibulum,@gmail.com','02 36 65 18 47','Stacy','Fox'),(79,'Chantalepurus,','purus,','1993-09-08','Chantalepurus,@gmail.com','09 23 24 55 45','Chantale','Buchanan'),(80,'Porteret','et','2005-07-13','Porteret@gmail.com','01 55 68 66 49','Porter','Lucas'),(81,'Alyssaeu','eu','1985-12-20','Alyssaeu@gmail.com','01 06 94 66 75','Alyssa','Wilkerson'),(82,'XavieraNullam','Nullam','1994-04-08','XavieraNullam@gmail.com','03 21 49 72 01','Xaviera','Peck'),(83,'FlaviaEtiam','Etiam','2005-05-25','FlaviaEtiam@gmail.com','04 98 69 64 63','Flavia','Cabrera'),(84,'Macaulayquis','quis','2001-08-28','Macaulayquis@gmail.com','09 93 47 54 28','Macaulay','Holman'),(85,'GloriaFusce','Fusce','2000-12-30','GloriaFusce@gmail.com','03 11 41 63 99','Gloria','Bass'),(86,'Auroraplacerat','placerat','1985-06-26','Auroraplacerat@gmail.com','05 86 68 23 02','Aurora','Snyder'),(87,'Rayprimis','primis','2010-03-25','Rayprimis@gmail.com','05 41 76 55 84','Ray','Boone'),(88,'Janedolor','dolor','1990-11-07','Janedolor@gmail.com','09 31 49 11 76','Jane','Mason'),(89,'FrederickaDonec','Donec','1989-01-10','FrederickaDonec@gmail.com','05 68 40 36 52','Fredericka','Buck'),(90,'Nathanielnec','nec','2002-02-05','Nathanielnec@gmail.com','09 72 83 57 49','Nathaniel','Blankenship'),(91,'Brandonullamcorper,','ullamcorper,','1993-09-15','Brandonullamcorper,@gmail.com','05 67 59 83 14','Brandon','Lowery'),(92,'Beaurisus','risus','1984-08-08','Beaurisus@gmail.com','05 03 36 60 20','Beau','Mcmahon'),(93,'Kiayadavarius','varius','2012-02-11','Kiayadavarius@gmail.com','02 54 02 80 17','Kiayada','Nguyen'),(94,'Moanaeu,','eu,','1982-05-12','Moanaeu,@gmail.com','05 47 42 48 43','Moana','Reid'),(95,'Maiteinterdum','interdum','1979-07-21','Maiteinterdum@gmail.com','09 28 89 46 71','Maite','Hinton'),(96,'PerryAenean','Aenean','1995-02-18','PerryAenean@gmail.com','08 68 78 06 52','Perry','Meadows'),(97,'Eatonmetus','metus','1980-08-22','Eatonmetus@gmail.com','05 74 87 69 12','Eaton','Gill'),(98,'Myleshendrerit','hendrerit','1994-01-04','Myleshendrerit@gmail.com','03 37 51 68 63','Myles','Gomez'),(99,'Rajahmolestie','molestie','2000-12-26','Rajahmolestie@gmail.com','06 47 32 21 14','Rajah','Haley'),(100,'Selmaat,','at,','2010-05-22','Selmaat,@gmail.com','08 36 06 49 88','Selma','Faulkner');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meting`
--

DROP TABLE IF EXISTS `meting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meting` (
  `idMeting` int NOT NULL AUTO_INCREMENT,
  `waarde` decimal(10,0) NOT NULL,
  `meeteenheid` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `Sensor_idSensor` int NOT NULL,
  `Voedingsbak_idVoedingsbak` int DEFAULT NULL,
  PRIMARY KEY (`idMeting`),
  KEY `fk_Meting_Sensor1_idx` (`Sensor_idSensor`),
  KEY `fk_Meting_Voedingsbak1_idx` (`Voedingsbak_idVoedingsbak`),
  CONSTRAINT `fk_Meting_Sensor1` FOREIGN KEY (`Sensor_idSensor`) REFERENCES `sensor` (`idSensor`),
  CONSTRAINT `fk_Meting_Voedingsbak1` FOREIGN KEY (`Voedingsbak_idVoedingsbak`) REFERENCES `voedingsbak` (`idVoedingsbak`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meting`
--

LOCK TABLES `meting` WRITE;
/*!40000 ALTER TABLE `meting` DISABLE KEYS */;
INSERT INTO `meting` VALUES (1,6,'centimeter','2020-07-24 17:15:50',1,1),(2,10,'liter','2019-07-22 01:33:47',2,2),(3,9,'gram','2020-11-17 15:44:04',3,3),(4,9,'gram','2020-08-15 22:24:55',4,4),(5,2,'gram','2020-06-14 19:32:40',5,5),(6,7,'gram','2019-10-07 14:04:47',6,6),(7,7,'gram','2019-06-24 09:43:38',7,7),(8,2,'gram','2021-02-01 00:21:56',8,8),(9,5,'gram','2019-08-05 02:49:33',9,9),(10,2,'gram','2021-03-26 16:58:38',10,10),(11,6,'gram','2020-10-09 01:02:15',11,11),(12,9,'gram','2020-09-28 04:44:08',12,12),(13,8,'gram','2021-05-17 23:40:04',13,13),(14,10,'gram','2020-01-05 01:46:31',14,14),(15,1,'gram','2020-12-07 04:10:18',15,15),(16,6,'gram','2020-06-14 08:36:31',16,16),(17,5,'gram','2020-06-27 20:55:11',17,17),(18,10,'gram','2020-03-08 21:29:48',18,18),(19,5,'gram','2020-07-25 07:45:37',19,19),(20,7,'gram','2020-01-03 17:24:49',20,20),(21,7,'gram','2020-12-22 17:21:32',21,21),(22,10,'gram','2020-05-01 08:19:46',22,22),(23,7,'gram','2019-10-29 05:57:52',23,23),(24,10,'gram','2021-03-02 08:09:00',24,24),(25,6,'gram','2020-01-11 11:07:09',25,25),(26,7,'gram','2019-09-25 15:15:37',26,26),(27,7,'gram','2020-09-20 23:58:32',27,27),(28,3,'gram','2020-09-06 21:44:48',28,28),(29,7,'gram','2019-12-14 17:23:44',29,29),(30,2,'gram','2020-12-13 12:12:39',30,30),(31,8,'gram','2020-01-02 02:47:08',31,31),(32,3,'gram','2020-04-17 14:12:13',32,32),(33,10,'gram','2019-09-17 18:16:25',33,33),(34,6,'gram','2019-08-28 23:23:43',34,34),(35,8,'gram','2019-08-28 06:05:05',35,35),(36,9,'gram','2020-09-21 17:15:57',36,36),(37,7,'gram','2019-12-24 19:40:06',37,37),(38,3,'gram','2021-03-26 05:17:43',38,38),(39,8,'gram','2020-08-21 11:14:46',39,39),(40,1,'gram','2020-11-21 02:35:22',40,40),(41,8,'gram','2019-10-20 23:07:32',41,41),(42,8,'gram','2019-07-11 02:05:56',42,42),(43,6,'gram','2020-11-18 13:59:55',43,43),(44,7,'gram','2020-01-29 06:53:21',44,44),(45,6,'gram','2019-06-07 16:27:36',45,45),(46,4,'gram','2019-09-05 02:35:07',46,46),(47,7,'gram','2020-04-20 16:54:07',47,47),(48,5,'gram','2019-08-28 00:02:10',48,48),(49,2,'gram','2020-04-17 10:12:53',49,49),(50,2,'gram','2020-10-03 07:38:17',50,50),(51,4,'gram','2021-02-05 18:29:03',51,51),(52,7,'gram','2020-02-17 09:50:25',52,52),(53,5,'gram','2020-03-28 15:04:19',53,53),(54,9,'gram','2020-02-18 20:07:52',54,54),(55,6,'gram','2019-12-01 04:49:29',55,55),(56,9,'gram','2021-03-04 07:39:36',56,56),(57,6,'gram','2019-07-10 11:20:18',57,57),(58,2,'gram','2019-08-29 17:10:33',58,58),(59,1,'gram','2020-06-01 21:10:05',59,59),(60,8,'gram','2021-04-29 02:20:11',60,60),(61,8,'gram','2019-12-24 15:21:28',61,61),(62,5,'gram','2021-04-01 22:29:17',62,62),(63,4,'gram','2021-05-16 18:45:37',63,63),(64,7,'gram','2020-07-19 20:19:13',64,64),(65,6,'gram','2020-07-24 06:47:57',65,65),(66,2,'gram','2019-05-28 06:54:54',66,66),(67,8,'gram','2020-05-12 12:51:22',67,67),(68,7,'gram','2019-05-31 16:38:03',68,68),(69,5,'gram','2020-11-14 16:03:47',69,69),(70,9,'gram','2020-02-16 10:00:14',70,70),(71,6,'gram','2020-08-25 16:09:14',71,71),(72,2,'gram','2020-11-06 15:00:06',72,72),(73,5,'gram','2020-07-17 23:57:58',73,73),(74,1,'gram','2021-04-03 12:37:28',74,74),(75,6,'gram','2020-03-07 15:06:06',75,75),(76,5,'gram','2020-03-27 10:09:23',76,76),(77,1,'gram','2020-10-04 05:18:29',77,77),(78,8,'gram','2021-04-30 08:52:20',78,78),(79,3,'gram','2021-04-15 09:31:59',79,79),(80,10,'gram','2020-07-02 16:30:04',80,80),(81,4,'gram','2019-07-17 01:30:46',81,81),(82,8,'gram','2019-09-28 22:15:00',82,82),(83,7,'gram','2019-07-02 13:42:33',83,83),(84,5,'gram','2020-09-07 17:20:57',84,84),(85,1,'gram','2020-10-28 11:23:52',85,85),(86,1,'gram','2019-12-29 01:19:05',86,86),(87,9,'gram','2021-01-03 02:37:50',87,87),(88,1,'gram','2020-03-07 21:10:30',88,88),(89,2,'gram','2019-10-13 22:25:58',89,89),(90,5,'gram','2020-06-13 10:46:15',90,90),(91,10,'gram','2020-12-21 12:29:24',91,91),(92,5,'gram','2020-07-14 12:28:56',92,92),(93,9,'gram','2020-10-16 05:42:01',93,93),(94,2,'gram','2019-11-19 06:56:09',94,94),(95,1,'gram','2020-12-16 07:37:26',95,95),(96,8,'gram','2019-07-28 06:47:14',96,96),(97,2,'gram','2020-03-10 00:52:22',97,97),(98,8,'gram','2021-03-03 23:55:48',98,98),(99,9,'gram','2020-05-28 21:23:44',99,99),(100,5,'gram','2020-02-13 08:15:22',100,100);
/*!40000 ALTER TABLE `meting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema`
--

DROP TABLE IF EXISTS `schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema` (
  `idSchema` int NOT NULL AUTO_INCREMENT,
  `Account_idAccount` int NOT NULL,
  `Tijdstip` datetime DEFAULT NULL,
  `hoeveelheid` decimal(10,0) DEFAULT NULL,
  `Voeding_idVoeding` int NOT NULL,
  PRIMARY KEY (`idSchema`),
  KEY `fk_Schema_Account_idx` (`Account_idAccount`),
  KEY `fk_Schema_Voeding1_idx` (`Voeding_idVoeding`),
  CONSTRAINT `fk_Schema_Account` FOREIGN KEY (`Account_idAccount`) REFERENCES `account` (`idAccount`),
  CONSTRAINT `fk_Schema_Voeding1` FOREIGN KEY (`Voeding_idVoeding`) REFERENCES `voeding` (`idVoeding`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema`
--

LOCK TABLES `schema` WRITE;
/*!40000 ALTER TABLE `schema` DISABLE KEYS */;
INSERT INTO `schema` VALUES (1,1,'2020-12-27 02:44:16',9,1),(2,2,'2019-12-19 06:50:10',10,2),(3,3,'2019-06-16 09:21:52',6,3),(4,4,'2020-07-28 22:37:58',7,4),(5,5,'2019-08-01 16:11:00',4,5),(6,6,'2019-10-30 15:50:39',2,6),(7,7,'2021-03-18 02:59:58',3,7),(8,8,'2020-01-19 22:43:43',3,8),(9,9,'2020-09-06 13:30:51',8,9),(10,10,'2020-03-17 22:43:19',7,10),(11,11,'2020-07-16 13:50:45',8,11),(12,12,'2020-11-12 04:32:02',3,12),(13,13,'2020-07-05 05:47:23',7,13),(14,14,'2020-04-18 19:36:08',3,14),(15,15,'2020-01-19 11:13:50',7,15),(16,16,'2019-08-19 09:01:27',6,16),(17,17,'2019-12-03 04:32:37',8,17),(18,18,'2019-10-05 04:26:11',3,18),(19,19,'2020-04-06 09:07:46',6,19),(20,20,'2021-03-05 07:07:10',1,20),(21,21,'2020-02-06 15:28:27',10,21),(22,22,'2020-02-24 14:52:52',5,22),(23,23,'2020-09-22 20:53:32',9,23),(24,24,'2019-08-20 08:01:06',1,24),(25,25,'2019-08-29 23:49:39',9,25),(26,26,'2020-02-28 22:14:49',1,26),(27,27,'2020-01-30 07:08:39',8,27),(28,28,'2020-09-23 22:24:08',6,28),(29,29,'2020-01-05 19:26:45',10,29),(30,30,'2019-12-16 18:25:37',1,30),(31,31,'2019-12-12 06:41:11',10,31),(32,32,'2020-10-13 22:35:09',10,32),(33,33,'2020-12-16 18:28:04',1,33),(34,34,'2020-12-12 21:01:10',10,34),(35,35,'2020-02-18 10:51:36',1,35),(36,36,'2021-02-05 17:41:04',2,36),(37,37,'2020-09-15 09:41:11',8,37),(38,38,'2020-12-31 00:36:41',8,38),(39,39,'2020-06-22 04:25:41',6,39),(40,40,'2020-04-05 08:35:05',9,40),(41,41,'2020-06-07 22:55:58',9,41),(42,42,'2020-10-25 05:29:45',4,42),(43,43,'2020-03-17 15:19:16',1,43),(44,44,'2020-10-29 00:47:46',6,44),(45,45,'2020-03-28 11:31:07',2,45),(46,46,'2020-02-13 23:15:15',8,46),(47,47,'2021-04-02 08:21:54',7,47),(48,48,'2020-01-29 23:31:56',10,48),(49,49,'2021-05-01 10:03:26',4,49),(50,50,'2020-02-11 03:50:33',10,50),(51,51,'2019-08-29 23:38:11',7,51),(52,52,'2020-03-11 04:27:42',4,52),(53,53,'2019-11-09 21:10:40',7,53),(54,54,'2020-03-23 15:14:00',1,54),(55,55,'2019-11-14 07:31:54',1,55),(56,56,'2020-03-19 13:53:09',1,56),(57,57,'2020-05-26 18:39:58',8,57),(58,58,'2021-05-06 01:30:40',2,58),(59,59,'2020-12-01 23:09:19',4,59),(60,60,'2020-05-18 09:38:38',1,60),(61,61,'2020-03-09 16:46:33',4,61),(62,62,'2020-10-25 08:00:06',7,62),(63,63,'2020-10-01 12:22:32',5,63),(64,64,'2020-07-01 19:02:31',5,64),(65,65,'2020-11-28 01:04:24',8,65),(66,66,'2020-12-23 05:31:48',6,66),(67,67,'2019-06-25 16:41:15',1,67),(68,68,'2019-11-03 07:07:09',4,68),(69,69,'2019-12-12 02:37:59',2,69),(70,70,'2020-11-12 03:55:07',3,70),(71,71,'2019-07-23 04:00:29',2,71),(72,72,'2019-09-19 19:11:15',5,72),(73,73,'2020-10-04 04:49:44',10,73),(74,74,'2020-11-25 22:12:08',6,74),(75,75,'2020-10-31 09:14:00',10,75),(76,76,'2020-08-08 14:44:11',7,76),(77,77,'2020-06-19 04:28:29',2,77),(78,78,'2020-07-13 11:58:43',3,78),(79,79,'2021-02-02 02:04:43',2,79),(80,80,'2020-05-31 07:00:34',8,80),(81,81,'2020-04-08 03:37:20',10,81),(82,82,'2020-06-09 07:00:08',4,82),(83,83,'2020-07-29 19:13:18',1,83),(84,84,'2020-08-02 19:37:21',9,84),(85,85,'2020-09-25 06:32:53',10,85),(86,86,'2020-08-08 17:45:00',7,86),(87,87,'2020-11-18 15:52:19',2,87),(88,88,'2020-12-14 03:31:59',1,88),(89,89,'2021-04-15 00:43:46',8,89),(90,90,'2020-05-26 08:39:33',2,90),(91,91,'2020-11-11 11:40:45',5,91),(92,92,'2020-12-12 16:44:28',6,92),(93,93,'2020-02-28 11:29:35',9,93),(94,94,'2019-09-30 03:13:18',10,94),(95,95,'2019-10-03 05:46:50',9,95),(96,96,'2021-04-16 23:23:02',9,96),(97,97,'2019-11-17 02:22:19',9,97),(98,98,'2020-12-04 05:31:50',1,98),(99,99,'2019-12-22 08:26:26',9,99),(100,100,'2021-01-11 16:37:19',4,100);
/*!40000 ALTER TABLE `schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `idSensor` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) NOT NULL,
  `beschrijving` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSensor`),
  UNIQUE KEY `naam_UNIQUE` (`naam`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,'naam1','aliquet nec,'),(2,'naam2','orci lacus'),(3,'naam3','posuere vulputate,'),(4,'naam4','Phasellus in'),(5,'naam5','vehicula risus.'),(6,'naam6','ipsum. Curabitur'),(7,'naam7','volutpat ornare,'),(8,'naam8','Donec elementum,'),(9,'naam9','Vivamus non'),(10,'naam10','Donec felis'),(11,'naam11','mollis. Phasellus'),(12,'naam12','risus varius'),(13,'naam13','dictum. Phasellus'),(14,'naam14','Nullam ut'),(15,'naam15','sed, sapien.'),(16,'naam16','nec, euismod'),(17,'naam17','ac arcu.'),(18,'naam18','euismod in,'),(19,'naam19','sit amet'),(20,'naam20','magna. Lorem'),(21,'naam21','metus urna'),(22,'naam22','dictum eu,'),(23,'naam23','lectus convallis'),(24,'naam24','Proin mi.'),(25,'naam25','a, scelerisque'),(26,'naam26','semper et,'),(27,'naam27','euismod est'),(28,'naam28','Aliquam auctor,'),(29,'naam29','Quisque nonummy'),(30,'naam30','Mauris vestibulum,'),(31,'naam31','Aenean eget'),(32,'naam32','condimentum. Donec'),(33,'naam33','vel, faucibus'),(34,'naam34','nec mauris'),(35,'naam35','mi. Aliquam'),(36,'naam36','Maecenas ornare'),(37,'naam37','pellentesque a,'),(38,'naam38','ipsum non'),(39,'naam39','convallis ligula.'),(40,'naam40','bibendum fermentum'),(41,'naam41','eu sem.'),(42,'naam42','Nunc ac'),(43,'naam43','enim. Etiam'),(44,'naam44','velit. Quisque'),(45,'naam45','nec ligula'),(46,'naam46','mattis ornare,'),(47,'naam47','Cras vulputate'),(48,'naam48','tellus, imperdiet'),(49,'naam49','a mi'),(50,'naam50','vulputate velit'),(51,'naam51','Mauris non'),(52,'naam52','mollis. Integer'),(53,'naam53','a neque.'),(54,'naam54','ullamcorper magna.'),(55,'naam55','amet metus.'),(56,'naam56','magna nec'),(57,'naam57','facilisis eget,'),(58,'naam58','ac orci.'),(59,'naam59','sem, consequat'),(60,'naam60','nascetur ridiculus'),(61,'naam61','eu nibh'),(62,'naam62','vitae mauris'),(63,'naam63','feugiat metus'),(64,'naam64','at pede.'),(65,'naam65','Vivamus non'),(66,'naam66','quis diam'),(67,'naam67','arcu. Morbi'),(68,'naam68','Pellentesque habitant'),(69,'naam69','sit amet'),(70,'naam70','mollis lectus'),(71,'naam71','In condimentum.'),(72,'naam72','elementum, lorem'),(73,'naam73','urna. Nunc'),(74,'naam74','fames ac'),(75,'naam75','at pede.'),(76,'naam76','tincidunt orci'),(77,'naam77','tincidunt vehicula'),(78,'naam78','ipsum dolor'),(79,'naam79','egestas. Fusce'),(80,'naam80','enim. Mauris'),(81,'naam81','primis in'),(82,'naam82','facilisis. Suspendisse'),(83,'naam83','cursus, diam'),(84,'naam84','Aliquam erat'),(85,'naam85','lorem ut'),(86,'naam86','rhoncus. Proin'),(87,'naam87','vitae, erat.'),(88,'naam88','adipiscing lobortis'),(89,'naam89','nunc ac'),(90,'naam90','nascetur ridiculus'),(91,'naam91','rutrum eu,'),(92,'naam92','lectus pede'),(93,'naam93','scelerisque, lorem'),(94,'naam94','a, auctor'),(95,'naam95','gravida sagittis.'),(96,'naam96','Nunc ullamcorper,'),(97,'naam97','ante dictum'),(98,'naam98','Morbi neque'),(99,'naam99','rhoncus id,'),(100,'naam100','eleifend. Cras');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voeding`
--

DROP TABLE IF EXISTS `voeding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voeding` (
  `idVoeding` int NOT NULL AUTO_INCREMENT,
  `naam` varchar(45) NOT NULL,
  `beschrijving` varchar(45) DEFAULT NULL,
  `eenheid` varchar(45) NOT NULL,
  PRIMARY KEY (`idVoeding`),
  UNIQUE KEY `naam_UNIQUE` (`naam`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voeding`
--

LOCK TABLES `voeding` WRITE;
/*!40000 ALTER TABLE `voeding` DISABLE KEYS */;
INSERT INTO `voeding` VALUES (1,'naam1','aliquet nec,','gram'),(2,'naam2','orci lacus','gram'),(3,'naam3','posuere vulputate,','gram'),(4,'naam4','Phasellus in','gram'),(5,'naam5','vehicula risus.','gram'),(6,'naam6','ipsum. Curabitur','gram'),(7,'naam7','volutpat ornare,','gram'),(8,'naam8','Donec elementum,','gram'),(9,'naam9','Vivamus non','gram'),(10,'naam10','Donec felis','gram'),(11,'naam11','mollis. Phasellus','gram'),(12,'naam12','risus varius','gram'),(13,'naam13','dictum. Phasellus','gram'),(14,'naam14','Nullam ut','gram'),(15,'naam15','sed, sapien.','gram'),(16,'naam16','nec, euismod','gram'),(17,'naam17','ac arcu.','gram'),(18,'naam18','euismod in,','gram'),(19,'naam19','sit amet','gram'),(20,'naam20','magna. Lorem','gram'),(21,'naam21','metus urna','gram'),(22,'naam22','dictum eu,','gram'),(23,'naam23','lectus convallis','gram'),(24,'naam24','Proin mi.','gram'),(25,'naam25','a, scelerisque','liter'),(26,'naam26','semper et,','liter'),(27,'naam27','euismod est','liter'),(28,'naam28','Aliquam auctor,','liter'),(29,'naam29','Quisque nonummy','liter'),(30,'naam30','Mauris vestibulum,','liter'),(31,'naam31','Aenean eget','liter'),(32,'naam32','condimentum. Donec','liter'),(33,'naam33','vel, faucibus','liter'),(34,'naam34','nec mauris','liter'),(35,'naam35','mi. Aliquam','liter'),(36,'naam36','Maecenas ornare','liter'),(37,'naam37','pellentesque a,','liter'),(38,'naam38','ipsum non','liter'),(39,'naam39','convallis ligula.','liter'),(40,'naam40','bibendum fermentum','liter'),(41,'naam41','eu sem.','liter'),(42,'naam42','Nunc ac','liter'),(43,'naam43','enim. Etiam','liter'),(44,'naam44','velit. Quisque','liter'),(45,'naam45','nec ligula','liter'),(46,'naam46','mattis ornare,','liter'),(47,'naam47','Cras vulputate','liter'),(48,'naam48','tellus, imperdiet','liter'),(49,'naam49','a mi','liter'),(50,'naam50','vulputate velit','liter'),(51,'naam51','Mauris non','liter'),(52,'naam52','mollis. Integer','liter'),(53,'naam53','a neque.','liter'),(54,'naam54','ullamcorper magna.','liter'),(55,'naam55','amet metus.','liter'),(56,'naam56','magna nec','liter'),(57,'naam57','facilisis eget,','liter'),(58,'naam58','ac orci.','liter'),(59,'naam59','sem, consequat','liter'),(60,'naam60','nascetur ridiculus','liter'),(61,'naam61','eu nibh','liter'),(62,'naam62','vitae mauris','liter'),(63,'naam63','feugiat metus','liter'),(64,'naam64','at pede.','liter'),(65,'naam65','Vivamus non','liter'),(66,'naam66','quis diam','liter'),(67,'naam67','arcu. Morbi','liter'),(68,'naam68','Pellentesque habitant','liter'),(69,'naam69','sit amet','liter'),(70,'naam70','mollis lectus','liter'),(71,'naam71','In condimentum.','liter'),(72,'naam72','elementum, lorem','liter'),(73,'naam73','urna. Nunc','liter'),(74,'naam74','fames ac','liter'),(75,'naam75','at pede.','liter'),(76,'naam76','tincidunt orci','liter'),(77,'naam77','tincidunt vehicula','liter'),(78,'naam78','ipsum dolor','liter'),(79,'naam79','egestas. Fusce','liter'),(80,'naam80','enim. Mauris','liter'),(81,'naam81','primis in','liter'),(82,'naam82','facilisis. Suspendisse','liter'),(83,'naam83','cursus, diam','liter'),(84,'naam84','Aliquam erat','liter'),(85,'naam85','lorem ut','liter'),(86,'naam86','rhoncus. Proin','liter'),(87,'naam87','vitae, erat.','liter'),(88,'naam88','adipiscing lobortis','liter'),(89,'naam89','nunc ac','liter'),(90,'naam90','nascetur ridiculus','liter'),(91,'naam91','rutrum eu,','liter'),(92,'naam92','lectus pede','liter'),(93,'naam93','scelerisque, lorem','liter'),(94,'naam94','a, auctor','liter'),(95,'naam95','gravida sagittis.','liter'),(96,'naam96','Nunc ullamcorper,','liter'),(97,'naam97','ante dictum','liter'),(98,'naam98','Morbi neque','liter'),(99,'naam99','rhoncus id,','liter'),(100,'naam100','eleifend. Cras','liter');
/*!40000 ALTER TABLE `voeding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voedingsbak`
--

DROP TABLE IF EXISTS `voedingsbak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voedingsbak` (
  `idVoedingsbak` int NOT NULL,
  `Voeding_idVoeding` int NOT NULL,
  `hoeveelheid` decimal(10,0) DEFAULT NULL,
  `Sensor_idSensor` int NOT NULL,
  PRIMARY KEY (`idVoedingsbak`),
  KEY `fk_Voedingsbak_Voeding1_idx` (`Voeding_idVoeding`),
  KEY `fk_Voedingsbak_Sensor1_idx` (`Sensor_idSensor`),
  CONSTRAINT `fk_Voedingsbak_Sensor1` FOREIGN KEY (`Sensor_idSensor`) REFERENCES `sensor` (`idSensor`),
  CONSTRAINT `fk_Voedingsbak_Voeding1` FOREIGN KEY (`Voeding_idVoeding`) REFERENCES `voeding` (`idVoeding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voedingsbak`
--

LOCK TABLES `voedingsbak` WRITE;
/*!40000 ALTER TABLE `voedingsbak` DISABLE KEYS */;
INSERT INTO `voedingsbak` VALUES (1,1,2,1),(2,2,3,2),(3,3,6,3),(4,4,8,4),(5,5,3,5),(6,6,1,6),(7,7,3,7),(8,8,4,8),(9,9,8,9),(10,10,10,10),(11,11,2,11),(12,12,1,12),(13,13,6,13),(14,14,8,14),(15,15,5,15),(16,16,1,16),(17,17,8,17),(18,18,6,18),(19,19,8,19),(20,20,6,20),(21,21,3,21),(22,22,6,22),(23,23,7,23),(24,24,3,24),(25,25,8,25),(26,26,2,26),(27,27,1,27),(28,28,2,28),(29,29,7,29),(30,30,10,30),(31,31,7,31),(32,32,8,32),(33,33,7,33),(34,34,5,34),(35,35,10,35),(36,36,5,36),(37,37,7,37),(38,38,9,38),(39,39,6,39),(40,40,9,40),(41,41,10,41),(42,42,10,42),(43,43,9,43),(44,44,8,44),(45,45,5,45),(46,46,5,46),(47,47,1,47),(48,48,6,48),(49,49,6,49),(50,50,5,50),(51,51,10,51),(52,52,7,52),(53,53,1,53),(54,54,7,54),(55,55,9,55),(56,56,1,56),(57,57,4,57),(58,58,8,58),(59,59,3,59),(60,60,9,60),(61,61,10,61),(62,62,9,62),(63,63,9,63),(64,64,6,64),(65,65,6,65),(66,66,4,66),(67,67,9,67),(68,68,7,68),(69,69,1,69),(70,70,10,70),(71,71,1,71),(72,72,1,72),(73,73,3,73),(74,74,5,74),(75,75,8,75),(76,76,7,76),(77,77,5,77),(78,78,8,78),(79,79,4,79),(80,80,8,80),(81,81,8,81),(82,82,10,82),(83,83,1,83),(84,84,8,84),(85,85,6,85),(86,86,5,86),(87,87,3,87),(88,88,1,88),(89,89,2,89),(90,90,7,90),(91,91,10,91),(92,92,8,92),(93,93,6,93),(94,94,2,94),(95,95,2,95),(96,96,8,96),(97,97,6,97),(98,98,8,98),(99,99,7,99),(100,100,7,100);
/*!40000 ALTER TABLE `voedingsbak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voorraad`
--

DROP TABLE IF EXISTS `voorraad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voorraad` (
  `idVoorraad` int NOT NULL AUTO_INCREMENT,
  `hoeveelheid` decimal(10,0) NOT NULL,
  `Voeding_idVoeding` int NOT NULL,
  `Sensor_idSensor` int NOT NULL,
  PRIMARY KEY (`idVoorraad`),
  KEY `fk_Voorraad_Voeding1_idx` (`Voeding_idVoeding`),
  KEY `fk_Voorraad_Sensor1_idx` (`Sensor_idSensor`),
  CONSTRAINT `fk_Voorraad_Sensor1` FOREIGN KEY (`Sensor_idSensor`) REFERENCES `sensor` (`idSensor`),
  CONSTRAINT `fk_Voorraad_Voeding1` FOREIGN KEY (`Voeding_idVoeding`) REFERENCES `voeding` (`idVoeding`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voorraad`
--

LOCK TABLES `voorraad` WRITE;
/*!40000 ALTER TABLE `voorraad` DISABLE KEYS */;
INSERT INTO `voorraad` VALUES (1,5,1,1),(2,10,2,2),(3,3,3,3),(4,2,4,4),(5,9,5,5),(6,6,6,6),(7,3,7,7),(8,6,8,8),(9,6,9,9),(10,2,10,10),(11,1,11,11),(12,6,12,12),(13,5,13,13),(14,10,14,14),(15,7,15,15),(16,3,16,16),(17,3,17,17),(18,3,18,18),(19,10,19,19),(20,2,20,20),(21,3,21,21),(22,1,22,22),(23,5,23,23),(24,2,24,24),(25,1,25,25),(26,3,26,26),(27,3,27,27),(28,8,28,28),(29,10,29,29),(30,4,30,30),(31,6,31,31),(32,10,32,32),(33,10,33,33),(34,4,34,34),(35,10,35,35),(36,4,36,36),(37,7,37,37),(38,2,38,38),(39,5,39,39),(40,6,40,40),(41,4,41,41),(42,7,42,42),(43,5,43,43),(44,8,44,44),(45,2,45,45),(46,3,46,46),(47,10,47,47),(48,3,48,48),(49,8,49,49),(50,1,50,50),(51,9,51,51),(52,9,52,52),(53,10,53,53),(54,4,54,54),(55,2,55,55),(56,10,56,56),(57,1,57,57),(58,10,58,58),(59,10,59,59),(60,10,60,60),(61,7,61,61),(62,10,62,62),(63,2,63,63),(64,2,64,64),(65,8,65,65),(66,1,66,66),(67,6,67,67),(68,6,68,68),(69,2,69,69),(70,3,70,70),(71,1,71,71),(72,9,72,72),(73,1,73,73),(74,1,74,74),(75,2,75,75),(76,8,76,76),(77,1,77,77),(78,10,78,78),(79,5,79,79),(80,7,80,80),(81,4,81,81),(82,5,82,82),(83,7,83,83),(84,3,84,84),(85,1,85,85),(86,7,86,86),(87,5,87,87),(88,8,88,88),(89,4,89,89),(90,5,90,90),(91,2,91,91),(92,6,92,92),(93,9,93,93),(94,8,94,94),(95,1,95,95),(96,1,96,96),(97,2,97,97),(98,3,98,98),(99,10,99,99),(100,8,100,100);
/*!40000 ALTER TABLE `voorraad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'petfret'
--

--
-- Dumping routines for database 'petfret'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26  2:13:25
