
DROP TABLE IF EXISTS `product_images`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `sub_category`;
DROP TABLE IF EXISTS `category`;


CREATE TABLE IF NOT EXISTS `category` (
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


CREATE TABLE IF NOT EXISTS `sub_category` (
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

