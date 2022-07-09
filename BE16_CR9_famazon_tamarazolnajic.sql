-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 01:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be16_cr9_famazon_tamarazolnajic`
--
CREATE DATABASE IF NOT EXISTS `be16_cr9_famazon_tamarazolnajic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `be16_cr9_famazon_tamarazolnajic`;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(10) NOT NULL,
  `bank_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_name`) VALUES
(7, 'Erste Bank'),
(8, 'Austria Bank'),
(9, 'Unicredit Bank'),
(10, 'Santander Bank');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(10) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_contact` int(10) NOT NULL,
  `fk_location_id` int(10) DEFAULT NULL,
  `fk_bank_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_email`, `company_contact`, `fk_location_id`, `fk_bank_id`) VALUES
(1, 'Tromp', 'tromp@gmail.com', 436123456, 1, 7),
(2, 'Quitzon', 'quitzon@gmail.com', 43654321, 2, 8),
(3, 'Schmitt', 'schmitt@gmail.com', 43123321, 3, 9),
(4, 'TicTac', 'tictac@gmail.com', 43321123, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fk_order_id` int(10) DEFAULT NULL,
  `fk_location_id` int(10) DEFAULT NULL,
  `fk_transaction_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `customer_email`, `password`, `fk_order_id`, `fk_location_id`, `fk_transaction_id`) VALUES
(1, 'Tyler', 'Koziol', 'ty-koz@gmail.com', 'E[uMu.u+', 4, 2, 3),
(2, 'Ravid', 'Seidel', 'ravid-sei@gmail.com', 'u%u_UHULU{UQ', 2, 1, 4),
(3, 'Yeshe', 'Riley', 'yeri@inc.info', 'u{e#Aha+AP', 1, 3, 2),
(4, 'Marilyn', 'Hampson', 'marihampson@mail.com', 'EbYWy]Y~e', 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `famazon`
--

CREATE TABLE `famazon` (
  `fk_customer_id` int(10) DEFAULT NULL,
  `fk_company_id` int(10) DEFAULT NULL,
  `fk_product_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `famazon`
--

INSERT INTO `famazon` (`fk_customer_id`, `fk_company_id`, `fk_product_id`) VALUES
(2, 1, 3),
(2, 3, 4),
(4, 4, 1),
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(10) NOT NULL,
  `adress` varchar(100) DEFAULT NULL,
  `ZIP` int(5) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `adress`, `ZIP`, `city`) VALUES
(1, 'Blue Street', 1160, 'Vienna'),
(2, 'Red Street', 1010, 'Vienna'),
(3, 'Yellow Street', 1234, 'Linz'),
(4, 'White Street', 13365, 'Hallstadt');

-- --------------------------------------------------------

--
-- Table structure for table `ordering`
--

CREATE TABLE `ordering` (
  `order_id` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `shipping_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `quantity` int(10) NOT NULL,
  `price_sum` int(10) NOT NULL,
  `fk_shipping_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordering`
--

INSERT INTO `ordering` (`order_id`, `order_date`, `shipping_date`, `delivery_date`, `quantity`, `price_sum`, `fk_shipping_id`) VALUES
(1, '2022-07-07', '2022-07-08', '2022-07-10', 2, 210, 1),
(2, '2022-07-06', '2022-07-07', '2022-07-09', 2, 320, 2),
(3, '2022-07-01', '2022-07-03', '2022-07-06', 3, 200, 3),
(4, '2022-07-08', '2022-07-10', '2022-07-12', 4, 430, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_type_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL,
  `card_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_type_id`, `fk_customer_id`, `card_nr`) VALUES
(1, 2, 3, 12345),
(2, 3, 2, 54321),
(3, 1, 4, 11111),
(4, 4, 1, 123321);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `type_id` int(10) NOT NULL,
  `payment_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`type_id`, `payment_type`) VALUES
(1, 'Debit Card'),
(2, 'Credit Card'),
(3, 'Sofort'),
(4, 'Klarna');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `product_price` int(10) NOT NULL,
  `fk_set_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `description`, `product_price`, `fk_set_id`) VALUES
(1, 'Echo Dot (4th generation) | Smart speaker with Alexa', 'Meet the all-new Echo Dot—our most popular smart speaker with Alexa. The sleek, compact design delivers crisp vocals and balanced bass for full sound.', 35, 3),
(2, 'Gedore 1.26/2', 'For splitting jammed or stripped nuts without damaging the bolt thread\r\nSuitable for nuts up to property class 6. 15 x 15 x 15 centimetres, Weight	0.3 Kilograms,Size	M10-M16\r\nNumber Of Pieces	1', 65, 2),
(3, 'Memories of Ice: (Malazan Book of the Fallen: Book 3)', 'Like a fanatical tide of corrupted blood, it seethes across the land, devouring all who fail to heed the Word of its elusive prophet, the Pannion Seer.', 52, 1),
(4, 'Smimgo Y2k Fashion, Aesthetic, V-Neck Jumper', 'Long sleeves, V-neck sweater, cardigan.\r\nBlend of chemical fibres.', 30, 4);

-- --------------------------------------------------------

--
-- Table structure for table `set`
--

CREATE TABLE `set` (
  `set_id` int(10) NOT NULL,
  `set_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `set`
--

INSERT INTO `set` (`set_id`, `set_name`) VALUES
(1, 'books'),
(2, 'tools'),
(3, 'home'),
(4, 'clothes');

-- --------------------------------------------------------

--
-- Table structure for table `shiping`
--

CREATE TABLE `shiping` (
  `shipping_id` int(10) NOT NULL,
  `from_location` varchar(100) NOT NULL,
  `to_location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shiping`
--

INSERT INTO `shiping` (`shipping_id`, `from_location`, `to_location`) VALUES
(1, 'Vienna', 'Vienna'),
(2, 'Linz', 'Vienna'),
(3, 'Vienna', 'Graz'),
(4, 'Tirol', 'Salzburg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(10) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `fk_bank_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_date`, `fk_bank_id`) VALUES
(1, '2022-03-01', 7),
(2, '2022-02-08', 10),
(3, '2022-03-06', 8),
(4, '2022-02-27', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_bank_id` (`fk_bank_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_transaction_id` (`fk_transaction_id`);

--
-- Indexes for table `famazon`
--
ALTER TABLE `famazon`
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_company_id` (`fk_company_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_shipping_id` (`fk_shipping_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_type_id` (`fk_type_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_set_id` (`fk_set_id`);

--
-- Indexes for table `set`
--
ALTER TABLE `set`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `shiping`
--
ALTER TABLE `shiping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_bank_id` (`fk_bank_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ordering`
--
ALTER TABLE `ordering`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `set`
--
ALTER TABLE `set`
  MODIFY `set_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shiping`
--
ALTER TABLE `shiping`
  MODIFY `shipping_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`fk_bank_id`) REFERENCES `bank` (`bank_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `ordering` (`order_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_transaction_id`) REFERENCES `transaction` (`transaction_id`);

--
-- Constraints for table `famazon`
--
ALTER TABLE `famazon`
  ADD CONSTRAINT `famazon_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `famazon_ibfk_2` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `famazon_ibfk_3` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `ordering`
--
ALTER TABLE `ordering`
  ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`fk_shipping_id`) REFERENCES `shiping` (`shipping_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_type_id`) REFERENCES `payment_type` (`type_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_set_id`) REFERENCES `set` (`set_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`fk_bank_id`) REFERENCES `bank` (`bank_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
