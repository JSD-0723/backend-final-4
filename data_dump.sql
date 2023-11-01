-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 05:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `postalCode` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street`, `postalCode`, `state`, `city`, `userId`) VALUES
(1, '123 Main St', '12345', 'California', 'Los Angeles', 1),
(2, '456 Oak St', '67890', 'New York', 'New York City', 1),
(3, '789 Pine St', '54321', 'Texas', 'Houston', 1),
(4, '101 Maple Ave', '98765', 'Florida', 'Miami', 2),
(5, '202 Cedar Blvd', '23456', 'Illinois', 'Chicago', 2),
(6, '303 Pine Ln', '87654', 'Arizona', 'Phoenix', 3),
(9, '3056 Emerson Road', '7143', 'Louisiana', 'Glenmora', 4),
(10, '2060 Florence Street', '75757', 'Texas', 'Tyler', 5);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `imageUrl`) VALUES
(1, 'Zara', 'https://i.ibb.co/R6kk5Sx/Zara-Logo-1.png'),
(2, 'Dolce & Gabbana', 'https://i.ibb.co/xS4Bxwk/Dolce-Gabbana-1.png'),
(3, 'H&M', 'https://i.ibb.co/HxJgYJN/layer1.png'),
(4, 'Chanel', 'https://i.ibb.co/rfmBFR5/Chanel-logo-interlocking-cs-1.png'),
(5, 'Prada', 'https://i.ibb.co/105JXWk/Prada-Logo-1.png'),
(6, 'Biba', 'https://i.ibb.co/3rzrX4B/logo-1.png'),
(7, 'Coach', 'https://i.ibb.co/0X4qPBV/coach-logo-removebg-preview.png'),
(8, 'Remus', 'https://i.ibb.co/nn9YdfG/remus-vector-logo-200x200.png'),
(9, 'Boujee', 'https://i.ibb.co/6P0Jy3z/download-2.png');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `totalPrice` decimal(20,2) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `totalPrice`, `userId`) VALUES
(2, 0.00, 2),
(3, 0.00, 3),
(4, 0.00, 4),
(5, 0.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `isFeatured` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `imageUrl`, `isFeatured`) VALUES
(1, 'Skincare', 'https://specials-images.forbesimg.com/imageserve/605d4864bc70d50fa42b5194/Best-Skincare-Routine/960x0.jpg?fit=scale', 1),
(2, 'Personal Care', 'https://www.dow.com/content/dam/dcc/images/heroes/l1-hero/l1hero-market/beauty/as_299060393-mkthero2-face-products-380x135.jpg', 0),
(3, 'Handbags', 'https://i.ibb.co/N9xjTXk/image-2.png', 1),
(4, 'Apparels', 'https://www.incrediwire.com/wp-content/uploads/2022/10/3-1024x536.png', 1),
(5, 'Watches', 'https://apviz.io/uploads/digital-tools-watch.jpg', 1),
(6, 'Eye Wear', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREiZSvGSkjvUGfgWV0v18yqGIy0CTG-Cu8aA&usqp=CAU', 0),
(7, 'Jewellery', 'https://www.eventige.com/hubfs/Jewelry-Marketing-Agency.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discountPercentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `description`, `discountPercentage`) VALUES
(1, '10% Off on Summer Collection', 10),
(2, 'Flash Sale - 20% Off Sitewide', 20),
(3, 'Holiday Special: Buy One Get One Free', 100),
(4, 'Save Big: Get 60% Off Today!', 60),
(5, 'Save 15% on Your Next Purchase with Our Exclusive Discount!', 15);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `totalPrice` decimal(20,2) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `tax` decimal(20,2) NOT NULL,
  `deliveryFee` decimal(20,2) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `addressId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `provider`, `status`, `type`) VALUES
