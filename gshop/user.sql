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


