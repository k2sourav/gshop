-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2016 at 07:24 PM
-- Server version: 5.5.46
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gshop_schema`
--
CREATE DATABASE IF NOT EXISTS `gshop_schema` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gshop_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

DROP TABLE IF EXISTS `admin_details`;
CREATE TABLE IF NOT EXISTS `admin_details` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `email_id` varchar(64) NOT NULL,
  `primary_phone_number` varchar(13) NOT NULL,
  `secondary_phone_number` varchar(13) DEFAULT NULL,
  `company_name` varchar(64) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `store_id` varchar(10) DEFAULT NULL,
  `product_line` varchar(64) DEFAULT NULL,
  `role` varchar(10) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `image_thumbnail_url` varchar(256) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  `valid_through` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `device_type` varchar(264) DEFAULT NULL,
  `device_id` varchar(64) DEFAULT NULL,
  `gcm_id` varchar(64) DEFAULT NULL,
  `api_key` varchar(264) DEFAULT NULL,
  `OTP` varchar(10) DEFAULT NULL,
  `OTP_timestamp` datetime DEFAULT NULL,
  `OTP_confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `username`, `password`, `firstname`, `lastname`, `email_id`, `primary_phone_number`, `secondary_phone_number`, `company_name`, `city`, `store_id`, `product_line`, `role`, `is_enable`, `image_url`, `image_thumbnail_url`, `created_on`, `created_by`, `updated_on`, `updated_by`, `valid_through`, `device_type`, `device_id`, `gcm_id`, `api_key`, `OTP`, `OTP_timestamp`, `OTP_confirmed`) VALUES
(1, 'admin', '$2a$10$wZ8w8xl0RRdBt2DO9zttHOhHDdsKru7SIjZk.gAYk9VqVXfOYpM0W', 'Main', 'Administrator', 'admin@admin', '0000000000', '9999999999', NULL, 'all', NULL, NULL, 'admin', 1, NULL, NULL, '2016-07-07 14:16:21', 'admin', '2016-07-07 14:16:21', 'admin', '2026-07-07 14:16:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(64) NOT NULL,
  `attribute_type` varchar(64) DEFAULT NULL,
  `sort_order` int(10) unsigned DEFAULT NULL,
  `attribute_header` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `uk_attribute_name` (`attribute_name`),
  KEY `idx_attribute` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `attribute_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_value` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_value_id`),
  UNIQUE KEY `atrtibute_id_product` (`attribute_id`,`product_id`),
  KEY `idx_attribute_value_product` (`product_id`),
  KEY `idx_attribute_value_attribute` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_quantity` int(10) unsigned NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `uk_cart` (`user_id`,`product_id`),
  KEY `idx_cart_prod` (`product_id`),
  KEY `idx_cart_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `favourite_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`favourite_id`),
  UNIQUE KEY `uk_favourites` (`user_id`,`product_id`),
  KEY `idx_fav_prod` (`product_id`),
  KEY `idx_fav_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `market_news`
--

DROP TABLE IF EXISTS `market_news`;
CREATE TABLE IF NOT EXISTS `market_news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_category` varchar(64) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `headline` varchar(256) DEFAULT NULL,
  `details` varchar(2560) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `order_size` int(10) unsigned DEFAULT NULL,
  `order_price` decimal(10,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_order_address` (`address_id`),
  KEY `idx_fav_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_quantity` float NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `idx_od_prod` (`product_id`),
  KEY `idx_od_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `subcategory_id` int(10) unsigned NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `uk_product_name` (`product_name`,`category_id`,`subcategory_id`),
  KEY `idx_product_subcategory` (`subcategory_id`),
  KEY `idx_product_category` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category_id`, `subcategory_id`, `description`, `is_hot`, `is_new`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 'Kingfisher', 1, 2, 'UK Flies', 0, 0, '2016-07-18 18:29:23', 'admin', '2016-07-18 18:29:23', 'admin'),
