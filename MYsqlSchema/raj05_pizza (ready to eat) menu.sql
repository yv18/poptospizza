-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: raj05
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `pizza (ready to eat) menu`
--

DROP TABLE IF EXISTS `pizza (ready to eat) menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza (ready to eat) menu` (
  `Pizza ID` int(11) NOT NULL,
  `Pizza Name` varchar(45) DEFAULT NULL,
  `Pizza Type` varchar(45) DEFAULT NULL,
  `R_Pizza_Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pizza ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza (ready to eat) menu`
--

LOCK TABLES `pizza (ready to eat) menu` WRITE;
/*!40000 ALTER TABLE `pizza (ready to eat) menu` DISABLE KEYS */;
INSERT INTO `pizza (ready to eat) menu` VALUES (1,'Pizza Margherita','Vegetarian',499),(2,'Double Cheese Margherita','Vegetarian',699),(3,'Tandoori Paneer Pizza','Vegetarian',599),(4,'Cheese Corn & Jalapeno','Vegetarian',399),(5,'5 Cheese Pizza','Vegetarian',499),(6,'Veggie Wonder','Specialty',399),(7,'Premium Single Toppings','Specialty',499),(8,'Overloaded Pizza','Vegetarian',329),(9,'Paneer Supreme','Vegetarian',399),(10,'Veggie Lovers','Specialty',499),(11,'Spicy Fries','Vegetarian',299);
/*!40000 ALTER TABLE `pizza (ready to eat) menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 19:40:22
