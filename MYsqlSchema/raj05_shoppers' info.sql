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
-- Table structure for table `shoppers' info`
--

DROP TABLE IF EXISTS `shoppers' info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppers' info` (
  `Shopper ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Phone Number` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`Shopper ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppers' info`
--

LOCK TABLES `shoppers' info` WRITE;
/*!40000 ALTER TABLE `shoppers' info` DISABLE KEYS */;
INSERT INTO `shoppers' info` VALUES (1,'Krutik Patel','45 Lancaster ave',2147483647,'k18@example.com'),(2,'Yashraj Raj','446 Robert Ferrie',2147483647,'ryashraj1818@example.com'),(3,'Dhruv Patel','77 Ottawa St.',2147483647,'pdhruv07@example.com'),(4,'Rutvik Italiya','89 Fairview Ln',2147483647,'Rut08@example.com'),(5,'Vrusang Patel','18 downtown King St',2147483647,'vpate08@example.com'),(6,'Hardki Thakor','97 victoria Ave',2147483647,'hardik09@example.com'),(7,'Keyu Patel','21 Ottawa London Rd',2147483647,'keyu01@example.com'),(8,'Nisarg Ghevariya','30 Maple St',2147483647,'nisarg07@example.com'),(9,'Virat Kohli','1818 Sarojni chowk, Delhi',2147483647,'Virat18@example.com'),(10,'Rohit Sharma','4545 Main St, Mumbai',2147483647,'rohit45@example.com'),(11,'James','362 Victoria street S',2147483647,'rajrishi2329@gmail.com'),(12,'Krishna','Vaikhunth',2147483647,'radheradhe@gmail.com'),(13,'Dhoni','07 Ranchi, India',2147483647,'msd@gmail.com');
/*!40000 ALTER TABLE `shoppers' info` ENABLE KEYS */;
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