(2, 'Pincon', 1, 2, 'Values', 0, 0, '2016-07-18 18:29:45', 'admin', '2016-07-18 18:29:45', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `image_thumbnail_url` varchar(256) DEFAULT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  UNIQUE KEY `uk_category_name` (`category_name`,`admin_id`),
  KEY `idx_category` (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `description`, `image_url`, `image_thumbnail_url`, `admin_id`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 'Daaru', 'Breverage', NULL, NULL, 1, '2016-07-18 17:51:13', 'admin', '2016-07-18 17:51:13', 'admin'),
(2, 'Sarbat', 'new item', NULL, NULL, 1, '2016-07-18 17:51:47', 'admin', '2016-07-18 17:51:47', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_url` varchar(256) DEFAULT NULL,
  `image_thumbnail_url` varchar(266) DEFAULT NULL,
  `caption` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `uk_image_url` (`image_url`),
  KEY `idx_prod_images` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

DROP TABLE IF EXISTS `product_stock`;
CREATE TABLE IF NOT EXISTS `product_stock` (
  `stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `stock_name` varchar(64) NOT NULL,
  `stock_description` varchar(256) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'AVAILABLE',
  `quantity` float DEFAULT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL,
  `quantity_unit` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `idx_prod_stock` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_subcategory`
--

DROP TABLE IF EXISTS `product_subcategory`;
CREATE TABLE IF NOT EXISTS `product_subcategory` (
  `subcategory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(64) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `image_thumbnail_url` varchar(256) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  UNIQUE KEY `uk_subcategory_name` (`subcategory_name`,`category_id`),
  KEY `idx_subcategory` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product_subcategory`
--

INSERT INTO `product_subcategory` (`subcategory_id`, `subcategory_name`, `category_id`, `description`, `image_url`, `image_thumbnail_url`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 'Vodka', 1, 'Added by admin', NULL, NULL, '2016-07-18 18:24:57', 'admin', '2016-07-18 18:24:57', 'admin'),
(2, 'Beer', 1, 'Added by admin', NULL, NULL, '2016-07-18 18:25:06', 'admin', '2016-07-18 18:25:06', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_log`
--

DROP TABLE IF EXISTS `user_activity_log`;
CREATE TABLE IF NOT EXISTS `user_activity_log` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(64) NOT NULL,
  `event_type` varchar(24) NOT NULL,
  `activity_comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `idx_ual_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
CREATE TABLE IF NOT EXISTS `user_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `pin` int(6) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `idx_user_address` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `email_id` varchar(64) NOT NULL,
  `primary_phone_number` varchar(13) NOT NULL,
  `secondary_phone_number` varchar(13) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `image_thumbnail_url` varchar(256) DEFAULT NULL,
  `company_name` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL DEFAULT '1',
  `device_type` varchar(256) DEFAULT NULL,
  `device_id` varchar(256) DEFAULT NULL,
  `api_key` varchar(256) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(64) DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  `OTP` varchar(10) DEFAULT NULL,
  `OTP_timestamp` datetime DEFAULT NULL,
  `OTP_confirmed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `idx_user_admin` (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `admin_id`, `username`, `password`, `firstname`, `lastname`, `email_id`, `primary_phone_number`, `secondary_phone_number`, `image_url`, `image_thumbnail_url`, `company_name`, `city`, `is_enable`, `device_type`, `device_id`, `api_key`, `created_on`, `created_by`, `updated_on`, `updated_by`, `OTP`, `OTP_timestamp`, `OTP_confirmed`) VALUES
(1, 1, 'ramesh@gmail.com', 'abcd', 'as', 'bs', 'ramesh@gmail.com', '9000', NULL, NULL, NULL, NULL, NULL, 1, 'Android', 'Android123', NULL, '2016-07-18 18:42:15', 'SELF', '2016-07-18 18:42:15', 'SELF', NULL, NULL, NULL),
(2, 1, 'abcd', 'abcd', 'as', 'bs', 'abcd', '9000', NULL, NULL, NULL, NULL, NULL, 1, 'Android', 'Android123', NULL, '2016-08-30 18:46:27', 'SELF', '2016-08-30 18:46:27', 'SELF', NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `fk_attribute_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin_details` (`admin_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD CONSTRAINT `fk_attribute_value_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attribute_value_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_user_details_cart` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_cart` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `fk_user_details_favorites` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_favorites` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_user_details_order` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_address_order` FOREIGN KEY (`address_id`) REFERENCES `user_address` (`address_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_details_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_subcategory` FOREIGN KEY (`subcategory_id`) REFERENCES `product_subcategory` (`subcategory_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_category_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin_details` (`admin_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_prod_images_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD CONSTRAINT `fk_prod_stock_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_subcategory`
--
ALTER TABLE `product_subcategory`
  ADD CONSTRAINT `fk_category_subcategory` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD CONSTRAINT `fk_user_details_activity` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_user_address` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `fk_user_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin_details` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
