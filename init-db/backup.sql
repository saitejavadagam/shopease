-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK2fypguoq8qc1uigt9i6em0t07` (`cart_id`,`product_id`),
  KEY `FKqkqmvkmbtiaqn2nfqf25ymfs2` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKqkqmvkmbtiaqn2nfqf25ymfs2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `bought` int DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `reviews` int DEFAULT NULL,
  `sponsored` bit(1) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
                           (500,2999,1999,4.2,146,_binary '',1,'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=400&h=400&fit=crop','Wireless Bluetooth Headphones','electronics','headphones'),
                           (1200,4999,3499,4.5,312,_binary '\0',2,'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?q=80&w=400&h=400&fit=crop','Smart Watch AMOLED Display','sports-and-fitness','wearables'),
                           (350,1499,999,4.1,98,_binary '\0',3,'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?q=80&w=400&h=400&fit=crop','Apple iMac','electronics','laptops'),
                           (670,3999,2499,4.4,221,_binary '\0',4,'https://images.unsplash.com/photo-1587829741301-dc798b83add3?q=80&w=400&h=400&fit=crop','Mechanical Keyboard','electronics','laptops'),
                           (430,11999,8999,4.3,189,_binary '\0',5,'https://images.unsplash.com/photo-1527443154391-507e9dc6c5cc?q=80&w=400&h=400&fit=crop','1080p Full HD Monitor','electronics','laptops'),
                           (210,2499,1499,4,76,_binary '\0',6,'https://images.unsplash.com/photo-1545454675-3531b543be5d?q=80&w=400&h=400&fit=crop','Portable Bluetooth Speaker','electronics','headphones'),
                           (1800,1999,1199,4.6,540,_binary '',7,'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=400&h=400&fit=crop','Laptop Backpack Waterproof','fashion','men'),
                           (2200,1299,699,4.3,410,_binary '\0',8,'https://images.unsplash.com/photo-1622445272461-c6580cab8755?q=80&w=400&h=400&fit=crop','USB-C Fast Charger','electronics','mobiles'),
                           (900,3999,2799,4.2,305,_binary '\0',9,'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?q=80&w=400&h=400&fit=crop','Noise Cancelling Earbuds','electronics','headphones'),
                           (1500,5999,4599,4.5,620,_binary '\0',10,'https://images.unsplash.com/photo-1601524909162-be87252be298?q=80&w=400&h=400&fit=crop','External Hard Drive 1TB','electronics','laptops'),
                           (480,3499,2299,4.1,155,_binary '\0',11,'https://images.unsplash.com/photo-1593106183862-2b31f74667a6?q=80&w=400&h=400&fit=crop','Wireless Router Dual Band','electronics','laptops'),
                           (500,85965,69990,4.4,146,_binary '',12,'https://images.unsplash.com/photo-1603302576837-37561b2e2302?q=80&w=400&h=400&fit=crop','Gaming Laptop 16GB RAM','electronics','laptops'),
                           (740,15999,12999,4.2,201,_binary '\0',13,'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?q=80&w=400&h=400&fit=crop','Tablet 10-inch Display','electronics','mobiles'),
                           (3200,22999,18999,4.3,890,_binary '\0',14,'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=400&h=400&fit=crop','Smartphone 5G 128GB','electronics','mobiles'),
                           (460,1799,1199,4,133,_binary '\0',15,'https://images.unsplash.com/photo-1583863788434-e58a36330cf0?q=80&w=400&h=400&fit=crop','Wireless Charging Pad','electronics','mobiles'),
                           (620,10999,7999,4.2,258,_binary '\0',16,'https://images.unsplash.com/photo-1502982720700-bfff97f2ecac?q=80&w=400&h=400&fit=crop','Action Camera 4K','electronics','cameras'),
                           (2700,32999,24999,4.5,1120,_binary '\0',17,'https://images.unsplash.com/photo-1593784991095-a205069470b6?q=80&w=400&h=400&fit=crop','Smart LED TV 43-inch','electronics','mobiles'),
                           (1100,2499,1599,4.1,340,_binary '\0',18,'https://images.unsplash.com/photo-1557935728-e6d1eaabe558?q=80&w=400&h=400&fit=crop','Fitness Band Tracker','sports-and-fitness','wearables'),
                           (850,54999,45999,4.6,520,_binary '\0',19,'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?q=80&w=400&h=400&fit=crop','DSLR Camera 24MP','electronics','cameras'),
                           (960,8999,6999,4.4,310,_binary '\0',20,'https://images.unsplash.com/photo-1531297484001-80022131f5a1?q=80&w=400&h=400&fit=crop','Portable SSD 512GB','electronics','laptops'),
                           (450, 89999, 74999, 4.6, 180, _binary '\0', 21, 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?q=80&w=400&h=400&fit=crop', 'Apple MacBook Air M2', 'electronics', 'laptops'),
                           (890, 45000, 38999, 4.3, 210, _binary '', 22, 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?q=80&w=400&h=400&fit=crop', 'Samsung Galaxy S23', 'electronics', 'mobiles'),
                           (120, 12999, 9999, 4.2, 45, _binary '\0', 23, 'https://images.unsplash.com/photo-1495707902641-75cac588d2e9?q=80&w=400&h=400&fit=crop', 'Canon EOS 1500D DSLR', 'electronics', 'cameras'),
                           (610, 4999, 2999, 4.4, 189, _binary '\0', 24, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=400&h=400&fit=crop', 'Nike Air Max Sneakers', 'fashion', 'footwear'),
                           (1400, 1999, 1299, 4.5, 512, _binary '\0', 25, 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=400&h=400&fit=crop', 'Men Slim Fit Black T-Shirt', 'fashion', 'men'),
                           (340, 2499, 1799, 4.1, 88, _binary '\0', 26, 'https://images.unsplash.com/photo-1584269600464-37b1b58a9fe7?q=80&w=400&h=400&fit=crop', 'Non-Stick Cookware Set 3pc', 'home-and-kitchen', 'cookware'),
                           (230, 14999, 11999, 4.3, 67, _binary '', 27, 'https://images.unsplash.com/photo-1505797149-43b0069ec26b?q=80&w=400&h=400&fit=crop', 'Ergonomic Office Chair', 'home-and-kitchen', 'furniture'),
                           (950, 999, 699, 4.3, 310, _binary '\0', 28, 'https://images.unsplash.com/photo-1608248597481-496100c80836?q=80&w=400&h=400&fit=crop', 'Vitamin C Face Serum 30ml', 'beauty-and-personal-care', 'skincare'),
                           (540, 1499, 899, 4.0, 115, _binary '\0', 29, 'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=400&h=400&fit=crop', 'Argan Oil Anti-Hairfall Shampoo', 'beauty-and-personal-care', 'haircare'),
                           (150, 24999, 18500, 4.5, 42, _binary '\0', 30, 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?q=80&w=400&h=400&fit=crop', 'Motorized Treadmill 2HP', 'sports-and-fitness', 'gym-equipment'),
                           (820, 799, 499, 4.4, 230, _binary '\0', 31, 'https://images.unsplash.com/photo-1592432678016-e910b452f9a2?q=80&w=400&h=400&fit=crop', 'High-Density Yoga Mat', 'sports-and-fitness', 'yoga'),
                           (410, 699, 450, 4.6, 175, _binary '\0', 32, 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=400&h=400&fit=crop', 'The Alchemist (Paperback)', 'books-and-education', 'fiction'),
                           (300, 1299, 899, 4.2, 53, _binary '\0', 33, 'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?q=80&w=400&h=400&fit=crop', 'Monopoly Board Game Classic', 'toys-and-games', 'board-games'),
                           (780, 1599, 999, 4.3, 142, _binary '\0', 34, 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?q=80&w=400&h=400&fit=crop', 'Waterproof Car Body Cover', 'automotive', 'car-accessories'),
                           (290, 3499, 2199, 4.1, 61, _binary '\0', 35, 'https://images.unsplash.com/photo-1504148455328-c376907d081c?q=80&w=400&h=400&fit=crop', 'Professional Socket Wrench Set', 'automotive', 'tools');
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
