-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: b8g558yloomxczrpajro-mysql.services.clever-cloud.com:3306
-- Generation Time: Nov 07, 2023 at 03:54 PM
-- Server version: 8.0.22-13
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b8g558yloomxczrpajro`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `street` varchar(50) NOT NULL,
  `postalCode` varchar(20) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `imageUrl`) VALUES
(1, 'Zara', 'https://i.ibb.co/R6kk5Sx/Zara-Logo-1.png'),
(2, 'Dolce Gabbana', 'https://i.ibb.co/xS4Bxwk/Dolce-Gabbana-1.png'),
(3, 'H&M', 'https://i.ibb.co/HxJgYJN/layer1.png'),
(4, 'Chanel', 'https://i.ibb.co/rfmBFR5/Chanel-logo-interlocking-cs-1.png'),
(5, 'Prada', 'https://i.ibb.co/105JXWk/Prada-Logo-1.png'),
(6, 'Biba', 'https://i.ibb.co/3rzrX4B/logo-1.png'),
(7, 'Coach', 'https://i.ibb.co/0X4qPBV/coach-logo-removebg-preview.png'),
(8, 'Remus', 'https://i.ibb.co/nn9YdfG/remus-vector-logo-200x200.png');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `totalPrice` decimal(20,2) NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `cartItem`
--

CREATE TABLE `cartItem` (
  `id` int NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int NOT NULL,
  `productId` int NOT NULL,
  `cartId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `isFeatured` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `discountPercentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `productId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `totalPrice` decimal(20,2) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `deliveryFee` decimal(20,2) NOT NULL,
  `paymentId` int NOT NULL,
  `cartId` int NOT NULL,
  `userId` int NOT NULL,
  `addressId` int NOT NULL,
  `taxId` int NOT NULL,
  `discountId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderItem`
--