(1, 'Stripe', 'Active', 'Credit Card'),
(2, 'PayPal', 'Active', 'PayPal Balance'),
(3, 'Cash', 'Active', 'On Delivery Cash'),
(4, 'Bank', 'Active', 'Bank Card');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availableInStock` int(11) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `discountId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `availableInStock`, `imageUrl`, `categoryId`, `brandId`, `discountId`, `createdAt`, `updatedAt`) VALUES
(1, 'Classic Watch', 'A timeless piece for every occasion.', 100.00, 50, 'https://www.linjer.co/cdn/shop/products/linjer-classic-watch-38-gunmetal-black-1-front_1000x.jpg?v=1602577160', 5, 1, 3, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(2, 'Leather Handbag', 'Elegance in every detail, crafted with genuine leather.', 150.00, 30, 'https://atpatelier.com/cdn/shop/products/Arezzo_Brandy_Vacchetta_Handbag_Front.jpg?v=1678205144', 4, 2, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(3, 'Aviator Sunglasses', 'Protect your eyes with style.', 60.00, 40, 'https://www.slazenger.com/images/imgzoom/75/75617266_xxl.jpg', 6, 3, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(4, 'Fedora Hat', 'A classic accessory for a touch of sophistication.', 35.00, 25, 'https://www.bon-clic-bon-genre.us/photo/px1844-noir-1_20221026111212.jpg', 4, 1, 2, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(5, 'Diamond Necklace', 'Shine bright with this exquisite diamond necklace.', 300.00, 15, 'https://www.sarahandsebastian.com/cdn/shop/products/SolitaireRoundDiamondNecklace2YellowGold_Sarah_Sebastian.jpg?v=1638421761', 7, 9, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(6, 'Stylish Backpack', 'Versatile and trendy, perfect for daily adventures.', 80.00, 35, 'https://cdn.thewirecutter.com/wp-content/media/2022/12/laptopbackpacks-2048px-6905.jpg?auto=webp&quality=75&width=1024', 4, 8, 2, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(7, 'Silver Bracelet', 'Add a touch of elegance to your wrist.', 49.99, 28, 'https://cfs3.monicavinader.com/images/pdp-full/15715191-ss-bl-stch-non-f1.jpg', 7, 9, 3, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(8, 'Wide-Brim Hat', 'Stay stylish and sun-protected.', 39.99, 22, 'https://www.levinehat.com/cdn/shop/products/IMG_5170.png?v=1569966302', 4, 5, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(9, 'Gold Earrings', 'Accentuate your look with these dazzling gold earrings.', 89.99, 18, 'https://www.thangamayil.com/pub/media/catalog/product/cache/9ba065ba720617b32bb6404bbcb37f7a/b/a/base_cgl22istu07894.jpg', 7, 6, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(10, 'Modern Wristwatch', 'Sleek design for the contemporary lifestyle.', 119.99, 32, 'https://www.watchtime.com/wp-content/uploads/2018/08/Jaeger-LeCoultre-Polaris-Memovox_Front-1000.jpg', 5, 4, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(11, 'Canvas Tote Bag', 'A stylish and spacious tote for everyday use.', 49.99, 40, 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/445076/item/goods_30_445076.jpg?width=494', 3, 7, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(12, 'Sporty Backpack', 'Perfect for the active lifestyle, designed for comfort.', 64.99, 35, 'https://ca.targus.com/cdn/shop/products/0028543_156-sport-backpack-224802_1024x1024.png?v=1656002516', 4, 6, 3, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(13, 'Pearl Necklace', 'Timeless elegance with a string of pearls.', 179.99, 20, 'https://kinclimg3.bluestone.com/f_jpg,c_scale,w_1024,q_80,b_rgb:f0f0f0/giproduct/BISA0255N23_YAA18PRWHXXXXXXXX_ABCD00-PICS-00003-1024-9327.png', 7, 9, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(14, 'Leather Wallet', 'Classic design with multiple compartments for your essentials.', 29.99, 50, 'https://www.tradeinn.com/f/13787/137871445/dolce---gabbana-710262-men-leather-wallet.jpg', 4, 2, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(15, 'Retro Sunglasses', 'Channel your inner vintage with these stylish shades.', 54.99, 30, 'https://www.icing.com/dw/image/v2/BBTK_PRD/on/demandware.static/-/Sites-master-catalog/default/dw9f321d1e/images/icing/hi-res/59699_1.jpg?sw=734&sh=734&sm=fit', 6, 2, 3, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(16, 'Silver Cuff Bracelet', 'A statement piece to elevate your wristwear.', 69.99, 25, 'https://cdn-images.farfetch-contents.com/18/19/37/69/18193769_40365499_600.jpg', 7, 5, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(17, 'Panama Hat', 'Stay cool and stylish under the sun.', 44.99, 28, 'https://d2mpxrrcad19ou.cloudfront.net/item_images/385535/8586910_fullsize.jpg', 4, 4, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(18, 'Rose Gold Earrings', 'Add a touch of warmth with these elegant rose gold earrings.', 99.99, 18, 'https://cfs3.monicavinader.com/images/pdp-small-large/14347838-rp-ea-swer-ros-f1.jpg', 7, 3, 3, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(19, 'Minimalist Wristwatch', 'Simplicity meets sophistication in this modern timepiece.', 89.99, 32, 'https://example.com/minimalist-wristwatch.jpg', 2, 1, 2, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(20, 'Crystal Pendant Necklace', 'Capture the light with this dazzling crystal pendant.', 129.99, 15, 'https://example.com/crystal-pendant-necklace.jpg', 5, 2, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(21, 'Leather Crossbody Bag', 'Compact and versatile, perfect for on-the-go.', 74.99, 22, 'https://example.com/leather-crossbody-bag.jpg', 1, 3, 3, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(22, 'Diamond Stud Earrings', 'Timeless elegance with a touch of sparkle.', 149.99, 17, 'https://example.com/diamond-stud-earrings.jpg', 5, 1, 1, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(23, 'Laptop Backpack', 'Stay organized and stylish with this tech-friendly backpack.', 89.99, 20, 'https://example.com/laptop-backpack.jpg', 1, 2, 3, '2023-05-23 08:08:55', '2023-10-23 08:08:55'),
(24, 'Gold Link Bracelet', 'Make a statement with this bold and trendy gold link bracelet.', 79.99, 19, 'https://example.com/gold-link-bracelet.jpg', 5, 3, 2, '2023-10-23 08:08:55', '2023-10-23 08:08:55'),
(25, 'Classic Aviator Sunglasses', 'Achieve a timeless look with these iconic aviator shades.', 59.99, 25, 'https://example.com/classic-aviator-sunglasses.jpg', 3, 1, 3, '2023-10-23 08:08:55', '2023-10-23 08:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `ratingreview`
--

CREATE TABLE `ratingreview` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rating` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ratingreview`
--

INSERT INTO `ratingreview` (`id`, `title`, `description`, `rating`, `userId`, `productId`) VALUES
(1, 'Great Product!', 'I absolutely love this product. It exceeded my expectations.', 5, 1, 1),
(2, 'Not Satisfied', 'The product did not meet my expectations. Disappointed.', 2, 2, 2),
(3, 'Amazing Quality', 'Highly recommend! The quality is outstanding.', 4, 3, 3),
(4, 'Perfect Fit', 'This product fits perfectly. I am very happy with my purchase.', 5, 4, 4),
(5, 'Disappointing', 'Not what I expected. The product does not match the description.', 1, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `countryCode` varchar(2) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `taxRate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `mobile`, `dateOfBirth`, `password`, `imageUrl`, `role`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '9876543210', '1985-05-15', '$2b$10$wqN4FwEZzRcS8SdR/DudFubzTHliwMeXL/pX1Pp0JV2saMuM7Gwuq', 'https://visualpharm.com/assets/314/Admin-595b40b65ba036ed117d36fe.svg', 'admin'),
(2, 'john', 'smith', 'john.smith@gmail.com', '0123456780', '1990-03-28', '$2b$10$HLJHh0VuFyEN4Nl.iTZza.z/ne.RvnHcGpyNvVtR9KnT482XNLEta', 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'customer'),
(3, 'sara', 'adam', 'Sara.adam@gmail.com', '1239874560', '1995-11-19', '$2b$10$wEaKzxuEH68UitWDFTJzlOkXwhLG4.mniaaS3uSyvwl4Vu45OAX2m', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDWw8Vdm9JSAzsSu6MANcNR3pE0wZOISapEA&usqp=CAU', 'customer'),
(4, 'hanna', 'hinn', 'hanna@gmail.com', '2314214410', '2002-01-30', 'test@test', 'https://thumbs.dreamstime.com/z/businessman-avatar-image-beard-hairstyle-male-profile-vector-illustration-178545831.jpg?w=2048', 'customer'),
(5, 'atallah', 'hasan', 'atallah@gmail.com', '2134123410', '2000-01-01', 'test@test', 'https://thumbs.dreamstime.com/z/businessman-avatar-image-beard-hairstyle-male-profile-vector-illustration-178545831.jpg?w=2048', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`) VALUES
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wishlistitem`
--

CREATE TABLE `wishlistitem` (
  `id` int(11) NOT NULL,
  `wishListId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wishlistitem`
--

INSERT INTO `wishlistitem` (`id`, `wishListId`, `productId`) VALUES
(1, 2, 3),
(2, 3, 3),
(4, 4, 3),
(5, 5, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `cartId` (`cartId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentId` (`paymentId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `addressId` (`addressId`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `orderId` (`orderId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `brandId` (`brandId`),
  ADD KEY `discountId` (`discountId`);

--
-- Indexes for table `ratingreview`
--
ALTER TABLE `ratingreview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `wishlistitem`
--
ALTER TABLE `wishlistitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishListId` (`wishListId`),
  ADD KEY `productId` (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ratingreview`
--
ALTER TABLE `ratingreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlistitem`
--
ALTER TABLE `wishlistitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartItem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderItem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderItem_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`discountId`) REFERENCES `discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratingreview`
--
ALTER TABLE `ratingreview`
  ADD CONSTRAINT `ratingReview_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratingReview_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishList_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlistitem`
--
ALTER TABLE `wishlistitem`
  ADD CONSTRAINT `wishListItem_ibfk_1` FOREIGN KEY (`wishListId`) REFERENCES `wishlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishListItem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
