-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 04:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dolores perfumes`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorise`
--

CREATE TABLE `authorise` (
  `authoriseID` int(10) NOT NULL,
  `value` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `authorise`
--

INSERT INTO `authorise` (`authoriseID`, `value`) VALUES
(1, b'1'),
(2, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandID` int(10) NOT NULL,
  `brand_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandID`, `brand_name`) VALUES
(1, 'CHANEL'),
(2, 'GUCCI'),
(3, 'Dior'),
(4, 'ARMANY BEAUTY'),
(5, 'VERSACE'),
(6, 'MARC JACOBS FRAGRANCES'),
(7, 'BOBBI BROWN');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(10) NOT NULL,
  `category_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `category_name`) VALUES
(1, 'Men'),
(2, 'Women');

-- --------------------------------------------------------

--
-- Table structure for table `fragrance_famliy`
--

CREATE TABLE `fragrance_famliy` (
  `fragrance_familyID` int(10) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `familyID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fragrance_famliy`
--

INSERT INTO `fragrance_famliy` (`fragrance_familyID`, `name`, `familyID`) VALUES
(1, 'Floral', NULL),
(2, 'Earthy & Woody', NULL),
(3, 'Warm Woods', 2),
(4, 'Citrus & Woods', 2),
(5, 'Fruity Florals', 1),
(6, 'Fresh Aquatics', 1),
(7, 'Warm & Spicy', NULL),
(8, 'Cool Spice', 7);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `linkID` int(10) NOT NULL,
  `link_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`linkID`, `link_name`, `src`) VALUES
(3, 'Sign in', '#modal1'),
(4, 'Register', '#modal2'),
(5, '<i class=\"material-icons tiny\">shopping_cart</i>', 'index.php?view=shopping_cart'),
(6, 'Sign out', 'models/users/sign_out.php'),
(7, 'Home', 'index.php'),
(8, 'facebook', 'http://www.facebook.com'),
(9, 'instagram', 'http://www.instagram.com'),
(10, 'twitter', 'http://www.twitter.com');

-- --------------------------------------------------------

--
-- Table structure for table `link_authorise`
--

CREATE TABLE `link_authorise` (
  `link_authoriseID` int(10) NOT NULL,
  `linkID` int(10) NOT NULL,
  `authoriseID` int(10) NOT NULL,
  `priority` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_authorise`
--

INSERT INTO `link_authorise` (`link_authoriseID`, `linkID`, `authoriseID`, `priority`) VALUES
(1, 5, 1, 444),
(3, 6, 1, 1),
(7, 4, 2, 222),
(8, 3, 2, 444),
(9, 7, 1, 999),
(10, 7, 2, 999),
(11, 8, 1, 999),
(12, 9, 1, 998),
(13, 10, 1, 997),
(14, 8, 2, 999),
(15, 9, 2, 998),
(16, 10, 2, 997);

-- --------------------------------------------------------

--
-- Table structure for table `link_link_type`
--

CREATE TABLE `link_link_type` (
  `link_link_typeID` int(10) NOT NULL,
  `linkID` int(10) NOT NULL,
  `link_typeID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_link_type`
--

INSERT INTO `link_link_type` (`link_link_typeID`, `linkID`, `link_typeID`) VALUES
(3, 4, 1),
(4, 3, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `link_type`
--

CREATE TABLE `link_type` (
  `link_typeID` int(10) NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `link_type`
--

INSERT INTO `link_type` (`link_typeID`, `type`) VALUES
(2, 'footer_social'),
(1, 'header');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `noteID` int(10) NOT NULL,
  `note_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`noteID`, `note_name`) VALUES
(17, 'Alcohol Denat'),
(5, 'Bergamot'),
(1, 'Citron'),
(2, 'Citrus Accord'),
(15, 'Cypress'),
(12, 'Gardenia'),
(21, 'Italian Lemon'),
(11, 'Jasmine'),
(3, 'Labdanum'),
(14, 'Marine Notes'),
(16, 'Musk'),
(7, 'Nutmeg'),
(9, 'Pear'),
(22, 'Pepperwood'),
(8, 'Red Berries'),
(4, 'Sandalwood Cedar'),
(19, 'Strawberry'),
(6, 'Vanilla'),
(23, 'Vetiver'),
(20, 'Violet Leaves'),
(13, 'Warm Woods'),
(18, 'Water'),
(10, 'White Gardenia');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(10) NOT NULL,
  `method` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `method`) VALUES
(1, 'on delivery'),
(3, 'postponed payment');

-- --------------------------------------------------------

--
-- Table structure for table `perfume`
--

CREATE TABLE `perfume` (
  `perfumeID` int(10) NOT NULL,
  `brandID` int(10) NOT NULL,
  `perfume_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume`
--

INSERT INTO `perfume` (`perfumeID`, `brandID`, `perfume_name`) VALUES
(1, 1, 'BLEU DE CHANEL'),
(2, 3, 'Sauvage'),
(3, 2, 'Flora By Gucci - Gorgeous Gardenia'),
(4, 4, 'Acqua di Gioia'),
(5, 4, 'Acqua Di Gio Profumo'),
(6, 7, 'Beach Fragrance'),
(7, 6, 'Daisy'),
(8, 5, 'Eros Flame');

-- --------------------------------------------------------

--
-- Table structure for table `perfume_image`
--

CREATE TABLE `perfume_image` (
  `perfume_imageID` int(10) NOT NULL,
  `src_mini` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `src_normal` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `src_original` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_image`
--

INSERT INTO `perfume_image` (`perfume_imageID`, `src_mini`, `src_normal`, `src_original`) VALUES
(1, 'assets/img/products/mini-Bleu_De_Chanel.jpg', 'assets/img/products/normal-Bleu_De_Chanel.jpg', 'assets/images/products/Bleu_De_Chanel.jpg'),
(2, 'assets/img/products/mini-Sauvage.jpg', 'assets/img/products/normal-Sauvage.jpg', 'assets/images/products/Sauvage.jpg'),
(3, 'assets/img/products/mini-Gorgeous_Gardenia.jpg', 'assets/img/products/normal-Gorgeous_Gardenia.jpg', 'assets/images/products/Gorgeous_Gardenia.jpg'),
(4, 'assets/img/products/mini-Acqua_di_Gioia.jpg', 'assets/img/products/normal-Acqua_di_Gioia.jpg', 'assets/images/products/Acqua_di_Gioia.jpg'),
(5, 'assets/img/products/mini-Acqua_Di_Gio_Profumo.jpg', 'assets/img/products/normal-Acqua_Di_Gio_Profumo.jpg', 'assets/images/products/Acqua_Di_Gio_Profumo.jpg'),
(6, 'assets/img/products/mini-Beach_Fragrance.jpg', 'assets/img/products/normal-Beach_Fragrance.jpg', 'assets/images/product/Beach_Fragrance.jpg'),
(7, 'assets/img/products/mini-Daisy.jpg', 'assets/img/products/normal-Daisy.jpg', 'assets/images/products/Daisy.jpg'),
(8, 'assets/img/products/mini-Eros_Flame.jpg', 'assets/img/products/normal-Eros_Flame.jpg', 'assets/images/products/Eros_Flame.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `perfume_type`
--

CREATE TABLE `perfume_type` (
  `perfume_typeID` int(10) NOT NULL,
  `typeID` int(10) NOT NULL,
  `perfumeID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_type`
--

INSERT INTO `perfume_type` (`perfume_typeID`, `typeID`, `perfumeID`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 2, 7),
(8, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `perfume_type_category`
--

CREATE TABLE `perfume_type_category` (
  `perfume_type_categoryID` int(10) NOT NULL,
  `perfume_typeID` int(10) NOT NULL,
  `categoryID` int(10) NOT NULL,
  `product_description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_type_category`
--

INSERT INTO `perfume_type_category` (`perfume_type_categoryID`, `perfume_typeID`, `categoryID`, `product_description`) VALUES
(1, 1, 1, 'A woody, aromatic fragrance for the man who defies convention; a provocative blend of citrus and woods that liberates the senses. Fresh, clean, and profoundly sensual.'),
(2, 2, 1, 'Exudes sensual and mysterious facets. Calabrian bergamot adds spicy notes for fullness and sensuality, as nutmeg is wrapped in smoky accents of vanilla absolute. The fragrance is inspired by the magic hour of twilight in the desert, a moment when nature awakes and the sky is set ablaze.'),
(3, 3, 2, 'A sumptuous white floral Gorgeous Gardenia is Gucci’s faithful creation of the perfect gardenia. The Gorgeous Gardenia woman exudes a sultry sensuality that is lushly enticing. Men are drawn to her as bees are to a blossoming flower.'),
(4, 4, 2, 'Inspired by Italy’s Mediterranean coast, this Giorgio Armani perfume for women is a singular blend of serenity and exhilaration. Opening up with the clean, fresh perfume of citrus, the eau de parfum reveals a heart of intoxicating jasmine fragrance and lingers with a scent of warm cedarwood.'),
(5, 5, 1, 'This ARMANI beauty cologne for men pairs marine accords and fresh bergamot with patchouli and incense for a profoundly intense and aromatic men’s fragrance.'),
(6, 6, 2, 'This bestselling scent captures the atmosphere and attitude of summer. Designed with an intoxicating blend of jasmine, sea spray, and mandarin, this eau de parfum is wearable anytime, anywhere.'),
(7, 7, 2, 'Charmingly simple with a signature quality, Daisy Marc Jacobs transports you to a place that’s optimistic, beautiful, and pure. The top of the fragrance is infused with succulent wild berries and soft white violets. At the heart, velvety jasmine warms to a dreamy dry-down of sensual sandalwood, for a romantic, lingering finish.'),
(8, 8, 1, 'Versace Eros Flame the new men’s fragrance, strikes you right through the heart—a hesperidic, amber, woody fragrance to make the wearer feel strong, passionate, self-confident, and very Versace.');

-- --------------------------------------------------------

--
-- Table structure for table `perfume_type_category_fragrance`
--

CREATE TABLE `perfume_type_category_fragrance` (
  `perfume_type_category_fragranceID` int(10) NOT NULL,
  `perfume_type_categoryID` int(10) NOT NULL,
  `fragrance_familyID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_type_category_fragrance`
--

INSERT INTO `perfume_type_category_fragrance` (`perfume_type_category_fragranceID`, `perfume_type_categoryID`, `fragrance_familyID`) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 5),
(4, 4, 6),
(5, 5, 4),
(6, 6, 6),
(7, 7, 5),
(8, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `perfume_type_category_note`
--

CREATE TABLE `perfume_type_category_note` (
  `perfume_type_category_noteID` int(10) NOT NULL,
  `perfume_type_categoryID` int(10) NOT NULL,
  `noteID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_type_category_note`
--

INSERT INTO `perfume_type_category_note` (`perfume_type_category_noteID`, `perfume_type_categoryID`, `noteID`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 2, 5),
(5, 2, 6),
(6, 2, 7),
(7, 3, 8),
(8, 3, 9),
(9, 3, 10),
(10, 4, 11),
(11, 4, 12),
(12, 4, 13),
(13, 5, 14),
(14, 5, 15),
(15, 5, 16),
(16, 6, 17),
(17, 6, 18),
(18, 6, 11),
(19, 7, 19),
(20, 7, 20),
(21, 7, 11),
(22, 8, 21),
(23, 8, 22),
(24, 8, 23);

-- --------------------------------------------------------

--
-- Table structure for table `perfume_type_category_size`
--

CREATE TABLE `perfume_type_category_size` (
  `perfume_type_category_sizeID` int(10) NOT NULL,
  `perfume_type_categoryID` int(10) NOT NULL,
  `sizeID` int(10) NOT NULL,
  `perfume_imageID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `perfume_type_category_size`
--

INSERT INTO `perfume_type_category_size` (`perfume_type_category_sizeID`, `perfume_type_categoryID`, `sizeID`, `perfume_imageID`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 1, 3),
(4, 4, 1, 4),
(5, 5, 3, 5),
(6, 6, 1, 6),
(7, 7, 4, 7),
(8, 8, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `price_listID` int(10) NOT NULL,
  `perfume_type_category_sizeID` int(10) NOT NULL,
  `date` int(20) NOT NULL,
  `price` decimal(30,0) NOT NULL,
  `currency` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`price_listID`, `perfume_type_category_sizeID`, `date`, `price`, `currency`) VALUES
(1, 1, 1593885463, '77', '$'),
(2, 2, 1594209639, '90', '$'),
(3, 3, 1594210774, '80', '$'),
(4, 4, 1594211559, '78', '$'),
(5, 5, 1594398306, '74', '$'),
(6, 6, 1594587457, '70', '$'),
(7, 7, 1594587477, '106', '$'),
(8, 8, 1594587498, '80', '$');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int(10) NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `name`) VALUES
(2, 'Administrator'),
(1, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `sizeID` int(10) NOT NULL,
  `value` smallint(20) UNSIGNED NOT NULL,
  `measurement_unit` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`sizeID`, `value`, `measurement_unit`) VALUES
(1, 50, 'ml'),
(2, 60, 'ml'),
(3, 40, 'ml'),
(4, 100, 'ml');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `typeID` int(10) NOT NULL,
  `type_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typeID`, `type_name`) VALUES
(2, 'Eau de Toilette'),
(3, 'Eau de Parfum');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `username` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` int(20) NOT NULL,
  `roleID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `email`, `date_created`, `roleID`) VALUES
(6, 'Perica2', 'a7be72d58029707f81b90ef7177b1418', 'perapera@gmail.com', 1593784351, 2),
(12, 'Tomica2', 'e8340d3b29d77af2fca41a7c59f3b96b', 'tomatoma@gmail.com', 1594581973, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_basket`
--

CREATE TABLE `user_basket` (
  `user_basketID` int(10) NOT NULL,
  `price_listID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `user_orderID` int(10) NOT NULL,
  `total_price` decimal(30,0) DEFAULT NULL,
  `time` int(30) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `credit_card_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`user_orderID`, `total_price`, `time`, `paymentID`, `location`, `phone_number`, `credit_card_number`) VALUES
(44, '258', 1594560785, 1, 'Beograd demonstracije 2', '12312331231', NULL),
(45, '258', 1594560828, 1, 'Beograd demonstracije 2', '12312331231', NULL),
(46, '258', 1594560873, 1, 'Beograd demonstracije 2', '12312331231', NULL),
(47, '258', 1594561692, 3, 'Beograd demonstracije 2', '06132115599', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_order_basket`
--

CREATE TABLE `user_order_basket` (
  `user_order_basket` int(11) NOT NULL,
  `user_order` int(11) NOT NULL,
  `user_basket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorise`
--
ALTER TABLE `authorise`
  ADD PRIMARY KEY (`authoriseID`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `fragrance_famliy`
--
ALTER TABLE `fragrance_famliy`
  ADD PRIMARY KEY (`fragrance_familyID`),
  ADD KEY `familyID` (`familyID`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`linkID`);

--
-- Indexes for table `link_authorise`
--
ALTER TABLE `link_authorise`
  ADD PRIMARY KEY (`link_authoriseID`),
  ADD KEY `linkID` (`linkID`),
  ADD KEY `authoriseID` (`authoriseID`);

--
-- Indexes for table `link_link_type`
--
ALTER TABLE `link_link_type`
  ADD PRIMARY KEY (`link_link_typeID`),
  ADD KEY `linkID` (`linkID`),
  ADD KEY `link_typeID` (`link_typeID`);

--
-- Indexes for table `link_type`
--
ALTER TABLE `link_type`
  ADD PRIMARY KEY (`link_typeID`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`noteID`),
  ADD UNIQUE KEY `name` (`note_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `perfume`
--
ALTER TABLE `perfume`
  ADD PRIMARY KEY (`perfumeID`),
  ADD KEY `brand_fk` (`brandID`);

--
-- Indexes for table `perfume_image`
--
ALTER TABLE `perfume_image`
  ADD PRIMARY KEY (`perfume_imageID`);

--
-- Indexes for table `perfume_type`
--
ALTER TABLE `perfume_type`
  ADD PRIMARY KEY (`perfume_typeID`),
  ADD KEY `perfumeID` (`perfumeID`),
  ADD KEY `typeID` (`typeID`);

--
-- Indexes for table `perfume_type_category`
--
ALTER TABLE `perfume_type_category`
  ADD PRIMARY KEY (`perfume_type_categoryID`),
  ADD KEY `perfume_typeID` (`perfume_typeID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `perfume_type_category_fragrance`
--
ALTER TABLE `perfume_type_category_fragrance`
  ADD PRIMARY KEY (`perfume_type_category_fragranceID`),
  ADD KEY `perfume_type_categoryID` (`perfume_type_categoryID`),
  ADD KEY `fragrance_familyID` (`fragrance_familyID`);

--
-- Indexes for table `perfume_type_category_note`
--
ALTER TABLE `perfume_type_category_note`
  ADD PRIMARY KEY (`perfume_type_category_noteID`),
  ADD KEY `perfume_type_categoryID` (`perfume_type_categoryID`),
  ADD KEY `noteID` (`noteID`);

--
-- Indexes for table `perfume_type_category_size`
--
ALTER TABLE `perfume_type_category_size`
  ADD PRIMARY KEY (`perfume_type_category_sizeID`),
  ADD KEY `perfume_type_categoryID` (`perfume_type_categoryID`),
  ADD KEY `sizeID` (`sizeID`),
  ADD KEY `perfume_imageID` (`perfume_imageID`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`price_listID`),
  ADD KEY `perfume_type_category_sizeID` (`perfume_type_category_sizeID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`sizeID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `roleID` (`roleID`);

--
-- Indexes for table `user_basket`
--
ALTER TABLE `user_basket`
  ADD PRIMARY KEY (`user_basketID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `price_listID` (`price_listID`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`user_orderID`),
  ADD KEY `paymentID` (`paymentID`);

--
-- Indexes for table `user_order_basket`
--
ALTER TABLE `user_order_basket`
  ADD PRIMARY KEY (`user_order_basket`),
  ADD KEY `user_order` (`user_order`),
  ADD KEY `user_basket` (`user_basket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorise`
--
ALTER TABLE `authorise`
  MODIFY `authoriseID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fragrance_famliy`
--
ALTER TABLE `fragrance_famliy`
  MODIFY `fragrance_familyID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `linkID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `link_authorise`
--
ALTER TABLE `link_authorise`
  MODIFY `link_authoriseID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `link_link_type`
--
ALTER TABLE `link_link_type`
  MODIFY `link_link_typeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `link_type`
--
ALTER TABLE `link_type`
  MODIFY `link_typeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `noteID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `perfume`
--
ALTER TABLE `perfume`
  MODIFY `perfumeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfume_image`
--
ALTER TABLE `perfume_image`
  MODIFY `perfume_imageID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfume_type`
--
ALTER TABLE `perfume_type`
  MODIFY `perfume_typeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfume_type_category`
--
ALTER TABLE `perfume_type_category`
  MODIFY `perfume_type_categoryID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfume_type_category_fragrance`
--
ALTER TABLE `perfume_type_category_fragrance`
  MODIFY `perfume_type_category_fragranceID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perfume_type_category_note`
--
ALTER TABLE `perfume_type_category_note`
  MODIFY `perfume_type_category_noteID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `perfume_type_category_size`
--
ALTER TABLE `perfume_type_category_size`
  MODIFY `perfume_type_category_sizeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `price_listID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `sizeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `typeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_basket`
--
ALTER TABLE `user_basket`
  MODIFY `user_basketID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `user_orderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user_order_basket`
--
ALTER TABLE `user_order_basket`
  MODIFY `user_order_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fragrance_famliy`
--
ALTER TABLE `fragrance_famliy`
  ADD CONSTRAINT `fragrance_famliy_ibfk_1` FOREIGN KEY (`familyID`) REFERENCES `fragrance_famliy` (`fragrance_familyID`);

--
-- Constraints for table `link_authorise`
--
ALTER TABLE `link_authorise`
  ADD CONSTRAINT `link_authorise_ibfk_1` FOREIGN KEY (`linkID`) REFERENCES `link` (`linkID`),
  ADD CONSTRAINT `link_authorise_ibfk_2` FOREIGN KEY (`authoriseID`) REFERENCES `authorise` (`authoriseID`);

--
-- Constraints for table `link_link_type`
--
ALTER TABLE `link_link_type`
  ADD CONSTRAINT `link_link_type_ibfk_1` FOREIGN KEY (`linkID`) REFERENCES `link` (`linkID`),
  ADD CONSTRAINT `link_link_type_ibfk_2` FOREIGN KEY (`link_typeID`) REFERENCES `link_type` (`link_typeID`);

--
-- Constraints for table `perfume`
--
ALTER TABLE `perfume`
  ADD CONSTRAINT `brand_fk` FOREIGN KEY (`brandID`) REFERENCES `brand` (`brandID`);

--
-- Constraints for table `perfume_type`
--
ALTER TABLE `perfume_type`
  ADD CONSTRAINT `perfume_type_ibfk_1` FOREIGN KEY (`perfumeID`) REFERENCES `perfume` (`perfumeID`),
  ADD CONSTRAINT `perfume_type_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`);

--
-- Constraints for table `perfume_type_category`
--
ALTER TABLE `perfume_type_category`
  ADD CONSTRAINT `perfume_type_category_ibfk_1` FOREIGN KEY (`perfume_typeID`) REFERENCES `perfume_type` (`perfume_typeID`),
  ADD CONSTRAINT `perfume_type_category_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

--
-- Constraints for table `perfume_type_category_fragrance`
--
ALTER TABLE `perfume_type_category_fragrance`
  ADD CONSTRAINT `perfume_type_category_fragrance_ibfk_1` FOREIGN KEY (`perfume_type_categoryID`) REFERENCES `perfume_type_category` (`perfume_type_categoryID`),
  ADD CONSTRAINT `perfume_type_category_fragrance_ibfk_2` FOREIGN KEY (`fragrance_familyID`) REFERENCES `fragrance_famliy` (`fragrance_familyID`);

--
-- Constraints for table `perfume_type_category_note`
--
ALTER TABLE `perfume_type_category_note`
  ADD CONSTRAINT `perfume_type_category_note_ibfk_1` FOREIGN KEY (`perfume_type_categoryID`) REFERENCES `perfume_type_category` (`perfume_type_categoryID`),
  ADD CONSTRAINT `perfume_type_category_note_ibfk_2` FOREIGN KEY (`noteID`) REFERENCES `notes` (`noteID`);

--
-- Constraints for table `perfume_type_category_size`
--
ALTER TABLE `perfume_type_category_size`
  ADD CONSTRAINT `perfume_type_category_size_ibfk_1` FOREIGN KEY (`sizeID`) REFERENCES `size` (`sizeID`),
  ADD CONSTRAINT `perfume_type_category_size_ibfk_2` FOREIGN KEY (`perfume_type_categoryID`) REFERENCES `perfume_type_category` (`perfume_type_categoryID`),
  ADD CONSTRAINT `perfume_type_category_size_ibfk_3` FOREIGN KEY (`perfume_imageID`) REFERENCES `perfume_image` (`perfume_imageID`);

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `price_list_ibfk_1` FOREIGN KEY (`perfume_type_category_sizeID`) REFERENCES `perfume_type_category_size` (`perfume_type_category_sizeID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`);

--
-- Constraints for table `user_basket`
--
ALTER TABLE `user_basket`
  ADD CONSTRAINT `user_basket_ibfk_1` FOREIGN KEY (`price_listID`) REFERENCES `price_list` (`price_listID`),
  ADD CONSTRAINT `user_basket_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`paymentID`);

--
-- Constraints for table `user_order_basket`
--
ALTER TABLE `user_order_basket`
  ADD CONSTRAINT `user_order_basket_ibfk_1` FOREIGN KEY (`user_basket`) REFERENCES `user_basket` (`user_basketID`),
  ADD CONSTRAINT `user_order_basket_ibfk_2` FOREIGN KEY (`user_order`) REFERENCES `user_order` (`user_orderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
