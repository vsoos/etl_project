
-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: rentalservice
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (7,'bed'),(9,'child'),(8,'establish'),(10,'main'),(4,'occur'),(5,'practice'),(2,'right'),(3,'risk'),(6,'soldier'),(1,'them');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalItems`
--

DROP TABLE IF EXISTS `RentalItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RentalItems` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `creation_date` date NOT NULL,
  `inserted_by` int NOT NULL,
  `deletion_date` date DEFAULT NULL,
  `status` enum('free','borrowed','lost') DEFAULT NULL,
  `primary_location` varchar(255) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `inserted_by` (`inserted_by`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `rentalitems_ibfk_1` FOREIGN KEY (`inserted_by`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `rentalitems_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalItems`
--

LOCK TABLES `RentalItems` WRITE;
/*!40000 ALTER TABLE `RentalItems` DISABLE KEYS */;
INSERT INTO `RentalItems` VALUES (1,'different','Magazine billion church will not. Toward sing charge very occur stage moment.\nCheck skin know dog through place simply. Send note toward energy. Policy subject today career stay.','2023-06-09',12,NULL,'free','769 Greg Grove Suite 691\nRonaldberg, RI 60405',10),(2,'box','Leave far need laugh security. Energy reveal base entire activity arm turn. Beat seven position medical others.\nImprove evidence still score. Feeling official explain show interesting detail.','2024-04-13',5,NULL,'lost','942 Martinez River Suite 400\nWarnerview, PA 43902',9),(3,'protect','Edge after assume share appear final. Lawyer time approach difference call.','2023-09-29',4,'2028-09-27','free','846 Gonzalez Orchard Apt. 971\nEast Kenneth, NJ 05048',4),(4,'decide','Newspaper form star a end challenge body issue. Must agent thousand. Order machine different none significant along.\nLike across difference phone their act arrive. Thank reason well officer concern.','2021-03-14',6,'2027-11-11','borrowed','48693 Johnston Springs Apt. 520\nDylanbury, LA 02574',8),(5,'finish','Ability specific prevent minute enjoy stand week. Be fall probably couple surface party.','2020-03-11',6,NULL,'free','12560 Castillo Springs\nLake Valerieburgh, DC 36624',8),(6,'top','Guess event maintain once himself letter. Including marriage few just prove instead one. Leave view animal land.','2022-10-21',19,NULL,'lost','79515 Frank Harbors\nKevinburgh, DC 77686',2),(7,'when','Difficult read bring decision growth weight good. Scene data charge culture throughout. Plan speak ten public drug past.\nExactly few treatment western coach marriage. Former baby job health require.','2021-10-22',7,NULL,'free','Unit 5960 Box 1627\nDPO AA 68807',1),(8,'market','Feel history environmental dream fly. Chance late help arrive figure remain positive. Beat something nor candidate probably price.','2022-05-04',16,NULL,'lost','Unit 4973 Box 2657\nDPO AP 46765',4),(9,'exist','Man hand challenge among rule return administration. Great security west her what it shoulder. Raise former election.','2023-07-18',20,NULL,'borrowed','93719 Bass Terrace Suite 968\nKevinborough, GU 13291',1),(10,'fish','Cup effort live sign cause. Structure major style conference peace be job.\nTree save thank power. Result go according product Congress certainly.','2023-03-22',16,NULL,'lost','2526 Tracy Union Suite 717\nWilliamsonport, NY 88622',9),(11,'live','Peace rule bank woman. Here size foreign join opportunity. Voice spend wrong. Leg same may measure behavior bar baby keep.\nEarly grow food that east success attack protect.','2023-04-13',3,NULL,'free','00580 Victor Circle\nPetersonmouth, OR 58616',1),(12,'from','Whom short marriage serve. Take picture style source get although arrive. Doctor discover president which rise. Scene card radio tonight series available.','2019-09-09',3,'2025-10-21','free','160 Jessica Valley Apt. 429\nLake Brenda, OR 07440',3),(13,'high','Commercial skill perform onto since. Development talk region try difference. How medical glass call.','2020-04-24',20,'2027-10-23','lost','519 Howard Creek Suite 250\nMonicafurt, AK 10776',2),(14,'reach','Huge something trip blue. Great nearly better truth. Religious method who visit customer himself.\nRun her foreign happy.','2024-02-04',19,'2025-10-07','free','780 Gill Passage Suite 573\nNelsonchester, SD 32288',2),(15,'life','Protect plan need plan talk fight focus. Race stand last notice around third. Radio wind management yes list activity choice.','2020-11-16',4,'2025-02-14','lost','123 Henson Curve Suite 006\nPamelamouth, DE 79176',2),(16,'energy','Behind here perform option theory huge paper. Single four notice view over money.\nHealth drug big life.\nWindow add morning PM hundred animal.','2022-11-12',11,'2026-07-07','free','4407 Davis Via Apt. 417\nPort Maria, MT 46710',9),(17,'lead','Six from less doctor whether we whole. Accept enter fear side anything image away.\nSchool thus any western recently. Sister source shoulder finish prevent.','2020-12-27',14,NULL,'borrowed','4698 Gill Turnpike\nLake Timothy, DE 39243',8),(18,'talk','Develop near age whole scene because. Nor protect process commercial difference.\nPurpose would body save treatment enjoy break author. Offer federal rock.','2019-06-11',17,NULL,'lost','1081 Samantha Springs Apt. 608\nMargaretburgh, LA 12001',5),(19,'today','Teach cup picture together before.\nTurn society true one. Early meet senior case example. Probably feel Congress security yeah us.','2021-01-10',16,NULL,'free','417 Carpenter Cliff Apt. 208\nKevinfurt, MN 71312',10),(20,'wonder','Agree again experience amount than draw. Represent capital start whom onto reveal citizen.\nPicture rise blood inside assume build. Cut treat anyone fight. Too best at chair similar.','2020-08-09',9,'2025-07-24','borrowed','428 Davila Springs Apt. 073\nRobertburgh, MH 29691',6),(21,'executive','Somebody camera far when order century upon. Issue red baby risk even new particularly media. Church manager ball win whatever foot.\nTest speech place. Tend play read make manage office.','2020-07-26',19,'2024-11-07','borrowed','03973 Miller Station\nSarahhaven, CO 48196',10),(22,'away','Parent sea research partner. Little beautiful store result.\nTax go decision character kitchen enter finally fire. Away staff bank. Mrs think account finish may clearly main.','2023-03-26',19,NULL,'lost','16650 Michael Port\nAngelashire, TX 28912',6),(23,'behavior','Idea PM customer feeling news run. Parent movement decade system page course five.\nOur these check lawyer may here child. Cover week service name. Brother push determine.','2023-09-16',13,'2027-06-06','free','Unit 2118 Box 1568\nDPO AA 71249',1),(24,'once','Tend remember turn. Future financial less effect brother inside. Heart economic my couple financial its see.','2024-03-29',9,'2026-04-05','free','7232 Lisa Spur\nBrendaville, MT 53774',10),(25,'pass','Somebody back page activity spring contain. Fine return maintain miss eye program. Close her station beyond.\nAdministration style let second.\nMention wrong hit young game seem certain.','2023-02-17',19,NULL,'free','189 Amy Lake\nMariechester, SC 09945',10),(26,'than','Commercial perhaps sister its marriage owner. Yourself plant part political take.\nMake president charge society several discussion worry ten. You responsibility letter age foreign set million buy.','2022-01-15',4,NULL,'lost','669 Jennifer Light\nWilliamport, IN 43248',9),(27,'nature','Rather billion include. Act up recently against key even with Mrs.\nHuge whose woman try huge. Maintain official nor less.','2021-04-07',6,'2027-05-12','borrowed','USCGC Howell\nFPO AA 81991',2),(28,'general','Treatment quite image however peace. Whatever enjoy indicate learn page speech early style.\nCost response thought voice board. Ready out really traditional.','2023-10-16',8,NULL,'borrowed','385 Morgan Shoal Suite 309\nEast Marcusfurt, VT 99174',3),(29,'see','If imagine region such none nature candidate. Sing enough compare. Perhaps production pick yet none must.\nBehavior would their better join toward speak. Still figure important senior site fear.','2021-07-17',14,'2024-12-22','borrowed','653 Thomas Pine\nNew Amber, DC 87182',1),(30,'hand','Player current me best hundred. You fine born play.\nWord industry ten do. Fire else they rate treatment easy.','2022-12-18',12,'2024-09-24','free','627 Samantha Plaza\nDerekville, VA 11057',9),(31,'my','Weight number race save himself where focus. Government long deal difference.\nAir wonder us picture reason college. Management still TV born. Against stop return hand far.','2020-08-15',16,NULL,'lost','2101 Perez Roads\nSouth Aprilmouth, WY 49237',8),(32,'sure','Low on yeah member say specific stand.\nFactor focus company real. Large address fish. In whole beat often base.','2020-10-26',4,NULL,'borrowed','714 Ryan Locks Suite 915\nHarrisbury, PW 93586',10),(33,'work','Wind general decision she although right pattern. Education learn establish fear. Responsibility situation receive though.','2022-11-29',5,'2025-08-24','borrowed','270 Thomas Gateway\nWest Andrew, MN 55503',2),(34,'hear','Stand direction indicate machine. Morning tax theory possible cost develop appear tough. Represent herself professional bed nation put more.','2020-05-08',3,NULL,'borrowed','Unit 6622 Box 2091\nDPO AA 83030',5),(35,'only','Fact company risk down office idea continue. Smile eye sometimes strategy focus.\nRest through black address analysis win. Away development tell rock society important road.','2022-07-28',16,NULL,'free','4924 Michael Road\nHayesborough, PR 76700',9),(36,'adult','Bit happen exactly. Company five spring though similar.\nGive son month group. Politics where clearly strategy. Administration other per part arm turn laugh.','2023-05-17',4,NULL,'borrowed','296 Hudson Station\nJacksonberg, FM 35315',1),(37,'already','Seem science teacher term deal. Rest far listen people better respond wall reflect. Power pattern decide.\nBody environment board within behavior. From experience relationship. Issue why way.','2021-01-17',17,NULL,'borrowed','411 Richard Overpass Suite 960\nForbesport, FM 48974',8),(38,'one','Campaign phone hard difference read purpose. Hair special herself still close it far my.\nPull question trip newspaper. Like seat argue you crime peace. Pm know moment well appear move might trip.','2023-01-13',7,NULL,'lost','8343 Donald Pass Suite 780\nWilsonfort, OR 10467',6),(39,'we','Present low clear fear. Fear think music help large value.\nSite million show movie smile claim ago. Five trouble long range school kitchen.','2023-03-20',8,NULL,'borrowed','72252 Andrew Stravenue\nEricburgh, PR 39491',5),(40,'east','Past marriage experience government total plan prevent. Build type best ahead across stage. Wear pass specific price go worry. Cell in Mrs know.','2022-06-25',19,'2026-12-10','borrowed','967 Robertson Route Suite 396\nLake Emily, AL 54718',7),(41,'catch','Everybody begin least attack. Could I experience last fact during.\nElection region ask next we the car. Figure statement by two me tree discover. Method question special standard.','2022-11-15',11,'2026-11-05','free','5352 Alexandra Mission Apt. 022\nContrerasmouth, GA 63956',8),(42,'decade','Car simply consider camera campaign nearly great final. Sit determine husband floor commercial east today.\nMarket attention view present each benefit. List know accept strong stuff far get.','2021-09-30',12,NULL,'borrowed','5894 Hopkins Oval\nPort Scott, AZ 45645',10),(43,'way','Generation send together decide various either toward apply. Authority federal single rule. Character capital natural network onto.','2020-05-22',4,'2027-01-10','lost','793 Hamilton Spring\nEast Jeffreychester, IN 83882',2),(44,'morning','Care nature moment name during popular. Space population shake order place pay manager.\nRoom television none speech to large. Around daughter discover what today.','2022-05-25',4,NULL,'borrowed','12637 Tonya Rue Apt. 353\nSouth Kimberlyton, KY 62102',5),(45,'return','Page official technology lose public. Fear animal population need ago buy establish. Civil appear fire church painting candidate much.','2021-12-25',20,NULL,'borrowed','9469 Rodney Overpass Apt. 102\nWest Jennifer, WA 14533',3),(46,'learn','Language successful school. Process when claim enjoy forget professional.\nSure history yard should form like. Want car couple.','2023-10-05',1,NULL,'borrowed','26099 Kathleen Camp\nKaylaland, CA 97194',2),(47,'more','Involve per these bed.\nMemory western race nation. Person miss few treat as catch.\nStaff trial run create business soldier behavior table.','2021-06-23',10,NULL,'borrowed','1528 Blackwell Ridge\nNorth Karamouth, CT 70481',10),(48,'usually','Hotel third form anyone around notice. Try become marriage simply two. Ten cut almost sit.\nWind parent trial detail. Happen sense enter. Behavior paper they.','2023-07-08',19,'2025-03-25','borrowed','21861 Tara Green\nEast Kayla, WA 93701',9),(49,'opportunity','Should Democrat throw. Inside take represent fish model source begin. At stop never material. Movie go world movie vote.','2024-04-06',20,'2026-02-03','free','36573 Denise Port Suite 113\nVincentside, VI 99852',6),(50,'play','Also cold other Democrat sign yourself. Exist culture every dog. Floor plant evening may push break arrive.\nStandard level early ball knowledge. Relate majority he speech space cost Congress.','2021-12-10',19,NULL,'lost','2080 Adams Courts Apt. 436\nEmilyton, FL 40138',3);
/*!40000 ALTER TABLE `RentalItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RentalTransactions`
--

DROP TABLE IF EXISTS `RentalTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RentalTransactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `borrowed_by` int NOT NULL,
  `item_id` int NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `borrowed_by` (`borrowed_by`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `rentaltransactions_ibfk_1` FOREIGN KEY (`borrowed_by`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `rentaltransactions_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `RentalItems` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RentalTransactions`
--

LOCK TABLES `RentalTransactions` WRITE;
/*!40000 ALTER TABLE `RentalTransactions` DISABLE KEYS */;
INSERT INTO `RentalTransactions` VALUES (1,'2023-06-15','2025-03-17',10,26,NULL),(2,'2021-03-15','2025-07-15',13,38,'2024-04-16'),(3,'2023-04-25','2027-03-03',17,26,NULL),(4,'2020-04-19','2027-12-27',3,33,NULL),(5,'2022-11-23','2026-06-07',2,44,'2025-11-03'),(6,'2021-11-11','2027-03-14',19,49,NULL),(7,'2021-07-15','2027-11-01',4,5,'2027-06-02'),(8,'2024-02-15','2025-02-09',5,31,NULL),(9,'2021-06-03','2025-12-12',11,25,'2021-07-02'),(10,'2022-07-03','2028-04-26',3,46,NULL),(11,'2023-06-23','2028-07-23',14,46,'2025-12-27'),(12,'2022-04-20','2028-10-22',19,7,NULL),(13,'2023-04-08','2025-01-27',14,44,'2024-09-07'),(14,'2022-01-07','2026-03-14',13,48,'2024-03-08'),(15,'2020-01-23','2028-09-29',12,47,NULL),(16,'2022-06-04','2025-01-06',4,23,'2023-11-26'),(17,'2022-05-21','2029-04-17',4,41,'2026-08-04'),(18,'2023-07-27','2024-09-27',2,26,NULL),(19,'2022-12-16','2027-02-18',10,11,'2027-02-16'),(20,'2020-03-16','2027-03-08',2,28,NULL),(21,'2024-02-08','2026-01-02',6,3,'2024-10-10'),(22,'2021-01-26','2025-05-03',6,1,'2024-04-21'),(23,'2020-07-12','2028-01-25',7,15,NULL),(24,'2021-01-27','2028-02-21',7,46,'2027-07-20'),(25,'2020-10-27','2028-01-15',3,37,NULL),(26,'2020-04-19','2024-10-16',8,3,'2020-05-22'),(27,'2022-07-22','2029-01-24',10,6,'2028-07-01'),(28,'2020-08-07','2026-06-25',3,32,NULL),(29,'2019-11-30','2027-01-27',6,18,'2024-09-16'),(30,'2022-04-06','2026-02-09',11,45,NULL),(31,'2021-09-08','2025-03-21',20,11,'2023-07-28'),(32,'2023-11-09','2026-11-04',15,17,NULL),(33,'2021-12-15','2024-08-25',3,46,'2022-05-13'),(34,'2023-06-28','2026-02-02',16,47,'2024-02-18'),(35,'2023-06-12','2028-01-11',4,42,NULL),(36,'2019-07-16','2025-06-09',14,3,'2022-05-15'),(37,'2023-12-30','2026-11-25',18,20,'2026-09-18'),(38,'2023-04-01','2024-10-27',4,26,NULL),(39,'2022-11-27','2026-07-07',13,48,NULL),(40,'2020-10-25','2024-08-06',4,37,NULL),(41,'2020-07-10','2028-08-12',4,39,'2027-01-25'),(42,'2023-03-21','2026-08-03',3,39,NULL),(43,'2020-12-12','2025-11-26',13,13,NULL),(44,'2023-08-30','2025-06-09',10,15,'2025-05-15'),(45,'2021-07-15','2028-12-24',2,49,'2025-04-05'),(46,'2021-01-31','2026-03-05',19,41,'2024-10-12'),(47,'2023-01-25','2028-08-16',4,8,'2028-07-07'),(48,'2022-06-14','2027-07-24',8,46,'2026-10-23'),(49,'2024-03-15','2028-02-05',10,27,'2025-08-25'),(50,'2024-01-11','2027-08-01',9,1,NULL),(51,'2021-09-10','2027-09-24',2,12,'2022-05-25'),(52,'2023-08-17','2026-04-28',19,35,NULL),(53,'2021-05-08','2026-10-10',5,35,'2021-12-01'),(54,'2023-11-25','2025-09-24',20,20,NULL),(55,'2022-06-14','2028-06-05',8,27,NULL),(56,'2023-02-16','2024-10-16',20,37,NULL),(57,'2022-05-01','2024-08-06',10,43,NULL),(58,'2022-01-08','2027-01-04',10,25,NULL),(59,'2021-11-21','2027-01-30',7,9,NULL),(60,'2022-04-28','2029-01-14',9,21,'2027-10-03'),(61,'2019-05-03','2028-05-28',7,41,'2024-11-30'),(62,'2020-11-22','2027-07-03',14,2,NULL),(63,'2019-07-30','2024-07-09',11,3,NULL),(64,'2020-01-25','2027-06-18',6,14,NULL),(65,'2022-02-22','2026-11-20',3,24,'2022-05-23'),(66,'2019-08-30','2025-08-11',2,10,NULL),(67,'2021-01-04','2025-06-19',9,19,NULL),(68,'2021-05-16','2027-09-10',10,22,NULL),(69,'2019-04-22','2028-06-19',1,38,NULL),(70,'2023-11-08','2024-07-18',16,20,'2023-12-17'),(71,'2021-07-07','2029-04-17',7,40,NULL),(72,'2023-10-02','2027-05-19',13,15,NULL),(73,'2021-07-24','2025-07-04',14,48,'2022-01-07'),(74,'2019-05-02','2025-05-07',5,50,NULL),(75,'2021-11-14','2027-02-05',9,15,NULL),(76,'2021-04-08','2027-09-21',2,33,NULL),(77,'2020-11-30','2028-10-16',14,24,NULL),(78,'2023-08-29','2029-01-04',11,6,NULL),(79,'2019-07-27','2026-12-16',16,39,'2023-08-21'),(80,'2021-06-19','2026-06-19',8,9,'2025-01-21'),(81,'2022-05-27','2025-06-03',6,1,'2024-07-09'),(82,'2021-03-01','2026-03-16',6,34,NULL),(83,'2021-09-10','2027-02-26',1,2,NULL),(84,'2020-10-29','2024-06-04',16,50,NULL),(85,'2020-07-28','2027-05-20',16,23,'2024-10-29'),(86,'2020-07-14','2025-03-30',10,14,NULL),(87,'2019-06-02','2028-06-10',10,34,'2024-04-21'),(88,'2021-06-08','2026-08-12',1,29,NULL),(89,'2019-11-08','2028-01-01',19,13,'2020-09-05'),(90,'2022-09-22','2026-09-29',16,6,'2024-04-27'),(91,'2024-04-09','2024-10-15',4,3,'2024-09-04'),(92,'2024-04-11','2027-05-04',4,7,NULL),(93,'2021-10-11','2029-03-30',19,42,NULL),(94,'2019-07-11','2024-09-07',14,34,NULL),(95,'2020-01-17','2025-09-27',10,32,NULL),(96,'2023-05-17','2025-04-30',13,33,'2023-11-15'),(97,'2021-12-03','2026-07-02',19,39,'2025-03-05'),(98,'2021-07-24','2026-10-07',12,14,'2024-02-04'),(99,'2020-02-20','2028-01-04',2,2,NULL),(100,'2019-12-26','2025-01-03',5,25,NULL);
/*!40000 ALTER TABLE `RentalTransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroups`
--

DROP TABLE IF EXISTS `UserGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserGroups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroups`
--

LOCK TABLES `UserGroups` WRITE;
/*!40000 ALTER TABLE `UserGroups` DISABLE KEYS */;
INSERT INTO `UserGroups` VALUES (3,'along'),(4,'listen'),(1,'no'),(5,'ready'),(2,'security');
/*!40000 ALTER TABLE `UserGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `deletion_date` date DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `UserGroups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'briankennedy','@)IiUQp$E3','2022-08-16','2026-07-05',2),(2,'xcooke','0%LFb10o%l','2019-06-27',NULL,4),(3,'taylorallison','tkowZDxZ#7','2019-08-29','2025-11-30',5),(4,'hineswilliam','63J^J3gu)6','2021-09-13',NULL,4),(5,'stephaniefranco','t0v#+J6f#c','2024-02-06','2028-01-06',1),(6,'martinashley','(4GnHNx^IN','2022-07-13',NULL,5),(7,'zgomez','6N&vyGDe#r','2023-12-04','2025-05-12',1),(8,'suarezcalvin','%6UUjRyitp','2021-12-04','2026-08-17',3),(9,'gregory06','%1pINSrcFc','2019-09-28','2029-03-07',3),(10,'anna41','_l7Au7Hw5b','2023-04-01',NULL,1),(11,'robertmartinez','#!N16oia$8','2019-09-26',NULL,1),(12,'margaret70','J9y5byDk8)','2021-09-28',NULL,4),(13,'ztran','@T@1VRWhMW','2020-03-03',NULL,5),(14,'leahsolomon','RAd3nGLg9@','2019-04-25',NULL,4),(15,'brooke85','np4Lo%rc$@','2020-07-26','2024-04-24',2),(16,'ruizchristopher','e3VbyuO!@s','2019-06-28','2025-02-02',5),(17,'vmitchell','_T)7WCsQ+$','2021-05-11','2026-04-07',3),(18,'twood','R6@13O1uW$','2020-03-22','2026-05-01',4),(19,'joshuasmith','EY5YXJvt@1','2024-02-09',NULL,3),(20,'nathanielnelson','^tF94BEy_)','2022-06-01','2029-02-23',2);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 22:20:53
