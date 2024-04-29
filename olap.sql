-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: rentalolap
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
-- Table structure for table `DimCategories`
--

DROP TABLE IF EXISTS `DimCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DimCategories` (
  `category_key` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_key`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DimItems`
--

DROP TABLE IF EXISTS `DimItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DimItems` (
  `item_key` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `creation_date` date NOT NULL,
  `deletion_date` date DEFAULT NULL,
  `status` enum('free','borrowed','lost') DEFAULT NULL,
  `primary_location` varchar(255) DEFAULT NULL,
  `category_key` int DEFAULT NULL,
  PRIMARY KEY (`item_key`),
  KEY `category_key` (`category_key`),
  CONSTRAINT `dimitems_ibfk_1` FOREIGN KEY (`category_key`) REFERENCES `DimCategories` (`category_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DimTime`
--

DROP TABLE IF EXISTS `DimTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DimTime` (
  `date_key` int NOT NULL,
  `date` date NOT NULL,
  `year` year NOT NULL,
  `quarter` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `weekday` varchar(9) NOT NULL,
  PRIMARY KEY (`date_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DimUserGroups`
--

DROP TABLE IF EXISTS `DimUserGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DimUserGroups` (
  `group_key` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`group_key`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DimUsers`
--

DROP TABLE IF EXISTS `DimUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DimUsers` (
  `user_key` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `deletion_date` date DEFAULT NULL,
  `group_key` int DEFAULT NULL,
  PRIMARY KEY (`user_key`),
  UNIQUE KEY `username` (`username`),
  KEY `group_key` (`group_key`),
  CONSTRAINT `dimusers_ibfk_1` FOREIGN KEY (`group_key`) REFERENCES `DimUserGroups` (`group_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FactRentalTransactions`
--

DROP TABLE IF EXISTS `FactRentalTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FactRentalTransactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `rental_date_key` int NOT NULL,
  `due_date_key` int DEFAULT NULL,
  `return_date_key` int DEFAULT NULL,
  `user_key` int NOT NULL,
  `item_key` int NOT NULL,
  `borrowed_by_key` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `rental_date_key` (`rental_date_key`),
  KEY `due_date_key` (`due_date_key`),
  KEY `return_date_key` (`return_date_key`),
  KEY `user_key` (`user_key`),
  KEY `item_key` (`item_key`),
  KEY `borrowed_by_key` (`borrowed_by_key`),
  CONSTRAINT `factrentaltransactions_ibfk_1` FOREIGN KEY (`rental_date_key`) REFERENCES `DimTime` (`date_key`),
  CONSTRAINT `factrentaltransactions_ibfk_2` FOREIGN KEY (`due_date_key`) REFERENCES `DimTime` (`date_key`),
  CONSTRAINT `factrentaltransactions_ibfk_3` FOREIGN KEY (`return_date_key`) REFERENCES `DimTime` (`date_key`),
  CONSTRAINT `factrentaltransactions_ibfk_4` FOREIGN KEY (`user_key`) REFERENCES `DimUsers` (`user_key`),
  CONSTRAINT `factrentaltransactions_ibfk_5` FOREIGN KEY (`item_key`) REFERENCES `DimItems` (`item_key`),
  CONSTRAINT `factrentaltransactions_ibfk_6` FOREIGN KEY (`borrowed_by_key`) REFERENCES `DimUsers` (`user_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-18 22:19:31
