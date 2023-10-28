-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: finalproject4db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) NOT NULL,
  `postalCode` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `userId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Main St','12345','California','Los Angeles',1),(2,'456 Oak St','67890','New York','New York City',1),(3,'789 Pine St','54321','Texas','Houston',1),(4,'101 Maple Ave','98765','Florida','Miami',2),(5,'202 Cedar Blvd','23456','Illinois','Chicago',2),(6,'303 Pine Ln','87654','Arizona','Phoenix',3);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Brand 1','https://example.com/brand1.jpg'),(2,'Brand 2','https://example.com/brand2.jpg'),(3,'Brand 3','https://example.com/brand3.jpg'),(4,'Brand 4','https://example.com/brand4.jpg'),(5,'Brand 5','https://example.com/brand5.jpg');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `totalPrice` decimal(20,2) NOT NULL,
  `userId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,860.00,2),(2,485.00,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productId` int(15) NOT NULL,
  `cartId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `cartId` (`cartId`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,100.00,2,1,1),(2,60.00,1,3,1),(3,150.00,3,2,2),(4,35.00,1,4,2),(5,300.00,2,5,1);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `isFeatured` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Handbags','https://example.com/handbags.jpg',1),(2,'Watches','https://example.com/watches.jpg',0),(3,'Sunglasses','https://example.com/sunglasses.jpg',1),(4,'Hats','https://example.com/hats.jpg',0),(5,'Jewelry','https://example.com/jewelry.jpg',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `discountPercentage` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'10% Off on Summer Collection',10),(2,'Flash Sale - 20% Off Sitewide',20),(3,'Holiday Special: Buy One Get One Free',100);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `totalPrice` decimal(20,2) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `tax` decimal(20,2) NOT NULL,
  `deliveryFee` decimal(20,2) NOT NULL,
  `paymentId` int(15) NOT NULL,
  `cartId` int(15) NOT NULL,
  `userId` int(15) NOT NULL,
  `addressId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentId` (`paymentId`),
  KEY `cartId` (`cartId`),
  KEY `userId` (`userId`),
  KEY `addressId` (`addressId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,614.95,'2023-10-05','Processing',15.00,10.00,1,1,2,1),(2,220.45,'2023-10-06','Shipped',12.50,8.00,2,2,3,2),(3,635.23,'2023-10-07','Delivered',20.25,15.00,3,1,2,3),(4,80.75,'2023-10-08','Processing',8.75,5.00,4,1,2,4),(5,300.00,'2023-10-09','Shipped',30.00,20.00,5,2,3,5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productId` int(15) NOT NULL,
  `orderId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,100.00,2,1,1),(2,60.00,1,3,1),(3,150.00,3,2,2),(4,139.96,4,4,2),(5,599.98,2,5,3);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `provider` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Stripe','Success','Credit Card'),(2,'PayPal','Pending','PayPal Balance'),(3,'Square','Success','Debit Card'),(4,'Stripe','Failed','Credit Card'),(5,'PayPal','Success','Bank Transfer');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availableInStock` int(11) NOT NULL,
  `totalRating` decimal(3,2) NOT NULL,
  `ratingCount` int(11) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `categoryId` int(15) NOT NULL,
  `brandId` int(15) NOT NULL,
  `discountId` int(15) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `brandId` (`brandId`),
  KEY `discountId` (`discountId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`discountId`) REFERENCES `discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Classic Watch','A timeless piece for every occasion.',100.00,50,4.70,25,'https://example.com/classic-watch.jpg',2,1,3,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(2,'Leather Handbag','Elegance in every detail, crafted with genuine leather.',150.00,30,4.50,18,'https://example.com/leather-handbag.jpg',1,2,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(3,'Aviator Sunglasses','Protect your eyes with style.',60.00,40,4.80,22,'https://example.com/aviator-sunglasses.jpg',3,3,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(4,'Fedora Hat','A classic accessory for a touch of sophistication.',35.00,25,4.20,15,'https://example.com/fedora-hat.jpg',4,1,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(5,'Diamond Necklace','Shine bright with this exquisite diamond necklace.',300.00,15,4.90,30,'https://example.com/diamond-necklace.jpg',5,2,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(6,'Stylish Backpack','Versatile and trendy, perfect for daily adventures.',80.00,35,4.60,20,'https://example.com/stylish-backpack.jpg',1,3,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(7,'Silver Bracelet','Add a touch of elegance to your wrist.',49.99,28,4.40,17,'https://example.com/silver-bracelet.jpg',5,1,3,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(8,'Wide-Brim Hat','Stay stylish and sun-protected.',39.99,22,4.00,12,'https://example.com/wide-brim-hat.jpg',4,2,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(9,'Gold Earrings','Accentuate your look with these dazzling gold earrings.',89.99,18,4.80,26,'https://example.com/gold-earrings.jpg',5,3,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(10,'Modern Wristwatch','Sleek design for the contemporary lifestyle.',119.99,32,4.30,19,'https://example.com/modern-wristwatch.jpg',2,1,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(11,'Canvas Tote Bag','A stylish and spacious tote for everyday use.',49.99,40,4.50,23,'https://example.com/canvas-tote-bag.jpg',1,2,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(12,'Sporty Backpack','Perfect for the active lifestyle, designed for comfort.',64.99,35,4.20,15,'https://example.com/sporty-backpack.jpg',1,3,3,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(13,'Pearl Necklace','Timeless elegance with a string of pearls.',179.99,20,4.90,29,'https://example.com/pearl-necklace.jpg',5,1,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(14,'Leather Wallet','Classic design with multiple compartments for your essentials.',29.99,50,4.30,18,'https://example.com/leather-wallet.jpg',1,2,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(15,'Retro Sunglasses','Channel your inner vintage with these stylish shades.',54.99,30,4.70,22,'https://example.com/retro-sunglasses.jpg',3,3,3,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(16,'Silver Cuff Bracelet','A statement piece to elevate your wristwear.',69.99,25,4.60,21,'https://example.com/silver-cuff-bracelet.jpg',5,1,2,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(17,'Panama Hat','Stay cool and stylish under the sun.',44.99,28,4.10,16,'https://example.com/panama-hat.jpg',4,2,1,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(18,'Rose Gold Earrings','Add a touch of warmth with these elegant rose gold earrings.',99.99,18,4.80,27,'https://example.com/rose-gold-earrings.jpg',5,3,3,'2023-10-24 16:25:19','2023-10-24 16:25:19'),(19,'Minimalist Wristwatch','Simplicity meets sophistication in this modern timepiece.',89.99,32,4.40,19,'https://example.com/minimalist-wristwatch.jpg',2,1,2,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(20,'Crystal Pendant Necklace','Capture the light with this dazzling crystal pendant.',129.99,15,4.90,31,'https://example.com/crystal-pendant-necklace.jpg',5,2,1,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(21,'Leather Crossbody Bag','Compact and versatile, perfect for on-the-go.',74.99,22,4.50,25,'https://example.com/leather-crossbody-bag.jpg',1,3,3,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(22,'Diamond Stud Earrings','Timeless elegance with a touch of sparkle.',149.99,17,4.80,29,'https://example.com/diamond-stud-earrings.jpg',5,1,1,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(23,'Laptop Backpack','Stay organized and stylish with this tech-friendly backpack.',89.99,20,4.60,22,'https://example.com/laptop-backpack.jpg',1,2,3,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(24,'Gold Link Bracelet','Make a statement with this bold and trendy gold link bracelet.',79.99,19,4.30,18,'https://example.com/gold-link-bracelet.jpg',5,3,2,'2023-10-24 16:25:20','2023-10-24 16:25:20'),(25,'Classic Aviator Sunglasses','Achieve a timeless look with these iconic aviator shades.',59.99,25,4.70,21,'https://example.com/classic-aviator-sunglasses.jpg',3,1,3,'2023-10-24 16:25:20','2023-10-24 16:25:20');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingreview`
--

DROP TABLE IF EXISTS `ratingreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratingreview` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rating` int(15) NOT NULL,
  `userId` int(15) NOT NULL,
  `productId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  CONSTRAINT `ratingreview_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ratingreview_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingreview`
--

LOCK TABLES `ratingreview` WRITE;
/*!40000 ALTER TABLE `ratingreview` DISABLE KEYS */;
INSERT INTO `ratingreview` VALUES (1,'Great Product!','I absolutely love this product. It exceeded my expectations.',5,1,1),(2,'Not Satisfied','The product didn\'t meet my expectations. Disappointed.',2,2,2),(3,'Amazing Quality','Highly recommend! The quality is outstanding.',4,3,3),(4,'Perfect Fit','This product fits perfectly. I\'m very happy with my purchase.',5,1,4),(5,'Disappointing','Not what I expected. The product doesn\'t match the description.',1,2,5),(6,'Excellent Service','The customer service was excellent. They promptly addressed my concerns.',5,2,3),(7,'Good Value for Money','This product offers great value for the price. I\'m satisfied with my purchase.',4,3,3),(8,'Fast Shipping','Received the product faster than expected. Impressed with the quick delivery.',5,1,2),(9,'Beautiful Design','The design of this product is beautiful. It adds a nice touch to my collection.',4,2,4),(10,'Average Product','The product is decent, but nothing extraordinary. It serves its purpose.',3,3,5);
/*!40000 ALTER TABLE `ratingreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryCode` varchar(2) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `taxRate` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (1,'US','United States',7.50),(2,'CA','Canada',5.00),(3,'UK','United Kingdom',6.00),(4,'FR','France',5.50),(5,'DE','Germany',7.00),(6,'AU','Australia',10.00),(7,'JP','Japan',8.00),(8,'IT','Italy',6.00),(9,'BR','Brazil',12.50),(10,'IN','India',18.00),(11,'CN','China',13.50),(12,'MX','Mexico',16.00),(13,'RU','Russia',15.00),(14,'ES','Spain',7.50),(15,'KR','South Korea',9.00),(16,'SA','Saudi Arabia',5.50),(17,'ZA','South Africa',10.50),(18,'NL','Netherlands',6.00),(19,'SE','Sweden',7.00),(20,'SG','Singapore',7.50),(21,'TH','Thailand',7.00),(22,'AR','Argentina',8.50),(23,'EG','Egypt',9.00),(24,'TR','Turkey',8.00),(25,'CH','Switzerland',7.00),(26,'BE','Belgium',6.00),(27,'AT','Austria',5.00);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alice','smith','alice.smith@example.com','9876543210','1985-05-15','$2b$10$L9INO6bLPXmOw5U8sj6IGO7NK7Zadw4RwgshKOxOtBxvCEcPBjLZW','https://wallpaperaccess.com/full/4723250.jpg','admin'),(2,'john','wick','john.smith@example.com','012345678','1990-03-28','$2b$10$4tFYq1mAKeLpCLvLsQxbQez7I92LnhZqDDuXJgdKGAaMptM4VUGHS','https://wallpaperaccess.com/full/4723250.jpg','customer'),(3,'sara','adam','Sara.adam@example.com','123987456','1995-11-19','$2b$10$LNWnq9xXoa2cPgKzF/fGfeqZel4aplA.YR8VU10vI6XkuWvxmM77a','https://wallpaperaccess.com/full/4723250.jpg','customer');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `userId` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlistitem`
--

DROP TABLE IF EXISTS `wishlistitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlistitem` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `wishListId` int(15) NOT NULL,
  `productId` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishListId` (`wishListId`),
  KEY `productId` (`productId`),
  CONSTRAINT `wishlistitem_ibfk_1` FOREIGN KEY (`wishListId`) REFERENCES `wishlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlistitem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlistitem`
--

LOCK TABLES `wishlistitem` WRITE;
/*!40000 ALTER TABLE `wishlistitem` DISABLE KEYS */;
INSERT INTO `wishlistitem` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,1,5),(6,2,6),(7,1,7),(8,2,8),(9,1,9),(10,1,10),(11,1,11),(12,2,12),(13,2,13),(14,2,14),(15,1,15);
/*!40000 ALTER TABLE `wishlistitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-28 20:49:59
