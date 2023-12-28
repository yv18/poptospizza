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
-- Table structure for table `pizza orders`
--

DROP TABLE IF EXISTS `pizza orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza orders` (
  `Order ID` int(11) NOT NULL,
  `Order Date` date DEFAULT NULL,
  `Total Amount` int(11) DEFAULT NULL,
  `Shopper ID` int(11) NOT NULL,
  `Pizza (Ready to eat) Menu_Pizza ID` int(11) NOT NULL,
  `Pizzas_Pizza ID` int(11) NOT NULL,
  PRIMARY KEY (`Order ID`),
  KEY `fk_Pizza Orders_Shoppers' Info_idx` (`Shopper ID`),
  KEY `fk_Pizza Orders_Pizza (Ready to eat) Menu1_idx` (`Pizza (Ready to eat) Menu_Pizza ID`),
  KEY `fk_Pizza Orders_Pizzas1_idx` (`Pizzas_Pizza ID`),
  CONSTRAINT `fk_Pizza Orders_Pizza (Ready to eat) Menu1` FOREIGN KEY (`Pizza (Ready to eat) Menu_Pizza ID`) REFERENCES `pizza (ready to eat) menu` (`Pizza ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza Orders_Pizzas1` FOREIGN KEY (`Pizzas_Pizza ID`) REFERENCES `pizzas` (`Pizza ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza Orders_Shoppers' Info` FOREIGN KEY (`Shopper ID`) REFERENCES `shoppers' info` (`Shopper ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza orders`
--

LOCK TABLES `pizza orders` WRITE;
/*!40000 ALTER TABLE `pizza orders` DISABLE KEYS */;
INSERT INTO `pizza orders` VALUES (1,'2023-12-01',2098,1,1,1),(2,'2023-12-02',2598,2,2,2),(3,'2023-12-03',1799,3,3,3),(4,'2023-12-04',2199,4,4,4),(5,'2023-12-05',1698,5,5,5),(6,'2023-12-06',1698,6,6,6),(7,'2023-12-07',1998,7,7,7),(8,'2023-12-08',1798,8,8,8),(9,'2023-12-09',2098,9,9,9),(10,'2023-12-10',2298,10,10,10);
/*!40000 ALTER TABLE `pizza orders` ENABLE KEYS */;
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