CREATE TABLE `orderItem` (
  `id` int NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `quantity` int NOT NULL,
  `productId` int NOT NULL,
  `orderId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `provider` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availableInStock` int NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `categoryId` int NOT NULL,
  `brandId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `price`, `availableInStock`, `imageUrl`, `categoryId`, `brandId`, `createdAt`, `updatedAt`) VALUES
(1, 'Classic Watch', 'A timeless piece for every occasion.', 100.00, 50, 'https://www.linjer.co/cdn/shop/products/linjer-classic-watch-38-gunmetal-black-1-front_1000x.jpg?v=1602577160', 5, 1, '2023-05-23 08:08:55', '2023-11-02 13:28:23'),
(2, 'Leather Handbag', 'Elegance in every detail, crafted with genuine leather.', 150.00, 30, 'https://atpatelier.com/cdn/shop/products/Arezzo_Brandy_Vacchetta_Handbag_Front.jpg?v=1678205144', 4, 2, '2023-10-23 08:08:55', '2023-11-02 13:29:49'),
(3, 'Aviator Sunglasses', 'Protect your eyes with style.', 60.00, 40, 'https://www.slazenger.com/images/imgzoom/75/75617266_xxl.jpg', 6, 3, '2023-10-23 08:08:55', '2023-11-02 13:32:01'),
(4, 'Fedora Hat', 'A classic accessory for a touch of sophistication.', 35.00, 25, 'https://www.bon-clic-bon-genre.us/photo/px1844-noir-1_20221026111212.jpg', 4, 1, '2023-05-23 08:08:55', '2023-11-02 13:34:07'),
(6, 'Stylish Backpack', 'Versatile and trendy, perfect for daily adventures.', 80.00, 35, 'https://cdn.thewirecutter.com/wp-content/media/2022/12/laptopbackpacks-2048px-6905.jpg?auto=webp&quality=75&width=1024', 4, 8, '2023-05-23 08:08:55', '2023-11-02 13:35:57'),
(8, 'Wide-Brim Hat', 'Stay stylish and sun-protected.', 39.99, 22, 'https://www.levinehat.com/cdn/shop/products/IMG_5170.png?v=1569966302', 4, 5, '2023-10-23 08:08:55', '2023-11-02 13:40:27'),
(9, 'Gold Earrings', 'Accentuate your look with these dazzling gold earrings.', 89.99, 18, 'https://i.pinimg.com/550x/ed/88/55/ed885578c95d42d18fac841378f80e7f.jpg', 7, 6, '2023-10-23 08:08:55', '2023-11-02 13:41:39'),
(10, 'Modern Wristwatch', 'Sleek design for the contemporary lifestyle.', 119.99, 32, 'https://www.watchtime.com/wp-content/uploads/2018/08/Jaeger-LeCoultre-Polaris-Memovox_Front-1000.jpg', 5, 4, '2023-10-23 08:08:55', '2023-11-02 13:42:49'),
(11, 'Canvas Tote Bag', 'A stylish and spacious tote for everyday use.', 49.99, 40, 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/445076/item/goods_30_445076.jpg?width=494', 3, 7, '2023-10-23 08:08:55', '2023-11-02 13:44:12'),
(12, 'Sporty Backpack', 'Perfect for the active lifestyle, designed for comfort.', 64.99, 35, 'https://ca.targus.com/cdn/shop/products/0028543_156-sport-backpack-224802_1024x1024.png?v=1656002516', 4, 6, '2023-10-23 08:08:55', '2023-11-02 13:44:50'),
(14, 'Leather Wallet', 'Classic design with multiple compartments for your essentials.', 29.99, 50, 'https://www.tradeinn.com/f/13787/137871445/dolce---gabbana-710262-men-leather-wallet.jpg', 4, 2, '2023-10-23 08:08:55', '2023-11-02 13:46:43'),
(15, 'Retro Sunglasses', 'Channel your inner vintage with these stylish shades.', 54.99, 30, 'https://www.icing.com/dw/image/v2/BBTK_PRD/on/demandware.static/-/Sites-master-catalog/default/dw9f321d1e/images/icing/hi-res/59699_1.jpg?sw=734&sh=734&sm=fit', 6, 2, '2023-05-23 08:08:55', '2023-11-02 13:48:00'),
(16, 'Silver Cuff Bracelet', 'A statement piece to elevate your wristwear.', 69.99, 25, 'https://cdn-images.farfetch-contents.com/18/19/37/69/18193769_40365499_600.jpg', 7, 5, '2023-10-23 08:08:55', '2023-11-02 13:49:01'),
(17, 'Panama Hat', 'Stay cool and stylish under the sun.', 44.99, 28, 'https://d2mpxrrcad19ou.cloudfront.net/item_images/385535/8586910_fullsize.jpg', 4, 4, '2023-10-23 08:08:55', '2023-11-02 13:56:43'),
(18, 'Rose Gold Earrings', 'Add a touch of warmth with these elegant rose gold earrings.', 99.99, 18, 'https://cfs3.monicavinader.com/images/pdp-small-large/14347838-rp-ea-swer-ros-f1.jpg', 7, 3, '2023-10-23 08:08:55', '2023-11-02 13:57:56'),
(19, 'Minimalist Wristwatch', 'Simplicity meets sophistication in this modern timepiece.', 89.99, 32, 'https://www.linjer.co/cdn/shop/products/linjer-minimalist-watch-38-rose-gold-mocha-1-front_1000x.jpg?v=1571295293', 5, 5, '2023-05-23 08:08:55', '2023-11-02 13:58:51'),
(20, 'Crystal Pendant Necklace', 'Capture the light with this dazzling crystal pendant.', 129.99, 15, 'https://m.media-amazon.com/images/I/81k1fn921lL._AC_SL1500_.jpg', 7, 2, '2023-10-23 08:08:55', '2023-11-02 14:00:08'),
(21, 'Leather Crossbody Bag', 'Compact and versatile, perfect for on-the-go.', 74.99, 22, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5anxgeKxSACMDXs7Ly6GI5BRM2WO6HX_79A&usqp=CAU', 3, 3, '2023-10-23 08:08:55', '2023-11-02 14:02:09'),
(22, 'Diamond Stud Earrings', 'Timeless elegance with a touch of sparkle.', 149.99, 17, 'https://image.brilliantearth.com/media/product_images/25/BE304RD400_white_top.jpg', 7, 1, '2023-10-23 08:08:55', '2023-11-02 14:03:14'),
(23, 'Laptop Backpack', 'Stay organized and stylish with this tech-friendly backpack.', 89.99, 20, 'https://mt.studio.ps/web/image/product.template/2253/image_1024?unique=d6f4e12', 4, 2, '2023-05-23 08:08:55', '2023-11-02 14:28:30'),
(24, 'Gold Link Bracelet', 'Make a statement with this bold and trendy gold link bracelet.', 79.99, 19, 'https://media.tiffany.com/is/image/Tiffany/EcomItemL2/tiffany-hardwearsmall-link-bracelet-38086839_993599_ED.jpg', 5, 3, '2023-10-23 08:08:55', '2023-11-02 14:53:55'),
(25, 'Classic Aviator Sunglasses', 'Achieve a timeless look with these iconic aviator shades.', 59.99, 25, 'https://images.ray-ban.com/is/image/RayBan/805289602057__STD__shad__qt.png?impolicy=RB_Product&width=800&bgc=%23f2f2f2', 4, 1, '2023-10-23 08:08:55', '2023-11-02 14:54:38'),
(26, 'Hydrated Ever After Skincare Mini Kit', 'This skincare kit has all of your favorite Holy Hydration necessities- a Holy Hydration! Daily Cleanser, Holy Hydration! Makeup Melting Cleansing Balm, Hydrating Booster Drops, Holy Hydration! Face Cream & Eye Cream.', 19.90, 15, 'https://m.media-amazon.com/images/I/71sluGVCHgL._SL1500_.jpg', 1, 6, '2023-11-07 14:04:14', '2023-11-07 14:04:14'),
(27, 'Ice Roller for Face and Eye', 'Suitable for all types of skin. treat acne and sensitive skin, reduce redness & swelling, remove edema, puffiness and fine lines, smooth skin, improve skin problems, body massage care. It has multiple functions such as cleansing ,beauty, stimulates blood circulation and physical cooling when you have a fever.', 8.99, 10, 'https://m.media-amazon.com/images/I/512xda4M6YL._SL1500_.jpg', 1, 3, '2023-11-07 14:04:14', '2023-11-07 14:04:14'),
(30, 'Manicure Set Personal Care Nail Clipper Kit', 'Manicure Set: Professional Manicure Kit Contains nail and toenail tools, Multifunctiona includes hand care, facial care, and foot care tools.', 7.98, 15, 'https://m.media-amazon.com/images/I/71rH7dutmSL._SL1500_.jpg', 2, 5, '2023-11-07 14:12:12', '2023-11-07 14:12:12'),
(31, 'Gift Baskets for Women', 'Beauty Kits for Women - Elevate your self-care routine with our all-inclusive 13-piece beauty kit for women, offering premium skin care for teen girls and all women alike. Experience a luxurious, retro-themed spa day at home.', 64.97, 15, 'https://m.media-amazon.com/images/I/91FTEvRP-hL._SL1500_.jpg', 2, 6, '2023-11-07 14:12:12', '2023-11-07 14:12:12'),
(32, 'Gift Baskets for Women, Beauty Kit for Women', 'Beauty Kits for Women - Elevate your self-care routine with our all-inclusive 13-piece beauty kit for women, offering premium skin care for teen girls and all women alike. Experience a luxurious, retro-themed spa day at home.', 64.97, 15, 'https://m.media-amazon.com/images/I/91FTEvRP-hL._SL1500_.jpg', 2, 7, '2023-11-07 14:21:20', '2023-11-07 14:21:20'),
(33, 'Diamond Pendant Necklace', 'Make a statement with this dazzling diamond pendant.', 199.99, 15, 'https://www.example.com/diamond-pendant-necklace.jpg', 7, 1, '2023-11-07 14:35:00', '2023-11-07 14:35:00'),
(34, 'Casual T-Shirt', 'Comfortable and stylish for everyday wear.', 25.00, 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTil4UHHaX1e7GqmQC_R34cabrroIZvrWCvUYEJ3MLhoA&s', 4, 2, '2023-11-07 14:38:00', '2023-11-07 14:38:00'),
(35, 'Smart Watch', 'Stay connected with this modern smartwatch.', 149.99, 18, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYR9R5n5rl4V-EqDv7_NvQqG3bz4FwgaAN1Qt-74wFgg&s', 5, 5, '2023-11-07 14:40:00', '2023-11-07 14:40:00'),
(36, 'Avant-Garde Sunglasses', 'Step out in style with these unique sunglasses.', 75.00, 22, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZheEQool_wjHKtn0ldMHNSwkROW9zKtCmKS6JZaYG3A&s', 6, 6, '2023-11-07 14:42:00', '2023-11-07 14:42:00'),
(37, 'Fashionable Backpack', 'A trendy and spacious backpack for your essentials.', 65.00, 28, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdmwNJWqIjm0LO1iorayZzyAuaBt7WYOd3JQGpcGzV&s', 4, 7, '2023-11-07 14:45:00', '2023-11-07 14:45:00'),
(38, 'Gold Bangle Bracelet', 'Add a touch of glamour to your wrist with this gold bangle.', 89.99, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4AJS18dKM7a16lMtwj8Mcm_xjG6Y9wJS8FrURbkDAJw&s', 7, 3, '2023-11-07 14:48:00', '2023-11-07 14:48:00'),
(39, 'Chic Crossbody Bag', 'Compact and stylish, perfect for on-the-go fashion.', 55.00, 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtlwbQBRKgKLws0gw4SsuPjbpr-f0ojQMJuIxT1MScTA&s', 3, 2, '2023-11-07 14:50:00', '2023-11-07 14:50:00'),
(40, 'Luxury Wristwatch', 'Elevate your wristwear with this luxurious timepiece.', 189.99, 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOMnZuhLIgpp5-68TmzURn6nRcxViSRLhwm-K0jfG&s', 5, 4, '2023-11-07 14:52:00', '2023-11-07 14:52:00'),
(41, 'Statement Earrings', 'Make a bold statement with these eye-catching earrings.', 79.99, 18, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH1NTnxhc6y10npC17QVoow1a1QGUrlEMGgf6H3tgyoQ&s', 7, 5, '2023-11-07 14:55:00', '2023-11-07 14:55:00'),
(42, 'Casual Sneakers', 'Comfort meets style with these casual sneakers.', 49.99, 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKMe8YdgEz3RzZHp5PyJaCZsjRmT86d9IG4WxAMUz_OA&s', 4, 1, '2023-11-07 14:58:00', '2023-11-07 14:58:00'),
(43, 'Silver Link Bracelet', 'A sleek and modern silver link bracelet for any occasion.', 69.99, 22, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM0lnVbOUNdqjwF9BcE9Izc2Y1_lIwzQuqzCorGnWwgw&s', 7, 6, '2023-11-07 15:00:00', '2023-11-07 15:00:00'),
(44, 'Stylish Sun Hat', 'Stay shaded in style with this fashionable sun hat.', 34.99, 28, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGpPXFyvqKD2RS1dAW6oT3p7nTIxWG9PbQ-3eXb6fOeQ&s', 4, 8, '2023-11-07 15:02:00', '2023-11-07 15:02:00'),
(45, 'Classic Wallet', 'Keep your essentials organized with this classic wallet.', 39.99, 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQibZFcSZQYf30B8Ayrxdt1bIm01BH3gcO2Ul8C7hURpw&s', 4, 2, '2023-11-07 15:05:00', '2023-11-07 15:05:00'),
(46, 'Pearl Necklace', 'Elegance meets sophistication with this timeless pearl necklace.', 129.99, 17, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREiNi8AD-cCnkDB1-T1esUsstEBddrhT_xH0FrEL5t&s', 7, 1, '2023-11-07 15:08:00', '2023-11-07 15:08:00'),
(47, 'Denim Jacket', 'A classic denim jacket for a trendy and casual look.', 79.99, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC4m2AvFTEGF_sSO1gf6g_1sNgBVdGkDF-TYhkWgaM&s', 4, 3, '2023-11-07 15:10:00', '2023-11-07 15:10:00'),
(48, 'Leopard Print Clutch', 'Add a touch of wild to your outfit with this leopard print clutch.', 49.99, 22, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs5ykcpkvHJTamjAxWDwxEFI3lf23z1xO4Q9Cp8dkqWg&s', 3, 7, '2023-11-07 15:12:00', '2023-11-07 15:12:00'),
(49, 'Diamond Bracelet', 'Sparkle and shine with this exquisite diamond bracelet.', 159.99, 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8IIdA7AZr5PHTlmJxZkFRPyzLdE5WknKGNEMYmKUx1g&s', 7, 2, '2023-11-07 15:15:00', '2023-11-07 15:15:00'),
(50, 'Rose Gold Watch', 'A stylish timepiece with a touch of elegance.', 110.00, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4dcfXuiL8fruKMc_w_njkHwfCFsCXk91FCHRadY91&s', 5, 3, '2023-11-07 14:30:00', '2023-11-07 14:30:00'),
(51, 'Leather Shoulder Bag', 'Versatile and chic, perfect for any occasion.', 120.00, 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScZ2wLvNwvOXDItbwzzC7FOLjNvUeAkXFbW610MTII8w&s', 3, 4, '2023-11-07 14:32:00', '2023-11-07 14:32:00'),
(52, 'Canvas Slip-On Shoes', 'Easy and comfortable slip-on shoes for a casual day out.', 29.99, 25, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIqBBXfQIVaW9eFu7jtE23FKzTRYrkdEywPSGvB_3aug&s', 4, 1, '2023-11-07 15:18:00', '2023-11-07 15:18:00'),
(53, 'Silver Hoop Earrings', 'Timeless silver hoop earrings for a classic look.', 49.99, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb1492YwvJ8YpvrB5BsJ_RQagav4zOrKtjjcLz3AzchQ&s', 7, 5, '2023-11-07 15:20:00', '2023-11-07 15:20:00'),
(54, 'Luxe Leather Jacket', 'Upgrade your style with this luxurious leather jacket.', 179.99, 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzAcJuQpk-y1VTts9Q9cgL51d1vGgwzxY1mekfiA6N&s', 4, 4, '2023-11-07 15:22:00', '2023-11-07 15:22:00'),
(55, 'Statement Sunglasses', 'Make a bold statement with these oversized sunglasses.', 69.99, 18, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqu1-G9OjZdqaGPIE5Dlcyek7a9dSg0Y2ItXsrEBgyDg&s', 6, 6, '2023-11-07 15:25:00', '2023-11-07 15:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `ratingReview`
--

CREATE TABLE `ratingReview` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rating` float NOT NULL,
  `userId` int NOT NULL,
  `productId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratingReview`
--

INSERT INTO `ratingReview` (`id`, `title`, `description`, `rating`, `userId`, `productId`) VALUES
(1, 'Great Product!', 'I absolutely love this product. It exceeded my expectations.', 5, 1, 1),
(2, 'Not Satisfied', 'The product did not meet my expectations. Disappointed.', 2, 2, 2),
(3, 'Amazing Quality', 'Highly recommend! The quality is outstanding.', 4, 3, 3),
(4, 'Perfect Fit', 'This product fits perfectly. I am very happy with my purchase.', 5, 4, 4),
(6, 'Nice Classical Watch', 'I love this product. it\'s Awesome!', 4, 2, 1),
(7, 'Normal Watch', 'It looks like any other watch, nothing special about it', 3.5, 2, 1),
(8, 'I recommend this Handbag', 'Nice looking Handbag, the delivery was fast also', 4.5, 3, 2),
(9, 'I look great in them', 'I look badass in this glasses', 5, 4, 3),
(10, 'Ugly Hat', 'I look like a hoppo in it', 3, 5, 4),
(12, 'Cool looking bag', 'Comfortable and a nice looking hat', 4, 3, 6),
(14, 'It\'s noting like the picture', 'I look like a walking lamp, maybe I will wear it on hallowen', 2, 5, 8),
(15, 'Nice and cheap earing', 'Nice earinig, I recommend it and would buy again from you.', 5, 2, 9),
(16, 'Nothing like the description!', 'The product I got is not the same one is the description, and took alot of time to deliever!', 2, 3, 10),
(17, 'Bad Quality and not durable', 'The product is made of poor materials, not worth the money', 1, 4, 11),
(18, 'YaYa Sports', 'I like Sports and this bag is a good fit for me', 5, 5, 12),
(20, 'Do not recommend', 'the product I recieved was in bad shape and took alot of time in delivery.', 3, 3, 14),
(21, 'Fun and entertaining sunglasses', 'I won the hallowen contest beacuse of them.', 4, 4, 15),
(22, 'The sizes are bit small', 'I ordered the meduim and it feels like small', 3, 5, 16),
(23, 'Nice hat, I recommend', 'I look like my dead grandfather god bless his soul.', 4, 2, 17),
(24, 'I like the color, Very wonderful earrings', 'Very beautiful and wonderful earrings.', 4.5, 3, 18),
(25, 'If you like simple things, This is perfect for you', 'Very simple and modern wristwatch, I recommend buying it.', 4.5, 4, 19),
(26, 'There was a mis up', 'I thought the product comes as crystal but got a diamond like necklace', 1, 5, 20),
(27, 'I do not recommend buying it', 'The next dat I bought it, it got stolen beacuse its very easy to steal', 2, 2, 21),
(28, 'Very Beautiful Earrings', 'Wonderful and Beautiful earrings, The diamond is real.', 4, 3, 22),
(29, 'Good Backpack', 'Overall good backpack and material.', 4, 4, 23),
(30, 'I do not recommend the product or store', 'The product I got is not the same as the picture, then I contacted the store they gave me a cheap fake bracelet, When I contacted them they said they will send me a gift but never delivered.', 1, 5, 24),
(31, 'Good Product for a Gift', 'I used all of my last money to buy this product.', 4.5, 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int NOT NULL,
  `countryCode` varchar(2) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `taxRate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `wishList`
--

CREATE TABLE `wishList` (
  `id` int NOT NULL,
  `userId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishList`
--

INSERT INTO `wishList` (`id`, `userId`) VALUES
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `wishListItem`
--

CREATE TABLE `wishListItem` (
  `id` int NOT NULL,
  `wishListId` int NOT NULL,
  `productId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `cartItem`
--
ALTER TABLE `cartItem`
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
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentId` (`paymentId`),
  ADD KEY `cartId` (`cartId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `addressId` (`addressId`),
  ADD KEY `taxId` (`taxId`),
  ADD KEY `discountId` (`discountId`);

--
-- Indexes for table `orderItem`
--
ALTER TABLE `orderItem`
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
  ADD KEY `brandId` (`brandId`);

--
-- Indexes for table `ratingReview`
--
ALTER TABLE `ratingReview`
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
-- Indexes for table `wishList`
--
ALTER TABLE `wishList`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `wishListItem`
--
ALTER TABLE `wishListItem`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cartItem`
--
ALTER TABLE `cartItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderItem`
--
ALTER TABLE `orderItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ratingReview`
--
ALTER TABLE `ratingReview`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishList`
--
ALTER TABLE `wishList`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishListItem`
--
ALTER TABLE `wishListItem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `cartItem`
--
ALTER TABLE `cartItem`
  ADD CONSTRAINT `cartItem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartItem_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`taxId`) REFERENCES `tax` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_6` FOREIGN KEY (`discountId`) REFERENCES `discount` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orderItem`
--
ALTER TABLE `orderItem`
  ADD CONSTRAINT `orderItem_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderItem_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratingReview`
--
ALTER TABLE `ratingReview`
  ADD CONSTRAINT `ratingReview_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratingReview_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishList`
--
ALTER TABLE `wishList`
  ADD CONSTRAINT `wishList_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishListItem`
--
ALTER TABLE `wishListItem`
  ADD CONSTRAINT `wishListItem_ibfk_1` FOREIGN KEY (`wishListId`) REFERENCES `wishList` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishListItem_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
