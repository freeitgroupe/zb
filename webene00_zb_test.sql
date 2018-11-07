-- phpMyAdmin SQL Dump
-- version 2.8.0.1
-- http://www.phpmyadmin.net
-- 
-- Хост: custsql-ipg105.eigbox.net
-- Время создания: Апр 22 2018 г., 12:49
-- Версия сервера: 5.6.37
-- Версия PHP: 4.4.9
-- 
-- БД: `webene00_zb_test`
-- 

-- --------------------------------------------------------

-- 
-- Структура таблицы `additional_attribute`
-- 

CREATE TABLE `additional_attribute` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- 
-- Дамп данных таблицы `additional_attribute`
-- 

INSERT INTO `additional_attribute` VALUES (1, 'Text', 'text');
INSERT INTO `additional_attribute` VALUES (2, 'Textarea', 'textarea');
INSERT INTO `additional_attribute` VALUES (3, 'Number', 'number');
INSERT INTO `additional_attribute` VALUES (4, 'Radio', 'radio');
INSERT INTO `additional_attribute` VALUES (5, 'Checkbox', 'checkbox');
INSERT INTO `additional_attribute` VALUES (6, 'Link', 'link');

-- --------------------------------------------------------

-- 
-- Структура таблицы `additions_products`
-- 

CREATE TABLE `additions_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `related_additions_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Дамп данных таблицы `additions_products`
-- 

INSERT INTO `additions_products` VALUES (1, 13, 12);
INSERT INTO `additions_products` VALUES (2, 13, 11);

-- --------------------------------------------------------

-- 
-- Структура таблицы `attribute_product`
-- 

CREATE TABLE `attribute_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Дамп данных таблицы `attribute_product`
-- 


-- --------------------------------------------------------

-- 
-- Структура таблицы `attribute_value`
-- 

CREATE TABLE `attribute_value` (
  `attribute_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Дамп данных таблицы `attribute_value`
-- 


-- --------------------------------------------------------

-- 
-- Структура таблицы `availability_products`
-- 

CREATE TABLE `availability_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

-- 
-- Дамп данных таблицы `availability_products`
-- 

INSERT INTO `availability_products` VALUES (1, 'published', 'published');
INSERT INTO `availability_products` VALUES (2, 'archive', 'archive');
INSERT INTO `availability_products` VALUES (3, 'coming soon', 'coming_soon');
INSERT INTO `availability_products` VALUES (4, 'sold out', 'sold_out');
INSERT INTO `availability_products` VALUES (5, 'Do not display', 'do_not_display');

-- --------------------------------------------------------

-- 
-- Структура таблицы `bonuses`
-- 

CREATE TABLE `bonuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `action` tinyint(2) NOT NULL DEFAULT '0',
  `sum` int(10) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Дамп данных таблицы `bonuses`
-- 

INSERT INTO `bonuses` VALUES (1, 'E-burpy', '2017-07-07 00:00:00', '2018-06-07 00:00:00', 1, 100);

-- --------------------------------------------------------

-- 
-- Структура таблицы `cart`
-- 

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id_product` int(11) NOT NULL,
  `cart_id_supplier` int(11) DEFAULT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  `cart_warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 AUTO_INCREMENT=158 ;

-- 
-- Дамп данных таблицы `cart`
-- 

INSERT INTO `cart` VALUES (97, 2, 0, 251, 1, 0, '2017-07-21 22:49:01', '188.163.86.171', NULL);
INSERT INTO `cart` VALUES (108, 15, NULL, 250, 1, 0, '2017-11-08 02:11:28', '193.111.156.141', NULL);
INSERT INTO `cart` VALUES (109, 10, NULL, 250, 1, 0, '2017-11-08 11:56:54', '46.160.71.23', NULL);
INSERT INTO `cart` VALUES (110, 17, NULL, 250, 1, 0, '2017-11-08 11:57:37', '46.160.71.23', NULL);
INSERT INTO `cart` VALUES (111, 58, NULL, 56, 4, 0, '2017-12-11 02:11:48', '127.0.0.1', NULL);
INSERT INTO `cart` VALUES (112, 61, NULL, 444444, 1, 0, '2017-12-11 02:35:42', '127.0.0.1', NULL);
INSERT INTO `cart` VALUES (115, 58, NULL, 56, 1, 0, '2018-01-06 12:43:40', '188.163.86.188', NULL);
INSERT INTO `cart` VALUES (124, 15, NULL, 250, 90, 0, '2018-01-22 15:35:21', '188.163.86.188', NULL);
INSERT INTO `cart` VALUES (127, 62, NULL, 28, 1, 0, '2018-01-27 06:47:12', '188.163.86.188', NULL);
INSERT INTO `cart` VALUES (129, 82, NULL, 40, 1, 0, '2018-01-28 02:52:53', '188.163.87.216', NULL);
INSERT INTO `cart` VALUES (130, 89, NULL, 9, 1, 0, '2018-01-28 08:35:11', '188.163.87.216', NULL);
INSERT INTO `cart` VALUES (135, 66, NULL, 38, 1, 0, '2018-02-22 13:33:03', '192.99.66.39', NULL);
INSERT INTO `cart` VALUES (136, 71, NULL, 22, 1, 0, '2018-02-22 13:33:50', '192.99.66.39', NULL);
INSERT INTO `cart` VALUES (145, 163, NULL, 15, 1, 0, '2018-03-05 15:16:34', '188.163.84.243', NULL);
INSERT INTO `cart` VALUES (146, 158, NULL, 43, 1, 0, '2018-03-25 09:22:30', '95.153.131.44', NULL);
INSERT INTO `cart` VALUES (148, 178, NULL, 56, 1, 0, '2018-04-01 14:03:44', '91.217.101.202', NULL);
INSERT INTO `cart` VALUES (149, 178, NULL, 56, 4, 0, '2018-04-03 08:30:03', '193.111.156.142', NULL);
INSERT INTO `cart` VALUES (150, 177, NULL, 43, 2, 0, '2018-04-20 08:42:18', '193.111.156.142', NULL);
INSERT INTO `cart` VALUES (151, 84, NULL, 27, 1, 0, '2018-04-03 14:24:06', '91.217.101.202', NULL);
INSERT INTO `cart` VALUES (153, 97, NULL, 4, 1, 0, '2018-04-06 05:41:41', '193.111.156.142', NULL);
INSERT INTO `cart` VALUES (157, 196, 3, 4, 4, 0, '2018-04-16 16:33:31', '188.163.57.232', NULL);

-- --------------------------------------------------------

-- 
-- Структура таблицы `category`
-- 

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'nophoto.jpg',
  `description` varchar(255) NOT NULL,
  `m_description` varchar(255) NOT NULL DEFAULT 'm_description_text',
  `m_keywords` varchar(255) NOT NULL,
  `additional_attribute_category` text,
  `view` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- 
-- Дамп данных таблицы `category`
-- 

INSERT INTO `category` VALUES (1, 0, 'PAPER PRODUCT', 'category_al_1', '011218_URyMwsirj.jpg', 'Toilet tissue, paper towels, facial tissue e.t.c.', 'paper product', 'paper towels, toilet tissue', '[{"additionaltext_label":"xcxcx","id_val":"","position_val":"","type_val":"text","description_val":"","init_id":1511229936},{"additionaltext_label":"sdsd","id_val":"fderfdf","position_val":"10","type_val":"number","description_val":"","init_id":1511262680},{"additionaltext_label":"kjkj","id_val":"ghghghg","position_val":"54","type_val":"radio","description_val":"","init_id":1511262695},{"additionaltext_label":"kjkj","id_val":"jjjh","position_val":"uy","type_val":"link","description_val":"","init_id":1511262707},{"additionaltext_label":"xcxcx","id_val":"cvcv","position_val":"vcvcv","type_val":"textarea","description_val":"dfdfdfdf","init_id":1516821847}]', '1');
INSERT INTO `category` VALUES (2, 0, 'GLOVES', 'category_2', '110717_JlpsQI24y.jpg', '\r\nANY KIND OF GLOVES FOR YOU NEEDS', 'gloves', 'Gloves, nitrile gloves, latex gloves', NULL, '1');
INSERT INTO `category` VALUES (3, 0, 'PACKAGING', 'category_3', '011218_V2H9U3GTI.jpg', '\r\nProduct for your mailroom needs; boxes, envelopes, bubbles, e.t.c.', 'm_description_text', 'BOXES, PACKAGING', NULL, '1');
INSERT INTO `category` VALUES (4, 0, 'BREAK  ROOM', 'category_4', '011218_2yFraezYN.jpg', 'All your break room or kitchenette needs; plates, cups cutlery.', 'm_description_text', '', NULL, '1');
INSERT INTO `category` VALUES (5, 0, 'LINERS', 'category_5', '011218_DHRyqHLai.jpg', 'We have a big variety of can liners; low density, high density, biodegradable and more.', 'm_description_text', 'can liners', NULL, '1');
INSERT INTO `category` VALUES (6, 0, 'SKIN CARE', 'category_6', '110717_1strbgmUz.jpg', 'THIS CATEGORY FOR SOAP AND HAND SANITIZERS. BIG VARIETY OF   SOAP, FOAM SOAP WITH MOISTURIZERS, ANTIBACTERIAL, ANTIMICROBIAL, AND REGULAR ONES WITH FRAGRANCE OR FRAGRANCE-FREE.', 'SKIN CARE PRODUCT', 'SOAP, SANITIZERS', NULL, '1');
INSERT INTO `category` VALUES (7, 0, 'CLEANING TOOLS', 'category_7', '011218_4RaRjTEJD.jpg', 'Righ tools for the job.', 'm_description_text', 'Cleaning tools, mops, bucket, brushes', NULL, '1');
INSERT INTO `category` VALUES (8, 0, 'CHEMICALS', 'category_8', '011218_RHwjRNbuY.jpg', 'Cleaning solution to make you job easy', 'Cleaning solution', '', NULL, '1');
INSERT INTO `category` VALUES (26, 8, 'Odor control', 'odor-control', '012218_5Zn9aVBId.jpg', 'Air fresheners, odor bacteria eliminators, everything you need to keep your troubled areas fresh.', 'Air freshener, odor control, deodoriser', 'AIR FRESHENER, ODOR CONTROL, DEODORISER', NULL, '1');
INSERT INTO `category` VALUES (28, 6, 'DISPENSERS', 'dispensers', '012818_9LjejM6ar.jpg', 'dispensers for soap, foam soap, manual and touch-free.', '', 'sOAP dISPENSERS', NULL, '1');
INSERT INTO `category` VALUES (29, 7, 'Vacuum / Vacuum parts', 'vacuum-vacuum-parts', '022818_BUpIVGltN.jpg', 'Commercial vacuums and parts.', 'VACUUM AND PARTS', 'VACUUM', NULL, '1');

-- --------------------------------------------------------

-- 
-- Структура таблицы `comments`
-- 

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `author_email` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_product_id` int(11) NOT NULL,
  `comment_good` text NOT NULL,
  `comment_bad` text NOT NULL,
  `approved` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '''0''-ожидают проверки,"1" - Опубликованные,"2"-Спам,"3"-Удаленные',
  `count_like` int(10) unsigned NOT NULL,
  `count_dislike` int(10) unsigned NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- 
-- Дамп данных таблицы `comments`
-- 

INSERT INTO `comments` VALUES (1, 0, 'Иван', 'test@gmail.com', 'ntrcn', 1, 'good', 'bad', '1', 2, 1, '2018-01-15 09:49:22', 0);
INSERT INTO `comments` VALUES (2, 1, 'sun', 'email', 'comment text', 1, 'good', 'bad', '1', 2, 1, '2017-12-11 16:27:08', 1);
INSERT INTO `comments` VALUES (3, 0, 'Иван', 'test@gmail.com', 'ntrcn', 1, 'good', 'bad', '1', 2, 0, '2017-12-11 16:10:31', 0);
INSERT INTO `comments` VALUES (4, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 2, 1, '2017-12-11 16:27:01', 0);
INSERT INTO `comments` VALUES (5, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 2, 0, '2017-12-11 16:11:17', 0);
INSERT INTO `comments` VALUES (6, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:19:32', 0);
INSERT INTO `comments` VALUES (7, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:19:36', 0);
INSERT INTO `comments` VALUES (8, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:19:39', 0);
INSERT INTO `comments` VALUES (9, 6, 'Roman', 'sdsdsdsdsd@sddsd.com', 'Комментарий', 1, '', '', '1', 0, 0, '2017-07-21 10:19:42', 0);
INSERT INTO `comments` VALUES (10, 6, 'Roman', 'sdsdsdsdsd@sddsd.com', 'Комментарий', 1, '', '', '1', 0, 0, '2017-07-21 10:23:57', 0);
INSERT INTO `comments` VALUES (11, 1, 'asasasasa', 'sasasasasas@asas.com', 'asasasdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:19:47', 0);
INSERT INTO `comments` VALUES (12, 1, 'sdsdsdsdsdsds', 'sdsdsdsds@sadsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:19:51', 0);
INSERT INTO `comments` VALUES (13, 1, 'sdsdsdsdsdsdsd', 'dssdsdd@sdsd.com', 'sdsdssdsdsdsdsdsd', 1, 'sdsds', 'dsd', '1', 0, 0, '2017-07-21 10:24:01', 0);
INSERT INTO `comments` VALUES (14, 13, 'dsdsdsd', 'sdsdsd@dsdsd.com', 'sdsdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:24:04', 0);
INSERT INTO `comments` VALUES (15, 12, 'sdsd', 'sdsdsdsd@sds.com', 'sdsdsdsdsddsdsdsd', 1, 'sdsds', 'dsdsdsd', '1', 0, 0, '2017-07-21 10:20:09', 0);
INSERT INTO `comments` VALUES (16, 1, 'asasasas', 'asas@sdsd.coms', 'dsdsdsdsdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 10:24:07', 0);
INSERT INTO `comments` VALUES (17, 1, 'sdsdsdsd', 'sdsds@sdsd.com', 'dsdsdsdsdvbvbvb', 1, '', '', '1', 0, 0, '2017-07-21 10:20:07', 0);
INSERT INTO `comments` VALUES (18, 1, 'wewewewewe', 'wewewe@dfdfd.com', 'wewewewewewewewewe', 1, '', '', '1', 0, 0, '2017-07-21 10:24:11', 0);
INSERT INTO `comments` VALUES (19, 1, 'wwewewewewe', 'wewewe@dfdfd.com', 'weweweweasasasas', 1, '', '', '1', 1, 1, '2017-12-11 16:25:09', 0);
INSERT INTO `comments` VALUES (20, 2, 'sdsdsdsds', 'wewewe@dfdfd.com', 'sdsdsdsdsddsdsdsd', 1, '', 'sdsd', '1', 0, 0, '2017-07-21 10:24:14', 0);
INSERT INTO `comments` VALUES (21, 0, 'fgfgfgfgfg', 'gfgfgfg@fmfmf.com', 'fgfgfdfdfdfdfdfdfdf', 1, '', '', '1', 1, 1, '2017-12-11 16:13:00', 0);
INSERT INTO `comments` VALUES (22, 0, 'sdsdsdsd', 'sdsdsd@dsdsd.com', 'sdsdsdsdsdsdsdsdsd', 3, 'dsdsdsdsds', 'dsdsdsd', '1', 0, 0, '2017-07-21 10:24:18', 0);
INSERT INTO `comments` VALUES (23, 22, 'assaasasasa', 'asasasasas@sdsdsd.com', 'asasasassdsdsd', 3, 'sasasas', 'asasas', '1', 0, 0, '2017-07-21 10:24:21', 0);
INSERT INTO `comments` VALUES (24, 23, 'xzxzxzxzx', 'sdsds@sdsds.com', 'dsdsdxzxzxzxzx', 3, 'sdsdsdsdsd', 'sdsdsdsdsd', '1', 0, 0, '2017-07-21 10:24:24', 0);
INSERT INTO `comments` VALUES (25, 0, 'asasasas', 'wewewe@dfdfd.com', 'asasasasasasasasasas', 3, 'asasasa', 'sasasasas', '1', 0, 0, '2017-07-21 10:19:56', 0);
INSERT INTO `comments` VALUES (26, 3, 'вмвммвмвмв', 'admin@gmail.com', 'вмвмвмв', 1, 'good products. thanks', 'no bad', '0', 0, 0, '2017-12-11 13:38:33', 0);
INSERT INTO `comments` VALUES (27, 3, 'my test name', 'admin@gmail.com', 'thank you for website', 1, 'very good products', 'no bad', '0', 0, 0, '2017-12-11 13:41:52', 0);
INSERT INTO `comments` VALUES (28, 2, 'cvcvcvcv', 'email@gmail.com', 'vcvcvcvcvdfdfdf', 1, 'cvcv', 'cvc', '0', 0, 0, '2017-12-11 13:54:56', 0);
INSERT INTO `comments` VALUES (29, 1, 'xcxcxcxc', 'email@gmail.com', 'xcxcxcxcxc', 1, 'xc', 'cxc', '0', 0, 0, '2017-12-11 14:21:34', 0);
INSERT INTO `comments` VALUES (30, 0, 'gngn', 'test@gmail.com', 'gngngngngngngngngn', 97, '', '', '0', 0, 0, '2018-04-04 08:57:02', 0);

-- --------------------------------------------------------

-- 
-- Структура таблицы `comments_votes`
-- 

CREATE TABLE `comments_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `comments_id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- 
-- Дамп данных таблицы `comments_votes`
-- 

INSERT INTO `comments_votes` VALUES (16, '127.0.0.1', 'WIN-QJF2VCB52DD', 4, '2017-12-12');
INSERT INTO `comments_votes` VALUES (17, '127.0.0.1', 'WIN-QJF2VCB52DD', 2, '2017-12-12');
INSERT INTO `comments_votes` VALUES (18, '127.0.0.1', 'agro', 1, '2018-01-15');

-- --------------------------------------------------------

-- 
-- Структура таблицы `delivery`
-- 

CREATE TABLE `delivery` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `position` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Дамп данных таблицы `delivery`
-- 

INSERT INTO `delivery` VALUES (1, 'Courier delivery', 'couriers', 1);
INSERT INTO `delivery` VALUES (2, 'Personally appear for goods', 'self_delivery', 2);
INSERT INTO `delivery` VALUES (3, 'Delivery by post', 'per_post', 3);

-- --------------------------------------------------------

-- 
-- Структура таблицы `fealtures`
-- 

CREATE TABLE `fealtures` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `fealtures` tinyint(3) unsigned NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Дамп данных таблицы `fealtures`
-- 


-- --------------------------------------------------------

-- 
-- Структура таблицы `menu_admin`
-- 

CREATE TABLE `menu_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `position` int(3) NOT NULL,
  `parent` int(10) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `view` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- Дамп данных таблицы `menu_admin`
-- 

INSERT INTO `menu_admin` VALUES (1, 'Home', 'home', 'empty', 'empty', 1, 0, 'home', '1');
INSERT INTO `menu_admin` VALUES (2, 'Products', 'product-options', 'home', 'home home', 2, 0, 'home', '1');
INSERT INTO `menu_admin` VALUES (3, 'Category', 'category-product-options', 'category-product-options', 'category-product-options', 2, 3, '', '1');
INSERT INTO `menu_admin` VALUES (4, 'Category Add', 'edit-category-product/new', 'edit-category-product', 'edit-category-product', 4, 0, 'content_paste', '0');
INSERT INTO `menu_admin` VALUES (5, 'Product Add', 'add-product/new', 'description', 'keywords', 5, 3, 'queue', '0');
INSERT INTO `menu_admin` VALUES (6, 'Warehouse', 'warehouse', '', '', 5, 0, 'compare', '1');
INSERT INTO `menu_admin` VALUES (7, 'Warehouse Add', 'edit-warehouse/new', '', '', 6, 0, 'queue', '0');
INSERT INTO `menu_admin` VALUES (8, 'Upsell', 'upsell', 'upsell options', 'upsell options', 5, 3, 'local_mall', '1');
INSERT INTO `menu_admin` VALUES (9, 'Stock', 'stock', 'Stock options', 'Stock options', 6, 3, 'local_play', '1');
INSERT INTO `menu_admin` VALUES (10, 'Orders', 'orders-options', 'orders options', 'orders options', 8, 0, 'local_play', '1');
INSERT INTO `menu_admin` VALUES (11, 'Comments', 'comments', 'comments options', 'comments options', 7, 0, 'local_play', '0');
INSERT INTO `menu_admin` VALUES (12, 'Users', 'users', 'users options', 'users options', 7, 0, 'insert_emoticon', '1');
INSERT INTO `menu_admin` VALUES (13, 'Team', 'team', 'team options', 'team options', 6, 0, 'insert_emoticon', '1');
INSERT INTO `menu_admin` VALUES (14, 'Pages', 'static-pages', 'Pages options', 'Pages options', 9, 0, 'library_books', '1');
INSERT INTO `menu_admin` VALUES (15, 'Settings', 'settings', 'Settings options', 'Settings options', 10, 0, 'settings', '1');
INSERT INTO `menu_admin` VALUES (16, 'CSV import', 'product-import', 'CSV import', 'CSV import', 11, 3, 'play_for_work', '1');
INSERT INTO `menu_admin` VALUES (17, 'Product fields', 'category-fields', 'Product fields', 'Product fields', 12, 3, 'settings_applications', '1');
INSERT INTO `menu_admin` VALUES (18, 'Suppliers', 'suppliers', 'suppliers', 'suppliers', 13, 0, 'suppliers', '1');

-- --------------------------------------------------------

-- 
-- Структура таблицы `menu_office`
-- 

CREATE TABLE `menu_office` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `position` int(3) NOT NULL,
  `parent` int(10) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Дамп данных таблицы `menu_office`
-- 

INSERT INTO `menu_office` VALUES (1, 'Main', '/profile', 'profile menu', 'profile menu', 1, 0, 'fa fa-user');
INSERT INTO `menu_office` VALUES (2, 'Finance', '#', 'finance desc', 'Ключевые фразы', 2, 0, 'fa fa-user');
INSERT INTO `menu_office` VALUES (3, 'Orders', '/orders', 'orders', 'Корзин пользователя - описание', 3, 0, 'fa fa-user');
INSERT INTO `menu_office` VALUES (4, 'Wish list', '/wish-list', 'wish list user', 'ключевые слова', 4, 0, 'fa fa-user');

-- --------------------------------------------------------

-- 
-- Структура таблицы `models_product`
-- 

CREATE TABLE `models_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `old_price` float NOT NULL,
  `new_price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Дамп данных таблицы `models_product`
-- 


-- --------------------------------------------------------

-- 
-- Структура таблицы `order`
-- 

CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int(8) NOT NULL,
  `sum` float NOT NULL,
  `status` tinyint(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `delivery` tinyint(2) NOT NULL,
  `type_pay` tinyint(2) NOT NULL,
  `pay` tinyint(2) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- 
-- Дамп данных таблицы `order`
-- 

INSERT INTO `order` VALUES (1, '2017-07-06 00:00:00', '2017-07-06 00:00:00', 10, 8555, 0, 'имя клиента', 'email', 'phone', 'address', 1, 1, 0, 'note');
INSERT INTO `order` VALUES (2, '2017-07-06 18:15:25', '2017-07-06 18:15:25', 10, 8555, 0, 'имя клиента', 'email', 'phone', 'address', 1, 1, 0, '');
INSERT INTO `order` VALUES (3, '2017-07-06 18:28:40', '2017-07-06 18:28:40', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (4, '2017-07-06 18:30:10', '2017-07-06 18:30:10', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (5, '2017-07-06 18:31:27', '2017-07-06 18:31:27', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (6, '2017-07-06 19:01:47', '2017-07-06 19:01:47', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (7, '2017-07-06 19:03:17', '2017-07-06 19:03:17', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (8, '2017-07-06 19:04:20', '2017-07-06 19:04:20', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (9, '2017-07-06 19:06:47', '2017-07-06 19:06:47', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (10, '2017-07-06 19:08:08', '2017-07-06 19:08:08', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (11, '2017-07-06 19:08:36', '2017-07-06 19:08:36', 12, 3024, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (12, '2017-07-06 19:09:42', '2017-07-06 19:09:42', 12, 3024, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (13, '2017-07-06 19:11:43', '2017-07-06 19:11:43', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (14, '2017-07-06 19:12:45', '2017-07-06 19:12:45', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (15, '2017-07-06 19:12:59', '2017-07-06 19:12:59', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (16, '2017-07-06 19:50:40', '2017-07-06 19:50:40', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf');
INSERT INTO `order` VALUES (17, '2017-07-06 19:52:35', '2017-07-06 19:52:35', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf');
INSERT INTO `order` VALUES (18, '2017-07-06 19:57:29', '2017-07-06 19:57:29', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf');
INSERT INTO `order` VALUES (19, '2017-07-06 20:00:38', '2017-07-06 20:00:38', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (20, '2017-07-06 20:00:44', '2017-07-06 20:00:44', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (21, '2017-07-06 20:18:25', '2017-07-06 20:18:25', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (22, '2017-07-06 20:18:47', '2017-07-06 20:18:47', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (23, '2017-07-06 20:19:19', '2017-07-06 20:19:19', 16, 4027, 0, 'Иванович', 'pudzia009@gmail.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, '');
INSERT INTO `order` VALUES (24, '2017-07-07 11:29:00', '2017-07-07 11:29:00', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (25, '2017-07-07 11:32:09', '2017-07-07 11:32:09', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (26, '2017-07-07 13:02:10', '2017-07-07 13:02:10', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (27, '2017-07-07 14:05:43', '2017-07-07 14:05:43', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (28, '2017-07-07 14:41:08', '2017-07-07 14:41:08', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (29, '2017-07-07 14:42:45', '2017-07-07 14:42:45', 1, 251, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (30, '2017-07-07 15:27:50', '2017-07-07 15:27:50', 1, 251, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (31, '2017-07-07 15:33:35', '2017-07-07 15:33:35', 2, 503, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (32, '2017-07-07 15:37:00', '2017-07-07 15:37:00', 1, 252, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, '');
INSERT INTO `order` VALUES (33, '2017-07-18 15:16:06', '2017-07-18 15:16:06', 1, 252, 0, 'admin', 'pudzia009@gmail.com', '+38(021) 212-12-12,+38(021) 212-12-12', 'долодлолдололо', 3, 1, 0, '');
INSERT INTO `order` VALUES (34, '2017-07-21 13:58:05', '2017-07-21 13:58:05', 1, 250, 0, 'sxsxs', 'freeitteam1000@gmail.com', '+38(222) 222-22-22,+38(222) 222-22-22', 'asasasasaasasasas', 3, 1, 0, 'sasasasasasasas');

-- --------------------------------------------------------

-- 
-- Структура таблицы `order_items`
-- 

CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(10) NOT NULL,
  `sum_item` float NOT NULL,
  `order_supplier` int(11) DEFAULT NULL,
  `article_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

-- 
-- Дамп данных таблицы `order_items`
-- 

INSERT INTO `order_items` VALUES (51, 28, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 13, 3276, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (52, 28, 1, '111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 250, 3, 750, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (53, 28, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 6, 1506, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (54, 28, 5, '45541LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 3500, 1, 3500, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (55, 29, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (56, 30, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (57, 31, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 1, 252, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (58, 31, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (59, 32, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 1, 252, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (60, 33, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 10, 2520, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (61, 34, 1, '111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 250, 1, 250, NULL, 'article-12d-test');
INSERT INTO `order_items` VALUES (62, 35, 10, 'product-test_10', 249.99, 20, 5000, NULL, '');
INSERT INTO `order_items` VALUES (63, 35, 1, 'Coffee stuff for Lovers_1', 233.99, 16, 3744, NULL, '');
INSERT INTO `order_items` VALUES (64, 35, 2, 'Coffee stuff for Lovers_2', 233.99, 12, 2808, NULL, '');
INSERT INTO `order_items` VALUES (65, 37, 10, 'product-test_10', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (66, 37, 11, 'product-test_11', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (67, 38, 1, 'Coffee stuff for Lovers_1', 233.99, 1, 234, NULL, '#54d874');
INSERT INTO `order_items` VALUES (68, 38, 2, 'Coffee stuff for Lovers_2', 233.99, 1, 234, NULL, '#54d874');
INSERT INTO `order_items` VALUES (69, 39, 11, 'product-test_11', 249.99, 4, 1000, NULL, 'article');
INSERT INTO `order_items` VALUES (70, 39, 2, 'Coffee stuff for Lovers_2', 233.99, 7, 1638, NULL, '#54d874');
INSERT INTO `order_items` VALUES (71, 39, 13, 'product-test_13_13', 249.99, 3, 750, NULL, '#21221');
INSERT INTO `order_items` VALUES (72, 39, 21, 'product-test_21', 249.99, 2, 500, NULL, 'article');
INSERT INTO `order_items` VALUES (73, 39, 16, 'product-test_16', 249.99, 10, 2500, NULL, 'article');
INSERT INTO `order_items` VALUES (74, 40, 20, 'product-test_20', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (75, 41, 20, 'product-test_20', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (76, 42, 24, 'product-test_24', 249.99, 10, 2499.9, NULL, 'article');
INSERT INTO `order_items` VALUES (77, 43, 24, 'product-test_24', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (78, 44, 20, 'product-test_20', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (79, 45, 21, 'product-test_21', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (80, 46, 24, 'product-test_24', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (81, 47, 23, 'product-test_23', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (84, 49, 32, 'product-test_32', 249.99, 10, 2499.9, NULL, 'article');
INSERT INTO `order_items` VALUES (86, 49, 34, 'product-test_34', 249.99, 4, 1000, NULL, 'article');
INSERT INTO `order_items` VALUES (87, 49, 35, 'product-test_35', 249.99, 10, 2499.9, NULL, 'article');
INSERT INTO `order_items` VALUES (88, 50, 24, 'product-test_24', 249.99, 50, 12499.5, NULL, 'article');
INSERT INTO `order_items` VALUES (89, 50, 2, 'Coffee stuff for Lovers_2', 233.99, 30, 7019.7, NULL, '#54d874');
INSERT INTO `order_items` VALUES (90, 50, 27, 'product-test_27', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (91, 50, 20, 'product-test_20', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (92, 50, 21, 'product-test_21', 249.99, 10, 2500, NULL, 'article');
INSERT INTO `order_items` VALUES (93, 50, 22, 'product-test_22', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (94, 50, 26, 'product-test_26', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (95, 51, 20, 'product-test_20', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (96, 51, 21, 'product-test_21', 249.99, 1, 250, NULL, 'article');
INSERT INTO `order_items` VALUES (97, 52, 58, 'ENMOTION ROLL TOWEL', 55.55, 1, 56, NULL, 'CZ89460');
INSERT INTO `order_items` VALUES (98, 53, 58, 'ENMOTION ROLL TOWEL', 55.55, 1, 55.55, NULL, 'CZ89460');
INSERT INTO `order_items` VALUES (99, 54, 196, 'REPLACEMENT BRUSH FOR EZ GLIDE TOOL (PT100147)', 3.5, 10, 40, 3, 'PT101155');

-- --------------------------------------------------------

-- 
-- Структура таблицы `order_items_paypal`
-- 

CREATE TABLE `order_items_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(5) NOT NULL,
  `gross_amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- Дамп данных таблицы `order_items_paypal`
-- 

INSERT INTO `order_items_paypal` VALUES (1, 2, '58', 1, 55.55);
INSERT INTO `order_items_paypal` VALUES (3, 3, '58', 1, 55.55);
INSERT INTO `order_items_paypal` VALUES (4, 4, '58', 1, 55.55);
INSERT INTO `order_items_paypal` VALUES (5, 4, '15', 1, 249.99);

-- --------------------------------------------------------

-- 
-- Структура таблицы `order_processing`
-- 

CREATE TABLE `order_processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  `auth_name` varchar(255) DEFAULT NULL,
  `auth_email` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

-- 
-- Дамп данных таблицы `order_processing`
-- 

INSERT INTO `order_processing` VALUES (3, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: created new qty:2', '2017-12-03 18:22:57');
INSERT INTO `order_processing` VALUES (9, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: created new qty:2', '2017-12-03 18:22:57');
INSERT INTO `order_processing` VALUES (12, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:19');
INSERT INTO `order_processing` VALUES (13, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:46');
INSERT INTO `order_processing` VALUES (14, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:56');
INSERT INTO `order_processing` VALUES (15, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:40:47');
INSERT INTO `order_processing` VALUES (16, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:40:56');
INSERT INTO `order_processing` VALUES (17, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status', '2017-12-03 21:41:58');
INSERT INTO `order_processing` VALUES (18, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status', '2017-12-03 21:44:01');
INSERT INTO `order_processing` VALUES (19, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status in2017-12-03 21:44:50', '2017-12-03 21:44:50');
INSERT INTO `order_processing` VALUES (23, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12to 12', '2017-12-03 22:33:51');
INSERT INTO `order_processing` VALUES (25, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12to 12', '2017-12-03 22:38:04');
INSERT INTO `order_processing` VALUES (26, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12 to 80', '2017-12-03 22:38:44');
INSERT INTO `order_processing` VALUES (27, 48, 71, 'Admin Admin', 'admin@gmail.com', 'ArrayArray update qty from 80 to 55', '2017-12-03 22:40:02');
INSERT INTO `order_processing` VALUES (28, 48, 71, 'Admin Admin', 'admin@gmail.com', 'ArrayArray update qty from 55 to 55', '2017-12-03 22:40:04');
INSERT INTO `order_processing` VALUES (29, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 55 to 55', '2017-12-03 22:40:30');
INSERT INTO `order_processing` VALUES (30, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 55 to 10', '2017-12-03 22:54:30');
INSERT INTO `order_processing` VALUES (31, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 10', '2017-12-03 22:56:45');
INSERT INTO `order_processing` VALUES (32, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 10', '2017-12-03 22:56:52');
INSERT INTO `order_processing` VALUES (33, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 8', '2017-12-03 23:00:46');
INSERT INTO `order_processing` VALUES (34, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 8 to 8', '2017-12-03 23:06:18');
INSERT INTO `order_processing` VALUES (35, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 8 to 8', '2017-12-03 23:08:10');
INSERT INTO `order_processing` VALUES (36, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 8 to 80 2017-12-03 23:11:49', '2017-12-03 23:11:49');
INSERT INTO `order_processing` VALUES (37, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 80 to 80 2017-12-03 23:12:57', '2017-12-03 23:12:57');
INSERT INTO `order_processing` VALUES (38, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 80 to 77 2017-12-03 23:13:04', '2017-12-03 23:13:04');
INSERT INTO `order_processing` VALUES (39, 48, 71, 'Admin Admin', 'admin@gmail.com', 'test test test', '2017-12-03 23:31:40');
INSERT INTO `order_processing` VALUES (40, 48, 71, 'Admin Admin', 'admin@gmail.com', 'testsds  (comment: Admin Admin in 2017-12-03 23:35:50)', '2017-12-03 23:35:50');
INSERT INTO `order_processing` VALUES (41, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 77 to 0 2017-12-03 23:36:02', '2017-12-03 23:36:02');
INSERT INTO `order_processing` VALUES (42, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 0 to 40 2017-12-03 23:36:12', '2017-12-03 23:36:12');
INSERT INTO `order_processing` VALUES (43, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from  to  2017-12-03 23:53:43', '2017-12-03 23:53:43');
INSERT INTO `order_processing` VALUES (44, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order has been sent to Order has been sent 2017-12-03 23:55:16', '2017-12-03 23:55:16');
INSERT INTO `order_processing` VALUES (45, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 40 to 40 2017-12-03 23:59:26', '2017-12-03 23:59:26');
INSERT INTO `order_processing` VALUES (46, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Delivered to Order is processed 2017-12-03 23:59:33', '2017-12-03 23:59:33');
INSERT INTO `order_processing` VALUES (47, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order is processed to Cancelled 2017-12-03 23:59:41', '2017-12-03 23:59:41');
INSERT INTO `order_processing` VALUES (48, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin product is removed (product-test_28) 2017-12-04 00:15:45', '2017-12-04 00:15:45');
INSERT INTO `order_processing` VALUES (49, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin product is removed (product-test_33) 2017-12-04 00:16:04', '2017-12-04 00:16:04');
INSERT INTO `order_processing` VALUES (50, 50, 71, 'Admin Admin', 'admin@gmail.com', 'gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:20)', '2017-12-05 10:43:20');
INSERT INTO `order_processing` VALUES (51, 50, 71, 'Admin Admin', 'admin@gmail.com', 'gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:33)', '2017-12-05 10:43:33');
INSERT INTO `order_processing` VALUES (52, 50, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 3 to 30 2017-12-05 10:43:42', '2017-12-05 10:43:42');
INSERT INTO `order_processing` VALUES (53, 50, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Cancelled to Order has been sent 2017-12-05 10:43:51', '2017-12-05 10:43:51');
INSERT INTO `order_processing` VALUES (54, 50, 71, 'Admin Admin', 'admin@gmail.com', 'dffdfdfdfdfdf (comment: Admin Admin in 2017-12-05 11:24:00)', '2017-12-05 11:24:00');
INSERT INTO `order_processing` VALUES (55, 50, 71, 'Admin Admin', 'admin@gmail.com', 'fdf fdssxsdsd (comment: Admin Admin in 2017-12-05 11:30:42)', '2017-12-05 11:30:42');
INSERT INTO `order_processing` VALUES (56, 33, 71, 'Admin Admin', 'admin@gmail.com', 'test_test (comment: Admin Admin in 2017-12-12 11:14:10)', '2017-12-12 11:14:10');
INSERT INTO `order_processing` VALUES (57, 33, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order is processed to Cancelled 2017-12-12 11:14:38', '2017-12-12 11:14:38');
INSERT INTO `order_processing` VALUES (58, 33, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 1 to 10 2017-12-12 11:16:47', '2017-12-12 11:16:47');
INSERT INTO `order_processing` VALUES (59, 52, 71, 'Admin Admin', 'admin@gmail.com', 'comment (comment: Admin Admin in 2017-12-12 11:18:07)', '2017-12-12 11:18:07');
INSERT INTO `order_processing` VALUES (60, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 1 to 10 2018-01-15 10:56:15', '2018-01-15 10:56:15');
INSERT INTO `order_processing` VALUES (61, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Unprocessed to Unprocessed 2018-01-17 03:12:37', '2018-01-17 03:12:37');
INSERT INTO `order_processing` VALUES (62, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 10 to 11 2018-01-17 06:37:14', '2018-01-17 06:37:14');
INSERT INTO `order_processing` VALUES (63, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 11 to 1 2018-01-17 06:37:25', '2018-01-17 06:37:25');
INSERT INTO `order_processing` VALUES (64, 53, 71, 'Admin Admin', 'admin@gmail.com', 'test comment\r\n (comment: Admin Admin in 2018-01-17 06:37:39)', '2018-01-17 06:37:39');

-- --------------------------------------------------------

-- 
-- Структура таблицы `order_status`
-- 

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `param_status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- 
-- Дамп данных таблицы `order_status`
-- 

INSERT INTO `order_status` VALUES (1, 'Order is processed', 'processed', 1);
INSERT INTO `order_status` VALUES (2, 'Order has been sent', 'sent', 2);
INSERT INTO `order_status` VALUES (3, 'Delivered', 'delivered', 3);
INSERT INTO `order_status` VALUES (4, 'Unprocessed', 'unprocessed', 0);
INSERT INTO `order_status` VALUES (5, 'Cancelled', 'cancelled', 4);

-- --------------------------------------------------------

-- 
-- Структура таблицы `orders`
-- 

CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int(8) NOT NULL,
  `sum` float NOT NULL,
  `status` tinyint(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `zipcode` int(7) DEFAULT NULL,
  `rate_sum` float DEFAULT NULL,
  `delivery` tinyint(2) NOT NULL,
  `type_pay` tinyint(2) NOT NULL,
  `pay` tinyint(2) NOT NULL,
  `note` text NOT NULL,
  `team_admin_users_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=55 ;

-- 
-- Дамп данных таблицы `orders`
-- 

INSERT INTO `orders` VALUES (1, '2017-07-06 00:00:00', '2017-07-06 00:00:00', 10, 8555, 1, 'имя клиента', 'email', 'phone', 'address', NULL, NULL, 1, 1, 0, 'note', 1, 0);
INSERT INTO `orders` VALUES (2, '2017-07-06 18:15:25', '2017-07-06 18:15:25', 10, 8555, 1, 'имя клиента', 'email', 'phone', 'address', NULL, NULL, 1, 1, 0, '', 1, 0);
INSERT INTO `orders` VALUES (3, '2017-07-06 18:28:40', '2017-07-06 18:28:40', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (4, '2017-07-06 18:30:10', '2017-07-06 18:30:10', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (5, '2017-07-06 18:31:27', '2017-07-06 18:31:27', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (6, '2017-07-06 19:01:47', '2017-07-06 19:01:47', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (7, '2017-07-06 19:03:17', '2017-07-06 19:03:17', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (8, '2017-07-06 19:04:20', '2017-07-06 19:04:20', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (9, '2017-07-06 19:06:47', '2017-07-06 19:06:47', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (10, '2017-07-06 19:08:08', '2017-07-06 19:08:08', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (11, '2017-07-06 19:08:36', '2017-07-06 19:08:36', 12, 3024, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (12, '2017-07-06 19:09:42', '2017-07-06 19:09:42', 12, 3024, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (13, '2017-07-06 19:11:43', '2017-07-06 19:11:43', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (14, '2017-07-06 19:12:45', '2017-07-06 19:12:45', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (15, '2017-07-06 19:12:59', '2017-07-06 19:12:59', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (16, '2017-07-06 19:50:40', '2017-07-06 19:50:40', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', NULL, NULL, 2, 1, 0, 'dfdfdfdf', 1, 0);
INSERT INTO `orders` VALUES (17, '2017-07-06 19:52:35', '2017-07-06 19:52:35', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', NULL, NULL, 2, 1, 0, 'dfdfdfdf', 1, 0);
INSERT INTO `orders` VALUES (18, '2017-07-06 19:57:29', '2017-07-06 19:57:29', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', NULL, NULL, 2, 1, 0, 'dfdfdfdf', 1, 0);
INSERT INTO `orders` VALUES (19, '2017-07-06 20:00:38', '2017-07-06 20:00:38', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (20, '2017-07-06 20:00:44', '2017-07-06 20:00:44', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (21, '2017-07-06 20:18:25', '2017-07-06 20:18:25', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (22, '2017-07-06 20:18:47', '2017-07-06 20:18:47', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (28, '2017-07-07 14:41:08', '2017-07-07 14:41:08', 23, 9032, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (29, '2017-07-07 14:42:45', '2017-07-07 14:42:45', 1, 251, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (30, '2017-07-07 15:27:50', '2017-07-07 15:27:50', 1, 251, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (31, '2017-07-07 15:33:35', '2017-07-07 15:33:35', 2, 503, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (32, '2017-07-07 15:37:00', '2017-12-02 13:05:04', 1, 252, 3, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', NULL, NULL, 2, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (33, '2017-07-18 15:16:06', '2017-07-18 15:16:06', 1, 252, 1, 'admin', 'pudzia009@gmail.com', '+38(021) 212-12-12,+38(021) 212-12-12', 'долодлолдололо', NULL, NULL, 3, 1, 0, '', 1, 0);
INSERT INTO `orders` VALUES (34, '2017-07-21 13:58:05', '2017-07-21 13:58:05', 1, 250, 1, 'sxsxs', 'freeitteam1000@gmail.com', '+38(222) 222-22-22,+38(222) 222-22-22', 'asasasasaasasasas', NULL, NULL, 3, 1, 0, 'sasasasasasasas', 1, 0);
INSERT INTO `orders` VALUES (35, '2017-10-19 15:55:39', '2017-10-19 15:55:39', 48, 11551.5, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', NULL, NULL, 3, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (36, '2017-10-20 03:42:55', '2017-10-20 03:42:55', 48, 11551.5, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', NULL, NULL, 3, 1, 0, '', 1, 0);
INSERT INTO `orders` VALUES (37, '2017-10-20 03:46:03', '2017-10-20 03:46:03', 2, 499.98, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', NULL, NULL, 3, 2, 0, '', 1, 0);
INSERT INTO `orders` VALUES (38, '2017-10-20 04:22:10', '2017-10-20 04:22:10', 2, 467.98, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', NULL, NULL, 1, 4, 0, '', 1, 0);
INSERT INTO `orders` VALUES (39, '2017-11-27 14:51:58', '2017-11-27 14:51:58', 26, 6387.74, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 1, 0, ';l;l;l;', 1, 0);
INSERT INTO `orders` VALUES (40, '2017-11-27 15:59:33', '2017-11-27 15:59:33', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 4, 0, ';l;l;l;', 1, 0);
INSERT INTO `orders` VALUES (41, '2017-11-27 16:10:02', '2017-11-27 16:10:02', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 3, 4, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (42, '2017-11-27 16:11:51', '2017-12-02 13:04:21', 10, 2499.9, 2, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 3, 2, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (43, '2017-11-27 16:18:46', '2017-11-27 16:18:46', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 4, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (44, '2017-11-27 16:20:06', '2017-11-27 16:20:06', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 4, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (45, '2017-11-27 16:44:13', '2017-11-27 16:44:13', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 4, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (46, '2017-11-27 16:45:07', '2017-11-27 16:45:07', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 2, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (47, '2017-11-27 16:46:32', '2017-11-27 16:46:32', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 2, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (48, '2017-11-27 16:47:55', '2017-12-01 20:37:21', 0, 0, 2, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', NULL, NULL, 1, 2, 0, 'fsfsdfsdfsdf', 1, 0);
INSERT INTO `orders` VALUES (49, '2017-11-29 12:26:07', '2017-12-01 20:02:06', 24, 5999.8, 1, 'dfdfdf', 'pudzia009@gmail.com', '', '', NULL, NULL, 2, 1, 0, 'dcdcdc', 1, 0);
INSERT INTO `orders` VALUES (50, '2017-12-02 13:50:27', '2017-12-05 10:43:51', 94, 23019.2, 2, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', NULL, NULL, 2, 1, 0, 'xzvxvzvxcvZv', 0, 0);
INSERT INTO `orders` VALUES (51, '2017-12-02 15:02:30', '2017-12-02 15:02:30', 2, 499.98, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', NULL, NULL, 2, 4, 0, 'чччччччччччччччччччччччччччч', 0, 0);
INSERT INTO `orders` VALUES (52, '2017-12-14 14:14:33', '2017-12-14 14:14:33', 6, 444722, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', NULL, NULL, 3, 1, 0, 'vbvbvbvbvbvbvbv', 0, 71);
INSERT INTO `orders` VALUES (53, '2017-12-15 13:25:02', '2018-01-17 06:37:25', 1, 55.55, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', NULL, NULL, 2, 1, 0, 'frerer', 0, 71);
INSERT INTO `orders` VALUES (54, '2018-04-10 10:34:09', '2018-04-10 10:34:09', 10, 35, 0, 'Roman Ivanov', 'dfdfdf@gmail.com', '99999999', 'cvbvbcbcvb', 94111, 0.085, 3, 0, 0, 'cvbcvbcbcbcbc', 0, 0);

-- --------------------------------------------------------

-- 
-- Структура таблицы `pages`
-- 

CREATE TABLE `pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `meta_d` text NOT NULL,
  `meta_k` text NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '(draft | public)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(10) NOT NULL,
  `parent_section` int(10) unsigned NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- Дамп данных таблицы `pages`
-- 

INSERT INTO `pages` VALUES (4, 'Privacy Policy', 'privacy-policy', 'Privacy Policy', 'site policy', '&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;ZUPPLY BOX PRIVACY STАTЕMЕNT&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Last Reviewed: Nov. 19 2017&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Your Prіvасу Rights &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;THІЅ PRIVACY PОLІСУ АРРLІЕЅ TО ІNFОRMАTІОN WE СОLLЕСT FRОM YOU&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;This ѕtаtеmеnt describes our privacy practices fоr the wеbѕіtеѕ where іt is роѕtеd. This іnсludеѕ mоbіlе wеbѕіtеѕ, tеxt рrоgrаmѕ аnd applications. It also аррlіеѕ tо іnfоrmаtіоn wе collect іn оur ѕtоrеѕ оr оthеr рlасеѕ offline. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ СОLLЕСT ІNFОRMАTІОN FROM YOU IN MANY WАУЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We соllесt information dіrесtlу frоm уоu. Fоr еxаmрlе, іf you rеgіѕtеr for a рrоmоtіоn оr аррlу fоr a jоb. Wе might соllесt іnfоrmаtіоn іf you роѕt a соmmеnt on one of оur wеbѕіtеѕ or rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕt information. Wе аlѕо collect іnfоrmаtіоn when уоu buу our product or other things. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We соllесt information frоm уоu раѕѕіvеlу. Wе uѕе trасkіng tооlѕ lіkе brоwѕеr сооkіеѕ аnd web bеасоnѕ. To lеаrn more аbоut thеѕе tools аnd hоw уоu саn control thеm, &lt;span style=&quot;color:red&quot;&gt;сlісk hеrе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We get information about уоu frоm thіrd раrtіеѕ. Fоr еxаmрlе, ѕосіаl media platforms may gіvе uѕ іnfоrmаtіоn about уоu. Wе may combine thе information wе соllесt from уоu wіth the іnfоrmаtіоn wе gеt from third раrtіеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ СОLLЕСT VАRІОUЅ ІNFОRMАTІОN АBОUT УОU&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wе mау соllесt уоur: &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Name&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Email аddrеѕѕ&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Pоѕtаl аddrеѕѕ&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Phone numbеr&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cеll рhоnе number&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Credit саrd numbеr&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wе mау аѕk you fоr іnfоrmаtіоn tо lеаrn mоrе аbоut you, lіkе уоur аgе оr рrоduсtѕ уоu lіkе. In a mоbіlе environment, we mіght соllесt your lосаtіоn. Wе might lооk аt how оftеn you use thе арр аnd whеrе уоu downloaded іt. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ UЅЕ ІNFОRMАTІОN AS DІЅСLОЅЕD АND DESCRIBED HERE&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо rеѕроnd to уоur rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtѕ оr questions. Fоr example, wе mіght uѕе your іnfоrmаtіоn tо register you fоr рrоmоtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо іmрrоvе оur рrоduсtѕ аnd ѕеrvісеѕ. Wе mіght uѕе уоur іnfоrmаtіоn tо customize your еxреrіеnсе with us. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо lооk at site trеndѕ and сuѕtоmеr interests. Wе may uѕе уоur information to make wеbѕіtе оr рrоduсt improvements. Wе may also соmbіnе information wе get from уоu wіth іnfоrmаtіоn wе hаvе gоttеn from thіrd parties. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;For security рurроѕеѕ. We may uѕе іnfоrmаtіоn to protect оur company, оur сuѕtоmеrѕ, оr оur wеbѕіtеѕ &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;To рrоmоtе us аnd our various wеbѕіtеѕ. Unlеѕѕ wе tеll you оthеrwіѕе, we might nоtіfу you аbоut products, special promotions, оr оffеrѕ. Wе mіght tell уоu аbоut nеw wеbѕіtе fеаturеѕ оr products. Wе mіght also рuѕh out mobile nоtісеѕ for соntеnt оr оffеrѕ we think you might like. Tо mаnаgе thіѕ, fоllоw thе іnѕtruсtіоnѕ in Yоur Chоісеѕ, below. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо communicate wіth you аbоut your ассоunt оr оur rеlаtіоnѕhір: Wе mау соntасt you tо tеll уоu аbоut changes to thіѕ Pоlісу оr оur website Terms. Wе may аlѕо tеll уоu about іѕѕuеѕ wіth your оrdеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ MАУ ЅHАRЕ INFORMATION WІTH THІRD PARTIES&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Yоur іnfоrmаtіоn mау bе ѕhаrеd whеn legally реrmіttеd, іnсludіng іn thе fоllоwіng situations: &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіthіn оur соmраnу (іnсludіng оur affiliated соmраnіеѕ). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіth thіrd раrtіеѕ whо реrfоrm services on оur behalf. Fоr еxаmрlе, we ѕhаrе іnfоrmаtіоn wіth vеndоrѕ, оr wіll authorize them to соllесt іnfоrmаtіоn on our bеhаlf. Some vendors mау be located оutѕіdе our vicinity. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіth оur buѕіnеѕѕ раrtnеrѕ. To орt оut оf hаvіng уоur іnfоrmаtіоn ѕhаrеd, ѕее Your Choices below. Tо ѕtор rесеіvіng іnfоrmаtіоn frоm a business раrtnеr, follow іtѕ орt оut іnѕtruсtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If wе thіnk wе hаvе tо іn оrdеr to соmрlу wіth thе lаw. Fоr еxаmрlе, wе will share іnfоrmаtіоn tо respond tо a соurt оrdеr оr subpoena. We may аlѕо share it іf a gоvеrnmеnt аgеnсу оr investigatory body requests. We mау аlѕо ѕhаrе іnfоrmаtіоn tо рrоtесt uѕ, оur sites, or оur users. Wе mіght share іnfоrmаtіоn with оthеr соmраnіеѕ for frаud аnd сrеdіt rіѕk reduction. With аnу ѕuссеѕѕоr tо аll оr part оf our buѕіnеѕѕ. Fоr еxаmрlе, іf раrt оf our buѕіnеѕѕ was ѕоld wе may sell оur сuѕtоmеr list аѕ раrt оf thаt transaction. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR WEBSITES MАУ LINK TО THIRD PARTY SITES ОR ЅЕRVІСЕЅ WE DON&amp;#39;T СОNTRОL&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If уоu сlісk on оnе оf those lіnkѕ, уоu wіll bе tаkеn tо wеbѕіtеѕ wе dо not control. This роlісу does nоt apply tо thе іnfоrmаtіоn рrасtісеѕ оf thаt wеbѕіtе. Yоu should rеаd thе рrіvасу роlісу of оthеr websites саrеfullу. We are not rеѕроnѕіblе fоr ѕuсh thіrd раrtу&amp;#39;ѕ ѕіtеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ UЅЕ ЅTАNDАRD SECURITY MЕАЅURЕЅ TО РRОTЕСT YOUR ІNFОRMАTІОN&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thе Internet іѕ nоt 100% ѕесurе. Wе thuѕ саnnоt рrоmіѕе that уоur іnfоrmаtіоn wіll be соmрlеtеlу ѕаfе. Please use саutіоn when uѕіng thе Intеrnеt or providing реrѕоnаl іnfоrmаtіоn to оthеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR DІGІTАL РLАTFОRMЅ АND PROGRAMS АRЕ NОT INTENDED FОR KІDЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Our wеbѕіtеѕ аrе not іntеndеd for сhіldrеn &lt;b&gt;undеr 13&lt;/b&gt;. Wе take steps оn thеѕе ѕіtеѕ tо аvоіd соllесtіng information online frоm сhіldrеn undеr 13. In ѕоmе саѕеѕ, children mау gіvе us іnfоrmаtіоn without us knоwіng аbоut іt. If you аrе a parent or lеgаl guаrdіаn and believe thаt уоur сhіld undеr 13 has рrоvіdеd uѕ wіth personally identifiable іnfоrmаtіоn, рlеаѕе еmаіl uѕ or саll us. If уоu wаnt to write, use thе аddrеѕѕ listed on our web page. Plеаѕе mаrk your іn&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrіеѕ tо thе attention of &amp;quot;COPPA - Infоrmаtіоn Request&amp;quot; and іnсludе your email аnd рhоnе numbеr. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ ЅTОRЕ ІNFОRMАTІОN IN THЕ UNITED STАTЕЅ.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Infоrmаtіоn wе maintain іѕ ѕtоrеd in thе Unіtеd Stаtеѕ. If уоu lіvе оutѕіdе оf thе United Stаtеѕ, you undеrѕtаnd and agree thаt we mау trаnѕfеr уоur information tо the United States. This site is ѕubjесt tо U.S. lаwѕ, whісh may not аffоrd thе ѕаmе level оf рrоtесtіоn аѕ those іn уоur country. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;YОUR СHОІСЕЅ ABOUT ОUR MАRKЕTІNG АND TRАСKІNG TOOLS.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Yоu саn орt оut оf mаrkеtіng еmаіlѕ аnd texts. To ѕtор receiving оur рrоmоtіоnаl еmаіlѕ, рlеаѕе еmаіl uѕ. Please indicate whеthеr уоu wіѕh tо соntіnuе to rесеіvе Zuppybox&amp;#39;ѕ catalogs and other postal mailings. Or уоu саn еmаіl us аt mаіlорtоut@zuppybox.соm (be ѕurе tо include your cell phone numbеr іn thе еmаіl message). If уоu hаvе an ассоunt оn our wеbѕіtе, уоu саn manage your рrеfеrеnсеѕ &lt;span style=&quot;color:red&quot;&gt;here. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR DO NOT TRACK POLICY&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Some brоwѕеrѕ hаvе a &lt;b&gt;&amp;quot;Dо Nоt Trасk&amp;quot; &lt;/b&gt;feature thаt lеtѕ you tell wеbѕіtеѕ thаt уоu do not want tо have your online асtіvіtіеѕ tracked. Thеѕе fеаturеѕ аrе nоt уеt uniform, ѕо wе аrе not currently ѕеt uр to respond tо thоѕе signals. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;You саn control tools оn your mobile dеvісеѕ. Fоr еxаmрlе, уоu саn turn оff the GPS locator оr рuѕh notifications оn уоur phone. Each push nоtіfісаtіоn hаѕ an unѕubѕсrіbе lіnk. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;You hаvе other controls you саn exercise&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;. Yоu саn сhооѕе whеthеr оr nоt tо ѕhаrе реrѕоnаl information. If you сhооѕе nоt tо share, ѕоmе fеаturеѕ and ѕеrvісеѕ may be more difficult оr impossible to uѕе. If уоu turn оff cookies or trасkіng tооlѕ, раrtѕ оf оur site аnd ѕеrvісеѕ mау also nоt work рrореrlу.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Fееl frее tо соntасt uѕ іf you hаvе more &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtіоnѕ. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ MАУ UРDАTЕ THІЅ POLICY.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Frоm tіmе to time, wе mау change оur рrіvасу роlісіеѕ. We will nоtіfу you оf аnу mаtеrіаl сhаngеѕ to оur Pоlісу аѕ required by lаw. Wе will also роѕt an uрdаtеd сору оn оur wеbѕіtе. Plеаѕе check оur site periodically fоr updates.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 1, NULL, '2018-01-28 03:28:37', 4, 1);
INSERT INTO `pages` VALUES (5, 'Terms and Conditions', 'terms-and-conditions', 'TERMS AND CONDITIONS', 'TERMS AND CONDITIONS', '&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;ZUPPLY BOX TЕRMЅ &amp;amp; CОNDІTІОNЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Last Reviewed: Nov. 19 2017&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DEFINITIONS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;quot;Zupply Box&amp;quot; and &amp;ldquo;We&amp;rdquo; mеаn Zupplybox.com, іnсludіng іtѕ ѕubѕіdіаrіеѕ, parent companies, оr аffіlіаtеѕ. &amp;quot;Customer,&amp;quot; &amp;quot;Yоu,&amp;quot; or &amp;quot;Your&amp;quot; means thе party рurсhаѕіng from Zupplybox any gооdѕ оr ѕеrvісеѕ thrоugh thе Internet, telephone, fаx, саtаlоg, mаіl, оr hand-delivery. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DISCLAIMER OF WARRANTIES&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox disclaims аnу аnd аll warranties tо the fullеѕt extent permitted bу law, іnсludіng any іmрlіеd wаrrаntіеѕ, thе wаrrаntу оf fіtnеѕѕ for a раrtісulаr purpose, аnd thе wаrrаntу оf mеrсhаntаbіlіtу. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;LIMITATION OF LIABILITY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr agrees thаt:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; IN NO EVENT SHALL ZUPPLYBOX BE LIABLE FOR CONSEQUENTIAL, SPECIAL, INDIRECT OR INCIDENTAL DAMAGES (COLLECTIVELY &amp;ldquo;DAMAGES&amp;rdquo;), INCLUDING, BUT NOT LIMITED TO, ANY DAMAGES RESULTING FROM LOSS OF USE OR PROFITS ARISING OUT OF OR IN CONNECTION WITH THESE TERMS AND CONDITIONS, WHETHER IN AN ACTION BASED ON CONTRACT, TORT (INCLUDING NEGLIGENCE) OR ANY OTHER LEGAL THEORY, EVEN IF ZUPPLYBOX HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. SOME JURISDICTIONS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR EXCLUSION OF LIABILITY FOR CERTAIN TYPES OF DAMAGES; AS A RESULT, THE ABOVE LIMITATIONS OR EXCLUSIONS MAY NOT APPLY TO YOU IN WHOLE OR IN PART AND THE FOREGOING PARAGRAPH SHALL NOT APPLY TO A RESIDENT OF NEW JERSEY TO THE EXTENT DAMAGES TO SUCH NEW JERSEY RESIDENT ARE THE RESULT OF ZUPPLYBOX&amp;rsquo;S NEGLIGENT, FRAUDULENT, OR RECKLESS ACT(S) OR INTENTIONAL MISCONDUCT. &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;PRICING&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Wіth rеѕресt to pricing, Zupplybox&amp;#39;ѕ соѕt оf gооdѕ is calculated wіthоut dеduсtіоn оr оthеrwіѕе gіvіng effect tо program, рurсhаѕе іnсеntіvеѕ, rеbаtеѕ аnd other benefits роtеntіаllу рrоvіdеd tо Zupplybox, аnd mау іnсludе аn аddіtіоnаl allocation fоr сеrtаіn соѕtѕ аnd expenses іnсurrеd bу Zupplybox іn соnnесtіоn wіth ѕuсh рrоduсtѕ. Zupplybox rеѕеrvеѕ thе rіght tо іmроѕе margin-based рrісіng tо ensure mіnіmum рrоfіtаbіlіtу thrеѕhоldѕ. Zupplybox uрdаtеѕ рrісіng and рrоduсt and ѕеrvісе assortments оn a rеgulаr basis аѕ a result оf a variety оf factors, іnсludіng, but nоt lіmіtеd tо, mаrkеt аnd соmреtіtіvе forces, аnd rеѕеrvеѕ thе rіght tо сhаngе Cuѕtоmеr&amp;#39;ѕ рrісіng аnd рrоduсt аѕѕоrtmеnt аt any tіmе wіthоut nоtісе. Zupplybox also reserves thе rіght tо ѕubѕtіtutе рrіvаtе-brаnd оr other equivalent рrоduсtѕ as раrt оf Yоur order. Manufacturer lіѕt prices аrе set bу thе manufacturer аnd аrе рrоvіdеd by еіthеr whоlеѕаlе dіѕtrіbutоrѕ оr the mаnufасturеr directly, аѕ аррlісаblе. Prоmоtіоn pricing, іnсludіng, but nоt limited tо, Instant Sаvіngѕ, Cоuроn Savings, Mail-In Sаvіngѕ, аnd Bundlеd Sаvіngѕ, thаt іѕ аvаіlаblе оn www.zupplybox.com. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;CREDIT TERMS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr&amp;#39;ѕ credit lіmіt ѕhаll be еѕtаblіѕhеd bу Zupplybox. Zupplybox reserves the rіght tо lower Cuѕtоmеr&amp;#39;ѕ сrеdіt lіmіt оr rеfuѕе to ѕhір any orders.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DELIVERY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Place a &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfуіng оrdеr оf $50 оr mоrе, and if уоu&amp;#39;rе іn оnе оf оur mаnу lосаl dеlіvеrу аrеаѕ, уоur dеlіvеrу wіll bе FREE. Minimum purchase іѕ calculated after discounts and bеfоrе tаxеѕ аrе аррlіеd. Cеrtаіn еxсерtіоnѕ mау аррlу. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt furnіturе and oversized items, ѕресіаl orders, сuѕtоm рrіntіng orders, bulk items, cases of bоttlеd wаtеr and оthеr beverages, аnd сеrtаіn technology items are еxсludеd. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Orders less than $50 аnd оrdеrѕ оutѕіdе Zupplybox&amp;#39;s lосаl dеlіvеrу areas wіll іnсur dеlіvеrу fees аѕ &lt;b&gt;&lt;i&gt;Zupplybox discretion&lt;/i&gt;&lt;/b&gt;.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;Additional fееѕ mау apply for оrdеrѕ оutѕіdе оur local dеlіvеrу areas, including аrеаѕ оutѕіdе оf thе continental Unіtеd Stаtеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please Note:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &amp;nbsp;Dеlіvеrу fееѕ, іf аnу, wіll bе nоtеd аt сhесkоut. Dеlіvеrу fееѕ are nоn-rеfundаblе if thе оrdеr or раrt of thе order іѕ returned unlеѕѕ the рrоduсt іѕ dаmаgеd or defective. Dеlіvеrу fееѕ аrе ѕubjесt to change wіthоut nоtісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;Mаnу іtеmѕ аrе аvаіlаblе for nеxt buѕіnеѕѕ-dау dеlіvеrу. Wе wіll notify уоu оf your еѕtіmаtеd delivery date when you рlасе your оrdеr (subject to credit approval аnd рrоduсt аvаіlаbіlіtу). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DELIVERY HOURS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Dеlіvеrіеѕ аrе mаdе bеtwееn 8:00 аnd 17:00, Monday through Frіdау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Rеѕіdеntіаl deliveries are mаdе until 19:00, Mоndау through Frіdау. Dеlіvеrу tіmеѕ оutѕіdе оf the соntіnеntаl United States mау vary bаѕеd upon thе dеlіvеrу аddrеѕѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If аnу delivery іѕ prevented оr delayed bу аnу асt оr соndіtіоn bеуоnd оur rеаѕоnаblе control, Zupplybox ѕhаll give рrоmрt notice to buyer оf ѕuсh condition аnd ѕhаll make аll reasonable efforts to ensure dеlіvеrу іѕ mаdе аѕ ѕооn thereafter аѕ роѕѕіblе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Based оn іnvеntоrу lосаtіоn, items may аrrіvе іn more thаn one ѕhірmеnt аnd wіll bе ѕhоwn аѕ separate сhаrgеѕ on уоur сrеdіt card statement. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox reserves thе right tо dеtеrmіnе the dеlіvеrу mеthоd uѕеd to fulfill your оrdеr. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Exреdіtеd Dеlіvеrу Sеrvісе is аvаіlаblе fоr certain tесhnоlоgу items, and сеrtаіn technology іtеmѕ may require аddіtіоnаl time іn trаnѕіt. Free ѕtаndаrd dеlіvеrу fоr ѕuсh tесhnоlоgу іtеmѕ іѕ 3-10 business dауѕ. Shоuld Yоu require fаѕtеr ѕеrvісе for these technology items, Nеxt Buѕіnеѕѕ Dау аnd Nеxt Buѕіnеѕѕ Dау AM dеlіvеrу аrе аvаіlаblе fоr an аddіtіоnаl cost. Ordеrѕ рlасеd by 4:00 p.m. Eаѕtеrn time оn a buѕіnеѕѕ day wіll bе dеlіvеrеd the next buѕіnеѕѕ dау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Fоr еxаmрlе,&lt;/span&gt;&lt;/i&gt;&lt;/b&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;оrdеrѕ рlасеd prior to 4:00 р.m. Eаѕtеrn tіmе оn Mоndау wіll be dеlіvеrеd оn Tuеѕdау, whіlе оrdеrѕ рlасеd аftеr 4:00 p.m. Eastern Tіmе оn Mоndау will be dеlіvеrеd on Wеdnеѕdау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Ordеrѕ placed on Frіdау аftеr 4:00 p.m. Eastern tіmе, Saturday оr Sundау wіll bе delivered оn Tuеѕdау. Buѕіnеѕѕ days dо not іnсludе hоlіdауѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Expedited Dеlіvеrу fееѕ wіll bе nоtеd аt checkout. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cеrtаіn custom printing оrdеrѕ mау rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrе аddіtіоnаl time іn trаnѕіt. Frее ѕtаndаrd dеlіvеrу fоr ѕuсh сuѕtоm items іѕ 7-9 buѕіnеѕѕ dауѕ. &amp;ldquo;Prіоrіtу Shірріng&amp;rdquo;, dеlіvеrеd іn 5-6 buѕіnеѕѕ days, аnd &amp;ldquo;Ruѕh Shірріng&amp;rdquo;, delivered іn 3-4 buѕіnеѕѕ days, аrе аvаіlаblе for additional соѕt. Fees wіll bе nоtеd at сhесkоut. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please note:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; Zupplybox&amp;#39;ѕ dеlіvеrу rаtеѕ and роlісу are subject tо сhаngе wіthоut nоtісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please саll сuѕtоmеr ѕеrvісе оr Yоur ассоunt representative fоr аddіtіоnаl dеtаіlѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt іtеmѕ аrе dеlіvеrеd tо уоur dооr. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;For ѕоmе оrdеrѕ, wе provide Enhаnсеd Dеlіvеrу Service, which includes delivery bу a 1 or 2-person tеаm, рlасеmеnt in уоur оffісе or rеѕіdеnсе and rеmоvаl of расkаgіng (upon rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕt). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Enhanced Dеlіvеrу Sеrvісе іѕ nоt available in all areas, and уоu wіll bе nоtіfіеd аt checkout if уоur оrdеr &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfіеѕ fоr Enhanced Dеlіvеrу Sеrvісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt оrdеrѕ ѕhоuld bе rесеіvеd wіthіn 7 buѕіnеѕѕ dауѕ оf placing thе order, but ѕоmе orders may &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfу fоr nеxt buѕіnеѕѕ-dау dеlіvеrу. Thе аntісіраtеd dеlіvеrу dаtе will bе nоtеd on уоur оrdеr соnfіrmаtіоn. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If уоur оrdеr dоеѕ not &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfу for next business-day dеlіvеrу, уоu wіll rесеіvе a саll оnе (1) buѕіnеѕѕ dау рrіоr tо thе dеlіvеrу dаtе on уоur оrdеr соnfіrmаtіоn аdvіѕіng уоu of уоur dеlіvеrу wіndоw. At thаt tіmе, you саn request a nеw dеlіvеrу dаtе tо fit уоur ѕсhеdulе, іnсludіng Sаturdау.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Furnіturе Delivery Fees &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Duе tо lосаtіоn аnd ѕhірріng dіѕtаnсеѕ, dеlіvеrу fees mау vаrу аnd wіll be nоtеd аt сhесkоut. Dеlіvеrу fees are ѕubjесt tо сhаngе wіthоut notice. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Sресіаl Ordеr Dеlіvеrу Rаtеѕ аnd Pоlісіеѕ (Mаnufасturеr Direct) &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Certain Zupplybox items will bе ѕhірреd directly frоm carefully selected vеndоrѕ аnd manufacturers. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thеѕе special оrdеr (manufacturer dіrесt) іtеmѕ аrе ѕhірреd via standard dеlіvеrу аnd аrе dеlіvеrеd tо a grоund floor lосаtіоn іn thе mаnufасturеr&amp;#39;ѕ shipping саrtоn. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Yоur dеlіvеrу date аnd delivery fее will be calculated at checkout. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Premium dеlіvеrу іѕ аvаіlаblе fоr manufacturer direct furnіturе items fоr аn аddіtіоnаl fее. Premium delivery рrоvіdеѕ ѕhірріng dіrесtlу frоm thе mаnufасturеr and іnсludеѕ full аѕѕеmblу and іnѕtаllаtіоn within 10 buѕіnеѕѕ days оf рlасіng thе оrdеr (for lосаl dеlіvеrу areas) аnd wіthіn 21 buѕіnеѕѕ dауѕ (for rеmоtе lосаtіоnѕ).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;The dеtаіlѕ of these deliveries аrе dеtеrmіnеd bу the policies аnd рrасtісеѕ of thе аѕѕосіаtеd vеndоrѕ and mаnufасturеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DISCONTINUED PRODUCTS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;In thе еvеnt аn іtеm thаt was initially оffеrеd іѕ dіѕсоntіnuеd bу Zupplybox or іtѕ ѕuррlіеr, Zupplybox will use соmmеrсіаllу rеаѕоnаblе еffоrtѕ to rерlасе ѕuсh discontinued wіth аn аltеrnаtіvе item thаt is аvаіlаblе wіthіn Zupplybox&amp;#39;s ѕtосkеd іnvеntоrу. Itеmѕ mау bе discontinued аt any tіmе, without nоtісе to Cuѕtоmеr. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;EXPORT&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Customer acknowledges аnd аgrееѕ thаt rеgаrdіng Harmonized Tаrіff Schedule оf thе United States, U.S. Cеnѕuѕ Schedule B Exроrt Cоdеѕ, аnd/оr соuntrу оf origin іnfоrmаtіоn (соllесtіvеlу, &amp;ldquo;Export Information&amp;rdquo;), Zupplybox: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol style=&quot;list-style-type:lower-alpha&quot;&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Iѕ nоt thе mаnufасturеr of thе goods thаt Zupplybox ѕеllѕ to Customer and business.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Is nоt rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrеd tо рrоvіdе any Export Information tо Cuѕtоmеr and business.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Does not independently vеrіfу any Exроrt Information thаt Zupplybox receives from its ѕuррlіеrѕ.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Dоеѕ not rерrеѕеnt оr wаrrаnt the accuracy of any Export Infоrmаtіоn and &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Prоvіdеѕ Exроrt Infоrmаtіоn only аѕ оf thе dаtе Zupplybox rесеіvеd it frоm Zupplybox&amp;rsquo;ѕ ѕuррlіеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Customer and Business agreement:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol style=&quot;list-style-type:lower-alpha&quot;&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr аgrееѕ tо соmрlу wіth аll аррlісаblе U.S. аnd nоn-U.S. export аnd іmроrt lаwѕ аnd rеgulаtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr ѕhаll obtain аnу rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrеd еxроrt or іmроrt аuthоrіzаtіоnѕ tо support deliveries undеr this Agrееmеnt.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr ѕhаll іmmеdіаtеlу nоtіfу Zupplybox&amp;rsquo;ѕ rерrеѕеntаtіvе if Cuѕtоmеr is or bесоmеѕ listed in аnу U.S. оr nоn-U.S. government dеnіеd-раrtіеѕ lіѕt оr іf Cuѕtоmеr&amp;rsquo;ѕ еxроrt рrіvіlеgеѕ аrе оthеrwіѕе denied, ѕuѕреndеd or rеvоkеd in whole оr іn раrt bу аnу U.S. оr nоn-U.S. government еntіtу оr agency. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox ѕhаll nоt bе liable fоr іnсrеаѕеd соѕtѕ, dutіеѕ оr any реnаltіеѕ оr damages іnсurrеd bу Cuѕtоmеr аѕ a result оf dеfісіеnt оr еrrоnеоuѕ documentation ѕuррlіеd bу Cuѕtоmеr fоr рurроѕеѕ of еѕtаblіѕhіng thе ѕtаtuѕ of gооdѕ undеr any trаdе рrеfеrеnсе рrоgrаmѕ. Cuѕtоmеr ѕhаll іndеmnіfу and hоld harmless Zupplybox from and аgаіnѕt аnу claim, proceeding, action, fine, lоѕѕ, cost аnd dаmаgеѕ arising оut оf or rеlаtіng tо аnу nоnсоmрlіаnсе with export соntrоl regulations bу Customer. &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;NOTICES&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;All notices tо Zupplybox must bе given іn wrіtіng. Such nоtісеѕ ѕhаll bе dееmеd tо have bееn gіvеn whеn delivered in реrѕоn, or three (3) dауѕ аftеr bеіng ѕеnt bу сеrtіfіеd mаіl, return rесеірt rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtеd, postage pre-paid, оr upon dеlіvеrу bу rерutаblе оvеrnіght соurіеr, аll dеlіvеrу сhаrgеѕ pre-paid. Notices shall be ѕеnt to thе following аddrеѕѕ: Zupply Box, Inс., P.O. Box 3495, WA 98083 Kirkland, Attn: Office of thе Gеnеrаl Cоunѕеl. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;MODIFICATION&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox reserves thе right tо mоdіfу these Term аnd Cоndіtіоnѕ аt аnу tіmе аnd at іtѕ sole discretion. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;SEVERABILITY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Anу lеgаl determination that any of thе provisions contained іn thеѕе Tеrmѕ and Conditions аrе vоіd, invalid оr unenforceable shall nоt аffесt thе vаlіdіtу оf аnу оthеr рrоvіѕіоnѕ of thеѕе Tеrmѕ and Cоndіtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;CHOICE OF LAW FORUM&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thеѕе Terms аnd Cоndіtіоnѕ ѕhаll bе соnѕtruеd аnd governed in ассоrdаnсе with thе lаwѕ оf thе State оf Washington without rеgаrd to соnflісt of lаwѕ рrіnсірlеѕ, аnd any dіѕрutеѕ оr litigation аrіѕіng frоm these Terms and Conditions ѕhаll be conducted in the ѕtаtе оr fеdеrаl соurtѕ of thе Stаtе оf Washington. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;FORCE MAJEURE&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox ѕhаll nоt bе considered іn default іn thе реrfоrmаnсе of іtѕ obligations tо the еxtеnt thаt thе реrfоrmаnсе of аnу such оblіgаtіоn іѕ prevented оr delayed bу any cause thаt іѕ beyond іtѕ rеаѕоnаblе control. &amp;nbsp;Cоруrіght &amp;copy;2017 bу Zupplybox. All rіghtѕ rеѕеrvеd. Prices shown are іn U.S. Dоllаrѕ. Please login fоr уоur pricing. Prісеѕ are ѕubjесt tо change. All use оf thе ѕіtе іѕ ѕubjесt to the Tеrmѕ оf Uѕе. Prісеѕ аnd оffеrѕ оn www.zupplybox.соm mау nоt аррlу tо purchases mаdе оn affiliated or third party webpage. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 1, NULL, '2018-01-27 19:23:33', 5, 1);
INSERT INTO `pages` VALUES (6, 'Return policy', 'return-policy', 'Return Policy', 'Return', '&lt;p&gt;Доставка&lt;/p&gt;\r\n', 1, NULL, '2018-01-27 19:20:22', 6, 1);
INSERT INTO `pages` VALUES (7, 'test page', 'test-page', 'TEST PAGE', 'TEST PAGE', '&lt;p&gt;test&lt;/p&gt;\r\n', 0, '2018-01-28 02:32:05', '2018-01-28 02:47:31', 0, 2);
INSERT INTO `pages` VALUES (8, 'Contact Us', 'contact-us', '', 'Contact', '\r\n', 1, '2018-01-29 02:33:17', '2018-02-07 12:15:19', 0, 0);

-- --------------------------------------------------------

-- 
-- Структура таблицы `pages_section`
-- 

CREATE TABLE `pages_section` (
  `section_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Дамп данных таблицы `pages_section`
-- 

INSERT INTO `pages_section` VALUES (1, 'header');
INSERT INTO `pages_section` VALUES (2, 'footer');
INSERT INTO `pages_section` VALUES (3, 'Дополнительно');

-- --------------------------------------------------------

-- 
-- Структура таблицы `pay_form`
-- 

CREATE TABLE `pay_form` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Дамп данных таблицы `pay_form`
-- 

INSERT INTO `pay_form` VALUES (1, 'Paypal', 'paypal', 1);
INSERT INTO `pay_form` VALUES (2, 'Cashless payments', 'cashless_payments', 2);
INSERT INTO `pay_form` VALUES (3, 'Credit', 'credit', 3);
INSERT INTO `pay_form` VALUES (4, 'Visa', 'cart', 4);

-- --------------------------------------------------------

-- 
-- Структура таблицы `payments`
-- 

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- Дамп данных таблицы `payments`
-- 

INSERT INTO `payments` VALUES (1, '5R889851UM583442G', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com');
INSERT INTO `payments` VALUES (2, '2XT17783N23645232', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com');
INSERT INTO `payments` VALUES (3, '70G424612N166392V', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com');
INSERT INTO `payments` VALUES (4, '63K35742FB439953G', 305.54, 'USD', 'Completed', 'pudzia009-buy@gmail.com');

-- --------------------------------------------------------

-- 
-- Структура таблицы `prod_info_rating`
-- 

CREATE TABLE `prod_info_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `prod_rating_id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- Дамп данных таблицы `prod_info_rating`
-- 

INSERT INTO `prod_info_rating` VALUES (6, '127.0.0.1', 'art.loc', 13, '2017-10-31');
INSERT INTO `prod_info_rating` VALUES (7, '127.0.0.1', 'art.loc', 14, '2017-10-31');
INSERT INTO `prod_info_rating` VALUES (8, '127.0.0.1', 'art.loc', 1, '2017-10-31');
INSERT INTO `prod_info_rating` VALUES (9, '127.0.0.1', 'art.loc', 2, '2017-11-02');
INSERT INTO `prod_info_rating` VALUES (10, '127.0.0.1', 'art.loc', 60, '2017-11-02');
INSERT INTO `prod_info_rating` VALUES (11, '127.0.0.1', 'art.loc', 10, '2017-11-06');
INSERT INTO `prod_info_rating` VALUES (12, '193.111.156.142', 'mail.pstu.edu', 59, '2017-11-08');
INSERT INTO `prod_info_rating` VALUES (13, '127.0.0.1', 'WIN-QJF2VCB52DD', 57, '2017-11-19');
INSERT INTO `prod_info_rating` VALUES (14, '127.0.0.1', 'WIN-QJF2VCB52DD', 58, '2017-11-19');
INSERT INTO `prod_info_rating` VALUES (15, '127.0.0.1', 'WIN-QJF2VCB52DD', 24, '2017-12-11');
INSERT INTO `prod_info_rating` VALUES (16, '193.111.156.142', 'mail.pstu.edu', 15, '2017-12-28');
INSERT INTO `prod_info_rating` VALUES (17, '193.111.156.142', 'mail.pstu.edu', 62, '2018-01-24');
INSERT INTO `prod_info_rating` VALUES (18, '5.105.20.135', '5-105-20-135.mytrinity.com.ua', 75, '2018-04-15');

-- --------------------------------------------------------

-- 
-- Структура таблицы `prod_rating`
-- 

CREATE TABLE `prod_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Block, 0 = Unblock',
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

-- 
-- Дамп данных таблицы `prod_rating`
-- 

INSERT INTO `prod_rating` VALUES (11, 13, 1, 5, '2017-10-31 11:31:07', '2017-10-31 11:31:07', 1);
INSERT INTO `prod_rating` VALUES (12, 14, 1, 5, '2017-10-31 11:34:29', '2017-10-31 11:34:29', 1);
INSERT INTO `prod_rating` VALUES (13, 1, 1, 5, '2017-10-31 11:35:12', '2017-10-31 11:35:12', 1);
INSERT INTO `prod_rating` VALUES (14, 2, 2, 10, '2017-11-02 21:49:04', '2017-11-15 07:59:41', 1);
INSERT INTO `prod_rating` VALUES (15, 60, 1, 5, '2017-11-02 22:15:33', '2017-11-02 22:15:33', 1);
INSERT INTO `prod_rating` VALUES (16, 10, 1, 5, '2017-11-06 11:50:03', '2017-11-06 11:50:03', 1);
INSERT INTO `prod_rating` VALUES (17, 59, 1, 5, '2017-11-08 06:25:56', '2017-11-08 06:25:56', 1);
INSERT INTO `prod_rating` VALUES (18, 57, 1, 5, '2017-11-19 21:55:55', '2017-11-19 21:55:55', 1);
INSERT INTO `prod_rating` VALUES (19, 58, 1, 5, '2017-11-19 22:41:40', '2017-11-19 22:41:40', 1);
INSERT INTO `prod_rating` VALUES (20, 24, 1, 5, '2017-12-11 03:14:18', '2017-12-11 03:14:18', 1);
INSERT INTO `prod_rating` VALUES (21, 15, 1, 5, '2017-12-28 07:43:12', '2017-12-28 07:43:12', 1);
INSERT INTO `prod_rating` VALUES (22, 62, 1, 5, '2018-01-24 06:17:59', '2018-01-24 06:17:59', 1);
INSERT INTO `prod_rating` VALUES (23, 75, 1, 4, '2018-04-15 06:44:04', '2018-04-15 06:44:04', 1);

-- --------------------------------------------------------

-- 
-- Структура таблицы `product_status`
-- 

CREATE TABLE `product_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `icon_style` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Дамп данных таблицы `product_status`
-- 

INSERT INTO `product_status` VALUES (1, 'В наличии', 'available', 'fa-check');
INSERT INTO `product_status` VALUES (2, 'Ожидается', 'waiting', '');
INSERT INTO `product_status` VALUES (3, 'Нет в наличии', 'not_available', '');

-- --------------------------------------------------------

-- 
-- Структура таблицы `products`
-- 

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article` varchar(255) NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `notice` text,
  `stock_id` int(5) unsigned DEFAULT NULL,
  `meta_k` text,
  `meta_d` text,
  `mark_hit` enum('0','1') NOT NULL DEFAULT '0',
  `mark_expert` enum('0','1') NOT NULL DEFAULT '0',
  `mark_available` enum('0','1') NOT NULL DEFAULT '0',
  `mark_discontinued` enum('0','1') NOT NULL DEFAULT '0',
  `mark_stock` enum('0','1') NOT NULL DEFAULT '0',
  `mark_view` enum('0','1') NOT NULL DEFAULT '0',
  `fast_delivery` enum('0','1') NOT NULL DEFAULT '0',
  `free_delivery` enum('0','1') NOT NULL DEFAULT '0',
  `perfect_delivery` enum('0','1') NOT NULL DEFAULT '0',
  `exchange_prod` enum('0','1') NOT NULL DEFAULT '0',
  `warranty_months` enum('0','1') NOT NULL DEFAULT '0',
  `upsell_product` text,
  `related_product` varchar(255) DEFAULT NULL,
  `related_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gallery_image` text,
  `color` varchar(255) DEFAULT NULL,
  `link_video` varchar(255) DEFAULT NULL,
  `watermark` enum('0','1') NOT NULL DEFAULT '0',
  `rating` varchar(255) DEFAULT NULL,
  `price` float DEFAULT '0',
  `stock_price` float unsigned DEFAULT NULL,
  `tax_summ` float DEFAULT NULL,
  `discount_prod` float DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `count_prod` int(11) DEFAULT NULL,
  `available` tinyint(2) NOT NULL DEFAULT '1',
  `package` text,
  `page_views` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `additional_attribute_product` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 AUTO_INCREMENT=197 ;

-- 
-- Дамп данных таблицы `products`
-- 

INSERT INTO `products` VALUES (62, '3WDS02', 0, 'URINAL SCREEN WAVE 3D', 26, 'URINAL SCREEN WAVE 3D NON PARA CUCUMBER MELON 10/BOX', 0, 'URINAL SCREEN', '', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '011218_62_Ox8ydcoav.jpg', '011218_62_h7VJZz1cQ.jpg', '#000000', '', '0', NULL, 28.45, NULL, NULL, NULL, NULL, NULL, 1, '12/box|', 39, 'urinal-screen-wave-3d', '');
INSERT INTO `products` VALUES (63, 'AR1039', 0, 'LOW-DENSITY LNR 33X39', 5, 'TUFF-TEX LOW-DENSITY LNR 33X39 1.0ML   250/CS BLACK', 0, 'Can liners', 'TUFF-TEX LOW-DENSITY LNR 33X39 1.0ML   250/CS BLACK', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 6, '012218_63_we5BnQhN8.jpg', NULL, '#000000', '', '0', NULL, 42.85, NULL, NULL, NULL, NULL, NULL, 1, 'Case|', 5, 'ar1039', '');
INSERT INTO `products` VALUES (65, 'AR1036', 0, 'LOW-DENSITY 30X36', 5, 'TUFF-TEX  LOW-DENSITY 30X36 1 MIL 250/CS BLACK', 0, '', 'TUFF-TEX  LOW-DENSITY 30X36 1 MIL 250/CS BLACK', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_65_n1nfs5zaj.jpg', NULL, '#000000', '', '0', NULL, 37.81, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', NULL, 'ar1036', '');
INSERT INTO `products` VALUES (66, 'AR2048BK', 40, 'HIGH-DENSITY LINER 40X48', 5, 'HI-D RL HIGH-DENSITY LINER 40X48 16MIC BLK 250/CASE CORELESS ROLLS', 0, 'LINERS', 'HI-D RL HIGH-DENSITY LINER 40X48 16MIC BLK 250/CASE CORELESS ROLLS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_66_EjXM0Z3dg.jpg', '012518_66_q1fxnKqEG.jpg|', '#000000', '', '0', NULL, 37.85, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 5, 'high-density-liner-40x48', '');
INSERT INTO `products` VALUES (67, 'AR4348', 0, 'HIGH-DENSITY  LINER 43X48', 5, 'HIGH-DENSITY  LINER 43X48 19MIC 200/CS CORELESS ROLLS BLACK', 0, 'LINER 43X48', 'HIGH-DENSITY  LINER 43X48 19MIC 200/CS CORELESS ROLLS BLACK', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_67_7oKvJmOsy.jpg', '012518_67_PZYQIjf1T.jpg|012518_67_YD1EsSykU.jpg|012518_67_oXpwtba2d.jpg', '#000000', '', '0', NULL, 39.85, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 9, 'high-density-liner-43x48', '');
INSERT INTO `products` VALUES (68, 'BD668', 0, 'DISPOSABLE URINAL FLOOR MAT', 26, 'DISPOSABLE URINAL FLOOR MAT DEO-GARD FRESH SCENT 6 PER CASE\r\n\r\nThe BIG D® DEO-GARD DISPOSABLE MAT is constructed with a heavy, high-friction, coefficient material that actually grips to clean, dry floors. No adhesive is needed. DEO-GARD COMMODE AND URINAL MATS will neutralize odours by catching and quickly absorbing unwanted splashes and drips, protecting the floors from stain, discolouration and uric acid damage with a moisture barrier backing.', 0, '', 'DISPOSABLE URINAL FLOOR MAT DEO-GARD FRESH SCENT 6/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_68_w7zwkWFyv.jpg', '012518_68_hP2HXx02t.jpg|012518_68_ALaT6AtJq.jpg|', '#000000', '', '0', NULL, 52.87, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 15, 'disposable-urinal-floor-mat', '');
INSERT INTO `products` VALUES (69, 'DRK-90940', 0, 'WINDEX GLASS CLEANER 1/GL', 8, 'WINDEX GLASS CLEANER 1/GL', 0, 'WINDEX', 'WINDEX GLASS CLEANER 1/GL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_69_hD5NCkQ3h.jpg', NULL, '#000000', '', '0', NULL, 11.99, NULL, NULL, NULL, NULL, NULL, 1, 'gALON|', 1, 'windex-glass-cleaner-1-gl', '');
INSERT INTO `products` VALUES (70, 'DRK90135', 0, 'WINDEX GLASS CLEANER 32OZ', 8, 'WINDEX GLASS CLEANER 32OZ', 0, 'WINDEX', 'WINDEX GLASS CLEANER 32OZ', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_70_fYNBRNls2.jpg', NULL, '#000000', '', '0', NULL, 4.98, NULL, NULL, NULL, NULL, NULL, 1, '', 8, 'windex-glass-cleaner-32oz', '');
INSERT INTO `products` VALUES (71, 'HL110', 0, 'Hydrogen peroxide multi-purpose cleaner', 8, 'SUPROX CONCENT. PEROXIDE CLNR 1 Gl\r\nSuprox® Ready-To-Use\r\nA powerful tile and grout cleaner formulated with the cleaning power of hydrogen peroxide. It contains thickening agents that help the cleaner cling to surfaces, maximizing contact time for better performance. Suprox Ready-To-Use can be used on most tile and grout surfaces, bathroom and shower room surfaces, and bathroom fixtures like sinks, toilets, and urinals.', 0, '', 'SUPROX CONCENT. PEROXIDE CLNR 1 Gl', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_71_gjvEx0jko.jpg', NULL, '#000000', '', '0', NULL, 21.75, NULL, NULL, NULL, NULL, NULL, 1, 'GALON|', 33, 'hydrogen-peroxide-multi-purpose-cleaner', '');
INSERT INTO `products` VALUES (72, 'HL144-GL', 0, 'TOP CLEAN NEUTRAL CLEANER', 8, 'Top Clean®\\r\\nA fast-acting, synthetic cleaner that removes the soil and leaves the shine. It is specially formulated for metal cross-linked finishes as it preserves the high-gloss appearance without leaving a dulling build-up. Top Clean has a neutral pH formula designed to attack dirt without harming your floor or your floor finish.\\r\\n\\r\\nConcentrated for economical cost-in-use.\\r\\n\\r\\nNeutral pH wont harm floor finish.\\r\\n\\r\\nDefoaming agents minimize foam build-up.', 0, '', 'TOP CLEAN NEUTRAL CLEANER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_72_FoKgf5pKQ.jpg', NULL, '#000000', '', '0', NULL, 11.67, NULL, NULL, NULL, NULL, NULL, 1, 'GALLON|', 5, 'top-clean-neutral-cleaner', '');
INSERT INTO `products` VALUES (73, 'PGC02287', 0, 'COMET W/BLEACH', 8, 'COMET W/BLEACH 1/32OZ.\r\nBleaches many tough stains and cuts tough grease. Surfactant Bleach formula has two short-chain surfactants that act like solvents to cut through grease and other soils. Its liquid chlorine bleach ingredient provides a wealth of well-known bleach benefits. In the kitchen it helps remove tough soils like that tacky grease on range hoods and bleaches food stains on countertops, tables, and cutting boards.', 0, '', 'COMET W/BLEACH 1/32OZ.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_73_s98ATnqAj.jpg', '012518_73_aVCcxU8V7.jpg|', '#000000', '', '0', NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 1, '', 14, 'comet-w-bleach', '');
INSERT INTO `products` VALUES (74, 'SCAMB540A', 0, 'TOWEL TORK MULTIFOLD WHITE  ECOLOGO 540A', 1, 'TOWEL TORK MULTIFOLD WHITE 4000/CASE ECOLOGO\r\nTork Universal  Multifold Paper Hand Towel, 1-Ply, 9.5" Width x 9.13" Length, White, (Case of 16 Packs, 250 per Pack, 4,000 Towels)\r\nTork Universal 3-Panel Multifold Hand Towels provide the right combination of performance and value. Multifold design provides for less towel consumption leading to source reduction, storage space savings, and lower overall costs. Ideal for medium traffic washrooms, fits small spaces and provides both comfort and hygiene to your guests.', 0, '', 'TOWEL TORK MULTIFOLD WHITE 4000/CASE ECOLOGO', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_74_mIfFheEPY.jpg', '012518_74_OLuMbVM5Q.jpg|', '#000000', '', '0', NULL, 29.85, NULL, NULL, NULL, NULL, NULL, 1, '', 7, 'towel-tork-multifold-white-ecologo', '');
INSERT INTO `products` VALUES (75, 'CZ89460', 0, 'ENMOTION TOWEL 89460', 1, 'ENMOTION TOWEL, RECESSED DISP HIGH CAPACITY WHITE 6/700''/CS\r\nThese cost-effective, high-quality roll paper towels are specifically designed to be used with our enMotion® 8” Recessed Automated Touchless Roll Paper Towel Dispenser and our enMotion® Impulse® 8" 1-Roll Automated Touchless Roll Paper Towel Dispensers to provide reliable towel dispensing at the wave of a hand. Choose these towels for dependable performance and customer satisfaction.', 0, '', '', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_75_Qtalstq6s.jpg', '012518_75_HWbUb6lMs.jpg|012518_75_9gl3kx1PI.jpg|', '#000000', '', '0', NULL, 59.87, NULL, NULL, NULL, NULL, NULL, 1, '', 36, 'enmotion-towel', '');
INSERT INTO `products` VALUES (76, 'KC01980', 0, 'TOWEL MULTIFOLD WHITE  SCOTTFOLD 01980', 1, 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD 4375/CS\r\n\r\nScott Scottfold paper towels feature a patented fold that eliminates tearing and tabbing, so your guests and employees will waste less;\r\n They unfold to a generous 9.2” x 9.4”\r\nThe white paper disposable hand towels feature exclusive Absorbency Pockets for better absorbency\r\nHygienic, touchless dispensing with most universal folded towel dispensers: only touch the drying towel you use\r\nThe Scott Brand guarantees these multifold paper towels will be cost-neutral (vs. C-fold towels)', 0, '', 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD 4375/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_76_yJqkE39bG.jpg', '012518_76_z4pB5HltX.jpg|', '#000000', '', '0', NULL, 49.87, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 4, 'towel-multifold-white-scottfold', '');
INSERT INTO `products` VALUES (77, 'KC04007', 0, 'CORELESS TOILET TISSUE 2 PLY 04007', 1, 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', 0, '', 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_77_BnPS8XnaX.jpg', NULL, '#000000', '', '0', NULL, 55.94, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 14, 'coreless-toilet-tissue-2-ply', '');
INSERT INTO `products` VALUES (78, 'KC13217', 0, 'TOILET TISSUE UNIVERSAL 2 PLY 13217', 1, 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506\r\nWhite toilet tissue is neutral and goes to any restroom\r\nMade with 100% recycled fiber, this 2-ply bulk toilet paper is strong and absorbent\r\nScotts biodegradable toilet paper meets EPA minimum standards, and it’s FSC and EcoLogo certified so that you can feel confident about choosing a wholesale eco-friendly product at a great price\r\nThese commercial tissue rolls contain 75% post-consumer waste', 0, 'TOILET TISSUE UNIVERSAL', 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_78_oaFbFqJ8b.jpg', '012518_78_zINfqH1mA.jpg|', '#000000', '', '0', NULL, 52.75, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 6, 'toilet-tissue-universal-2-ply', '');
INSERT INTO `products` VALUES (79, 'MMGCBLUE', 0, 'Microfiber Glass, Window and Mirror Towel', 7, 'Microfiber Glass, Window and Mirror Towel blue. 12 per pack', 0, '', 'Microfiber Glass, Window and Mirror Towel blue. 12 per pack', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_79_htXKlzRvY.jpg', '012518_79_8lImG964f.jpg|', '#000000', '', '0', NULL, 14.75, NULL, NULL, NULL, NULL, NULL, 1, 'pack of 12 towel|', 5, 'microfiber-glass-window-and-mirror-towel', '');
INSERT INTO `products` VALUES (80, 'SZOGNPR-XL1M', 0, 'GLOVE, NITRILE BLU', 2, 'GLOVE, NITRILE BLU PF XL 100/BX GNPR-XL-1M\r\nBLUE NITRILE GLOVES\r\n POWDER FREE\r\n 100% LATEX FREE\r\n STANDARD LENGTH (9.65″ +/- 0.25″)\r\n Size XL\r\n PACKED 100/BX', 0, 'GLOVE, NITRILE', 'GLOVE, NITRILE BLU PF XL 100/BX GNPR-XL-1M', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_80_YUhQASa1M.jpg', '012518_80_x8OWZayf3.jpg|', '#000000', '', '0', NULL, 5.19, NULL, NULL, NULL, NULL, NULL, 1, 'pack|', 12, 'glove-nitrile-blu', '');
INSERT INTO `products` VALUES (82, 'GO5785-04', 0, 'PROVON FOAMING HANDWASH 535ML 5785-04', 6, 'PROVON FOAMING HANDWASH 535ML COUNTER TOP 4 PER CASE\r\n\r\nHigh-quality foaming hand soap with added skin conditioner.\r\nRefreshing cranberry fragrance\r\n\r\nEcoLogo™ certified', 0, '', 'PROVON FOAMING HANDWASH 535ML COUNTER TOP 4 PER CASE\r\n\r\nHigh-quality foaming hand soap with added skin conditioner.\r\nRefreshing cranberry fragrance\r\n\r\nEcoLogo™ certified', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_82_AHRa4CSwR.jpg', '012718_82_sz2A7ooL1.jpg|012718_82_0AilIXVtt.jpg|', '#000000', '', '0', NULL, 39.97, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 3, 'provon-foaming-handwash-535ml', '');
INSERT INTO `products` VALUES (83, 'GO5361-02', 0, 'GOJO® Premium Foam Handwash with Skin Conditioners 5361-02', 6, 'GOJO® Premium Foam Handwash with Skin Conditioners 1200 mL Refill for GOJO® TFX™ Dispenser\r\n2 PER CASE\r\nFoam handwash with a thick, rich lather.\r\n\r\nPleasant cranberry fragrance\r\nGentle on skin\r\nEcoLogo™ certified\r\nSANITARY SEALED™ refill helps prevent contamination\r\nFresh dispensing valve with each refill\r\nWORKS WITH TFX DISPENSER', 0, 'FOAM HANDWASH', 'GOJO® Premium Foam Handwash with Skin Conditioners 1200 mL Refill for GOJO® TFX™ Dispenser\r\n2 PER CASE\r\nFoam handwash with a thick, rich lather.\r\n\r\nPleasant cranberry fragrance\r\nGentle on skin\r\nEcoLogo™ certified\r\nSANITARY SEALED™ refill helps prevent contamination\r\nFresh dispensing valve with each refill\r\nWORKS WITH TFX DISPENSER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_83_vVxwBq5BX.jpg', '012818_83_Exv8fvQzl.jpg|012818_83_JusuICB2L.jpg|012818_83_y5xxcU7uv.jpg|012818_83_Pqcjgyq6e.jpg|', '#000000', 'https://youtu.be/qiRj2KjZymI', '0', NULL, 51.45, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 3, 'gojo-premium-foam-handwash-with-skin-conditioners', '');
INSERT INTO `products` VALUES (84, '2740-12', 0, 'GOJO® TFX™ Dispenser 2740-12', 6, 'GOJO® TFX™ Dispenser\r\nTouch-Free Dispenser for GOJO® Foam Soap', 0, 'Dispenser', 'GOJO® TFX™ Dispenser', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 6, '012818_84_ORKhbP7Mi.jpg', NULL, '#000000', 'https://youtu.be/RhcREW4Q6fk', '1', NULL, 27, NULL, NULL, NULL, NULL, NULL, 1, '', 3, 'gojo-tfx-dispenser', '');
INSERT INTO `products` VALUES (85, 'FCFOAM-GL', 0, 'FOAM-ALL HAND & BODY SOAP', 6, 'FOAM-ALL HAND & BODY SOAP 1/GL\\r\\nFoam-All™ is the next generation of personal care products. Its high foaming characteristics allow the end-user to use less product. When used through the foaming dispenser, you can see the foam magically grow from the first squirt in your hand. No messy dripping as you apply it to hands, hair or body. For use in shower and restroom facilities in schools, athletic clubs, nursing homes and other public facilities. pH balanced and gentle on the skin. Rinses freely with water.', 0, 'FOAM SOAP', 'FOAM-ALL HAND & BODY SOAP 1/GL\\r\\nFoam-All™ is the next generation of personal care products. Its high foaming characteristics allow the end-user to use less product. When used through the foaming dispenser, you can see the foam magically grow from the first squirt in your hand. No messy dripping as you apply it to hands, hair or body. For use in shower and restroom facilities in schools, athletic clubs, nursing homes and other public facilities. pH balanced and gentle on the skin. Rinses freely with water.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_85_6BGTgC0WG.jpg', NULL, '#000000', '', '0', NULL, 15.85, NULL, NULL, NULL, NULL, NULL, 1, 'GALON|', 3, 'foam-all-hand-body-soap', '');
INSERT INTO `products` VALUES (86, 'GO5392-02', 0, 'PURELL® Advanced Hand Sanitizer 5392-02', 6, 'PURELL® Advanced Hand Sanitizer E3 Rated Foam\r\n1200 mL Refill for PURELL® TFX™ Dispenser\r\n\r\n2 PER CASE\r\nLuxurious foam certified for use in food processing facilities.\r\n\r\nKills more than 99.99% of most common germs that may cause illness\r\nMeets guidelines for use in USDA and US federally-regulated food processing facilities\r\nListed with NSF International as an E3 for use in all departments of USDA-regulated food processing environments\r\nExceeds the chlorine equivalency standard set by NSF for E3 category status\r\nCertified Kosher\r\nPart of the GOJO Hygiene Management System for Food Processors\r\nFood Code Compliant\r\nOutperforms other hand sanitizers ounce-for-ounce¹\r\nClinically-proven to maintain skin health²\r\nAmerica’s #1 Instant Hand Sanitizer³', 0, 'sanitizer', 'PURELL® Advanced Hand Sanitizer E3 Rated Foam\r\n1200 mL Refill for PURELL® TFX™ Dispenser\r\n\r\n2 PER CASE\r\nLuxurious foam certified for use in food processing facilities.\r\n\r\nKills more than 99.99% of most common germs that may cause illness\r\nMeets guidelines for use in USDA and US federally-regulated food processing facilities\r\nListed with NSF International as an E3 for use in all departments of USDA-regulated food processing environments\r\nExceeds the chlorine equivalency standard set by NSF for E3 category status\r\nCertified Kosher\r\nPart of the GOJO Hygiene Management System for Food Processors\r\nFood Code Compliant\r\nOutperforms other hand sanitizers ounce-for-ounce¹\r\nClinically-proven to maintain skin health²\r\nAmerica’s #1 Instant Hand Sanitizer³', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_86_iRLfhKfzA.jpg', '012818_86_jXrhPr4P2.jpg|012818_86_jUUN3Szp9.jpg|', '#000000', '', '0', NULL, 68.99, NULL, NULL, NULL, NULL, NULL, 1, 'case|', 3, 'purell-advanced-hand-sanitizer', '');
INSERT INTO `products` VALUES (87, 'HL39403', 0, 'Mandarin-Cranberry Premium Foam Soap 39403', 6, 'Mandarin-Cranberry Premium Foam Soap\r\n	4 - 1,250mL cartridges	Affinity Manual Refill\r\n\r\n\r\nThis premium foaming soap has additional active ingredients that make it our thickest and most luxurious foaming soap yet. Infused with premium moisturizers that leave your skin smooth and clean with a refreshing citrus and berry scent.\r\n\r\nThick, luxurious foaming soap.\r\n\r\nMandarin-cranberry scent.\r\n\r\nGreen Seal Certified.', 0, '', 'Mandarin-Cranberry Premium Foam Soap\r\n\r\n	4 - 1,250mL cartridges	Affinity Manual Refill\r\n\r\n\r\nThis premium foaming soap has additional active ingredients that make it our thickest and most luxurious foaming soap yet. Infused with premium moisturizers that leave your skin smooth and clean with a refreshing citrus and berry scent.\r\n\r\nThick, luxurious foaming soap.\r\n\r\nMandarin-cranberry scent.\r\n\r\nGreen Seal Certified.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_87_zMqi8VaVJ.jpg', NULL, '#000000', '', '0', NULL, 49.95, NULL, NULL, NULL, NULL, NULL, 1, '', 1, 'mandarin-cranberry-premium-foam-soap', '');
INSERT INTO `products` VALUES (88, 'HIL22280', 0, 'Affinity Manual Soap Dispenser 1.25 L 22280', 28, 'Affinity Manual Soap Dispenser 1.25 L \r\nOne reliable, robust dispenser delivering foam, liquid or gel. Space-saving dispenser design utilizes 25% less plastic by weight than other 1,250 mL dispensers without compromising reliability or durability.', 0, 'MANUAL SOAP DISPENSER', 'Affinity Manual Soap Dispenser 1.25 L \r\nOne reliable, robust dispenser delivering foam, liquid or gel. Space-saving dispenser design utilizes 25% less plastic by weight than other 1,250 mL dispensers without compromising reliability or durability.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_88_0uDCN7mut.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'EACH|', 15, 'affinity-manual-soap-dispenser-1-25-l', '');
INSERT INTO `products` VALUES (89, 'FCHYGL', 0, 'PINK HAND SOAP', 6, 'PINK HAND SOAP\r\n1 GALON\r\n\r\nAn economical, mild, hand cleaner. This product has a very soft, gentle feel and a pleasant fragrance. It rinses quickly and completely.', 0, '', 'PINK HAND SOAP\r\n1 GALON\r\nAn economical, mild, hand cleaner. This product has a very soft, gentle feel and a pleasant fragrance. It rinses quickly and completely.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_89_pyl0LFKaN.jpg', NULL, '#000000', '', '0', NULL, 8.99, NULL, NULL, NULL, NULL, NULL, 1, '', 31, 'pink-hand-soap', '');
INSERT INTO `products` VALUES (90, '3M20T', 0, '3 M 20 TAN UHS FLOOR PAD', 7, 'UHS Tan Burnishing Floor Pad, 20", 5 Pads Per Case', 0, 'FLOOR PAD', 'FLOOR PAD', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_90_4T6brIx6C.jpg', NULL, '#000000', '', '0', NULL, 41.19, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 9, '3-m-20-tan-uhs-floor-pad', '');
INSERT INTO `products` VALUES (91, '3WDS02', 0, 'URINAL SCREEN WAVE 3D NON PARA CUCUMBER MELON 10/BOX', 8, 'Renown Wave 3D combines the patented technology of a 30 day urinal air freshener/deodorizer, with the absolute splash elimination available due to it''s two sided design. Wave 3D also provides an easy to use out indicator system to assist in timely maintenance.\r\nThe Wave 3D patented urinal screen releases more than twice the active ingredients as look-alike screens, over 30 days to keep the urinal and restroom smelling fresh. The Wave doesn’t'' just mask, it releases optimized bacteria that consume odors. The revolutionary design features a post & lattice design extending through the screen and diffuses the urine stream while releasing a pleasant fragrance. The 2-sided anti-splash design removes 99% of urine splash either side up! The Wave 3D easy reminder system lets you know when it''s time to replace the screen. Simply remove the tabs upon installation to set your replacement date. Pack of 10 (5/2-count inner bags per pack). 6 packs/case. 60 total screens per case. \r\n\r\nKey Benefits:\r\nFreshens the Urinal and the restroom for 30 days - The patented Wave contains more than twice the actives as ''lookalike'' screens.\r\nUnique hexagon post & lattice technology eliminates 99% of urine splash, saving custodial cleaning time and patron pant splatters.\r\n2-Sided design ensures correct installation… every time!\r\nReminds you when to change it - Simply pull off the date tabs to remind you when to change it.\r\nSaves money because it is stronger longer - Twice as long as lookalikes\r\nEliminates odors - Releases billions of optimized bacteria that consume mal-odors in the urinal.\r\nComplies with VOC requirements in all 50 states, North America and Europe. 100% recyclable.\r\nRecommended by the #1 Manufacturer of Waterless Urinals - Falcon Waterfree Technologies.\r\nSave screens not being used - A screen saver bag is included with every box to keep them fresh while not in use.', 0, 'URINAL SCREEN WAVE 3D', 'URINAL SCREEN WAVE 3D', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_91_KTfr0n3UC.jpg', '022718_91_KCjckIIZp.jpg|', '#000000', '', '0', NULL, 35.45, NULL, NULL, NULL, NULL, NULL, 1, 'box|', 1, 'urinal-screen-wave-3d-non-para-cucumber-melon-10-box', '');
INSERT INTO `products` VALUES (92, 'AR1036', 0, 'TUFF-TEX 30X36 1 MIL 250/CS BLACK', 5, 'LINER LOW-D 30X36 1 MIL BLACK 250/CS TUFF TEX', 0, 'TUFF-TEX 30X36 1 MIL 250', 'TUFF-TEX 30X36 1 MIL 250', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_92_TLkvkUWs6.jpg', '022718_92_sZ9Oc2nQR.jpg|', '#000000', '', '0', NULL, 37.81, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 1, 'tuff-tex-30x36-1-mil-250-cs-black', '');
INSERT INTO `products` VALUES (93, 'AR1039', 0, 'TUFF-TEX LNR 33X39 1.0ML 250/CS BLACK', 5, 'LINER LOW-D 33X39 1 MIL BLACK 250/CS TUFF TEX', 0, 'TUFF-TEX LNR 33X39 1.0ML', 'TUFF-TEX LNR 33X39 1.0ML', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_93_iB75EOYnQ.jpg', '022718_93_Et16zG3o7.jpg|', '#000000', '', '0', NULL, 42.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'tuff-tex-lnr-33x39-1-0ml-250-cs-black', '');
INSERT INTO `products` VALUES (94, 'AR2048BK', 0, 'HI-D RL LINER 40X48 16MIC BLK 250/CASE CORELESS ROLLS', 5, 'High-Density Can Liner, 40 X 48, 16gal, Black, 250/carton', 0, 'HI-D RL LINER 40X48 16MIC', 'HI-D RL LINER 40X48 16MIC', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_94_txyK7HuVj.jpg', '022718_94_fYGGHjzM8.jpg|', '#000000', '', '0', NULL, 39.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 1, 'hi-d-rl-liner-40x48-16mic-blk-250-case-coreless-rolls', '');
INSERT INTO `products` VALUES (95, 'AR4348', 0, 'HI-D RL LINER 43X48 19MIC 200/CS CORELESS ROLLS BLACK', 5, 'High-Density Can Liner, 43 X 48, 19mic, Black, 200 Rolls/carton', 0, 'HI-D RL LINER 43X48', 'HI-D RL LINER 43X48', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_95_deNLNo5TE.jpg', '022718_95_5Lva7EzzK.jpg|', '#000000', '', '0', NULL, 39.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'hi-d-rl-liner-43x48-19mic-200-cs-coreless-rolls-black', '');
INSERT INTO `products` VALUES (96, 'BD668', 0, 'URINAL FLOOR MAT DEO-GARD FRESH SCENT', 26, 'Constructed with a heavier, high-friction, coefficient material, the mat actually grips to clean, dry floors, to reduce slipping and tripping.\r\n-Designed to be used with all hanging single urinals\r\n-Impregnated with Mountain Air scent\r\n-6 per case\r\n The hexagon designed grid creates a more effective means to direct liquids quickly into the absorbent core and allows the end-user to see when the mat has become soiled and in need of replacement. Polymers with increased flexibility conform to uneven floor surfaces and allow the soiled mat to easily be folded, rolled or even wadded up to fit in the receptacle for effortless disposal. Used under urinals the mat will neutralize odors by catching and quickly absorbing unwanted splashes and drips, protecting your floor from stain, discoloration and uric acid damage with a non-glued moisture barrier backing.', 0, 'URINAL FLOOR MAT DEO', 'URINAL FLOOR MAT DEO', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_96_bx0vLIMgJ.jpg', '022718_96_bFIKPVIKM.jpg|', '#000000', '', '0', NULL, 52.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 9, 'urinal-floor-mat-deo-gard-fresh-scent', '');
INSERT INTO `products` VALUES (97, 'BO273-103', 0, 'BOBRICK TP DISP.SPINDLE BLACK, OBLONG 273-103', 1, 'This is an O.E.M. Authorized. Fits with various bobrick washroom equipment INC models. Oem part number BO.273-103. The product is manufactured in United states.', 0, 'BOBRICK TP DISP', 'BOBRICK TP DISP', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_97_EdYxT70Sr.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'Each|', 24, 'bobrick-tp-disp-spindle-black-oblong', '');
INSERT INTO `products` VALUES (99, 'BW48140', 0, 'TOWEL MULTIFOLD WHITE EPA  16/250 DUBL NATURE GREENSEAL 48140', 1, 'Appeal paper products provide a level of quality, comfort and economy that effectively meets everyday needs. The Appeal white multifold towel is 100% recycled and is a good alternative to premium grade folded towels. 250 per pack and 16 packs per case', 0, 'TOWEL MULTIFOLD WHITE EPA', 'TOWEL MULTIFOLD WHITE EPA', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_99_NZulK9Yyx.jpg', NULL, '#000000', '', '0', NULL, 35.56, NULL, NULL, NULL, NULL, NULL, 1, 'box|', NULL, 'towel-multifold-white-epa-16-250-dubl-nature-greenseal', '');
INSERT INTO `products` VALUES (100, 'BW59890', 0, 'TOILET TISSUE UNIVERSAL 2 PLY  80/500 DUBL NATURE GREEN SEAL 59890', 1, 'Dubl-Nature® Green Seal™ certified embossed universal tissue is made from a superior grade of 100% recycled wastepaper. It contains up to 25% post-consumer waste content. Ideal for class A office buildings, luxury hotels, upscale restaurants, green buildings and hotels, government, and colleges or universities. Attractive "floral" embossing. Exceptional brightness and absorbency.\r\n\r\n-2 Ply\r\n-500 sheets per roll, 80 rolls per case', 0, 'TOILET TISSUE UNIVERSAL', 'TOILET TISSUE UNIVERSAL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_100_CsTK3uFfi.jpg', NULL, '#000000', '', '0', NULL, 49, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'toilet-tissue-universal-2-ply-80-500-dubl-nature-green-seal', '');
INSERT INTO `products` VALUES (101, 'RMP267', 0, 'PAD,CARPET,W/SCRUB STRIPS 17" 5/CS', 7, 'White\r\nWith Green Scrub Strips\r\n5 per pack\r\n17", Low Profile w/Green Strips, 5/cs\r\nStandard thickness, original blend bonnets work well with either shampoo or solvent based chemicals. Use with a 175 RPM floor machine. The low-profile bonnet provides improved operator control on rotary floor machines from 175-300 RPM. The low-profile bonnet with scrub strips adds additional scrubbing action for improved cleaning performance.\r\n\r\nWith Green Scrub Strips. 5 per pack.', 0, 'PAD,CARPET,W/SCRUB STRIPS 17', 'PAD,CARPET,W/SCRUB STRIPS 17', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_101_JqZUBW9fV.jpg', '022718_101_mNUls1sOd.jpg|', '#000000', '', '0', NULL, 27, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'pad-carpet-w-scrub-strips-17-5-cs', '');
INSERT INTO `products` VALUES (102, 'CLO35604', 0, 'TILEX SOAP SCUM REMOVER', 8, 'Bleach-free.\r\nDisinfects and kills 99.9% of bathroom germs.\r\nDissolves soap scum with no scrubbing.\r\nPenetrating foam leaves surfaces clean and shiny.\r\nSpray every drop with Smart Tube® technology that reaches to the very bottom of the bottle.\r\nIdeal for offices, day care centers, restaurants, hotels and other commercial facilities.', 0, 'TILEX SOAP SCUM REMOVER', 'TILEX SOAP SCUM REMOVER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_102_xt7sUQCjD.jpg', '022718_102_G0ZCz0Hnb.jpg|', '#000000', '', '0', NULL, 6.68, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 1, 'tilex-soap-scum-remover', '');
INSERT INTO `products` VALUES (103, 'DRK-90940', 0, 'WINDEX GLASS CLEANER 4/GL/CS', 8, 'Windex® Ready-to-Use Glass Cleaner\r\nGallon Refill, Case of 4.\r\n\r\nCleans with Ammonia-D® for a streak-free shine. Loosens soil upon contact. Won’t streak or leave a film. Also cleans chrome, stainless steel, Plexiglas® and other hard surfaces. Contains no phosphates.', 0, 'WINDEX GLASS CLEANER', 'WINDEX GLASS CLEANER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_103_P8uXwAuNo.jpg', NULL, '#000000', '', '0', NULL, 12, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'windex-glass-cleaner-4-gl-cs', '');
INSERT INTO `products` VALUES (104, 'DRK90135', 0, 'WINDEX GLASS CLEANER', 8, 'Cleans with Ammonia-D for a streak-free shine. Loosens soil upon contact. won''t streak or leave a film. Also cleans chrome, stainless steel, Plexiglas and other hard surfaces. Contains no phosphates. Capped and sprayer separate.', 0, 'WINDEX GLASS CLEANER', 'WINDEX GLASS CLEANER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_104_wB0NVPjyz.jpg', NULL, '#000000', '', '0', NULL, 4.98, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'windex-glass-cleaner', '');
INSERT INTO `products` VALUES (105, 'FCILL-GL', 0, 'NEUTRAL CLEANER, ILLUMINATE,1 GL', 8, 'Concentrated anti-static neutral floor cleaner formulated to reduce the time and labor costs of daily maintenance of high gloss metal interlock floor finishes. Eliminates the time and labor normally required for rinsing. Pleasantly scented.\r\nIlluminate™ is quick drying and leaves no residue or haze to dull the original luster of high gloss finishes. Floor appearance is enhanced and the life of the finish substantially extended. Optically active, which will increase the floors reflectance and make the shine "pop".', 0, 'NEUTRAL CLEANER, ILLUMINATE', 'NEUTRAL CLEANER, ILLUMINATE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_105_rBxY9oiqA.jpg', NULL, '#000000', '', '0', NULL, 7.35, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'neutral-cleaner-illuminate-1-gl', '');
INSERT INTO `products` VALUES (106, 'HL110', 0, 'SUPROX CONCENT. PEROXIDE CLNR 1 Gl', 8, 'Super concentrated Hydrogen peroxide multi-purpose cleaner. Ideal for use on many surfaces including glass, restroom fixtures, tile and grout counters, floors and carpets. Brightens grout and enhances the appearance of tiled surfaces. Also available in 1/2 gallon and 1 gallon containers in the Hillyard Arsenal line.', 0, 'SUPROX CONCENT. PEROXIDE CLNR', 'SUPROX CONCENT. PEROXIDE CLNR', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_106_OnW8kHzoq.jpg', NULL, '#000000', '', '0', NULL, 18, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'suprox-concent-peroxide-clnr-1-gl', '');
INSERT INTO `products` VALUES (107, 'HL1134', 0, 'STAINLESS STEEL CLNR EP AERO', 8, 'Provides the performance and gloss typical of oil-based stainless steel cleaners but in a fast-breaking economical foaming water base. The silicone-free formula utilizes a food grade protectant which is easy to work with and dries to a non-oily film for use in public areas on escalators, elevators, and other areas. No excessive residue, no hazing and no excessive buffing are required. The high-gloss restores luster and protects stainless steel, chrome, aluminum, brass, copper, and most other metal surfaces. Applications can be found in food service, offices, hotels, schools, airports, municipal and government buildings, and much more', 0, 'STAINLESS STEEL CLNR EP AERO', 'STAINLESS STEEL CLNR EP AERO', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_107_bGVIJVEjr.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'stainless-steel-clnr-ep-aero', '');
INSERT INTO `products` VALUES (108, 'HL144-GL', 0, 'TOP CLEAN NEUTRAL CLEANER HIL0014406', 8, 'A fast acting synthetic cleaner that removes the soil and leaves the shine. It is specially formulated for metal cross-linked finishes as it preserves the high gloss appearance without leaving a dulling buildup. Top Clean has a neutral pH formula designed to attack dirt without harming your floor or your floor finish. The built-in defoamers in Top Clean make it ideal for damp mopping or for use in automatic scrubbers. It exhibits excellent cleaning efficiency in hard or soft, hot or cold water. Top Clean is an effective cleaner for floors, walls, ceilings, mirrors, windows, and metal surfaces. Top Clean is classified by Underwriters Laboratories, Inc. as to slip resistance (186S), is phosphate free, plus it contains no soap, free alkali, or ammonia.', 0, 'TOP CLEAN NEUTRAL CLEANER', 'TOP CLEAN NEUTRAL CLEANER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_108_TZMdNT1MM.jpg', NULL, '#000000', '', '0', NULL, 9.45, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'top-clean-neutral-cleaner-hil0014406', '');
INSERT INTO `products` VALUES (109, 'HL475-QT', 0, 'RESTROOM CLEANER, TILE CLEAN HIL0047504', 8, 'The perfect product for cleaning a wide variety of bathroom and shower surfaces, including shower stalls, partitions, grout, fiberglass, chrome, plastic composition…especially ceramic tile and grout joints. It is formulated with a special blend of two acids and detergents to create a cleaner that removes heavy grease, oil, soil, and mineral deposits with ease.\r\n\r\nRemoves heavy grease, oil, soil, and mineral deposits.\r\nDilutes with warm or cold water.\r\nPleasant, clean, mint fragrance.', 0, 'RESTROOM CLEANER, TILE CLEAN HIL0047504', 'RESTROOM CLEANER, TILE CLEAN HIL0047504', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_109_pCA16RkwY.jpg', NULL, '#000000', '', '0', NULL, 42, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 1, 'restroom-cleaner-tile-clean-hil0047504', '');
INSERT INTO `products` VALUES (110, 'PGC02287', 0, 'COMET W/BLEACH 1/32OZ.', 8, '', 0, 'COMET W/BLEACH 1/32OZ.', 'COMET W/BLEACH 1/32OZ.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_110_Yecs0ChkT.jpg', NULL, '#000000', '', '0', NULL, 6.5, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 9, 'comet-w-bleach-1-32oz', '');
INSERT INTO `products` VALUES (111, 'RO11771415QT', 0, 'SANI B LUE PLUS NA BATH CLNR,GL  1Qt', 8, 'Our non-acid ready-to-use bathroom cleaner disinfects and deodorizes in one time-saving step. An EPA registered bactericide, virucide and fungicide effective against even the toughest organisms, including HIV-1 virus. Non-abrasive formula cleans hard, non-porous surfaces, including porcelain and fixtures without risk of damage. Clean mint fresh scent.', 0, 'SANI B LUE PLUS NA BATH CLNR,GL  1Qt', 'SANI B LUE PLUS NA BATH CLNR,GL  1Qt', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_111_1eUwrgrB5.jpg', NULL, '#000000', '', '0', NULL, 4.85, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'sani-b-lue-plus-na-bath-clnr-gl-1qt', '');
INSERT INTO `products` VALUES (112, 'SP3397', 0, 'CONSUME BIO-BOWL TOILET CLEANR W/ODOR CONTROL', 8, 'A natural acid, toilet, urinal, & shower room cleaner. Aqua blue color and fragrance. Each quart equipped w/flip-top dispensing cap. pH: 1.5-2.5.\r\nFormulated with non-pathogenic, enzyme producing bacteria to provide efficient cleaning and maximum control of persistent, obnoxious odors in restroom and shower rooms.', 0, 'CONSUME BIO-BOWL TOILET CLEANR W/ODOR CONTROL', 'CONSUME BIO-BOWL TOILET CLEANR W/ODOR CONTROL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_112_8klWvSKbq.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'consume-bio-bowl-toilet-cleanr-w-odor-control', '');
INSERT INTO `products` VALUES (113, 'CZ46200', 0, 'FACIAL TISSUE 36/100/CS    CUBE BOX WHITE PREFERENCE 46200', 1, 'This soft, absorbent, value-oriented white 2-ply facial tissue offers a cost-effective solution for high-traffic facilities. Your guests, tenants, patients, customers and employees will notice the softness...and the quality. Individual Box Dimensions 4.375" x 4.375" x 5.25"', 0, 'FACIAL TISSUE 36/100/CS    CUBE BOX WHITE PREFERENCE', 'FACIAL TISSUE 36/100/CS    CUBE BOX WHITE PREFERENCE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_113_My8LC1B08.jpg', '022718_113_svnoJC0ys.jpg|', '#000000', '', '0', NULL, 59.95, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'facial-tissue-36-100-cs-cube-box-white-preference', '');
INSERT INTO `products` VALUES (114, 'BW130', 0, 'FACIAL TISSUE, ECO 100S 30/CS 2 PLY 8 3/4 130', 1, 'Made from 100% recycled fibers and contains a minimum of 10% post-consumer waste, which meets EPA guidelines. Made entirely from recovered fibers. 8" x 8".\r\n100 ct., 2 Ply, 30/cs', 0, 'FACIAL TISSUE, ECO 100S 30/CS 13000 2 PLY 8 3/4', 'FACIAL TISSUE, ECO 100S 30/CS 13000 2 PLY 8 3/4" X 8"', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_114_0ywvEtvz4.jpg', '022718_114_4xqRViBpb.jpg|', '#000000', '', '0', NULL, 29.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 1, 'facial-tissue-eco-100s-30-cs-13000-2-ply-8-3-4-x-8', '');
INSERT INTO `products` VALUES (115, 'FCAZ-GL', 0, 'AROMAZYME ENZYME CONC. DRAIN AND ODOR CONTROL4X1GL/CS', 8, 'The next generation technology in microbial blends with superior degradation capability for multiple applications. A stable consortium of safe Bacillus spores. Ability to work under aerobic and anaerobic conditions.\r\nAromazyme exhibits a broad range of uses in the maintenance of drain lines and grease traps as well as improving septic and waste degradation with exceptional odor control using our famous signature scent. A synergistic blend that works in concert to provide superior performance across multiple applications. Excretion of high levels of amylase, cellulose, lipase and protease enzymes.', 0, 'AROMAZYME ENZYME CONC. DRAIN AND ODOR CONTROL4X1GL/CS', 'AROMAZYME ENZYME CONC. DRAIN AND ODOR CONTROL4X1GL/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_115_MrhVm1vZL.jpg', NULL, '#000000', '', '0', NULL, 13, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 2, 'aromazyme-enzyme-conc-drain-and-odor-control4x1gl-cs', '');
INSERT INTO `products` VALUES (116, 'FCCC-GL', 0, 'CLEAR & CLEAN ANTIBACT SOAP,GL 4-GALLONS/CASE', 8, 'A premium quality, ready-to-use pH balanced antiseptic hand wash. A clear, thick liquid with no fragrance. Mild to the hands and leaves the skin soft and refreshed. Color: White, pearlized; Fragrance: None.', 0, 'CLEAR & CLEAN ANTIBACT SOAP,GL 4-GALLONS/CASE', 'CLEAR & CLEAN ANTIBACT SOAP,GL 4-GALLONS/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_116_KbcnQsMn5.jpg', NULL, '#000000', '', '0', NULL, 47.89, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 3, 'clear-clean-antibact-soap-gl-4-gallons-case', '');
INSERT INTO `products` VALUES (117, 'FCFOAM-GL', 0, 'FOAM-ALL HAND & BODY SOAP 4/GL/CS', 8, 'FOAMY Sea Breeze Foaming Hand Soap is a specially formulated moisturizing hand and body soap with a rich, thick, creamy, foaming lather that is designed exclusively for use in "foaming" soap dispensers and pump bottles. FOAMY Sea Breeze Foaming Hand Soap is more economical and cost-effective than ordinary liquid hand and body soaps. The rapid aeration and foaming by the dispensing unit results in substantially less soap and water required to maintain a luxurious, rich lather. FOAMY Sea Breeze Foaming Hand Soap is mild and gentle to the skin, while at the same time very effective at removing tough dirt, grease and grime. 4 gl/cs Shipping weight 8.5 lbs.', 0, 'FOAM-ALL HAND & BODY SOAP 4/GL/CS', 'FOAM-ALL HAND & BODY SOAP 4/GL/CS', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_117_wz0uE3hQY.png', NULL, '#000000', '', '0', NULL, 15.98, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'foam-all-hand-body-soap-4-gl-cs', '');
INSERT INTO `products` VALUES (118, 'FCWP-GL', 0, 'WHITE PEARL WHITE LOTION  SOAP/4/GL/CS', 8, 'Wash Plus Wax™ contains a special blend of high quality surfactants and waxes to produce a rich and foamy solution that emulsifies dirt, soils and road film. Rinses freely, without leaving streaks - will not harm the existing polish or wax on your car surface.', 0, 'WHITE PEARL WHITE LOTION  SOAP/4/GL/CS', 'WHITE PEARL WHITE LOTION  SOAP/4/GL/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_118_oo4mnMRdI.jpg', NULL, '#000000', '', '0', NULL, 8.45, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'white-pearl-white-lotion-soap-4-gl-cs', '');
INSERT INTO `products` VALUES (119, '3M17BR', 0, '17" BROWN STRIPPER PAD 5/CS 3M #7100', 7, '3M Brown Stripper Pad 7100, 12" Floor Stripper Pad', 0, '17" BROWN STRIPPER PAD 5/CS 3M #7100', '17" BROWN STRIPPER PAD 5/CS 3M #7100', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_119_5v0UKtxHz.jpg', NULL, '#000000', '', '0', NULL, 25, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 11, '17-brown-stripper-pad-5-cs-3m-7100', '');
INSERT INTO `products` VALUES (120, '3M20BK', 0, '20" BLACK FLOOR PAD 5/CS', 7, 'Every floor pad in the 3M line is designed and manufactured with a uniform coating throughout, assuring longer-lasting performance in a variety of maintenance operations.\r\nTo remove all finish, sealer and contaminants from the floor surface. Use with Rotary or Automatic. Low Speed 175-600 RPM.', 0, '20" BLACK FLOOR PAD 5/CS', '20" BLACK FLOOR PAD 5/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_120_5RgwASY2F.jpg', NULL, '#000000', '', '0', NULL, 7, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 11, '20-black-floor-pad-5-cs', '');
INSERT INTO `products` VALUES (121, '3M20BR', 0, '20" BROWN FLOOR PAD 5/CASE 3M# 7100', 7, '3M Brown Stripper Pad 7100, 20" Floor Stripper Pad (Case of 5)', 0, '20" BROWN FLOOR PAD 5/CASE 3M# 7100', '20" BROWN FLOOR PAD 5/CASE 3M# 7100', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_121_w2TvGa9Nv.jpg', NULL, '#000000', '', '0', NULL, 7.16, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 12, '20-brown-floor-pad-5-case-3m-7100', '');
INSERT INTO `products` VALUES (122, '3M20R', 0, '20" RED BUFFER PAD 5/CS 3M #5100', 7, '3M Red Buffer Pad 5100, 20" Floor Buffer, Machine Use (Case of 5)', 0, '20" RED BUFFER PAD 5/CS 3M #5100', '20" RED BUFFER PAD 5/CS 3M #5100', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_122_zAZUwA3le.jpg', NULL, '#000000', '', '0', NULL, 6.99, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 9, '20-red-buffer-pad-5-cs-3m-5100', '');
INSERT INTO `products` VALUES (123, 'FCD', 0, 'DEEP-SIX DEFOAMER GAL.', 8, 'A silicone antifoam which eliminates foam in recovery tanks of extraction carpet machines, automatic floor scrubbers and other industrial recovery systems. Non-corrosive and will not harm equipment. Specific Gravity: 1.0.\r\nPleasant fragrance.', 0, 'DEEP-SIX DEFOAMER GAL.', 'DEEP-SIX DEFOAMER GAL.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_123_D3hktLYFw.jpg', NULL, '#000000', '', '0', NULL, 10, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'deep-six-defoamer-gal', '');
INSERT INTO `products` VALUES (124, 'GS37826-EA', 0, 'MEDIUM BLUE/WHITE WAXER MOP', 7, 'This is the professionals choice for waxing! It is made of 4-ply blue and white synthetic blend yarn with a 1 1/4" band. Readily releases finish. Looped and helps it lay flat for even finishing.', 0, 'MEDIUM BLUE/WHITE WAXER MOP', 'MEDIUM BLUE/WHITE WAXER MOP', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_124_1s2roHEkN.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'medium-blue-white-waxer-mop', '');
INSERT INTO `products` VALUES (125, 'HL524-GL', 0, 'DISCOVERY 20 FLOOR FINISH,GL   HIL0052406   4/GL/CS', 8, 'If you live with a restrictive maintenance budget that does not allow for frequent buffing and lack sufficient cleaning staff to keep your facilities looking their best every day, then Discovery 20 can help. Its formulated to maintain its shine longer with everyday traffic with less work. Because of Discovery 20s excellent durability, it is idea for schools and small office buildings. The result is a program designed to optimize your cleaning resources and the appearance of your facility, saving time and money.', 0, 'DISCOVERY 20 FLOOR FINISH,GL   HIL0052406   4/GL/CS', 'DISCOVERY 20 FLOOR FINISH,GL   HIL0052406   4/GL/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_125_4Qa0Cs8gs.jpg', NULL, '#000000', '', '0', NULL, 15, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 1, 'discovery-20-floor-finish-gl-hil0052406-4-gl-cs', '');
INSERT INTO `products` VALUES (126, 'HL536-5', 0, 'NAVIGATOR FLOOR WAX 5 GL.', 8, 'Navigator utilizes the latest advancement in acrylic polymer technology to deliver\r\na protective floor coating that offers excellent clarity and durability. Navigator\r\nprovides excellent resistance to scuffing, scratching, and heel marking. Navigator’s\r\noptimal solids content makes it extremely easy to apply resulting in even, clear\r\nprotective layers of finish for your floor.', 0, 'NAVIGATOR FLOOR WAX 5 GL.', 'NAVIGATOR FLOOR WAX 5 GL.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_126_KshmbdCPB.jpg', NULL, '#000000', '', '0', NULL, 93, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'navigator-floor-wax-5-gl', '');
INSERT INTO `products` VALUES (127, 'FRS6-14-SS', 0, 'SUPERSORB ABSORBANT 6/BX 24/CS 12oz CONTAINER', 26, 'Includes six cans of 12 ounces each.\r\nAbsorbs 60 times its weight immediately!\r\nEasy, sanitary disposal of blood, vomit and other liquids.\r\nSimply sprinkle granular absorbent, sweep up.\r\nQuat and microbiocide eliminate odors.\r\nIdeal for use in grocery stores, restaurants, hospitals, more.', 0, 'SUPERSORB ABSORBANT 6/BX 24/CS 12oz CONTAINER', 'SUPERSORB ABSORBANT 6/BX 24/CS 12oz CONTAINER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_127_LdA0ooXYW.jpg', NULL, '#000000', '', '0', NULL, 44.96, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 2, 'supersorb-absorbant-6-bx-24-cs-12oz-container', '');
INSERT INTO `products` VALUES (128, 'GO5392-02', 0, 'INSTANT HAND SANITIZER, FOAM  TFX PURELL 2/1200 ML/CS O5392-02', 6, 'Luxurious foam. Kills more than 99.99% of most common germs that may cause illness. Outperforms other hand sanitizers ounce-for-ounce.\r\nClinically-proven to maintain skin health\r\nAmerica’s #1 Instant Hand Sanitizer\r\n1200 mL TFX™, 2/cs', 0, 'INSTANT HAND SANITIZER, FOAM  TFX PURELL 2/1200 ML/CS', 'INSTANT HAND SANITIZER, FOAM  TFX PURELL 2/1200 ML/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_128_2clkSL4R1.jpg', NULL, '#000000', '', '0', NULL, 69.75, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 1, 'instant-hand-sanitizer-foam-tfx-purell-2-1200-ml-cs', '');
INSERT INTO `products` VALUES (129, 'GS37293-EA', 0, '36X5 INFINITY TWIST DUST MOP WHITE 12/CASE', 7, 'Made with top quality Endless Twist yarn that won''t fray out or wash away. Available in either Universal 3" or 5" style to fit any mop frame.\r\nUniversal Style. Made with top quality yarn that won''t fray out or wash away. There are no loops to catch on obstacles or furniture. Pre-laundered for superior dust pickup. Orange invincible backing with natural yarn.\r\n36", 5" Universal, 12/cs', 0, '36X5 INFINITY TWIST DUST MOP WHITE 12/CASE', '36X5 INFINITY TWIST DUST MOP WHITE 12/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_129_PLvqe4hr8.jpg', NULL, '#000000', '', '0', NULL, 7.28, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, '36x5-infinity-twist-dust-mop-white-12-case', '');
INSERT INTO `products` VALUES (130, 'H2-8552', 0, 'RED SPRAY BOTTLE W/SPRAYER', 8, 'Our bottles are silk screened with colors, numbers and application/safety instructions in both English & Spanish. Perfect for satisfying OSHA or your safety administrator! Makes training easy too. As long as someone can read, see color or count, they can be thoroughly trained on the use of the H2Orange2 system! Peel & Stick labels are available for all three dilutions of H2Orange2 if you already have spray bottles you would like to use!', 0, 'RED SPRAY BOTTLE W/SPRAYER', 'RED SPRAY BOTTLE W/SPRAYER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_130_hE0V56mMj.jpg', '022718_130_dMww0X4YM.jpg|', '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'red-spray-bottle-w-sprayer', '');
INSERT INTO `products` VALUES (131, 'H2-8550', 0, 'GREEN SPRAY BOTTLE W/ SPRAYER', 8, 'Our bottles are silk screened with colors, numbers and application/safety instructions in both English & Spanish. Perfect for satisfying OSHA or your safety administrator! Makes training easy too. As long as someone can read, see color or count, they can be thoroughly trained on the use of the H2Orange2 system! Peel & Stick labels are available for all three dilutions of H2Orange2 if you already have spray bottles you would like to use!', 0, 'GREEN SPRAY BOTTLE W/ SPRAYER', 'GREEN SPRAY BOTTLE W/ SPRAYER', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_131_H1CXHyO4u.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'green-spray-bottle-w-sprayer', '');
INSERT INTO `products` VALUES (132, 'HL152-GL', 0, 'SUPER STRIP FLOOR STRIPPER GAL  HIL0015206 4-GAL/CASE', 8, 'Hillyard Super Strip will easily remove the toughest buildup on the floor. Even floors that have been repeatedly burnished and hardened with multiple coats of finish are rapidly stripped. Super Strip is formulated to provide powerful stripping action no matter what the condition of the floor.', 0, 'SUPER STRIP FLOOR STRIPPER GAL  HIL0015206 4-GAL/CASE', 'SUPER STRIP FLOOR STRIPPER GAL  HIL0015206 4-GAL/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_132_hqxjOdirE.jpg', NULL, '#000000', '', '0', NULL, 15, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'super-strip-floor-stripper-gal-hil0015206-4-gal-case', '');
INSERT INTO `products` VALUES (133, 'HL534-5', 0, 'EXPLORER FLOOR FINISH 25%SOLID  HIL0053407 5 GAL PAIL', 8, 'A high solids, acrylic copolymer floor polish formulated to provide a clear, wet-looking, protective shine on your floors. Its advanced formula is perfect for resilient tile, terrazzo, unglazed ceramic, quarry tile, paver brick, natural stone or concrete flooring. Explorer provides a tough approach to beautiful floors. It resists black heel marks, scratching, and scuffing. It is tough enough and dries fast enough for use in main lobbies, entrances, and major traffic corridors. Explorer has outstanding detergent resistance. \r\n\r\nReady to use.', 0, 'EXPLORER FLOOR FINISH 25%SOLID  HIL0053407 5 GAL PAIL', 'EXPLORER FLOOR FINISH 25%SOLID  HIL0053407 5 GAL PAIL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_133_3SCvine31.jpg', NULL, '#000000', '', '0', NULL, 84.25, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'explorer-floor-finish-25-solid-hil0053407-5-gal-pail', '');
INSERT INTO `products` VALUES (134, 'HOSKL', 0, 'WAXED KRAFT LINER (KL260)   7.5X3.5X10.25  500/CS', 1, 'With gusset waxed finish. Fit Sanisac and above units. 7 1/2x3 1/2x10 1/4 Pack Qty: 500.', 0, 'WAXED KRAFT LINER (KL260)   7.5X3.5X10.25  500/CS', 'WAXED KRAFT LINER (KL260)   7.5X3.5X10.25  500/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_134_p1X7YODZq.jpg', NULL, '#000000', '', '0', NULL, 27.83, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'waxed-kraft-liner-kl260-7-5x3-5x10-25-500-cs', '');
INSERT INTO `products` VALUES (135, 'KC91439', 0, 'SOAP SURETOUCH LOTION 700 MIL 3/CS 91439', 6, 'A luxurious, thick soap with rich, creamy lather containing aloe vera.', 0, 'SOAP SURETOUCH LOTION 700 MIL 3/CS', 'SOAP SURETOUCH LOTION 700 MIL 3/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_135_9IJ1FQU2v.jpg', NULL, '#000000', '', '0', NULL, 68.95, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'soap-suretouch-lotion-700-mil-3-cs', '');
INSERT INTO `products` VALUES (136, 'AR1033', 0, 'TUFF-TEX LNR 24X33 1 MIL 500/CS BLACK', 5, 'BLACK 500/CS BRANCH BULK PAK', 0, 'TUFF-TEX LNR 24X33 1 MIL 500/CS BLACK', 'TUFF-TEX LNR 24X33 1 MIL 500/CS BLACK', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_136_arrx2LTXU.jpg', NULL, '#000000', '', '0', NULL, 45.04, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'tuff-tex-lnr-24x33-1-mil-500-cs-black', '');
INSERT INTO `products` VALUES (137, 'AR1049L', 0, 'TUFF-TEX LNR 40X46 1.5ML 100/CS BLACK', 5, 'TUFF-TEX LNR 40X46 1.5ML 100/CS BLACK', 0, 'TUFF-TEX LNR 40X46 1.5ML 100/CS BLACK', 'TUFF-TEX LNR 40X46 1.5ML 100/CS BLACK', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_137_RO0HM6xSB.jpg', NULL, '#000000', '', '0', NULL, 35.87, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'tuff-tex-lnr-40x46-1-5ml-100-cs-black', '');
INSERT INTO `products` VALUES (138, 'AR2035', 0, 'HI-D RL LINER 24X33 8MIC NAT. 1000/CASE CORELESS ROLLS', 5, 'Made with HDPE resins for superior strength and load capacity. Excellent chemical resistance, temperature resistance and odor containment. Star seal. Available in black or natural.\r\n100 bags per roll, 10 rolls per case.\r\n24 x 33, Natural, 8 mic, 10/100/cs', 0, 'HI-D RL LINER 24X33 8MIC NAT. 1000/CASE CORELESS ROLLS', 'HI-D RL LINER 24X33 8MIC NAT. 1000/CASE CORELESS ROLLS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_138_fuhUk6yHN.jpg', NULL, '#000000', '', '0', NULL, 35.97, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'hi-d-rl-liner-24x33-8mic-nat-1000-case-coreless-rolls', '');
INSERT INTO `products` VALUES (139, 'AR2035B', 0, 'HI-D RL LINER 24X33 8MIC BLACK 1000/CASE CORELESS ROLLS', 5, 'Hi-Tuff Trash Liners 24x33 8micron Perfect for small-mid size office wastebaskets. This design conforms the best to fit the shape of your trash can and helps to distribute weight evenly. This liner is on a coreless roll allowing for easy storage on any janitor’s cart. Designed to fit a 13-16 gallon wastebasket.\r\n\r\n1000 bags/case', 0, 'HI-D RL LINER 24X33 8MIC BLACK 1000/CASE CORELESS ROLLS', 'HI-D RL LINER 24X33 8MIC BLACK 1000/CASE CORELESS ROLLS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_139_faIS12Sht.jpg', NULL, '#000000', '', '0', NULL, 37.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'hi-d-rl-liner-24x33-8mic-black-1000-case-coreless-rolls', '');
INSERT INTO `products` VALUES (140, 'AR20378', 0, 'HI-D LINER 30X37 8MIC NAT 500/CS CORELESS ROLLS', 5, 'CLEAR 500/CS CORELESS ROLLS', 0, 'HI-D LINER 30X37 8MIC NAT 500/CS CORELESS ROLLS', 'HI-D LINER 30X37 8MIC NAT 500/CS CORELESS ROLLS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_140_agtzN2Qow.jpg', '022718_140_ASlwJJRra.jpg|', '#000000', '', '0', NULL, 29.95, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 1, 'hi-d-liner-30x37-8mic-nat-500-cs-coreless-rolls', '');
INSERT INTO `products` VALUES (141, 'NT1025X-10', 0, 'COMPOSTABLE LINER 23.5 X 29 .8 ML 13 GAL 250/CS NATUR-BAG', 5, 'Natur-Bag® compostable bags and liners are used for the collection of food scraps and other organic waste for home, community, and industry composting. Our products are 100% compostable and integrate seamlessly in zero-waste and organic diversion programs. We engineered Natur-Bag for superior strength and to breathe naturally, dissipating moisture to help control odors while keeping collection bins clean. Natur-Bag is available in a wide variety of sizes, from 3 gallon bags for kitchen counter top pails up to 96 gallon liners for large collection bins.', 0, 'COMPOSTABLE LINER 23.5 X 29 .8 ML 13 GAL 250/CS NATUR-BAG', 'COMPOSTABLE LINER 23.5 X 29 .8 ML 13 GAL 250/CS NATUR-BAG', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022718_141_OSlePlcM0.jpg', NULL, '#000000', '', '0', NULL, 90, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'compostable-liner-23-5-x-29-8-ml-13-gal-250-cs-natur-bag', '');
INSERT INTO `products` VALUES (142, 'NT1025X-18', 0, 'COMPOSTABLE LINER 30 X 39 0.8 MIL 30GL 200/CS NATURA-BAG', 5, 'he WaveBrake® mop bucket and wringer system reduces splashing, which means a safer environment, cleaner floors, and improved productivity. \r\n\r\n35 qt.', 0, 'COMPOSTABLE LINER 30 X 39 0.8 MIL 30GL 200/CS NATURA-BAG', 'COMPOSTABLE LINER 30 X 39 0.8 MIL 30GL 200/CS NATURA-BAG', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_142_hwu4zuRPK.jpg', NULL, '#000000', '', '0', NULL, 79.88, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'compostable-liner-30-x-39-0-8-mil-30gl-200-cs-natura-bag', '');
INSERT INTO `products` VALUES (143, 'MAS6', 0, 'BLEACH, 6% PURE BRIGHT MULTI-PURPOSE 6X1GAL/CS', 8, 'Effective on hard, non-porous surfaces. Effective against TB, HIV-1, Hepatitis A virus and MRSA. Helps with compliance with OSHA blood-borne pathogen guidelines. Kills E.coli, TB, Hepatitis A, Salmonella. Compact bottle is easier to handle, store, pour, aMed', 0, 'BLEACH, 6% PURE BRIGHT MULTI-PURPOSE 6X1GAL/CS', 'BLEACH, 6% PURE BRIGHT MULTI-PURPOSE 6X1GAL/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_143_VEn7PfqcK.jpg', NULL, '#000000', '', '0', NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'bleach-6-pure-bright-multi-purpose-6x1gal-cs', '');
INSERT INTO `products` VALUES (144, '388108-001', 0, 'BWKCLIPCMECT ECO-FRESH BOWL CLIP CUCUMBER-MELON 72/CS', 26, 'Eco Clip 2.0 Eco Clip 2.0, Bowl Clip, Cucumber Melon, 12/box EBC72 CUCUMBER MELON', 0, 'BWKCLIPCMECT ECO-FRESH BOWL CLIP CUCUMBER-MELON 72/CS', 'BWKCLIPCMECT ECO-FRESH BOWL CLIP CUCUMBER-MELON 72/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_144_bKVLAhKah.jpg', NULL, '#000000', '', '0', NULL, 34, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 1, 'bwkclipcmect-eco-fresh-bowl-clip-cucumber-melon-72-cs', '');
INSERT INTO `products` VALUES (145, 'FRS2WDS60CME', 0, 'URINAL SCREEN WAVE CUCUMBER MELON 10/BOX', 26, 'Reminds you when to change it, simply pull off the date tabs upon installation to remind you when to change the air freshener, it''s easy! Includes 1 "screen saver" bag per box to store spare screen until needed. Freshen urinal a full 30 days. Contains more than twice as much fragrance as ''look-alike'' screens. Releases billions of optimized bacteria that clean the urinal and eliminate odors. Longer protrusions on top release fragrance and reduces splashback.\r\n\r\n-2 per pkg, 5 pkg per box', 0, 'URINAL SCREEN WAVE CUCUMBER MELON 10/BOX', 'URINAL SCREEN WAVE CUCUMBER MELON 10/BOX', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_145_5Lc9JdFKM.jpg', NULL, '#000000', '', '0', NULL, 35.5, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 8, 'urinal-screen-wave-cucumber-melon-10-box', '');
INSERT INTO `products` VALUES (146, 'KC91072', 0, 'KIMCARE CONTINUOUS AIR FRESHNR OCEAN SCENT REFILL 6 EA/CS 91072', 28, 'Maintaining a clean, fresh-smelling restroom is essential to your facility''s quality image. The Continuous Air Freshener System from Kimberly-Clark Professional makes that easy. Continuous fragrance that works around the clock. Each refill lasts 60 days. Neutralizes and removes odors from the air.\r\n\r\n-Use dispenser 92620, 92621\r\n-6 per case', 0, 'KIMCARE CONTINUOUS AIR FRESHNR OCEAN SCENT REFILL 6 EA/CS', 'KIMCARE CONTINUOUS AIR FRESHNR OCEAN SCENT REFILL 6 EA/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_146_k9tCrB9tC.jpg', NULL, '#000000', '', '0', NULL, 68.45, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 1, 'kimcare-continuous-air-freshnr-ocean-scent-refill-6-ea-cs', '');
INSERT INTO `products` VALUES (147, 'RO10709027GL', 0, 'LEMON AIRE ODOR CONTROL, 1 GAL', 26, 'Powerful non-aerosol, water-based air freshener and deodorizer concentrate with a pleasant lemon fragrance. Use in floor cleaners, carpet shampoos and general purpose cleaners or degreasers', 0, 'LEMON AIRE ODOR CONTROL, 1 GAL', 'LEMON AIRE ODOR CONTROL, 1 GAL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_147_b1qNIPeZU.jpg', NULL, '#000000', '', '0', NULL, 24, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 8, 'lemon-aire-odor-control-1-gal', '');
INSERT INTO `products` VALUES (148, 'PGC82027', 0, 'MR CLEAN MAGIC ERASER PAD 6/4 CT/CS', 8, 'Product SKU: PGC82027\r\nCleaning pads\r\n2 2/5" x 4 3/5" Pads\r\nOffers multi-purpose cleaning with only water\r\nWater activated microscrubbers lift & remove dirt\r\nDisposable, soft pads erase set-in dirt and grime quickly and easily\r\nRemove scuff marks, dirt and crayon from floors, walls and doors\r\nSafe and simple to use\r\nNo gloves or chemicals necessary\r\nWet pad with water and rub on stain to remove with ease\r\n4 Pads per box\r\nMr. Clean 82027 Magic Eraser Pads', 0, 'MR CLEAN MAGIC ERASER PAD 6/4 CT/CS', 'MR CLEAN MAGIC ERASER PAD 6/4 CT/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_148_eQMpwA5tc.jpg', '022818_148_hr4KkEARg.jpg|', '#000000', '', '0', NULL, 28, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'mr-clean-magic-eraser-pad-6-4-ct-cs', '');
INSERT INTO `products` VALUES (149, 'PT100331', 0, 'FILTER, PAPER COACH & MEGA 10/PKG/ 20PKG/CASE 100331', 1, 'To safeguard the Indoor Air Quality of your facilities and to optimize the performance of your vacuum cleaner, change filters once they are half full. Four Level Filtration system provides advanced protection against there introduction of pollutants back into an environment. Has 21% more filtration area than non-pleated filters. Fully laminated inner liner eliminates shredding. Dual layered construction captures fine particles, improving Indoor Air Quality. Intercept microbial treatment helps contain odors and prevent the growth of mold and bacteria.', 0, 'FILTER, PAPER COACH & MEGA 10/PKG/ 20PKG/CASE', 'FILTER, PAPER COACH & MEGA 10/PKG/ 20PKG/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_149_V0BXL5NO1.jpg', NULL, '#000000', '', '0', NULL, 15, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 2, 'filter-paper-coach-mega-10-pkg-20pkg-case', '');
INSERT INTO `products` VALUES (150, 'PT107314', 0, 'FILTER, PAPER PRO 6 VAC 10/PKG/ 20PKG/CASE 107314', 7, 'ProTeam''s Intercept Micro Filters have 21% more filtration area than non-pleated filters. Fully laminated inner liner eliminates shredding. Dual layered construction captures fine particles, improving Indoor Air Quality. Intercept microbial treatment helps contain odors and prevent the growth of mold and bacteria.', 0, 'FILTER, PAPER PRO 6 VAC 10/PKG/ 20PKG/CASE', 'FILTER, PAPER PRO 6 VAC 10/PKG/ 20PKG/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_150_tst3VRwu4.jpg', NULL, '#000000', '', '0', NULL, 11, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 1, 'filter-paper-pro-6-vac-10-pkg-20pkg-case', '');
INSERT INTO `products` VALUES (151, 'RMQ850', 0, 'MICROFIBER FLEXIBLE DUSTING WAND QUICK CONNECT 28.75x3.25', 7, 'Dusting wand with microfiber sleeve. Microfiber replacement sleeves available. Removes dust and allergens from crevices and hard-to-reach areas. Wand can be bent to conform to irregular surfaces for improved cleaning. Quick-Connect handle converts wand to extended-reach cleaning tool.\r\n\r\n1 1/2" x 28 3/4".', 0, 'MICROFIBER FLEXIBLE DUSTING WAND QUICK CONNECT 28.75x3.25', 'MICROFIBER FLEXIBLE DUSTING WAND QUICK CONNECT 28.75x3.25', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_151_Gge9RvfGP.jpg', NULL, '#000000', '', '0', NULL, 24, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'microfiber-flexible-dusting-wand-quick-connect-28-75x3-25', '');
INSERT INTO `products` VALUES (152, 'RMQ851', 0, 'MICROFIBER WAND DUSTER REPLACEMENT SLEEVE, GREEN', 7, 'Dusting wand with microfiber sleeve. Microfiber replacement sleeves available. Removes dust and allergens from crevices and hard-to-reach areas. Wand can be bent to conform to irregular surfaces for improved cleaning. Quick-Connect handle converts wand to extended-reach cleaning tool.\r\n\r\n-3/4" x 22.7"\r\n-6 per case', 0, 'MICROFIBER WAND DUSTER REPLACEMENT SLEEVE, GREEN', 'MICROFIBER WAND DUSTER REPLACEMENT SLEEVE, GREEN', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_152_tjmJ6WFgx.jpg', NULL, '#000000', '', '0', NULL, 10, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'microfiber-wand-duster-replacement-sleeve-green', '');
INSERT INTO `products` VALUES (153, 'SAA405333', 0, 'ALUMINUM FOIL 18', 4, 'Serving as an excellent all-purpose solution in your kitchen, this standard weight aluminum foil roll can be used for anything from wrapping individual food items to covering foods pans. With its convenient packaging and easy-to-use blade, this aluminum foil is the perfect addition to your busy commercial kitchen!', 0, 'ALUMINUM FOIL 18', 'ALUMINUM FOIL 18"X500''STANDARD  ROLL (ALLUPAK)', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_153_jM7poAMO9.jpg', NULL, '#000000', '', '0', NULL, 29.8, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 3, 'aluminum-foil-18-x500-standard-roll-allupak', '');
INSERT INTO `products` VALUES (154, 'SAA4060440', 0, 'CUTTER BOX FILM 18', 4, 'Try this Choice item instead! Like the AEP film and cutter, this Choice product produces accurate film cuts. However, the Choice item ensures superior safety in your kitchen with its patented Safecut technology. Since the blade on the cutter isn''t exposed, it eliminates any accidental cuts or injuries that are prone to happen with comparable film wrap cutters. Keep your kitchen running smoothly by switching over to this Choice product!', 0, 'CUTTER BOX FILM 18', 'CUTTER BOX FILM 18"X3000''  1 ROLL/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_154_ZSt0oFq36.jpg', NULL, '#000000', '', '0', NULL, 27.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 8, 'cutter-box-film-18-x3000-1-roll-case', '');
INSERT INTO `products` VALUES (155, 'IM1525', 0, 'MAT URINAL GREEN APPLE 6/CS DISPOSABLE FLOOR', 26, 'Save cleaning time by protecting your floors from stains and discoloration. These mats will protect floors from stains and uric acid damage, making your restroom maintenance easier. They also prevent cross contamination of urine from the restroom to other areas. Special nonslip bottom provides a safer, drier floor surface and helps prevent slips and falls. Inpregnated with Neutra Tech™, a neutralizing agent to combat odors and refresh the area, these mats should last 4 to 6 weeks, depending on usage and are easily picked up and replaced. Dimensions: 17 1/2" x 20 3/8"', 0, 'MAT URINAL GREEN APPLE 6/CS DISPOSABLE FLOOR', 'MAT URINAL GREEN APPLE 6/CS DISPOSABLE FLOOR', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_155_FKwKOhvcd.jpg', NULL, '#000000', '', '0', NULL, 52.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 1, 'mat-urinal-green-apple-6-cs-disposable-floor', '');
INSERT INTO `products` VALUES (156, 'WENSEAT', 0, 'SEATCOVER 1/2 FOLD 20/250/CS', 1, 'Fits most standard toilet cover dispensers. Dispenses one sheet at a time. Made from quick-dissolving tissue. 100% biodegradable and flushable.\r\n1/2 Fold, 20/250/cs', 0, 'SEATCOVER 1/2 FOLD 20/250/CS', 'SEATCOVER 1/2 FOLD 20/250/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_156_UGZY3PqPT.jpg', NULL, '#000000', '', '0', NULL, 35.94, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'seatcover-1-2-fold-20-250-cs', '');
INSERT INTO `products` VALUES (157, '111787', 0, 'KINDEST KARE HAND&BODY WASH 12/CS 1L 111787', 6, 'Kindest Kare Hand & Body Wash is a gentle, synthetic based body wash and shampoo formulated with Vitamin E, Aloe Vera, and emollients. Kindest Kare Hand & Body Wash is a versatile and economical product, suitable for routine bathing, shampooing, no rinse bed bathing, and routine handwashing. The select combination of surfactants and conditioners in Kindest Kare Hand & Body Wash leaves skin and hair soft and clean without drying. It is peach in color with alight floral scent.', 0, 'KINDEST KARE HAND&BODY WASH 12/CS 1L', 'KINDEST KARE HAND&BODY WASH 12/CS 1L', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_157_7uISJV2kj.png', NULL, '#000000', '', '0', NULL, 160, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'kindest-kare-hand-body-wash-12-cs-1l', '');
INSERT INTO `products` VALUES (158, 'CZ42714', 0, 'ENMOTION DYE & FRAG FREE FOAM SOAP W/MOIST 2-1200ML/CASE 42714', 28, 'Foam soap can be placed inside a Georgia-Pacific dispenser (sold separately) and used for washing hands\r\nSuitable for use in a public restroom\r\nContains a skin conditioner to help moisten hands and prevent them from drying out\r\nCollapsible bag can dispense soap until empty to limit waste\r\nCompatible with Georgia-Pacific 53052, 53053, and 53087 manual soap and sanitizer dispensers (sold separately)', 0, 'ENMOTION DYE & FRAG FREE FOAM SOAP W/MOIST 2-1200ML/CASE', 'ENMOTION DYE & FRAG FREE FOAM SOAP W/MOIST 2-1200ML/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_158_bJFSqFTmr.jpg', '022818_158_Ulk8CUDue.jpg|', '#000000', '', '0', NULL, 42.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 2, 'enmotion-dye-frag-free-foam-soap-w-moist-2-1200ml-case', '');
INSERT INTO `products` VALUES (159, 'FCHYGL', 0, 'HY-GRADE PINK HAND SOAP 4 - 1 GALLON / CASE', 8, 'A synthetic liquid with a balanced blend of biodegradable cleansers. A superior cleaner. Contains no harsh ingredients. Can be used by frequent hand washers. Pleasant hibiscus fragrance. Rinses quickly and completely.\r\nGal., 4/cs', 0, 'HY-GRADE PINK HAND SOAP 4 - 1 GALLON / CASE', 'HY-GRADE PINK HAND SOAP 4 - 1 GALLON / CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_159_5AGxXekY5.jpg', NULL, '#000000', '', '0', NULL, 8.99, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'hy-grade-pink-hand-soap-4---1-gallon-case', '');
INSERT INTO `products` VALUES (160, 'GO5361-02', 0, 'SOAP PREMIUM FOAM HANDWASH  TFX 2/1200 ML/CS O5361-02', 6, 'Cranberry scented foam soap. Comes in package of 2. Skin Conditioners, Touch Free Dispensing Refill', 0, 'SOAP PREMIUM FOAM HANDWASH  TFX 2/1200 ML/CS', 'SOAP PREMIUM FOAM HANDWASH  TFX 2/1200 ML/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_160_FHZRICaPN.jpg', NULL, '#000000', '', '0', NULL, 54.45, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'soap-premium-foam-handwash-tfx-2-1200-ml-cs', '');
INSERT INTO `products` VALUES (161, 'GO5785-04', 0, 'PROVON FOAMING HANDWASH 535ML 5785-04 COUNTER TOP 4/CASE', 6, 'A general purpose handwash with a pleasant berry fragrance with moisturizers. Dermatologist tested.', 0, 'PROVON FOAMING HANDWASH 535ML 5785-04 COUNTER TOP 4/CASE', 'PROVON FOAMING HANDWASH 535ML 5785-04 COUNTER TOP 4/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_161_WpXogOQtj.jpg', '022818_161_Tk5OsOSln.jpg|', '#000000', '', '0', NULL, 39.97, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'provon-foaming-handwash-535ml-5785-04-counter-top-4-case', '');
INSERT INTO `products` VALUES (162, 'GO9128-12', 0, 'PINK-N-KLEAN HAND SOAP 800 ML 12/cs 9128-12', 28, 'Push-Style Dispenser for GOJO® Lotion Soap. Compact lotion Soap, Shower Soap or Lotion dispenser. Compact design optimizes wall space.', 0, 'PINK-N-KLEAN HAND SOAP 800 ML 12/cs', 'PINK-N-KLEAN HAND SOAP 800 ML 12/cs', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_162_47GzKZaSh.jpg', NULL, '#000000', '', '0', NULL, 39.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 8, 'pink-n-klean-hand-soap-800-ml-12-cs', '');
INSERT INTO `products` VALUES (163, 'HL22275', 0, 'DISPENSER, BULK FOAM SOAP WHT 1000ML 22275', 28, '1000 ml capacity; dispenses 0.7 ml of foamed liquid per stroke. Durable ABS construction. Key lock for maximum security or optional universal access. ADA compliant pushbar. 11" H x 4 7/8" W x 4 3/4" D.\r\nSight window indicates level of soap remaining.', 0, 'DISPENSER, BULK FOAM SOAP WHT HIL22275 1000ML', 'DISPENSER, BULK FOAM SOAP WHT HIL22275 1000ML', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_163_YkvfPHgQo.jpg', NULL, '#000000', '', '0', NULL, 15.23, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 2, 'dispenser-bulk-foam-soap-wht-hil22275-1000ml', '');
INSERT INTO `products` VALUES (164, 'HL22282', 0, 'AFFINITY TOUCH FREE DISP WHT 22282', 28, 'One reliable, robust dispenser delivering foam, liquid or gel. Space-saving dispenser design utilizes 25 percent less plastic by weight than other dispensers without compromising reliability or durability.', 0, 'AFFINITY TOUCH FREE DISP WHT', 'AFFINITY TOUCH FREE DISP WHT', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 6, '022818_164_tj9dPyXIv.jpg', NULL, '#000000', '', '0', NULL, 25, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 10, 'affinity-touch-free-disp-wht', '');
INSERT INTO `products` VALUES (165, 'HL394-GL', 0, 'MANDARIN-CRANBERRY FOAM SOAP 1Gl 394-GL', 6, 'This premium foaming soap has additional active ingredients that makes it our thickest and most luxurious foaming soap yet. Mandarin-cranberry scent. For use with Affinity® Manual & Touch-Free dispensers.\r\nInfused with premium moisturizers that leave skin smooth and clean with a refreshing citrus and berry scent. Green Seal™ Certified. USDA Certified Biobased Product - 83%.\r\n1000 mL, 3/cs', 0, 'MANDARIN-CRANBERRY FOAM SOAP 1Gl', 'MANDARIN-CRANBERRY FOAM SOAP 1Gl', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_165_80W6GHZgN.jpg', NULL, '#000000', '', '0', NULL, 18.45, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'mandarin-cranberry-foam-soap-1gl', '');
INSERT INTO `products` VALUES (166, 'HL39403', 0, 'AFFINITY MAND CRAN FOAM SOAP 4-1250ML/CASE 39403', 6, 'This premium foaming soap has additional active ingredients that makes it our thickest and most luxurious foaming soap yet.\r\n-Mandarin-cranberry scent\r\n-For use with Affinity® Manual & Touch-Free dispensers\r\n-1250 mL, 4 per case', 0, 'AFFINITY MAND CRAN FOAM SOAP HIL0039403 4-1250ML/CASE', 'AFFINITY MAND CRAN FOAM SOAP HIL0039403 4-1250ML/CASE', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_166_7yDnVUeLJ.jpg', NULL, '#000000', '', '0', NULL, 49.95, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'affinity-mand-cran-foam-soap-hil0039403-4-1250ml-case', '');
INSERT INTO `products` VALUES (167, 'HL39802', 0, 'AFFINITY CUC-MEL FOAM SOAP TF  3-1000ML/CASE 39802', 6, 'Click to Enlarge\r\nHillyard affinity™ Cucumber-Melon Premium Foam Soap\r\nItem # HL39802\r\nThis premium foaming soap has additional active ingredients that makes it our thickest and most luxurious foaming soap yet. Infused with premium moisturizers.\r\nLeaves your skin smooth and clean. Green Seal[TM] Certified\r\nLight and clean scent of fresh cut melons and cucumbers\r\n1000 mL, 3/cs', 0, 'AFFINITY CUC-MEL FOAM SOAP TF  3-1000ML/CASE', 'AFFINITY CUC-MEL FOAM SOAP TF  3-1000ML/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_167_TW6KoiE5s.jpg', NULL, '#000000', '', '0', NULL, 49.85, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 4, 'affinity-cuc-mel-foam-soap-tf-3-1000ml-case', '');
INSERT INTO `products` VALUES (168, 'HL40703', 0, 'AFFINITY GOLDEN ANTI FOAM SOAP HIL0040703 4-1250ML/CASE 40703', 6, '', 0, 'AFFINITY GOLDEN ANTI FOAM SOAP HIL0040703 4-1250ML/CASE', 'AFFINITY GOLDEN ANTI FOAM SOAP HIL0040703 4-1250ML/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_168_0vOMTMJgW.jpg', NULL, '#000000', '', '0', NULL, 54.85, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 1, 'affinity-golden-anti-foam-soap-hil0040703-4-1250ml-case', '');
INSERT INTO `products` VALUES (169, 'HL40803', 0, 'AFFINITY CITRUS ANTIMIC FOAM SOAP 4-1250ML/CASE 40803', 6, 'Designed to kill germs on hands and provide a clean, gentle hand washing experience with thick, rich foam. Triclosan free; active ingredient PCMX.\r\nFragrance: Citrus/Medicinal\r\nOrange color. Use with Affinity Manual Dispenser\r\n1250 mL, Case', 0, 'AFFINITY CITRUS ANTIMIC FOAM SOAP 4-1250ML/CASE', 'AFFINITY CITRUS ANTIMIC FOAM SOAP 4-1250ML/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_169_V6ANUnL6N.jpg', NULL, '#000000', '', '0', NULL, 49.85, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'affinity-citrus-antimic-foam-soap-4-1250ml-case', '');
INSERT INTO `products` VALUES (170, 'HL39402', 0, 'AFFINITY MAN CRAN FOAM SOAP TF 3-1000ML/CASE 39402', 6, 'This premium foaming soap has additional active ingredients that makes it our thickest and most luxurious foaming soap yet.\r\nMandarin-cranberry scent\r\nFor use with Affinity[R] Manual & Touch-Free dispensers\r\n1000 mL, Case', 0, 'AFFINITY MAN CRAN FOAM SOAP TF 3-1000ML/CASE', 'AFFINITY MAN CRAN FOAM SOAP TF 3-1000ML/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_170_Yv9fc3j6V.jpg', NULL, '#000000', '', '0', NULL, 49.85, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 2, 'affinity-man-cran-foam-soap-tf-3-1000ml-case', '');
INSERT INTO `products` VALUES (171, 'RCI550084', 0, 'BODY WASH OCEAN BREEZE GALLONS 1Gl 550084', 6, 'Ginger Lily Farms Club and Fitness Formula Ocean Breeze Body Wash is perfect for facilities looking for value yet quality products for their shower dispensers. Paraben and sulfate free formula features aromatic fragrances and lathering that members love.\r\nWrap your body in moisture with Ocean Breeze Body Wash in a soothing scent that leaves skin soft, smooth and free of harsh chemicals. Our body wash is specially formulated with naturally derived botanicals for a clean you can see and feel.', 0, 'BODY WASH OCEAN BREEZE GALLONS 1Gl', 'BODY WASH OCEAN BREEZE GALLONS 1Gl', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_171_HvztmvFa9.jpg', NULL, '#000000', '', '0', NULL, 14, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 9, 'body-wash-ocean-breeze-gallons-1gl', '');
INSERT INTO `products` VALUES (172, 'RCI550484', 0, 'SHAMPOO OCEAN BREEZE GALLONS 1Gl 550484', 6, 'Ginger Lily Farms Club and Fitness Formula Ocean Breeze Shampoo is perfect for facilities looking for value yet quality products for their shower dispensers. Paraben and sulfate free formula features aromatic fragrances and lathering that members love. Samples available upon request. Gallon.\r\nEscape with the soothing scent of cool ocean breezes that leaves hair soft, smooth and free of harsh chemicals. Our shampoo is specially formulated with naturally derived botanicals for a clean you can see and feel. Suitable for all hair types', 0, 'SHAMPOO OCEAN BREEZE GALLONS 1Gl', 'SHAMPOO OCEAN BREEZE GALLONS 1Gl', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_172_RJTRbUHOM.jpg', NULL, '#000000', '', '0', NULL, 14, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', NULL, 'shampoo-ocean-breeze-gallons-1gl', '');
INSERT INTO `products` VALUES (173, 'SP3097', 0, 'Consume Bacteria Digestant deodorant GL', 8, 'Multi-functional at its best! Consume is a cleaner, odor eliminator, stain remover, and drain maintainer. It naturally removes difficult organic soils from many surfaces including tile, concrete, steel, and carpet. Regular use of Consume eliminates organic build-up in drains, keeping them clear and odor-free. Cleans and eliminates odors on floors, in dumpsters, recycling containers, and portable toilets. Ideal for cleaning and odor control in many areas, such as carpets, drains, dumpsters, and more!\r\n\r\nCleaner, odor eliminator, stain remover and drain maintainer.\r\n-Dilution: Straight - 64 oz. makes gallon\r\n-pH 8.0 - 9.0\r\n-4 per case', 0, 'Consume Bacteria Digestant deodorant GL', 'Consume Bacteria Digestant deodorant GL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_173_4KODfgg8s.jpg', NULL, '#000000', '', '0', NULL, 12, NULL, NULL, NULL, NULL, NULL, 1, 'bottle|', 10, 'consume-bacteria-digestant-deodorant-gl', '');
INSERT INTO `products` VALUES (174, 'SZOGNPR-M-1M', 0, 'GLOVE,NITRILE BLU PF MD 100/BX GNPR-M-1M 4 MIL 10-BX/CASE', 2, 'Excellent quality, 100% latex-free nitrile.\r\nPowder Free.\r\nBest disposable gloves for chemical resistance.\r\nTextured for better gripping power.\r\nMeets FFDCA requirements for food contact.\r\nGreater tactile feel over other latex alternatives.\r\nStandard Length (9.65″ +/- 0.25″)\r\nCase: 10 boxes/100 per box.', 0, 'GLOVE,NITRILE BLU PF MD 100/BX GNPR-M-1M 4 MIL 10-BX/CASE', 'GLOVE,NITRILE BLU PF MD 100/BX GNPR-M-1M 4 MIL 10-BX/CASE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_174_K1cSuiz6y.jpg', '022818_174_Sy72ohHlW.jpg|', '#000000', '', '0', NULL, 5.19, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'glove-nitrile-blu-pf-md-100-bx-gnpr-m-1m-4-mil-10-bx-case', '');
INSERT INTO `products` VALUES (175, 'SZOGNPR-XL1M', 0, 'GLOVE,NITRILE BLU PF XL 100/BX GNPR-XL-1M', 2, 'Nitrile Gloves are the perfect compromise between latex and vinyl. Nitrile is made from an allergy safe compound that feels a lot like latex but it’s much stronger and is more comfortable to wear. Nitrile is perfect for demanding applications, especially cleaning and dishwashing.', 0, 'GLOVE,NITRILE BLU PF XL 100/BX GNPR-XL-1M', 'GLOVE,NITRILE BLU PF XL 100/BX GNPR-XL-1M', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_175_T1tFvr864.jpg', '022818_175_QezRXuhuF.jpg|', '#000000', '', '0', NULL, 5.19, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'glove-nitrile-blu-pf-xl-100-bx-gnpr-xl-1m', '');
INSERT INTO `products` VALUES (176, 'BW1002-CS', 0, 'TISSUE JUMBO 2PLY 1000'' 12/CS 10020 ECOSOFT GRN SEAL 9" UNIV', 28, 'Available 1 ply and 2 ply. 100% recycled and meets EPA guidelines for post-consumer wastepaper content. Jumbo tissue has a 9-inch diameter and is ideal for heavy traffic facilities.\r\n\r\nContains a minimum of 20% post-consumer waste, which meets EPA guidelines. Embossed for softness. Each roll equal to 5.3 rolls standard tissue.\r\n-Large Core, 3.32"; 9" diameter\r\n-Use Dispenser: 88700, 88800, 88900\r\n-12 rolls per case', 0, 'TISSUE JUMBO 2PLY 1000'' 12/CS 10020 ECOSOFT GRN SEAL 9" UNIV', 'TISSUE JUMBO 2PLY 1000'' 12/CS 10020 ECOSOFT GRN SEAL 9" UNIV', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_176_Bh1odGYsa.jpg', NULL, '#000000', '', '0', NULL, 35.82, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 3, 'tissue-jumbo-2ply-1000-12-cs-10020-ecosoft-grn-seal-9-univ', '');
INSERT INTO `products` VALUES (177, 'CZ19378', 0, 'COMPACT TOILET TISSUE NEW PACK 18/1500/CS CORELESS 4X4.5 WHT 19378', 1, 'High capacity coreless rolls decrease service intervals, reduce the risk of run out, have 95 less packaging waste, and require half the storage space verses standard bathroom tissue. Specifically designed to fit GP Compact Tissue Dispensers and increase tissue capacity while optimizing storage space, this cost-effective coreless tissue will satisfy all of your customer and employee needs.', 0, 'COMPACT TOILET TISSUE NEW PACK 18/1500/CS CORELESS 4X4.5 WHT', 'COMPACT TOILET TISSUE NEW PACK 18/1500/CS CORELESS 4X4.5 WHT', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_177_xfhVa2B5q.jpg', NULL, '#000000', '', '0', NULL, 42.82, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 13, 'compact-toilet-tissue-new-pack-18-1500-cs-coreless-4x4-5-wht', '');
INSERT INTO `products` VALUES (178, 'KC04007', 0, 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS 04007', 1, 'A high capacity, easy maintenance system which results in less run-outs and lower maintenance costs. 2-ply standard roll. FSC Certified.\r\n-4.0" W x 4.4" L; 5 1/2" roll diameter\r\n-Elemental chlorine-free (ECF) bleaching\r\n-1000 sheets per pkg, 36 pkgs per case', 0, 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_178_3FyGPjsZn.jpg', NULL, '#000000', '', '0', NULL, 55.94, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 7, 'coreless-toilet-tissue-2-ply-white-scott-36-1000-cs', '');
INSERT INTO `products` VALUES (179, 'KC13217', 0, 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506 13217', 1, 'Strong and absorbent. Provides home-like comfort at your business. Meets EPA standards; FSC® and EcoLogo® certified.\r\n-Made with 100% recycled fiber. 2 ply.\r\n-506 sheets per pack\r\n-80 rolls per case', 0, 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506', 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_179_t8i8EwlkY.jpg', NULL, '#000000', '', '0', NULL, 52.75, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'toilet-tissue-universal-2-ply-100-rec-epa-greenseal-80-506', '');
INSERT INTO `products` VALUES (180, 'MMGCBLUE', 0, 'TOWEL MICROFIBER GLASS BLUE', 1, 'Size:       Approximately 16”x18” (40cm x 46cm)\r\n    Color:      Light Blue\r\n    Blend:     80% Polyester / 20% Polyamide – 100% Microfiber\r\n    Denier:    .1-.2\r\n    Weight:   200 Grams per Square Meter\r\n   Edges:     Overlock Stitching', 0, 'TOWEL MICROFIBER GLASS BLUE', 'TOWEL MICROFIBER GLASS BLUE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_180_i3u5sjjIs.jpg', NULL, '#000000', '', '0', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'towel-microfiber-glass-blue', '');
INSERT INTO `products` VALUES (181, 'RM2642', 0, 'BRUTE CADDY BAG * YELLOW FITS 32GL, 40GL, & 44GL BRUTES', 7, 'Knock out quick cleanups on-the-go with onboard storage for spray bottles, microfiber cloths, brushes, can liners, latex gloves, and other cleaning supplies.\r\n-Heavy-duty vinyl for long life and easy cleaning\r\n-20" dia x 20.5" h; Yellow.', 0, 'BRUTE CADDY BAG * YELLOW FITS 32GL, 40GL, & 44GL BRUTES', 'BRUTE CADDY BAG * YELLOW FITS 32GL, 40GL, & 44GL BRUTES', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_181_wpBnxqpNr.jpg', NULL, '#000000', '', '0', NULL, 43, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 3, 'brute-caddy-bag-yellow-fits-32gl-40gl-44gl-brutes', '');
INSERT INTO `products` VALUES (182, 'BW41000', 0, 'TOWEL HOUSEHOLD ROLL WHITE EPA 30/90/CS ECOSOFT 100% RECYCLE 41000', 1, '100% recycled and contains a minimum of 40% post-consumer waste, which meets EPA guidelines. This household toweling is heavily embossed for maximum absorbency and performance, with the wet strength needed for use in business and industry.\r\n\r\n-2 Ply\r\n-11" x 9"\r\n-90 sheets per pkg.; 30 pkgs. per case', 0, 'TOWEL HOUSEHOLD ROLL WHITE EPA 30/90/CS ECOSOFT 100% RECYCLE', 'TOWEL HOUSEHOLD ROLL WHITE EPA 30/90/CS ECOSOFT 100% RECYCLE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_182_l66b9tnsR.jpg', NULL, '#000000', '', '0', NULL, 32.73, NULL, NULL, NULL, NULL, NULL, 1, 'box|', NULL, 'towel-household-roll-white-epa-30-90-cs-ecosoft-100-recycle', '');
INSERT INTO `products` VALUES (183, 'BW458', 0, 'ROLL TOWEL UNIVER NAT 8 458', 1, 'Green Seal® 100% recycled 8" universal roll towels. Certified by Green Seal, Inc. in Washington, DC. Meets environmental standards. Green Seal®. Contains a minimum of 40% post-consumer waste, which meets EPA guidelines. Can be dispensed through universal roll towel dispensers. 1.9" universal core; Use dispenser: 16000, 16300, 16500.\r\n8" x 800'', Natural, 6/cs', 0, 'ROLL TOWEL UNIVER NAT 8', 'ROLL TOWEL UNIVER NAT 8" 800'' 45800 ECOSOFT GREEN SEAL 6/CS.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_183_S31riEGZ5.jpg', NULL, '#000000', '', '0', NULL, 33.75, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'roll-towel-univer-nat-8-800-45800-ecosoft-green-seal-6-cs', '');
INSERT INTO `products` VALUES (184, 'BW459', 0, 'ROLL TOWEL UNIVER 8 459', 1, 'Green Seal® 100% recycled 8" universal roll towels. Certified by Green Seal, Inc. in Washington, DC. Meets environmental standards. Green Seal®. Contains a minimum of 40% post-consumer waste, which meets EPA guidelines. Can be dispensed through universal roll towel dispensers. 1.9" universal core; Use dispenser: 16000, 16300, 16500.\r\n8" x 800'', Natural White, 6/cs', 0, 'ROLL TOWEL UNIVER 8', 'ROLL TOWEL UNIVER 8" WHT 800'' 45900 ECOSOFT GREEN SEAL 6/CS.', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_184_o2dYsI5Q6.jpg', NULL, '#000000', '', '0', NULL, 35.87, NULL, NULL, NULL, NULL, NULL, 1, 'box|', NULL, 'roll-towel-univer-8-wht-800-45900-ecosoft-green-seal-6-cs', '');
INSERT INTO `products` VALUES (185, 'BW480', 0, 'TOWEL MULTIFOLD NATURAL 4M/CS ECOSOFT GREEN SEAL  480', 1, '100% recycled. Contains a minimum of 40% post-consumer waste, which meets EPA guidelines.\r\nUse Dispenser: 53200, 53500\r\n9 1/8" x 9 1/2", Natural, 16/250/cs\r\nThis quality multifold towel is designed for those customers who support the recycling movement and request toweling that helps create a cleaner environment. This toweling is ideal for lodging/hospitality properties and commercial buildings. Made entirely from recovered fibers.', 0, 'TOWEL MULTIFOLD NATURAL 4M/CS 48000 ECOSOFT GREEN SEAL', 'TOWEL MULTIFOLD NATURAL 4M/CS 48000 ECOSOFT GREEN SEAL', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_185_m4TnL7GiK.jpg', NULL, '#000000', '', '0', NULL, 25.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'towel-multifold-natural-4m-cs-48000-ecosoft-green-seal', '');
INSERT INTO `products` VALUES (186, 'BW485', 0, 'TOWEL, MULTIFOLD WHT 4000/CS  ECOSOFT 485', 1, '100% recycled. Contains a minimum of 40% post-consumer waste, which meets EPA guidelines.\r\nUse Dispenser: 53200, 53500\r\n9 1/8" x 9 1/2", White, 16/250/cs\r\nThis quality multifold towel is designed for those customers who support the recycling movement and request toweling that helps create a cleaner environment. This toweling is ideal for lodging/hospitality properties and commercial buildings. Made entirely from recovered fibers.', 0, 'TOWEL, MULTIFOLD WHT 4000/CS 48500 ECOSOFT', 'TOWEL, MULTIFOLD WHT 4000/CS 48500 ECOSOFT', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_186_JJNLo1An1.jpg', NULL, '#000000', '', '0', NULL, 29.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'towel-multifold-wht-4000-cs-48500-ecosoft', '');
INSERT INTO `products` VALUES (187, 'BW6002', 0, 'CENTER PULL TOWEL, 6/600''/CS 06002 ECOSOFT WHITE 6002', 1, 'Made from high quality fiber. Features embossing for maximum softness and absorbency.\r\n-2 Ply\r\n-6.92" x 12", White\r\n-6 rolls per case\r\nProduct Class: CENTER PULL WIPERS/TOWEL', 0, 'CENTER PULL TOWEL, 6/600''/CS 06002 ECOSOFT WHITE', 'CENTER PULL TOWEL, 6/600''/CS 06002 ECOSOFT WHITE', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_187_hxRONrEob.jpg', NULL, '#000000', '', '0', NULL, 35.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 5, 'center-pull-towel-6-600-cs-06002-ecosoft-white', '');
INSERT INTO `products` VALUES (188, 'CZ89420', 0, 'ENMOTION TOWEL, RECESSED DISP HIGH CAPACITY WHITE 6/700''/CS 89420', 1, 'Pack Size: 6 rolls/case | Dimensions: 8.25" x 700'''' | Color: White | Size: \r\nLong Desc: These cost-effective, high-quality, high capacity roll towels are specifically engineered to be used with our innovative 59466 enMotion Recessed Automated Towel Dispenser to provide reliable towel dispensing at the wave of a hand. Each high-capacity roll provides up to 800 hand dries for continuous service and reduced service visits. Choose these towels for dependable, cost-saving performance and customer satisfaction.', 0, 'ENMOTION TOWEL, RECESSED DISP HIGH CAPACITY WHITE 6/700''/CS', 'ENMOTION TOWEL, RECESSED DISP HIGH CAPACITY WHITE 6/700''/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_188_XKMznbqYx.jpg', NULL, '#000000', '', '0', NULL, 59.87, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', 1, 'enmotion-towel-recessed-disp-high-capacity-white-6-700-cs', '');
INSERT INTO `products` VALUES (189, 'CZ89460', 0, 'ENMOTION ROLL TOWEL 10 89460', 1, 'These cost-effective, high-quality roll towels are specifically engineered to be used with our enMotion® Wall-Mount Automated Towel Dispenser or enMotion® Impulse® 10 Towel Dispenser to provide reliable towel dispensing at the wave of a hand. Choose these towels for dependable, cost-saving performance and customer satisfaction.', 0, 'ENMOTION ROLL TOWEL 10', 'ENMOTION ROLL TOWEL 10"X800'' WHITE PREMIUM LG CAPACITY 6/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_189_8cq30Uqng.jpg', '022818_189_Zk7QOurZq.jpg|', '#000000', '', '0', NULL, 66.85, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 9, 'enmotion-roll-towel-10-x800-white-premium-lg-capacity-6-cs', '');
INSERT INTO `products` VALUES (190, 'KC01980', 0, 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD 01980', 1, 'Meets EPA standards with a minimum of 40% post-consumer recycled fiber and total min. of 50% recycled fiber.\r\nMeets EPA standards; FSC[R] and EcoLogo[R] certified\r\n9.4" x 12.4"; Use dispenser: 09217, 09905, 09906\r\n9.4" x 12.4", White, 25/175/cs', 0, 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD', 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD "M" 4375/CS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_190_fubzpECcs.jpg', NULL, '#000000', '', '0', NULL, 47.85, NULL, NULL, NULL, NULL, NULL, 1, 'Box|', NULL, 'towel-multifold-white-epa-9-4x12-4-scottfold-m-4375-cs', '');
INSERT INTO `products` VALUES (191, 'PT100331', 0, 'FILTER, PAPER COACH & MEGA   10/PKG 100331', 7, 'Use with Super CoachVac® HEPA, CoachVac, MegaVac. Open collared making them easy to empty and reuse several times.\r\n-1 pack of 10\r\nTo safeguard the Indoor Air Quality of your facilities and to optimize the performance of your vacuum cleaner, change filters once they are half full. Four Level Filtration system provides advanced protection against there introduction of pollutants back into an environment. Has 21% more filtration area than non-pleated filters. Fully laminated inner liner eliminates shredding. Dual layered construction captures fine particles, improving Indoor Air Quality. Intercept microbial treatment helps contain odors and prevent the growth of mold and bacteria.', 0, 'FILTER, PAPER COACH & MEGA   10/PKG', 'FILTER, PAPER COACH & MEGA   10/PKG', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_191_ZOXHuhUCx.jpg', NULL, '#000000', '', '0', NULL, 12, NULL, NULL, NULL, NULL, NULL, 1, 'Pack|', 8, 'filter-paper-coach-mega-10-pkg', '');
INSERT INTO `products` VALUES (192, 'PT100431', 0, 'PRO TEAM 6 QT MICRO FILTER 10/PKG - QUARTERVAC/AVIATION 100431', 1, 'Use with Super QuarterVac HEPA, QuarterVac, TailVac, QuietPro BP HEPA, GoCartVac, AviationVac. Open collared making them easy to empty and reuse several times.\r\n-1 pack of 10\r\nTo safeguard the Indoor Air Quality of your facilities and to optimize the performance of your vacuum cleaner, change filters once they are half full. Four Level Filtration system provides advanced protection against there introduction of pollutants back into an environment. Has 21% more filtration area than non-pleated filters. Fully laminated inner liner eliminates shredding. Dual layered construction captures fine particles, improving Indoor Air Quality. Intercept microbial treatment helps contain odors and prevent the growth of mold and bacteria.', 0, 'PRO TEAM 6 QT MICRO FILTER 10/PKG - QUARTERVAC/AVIATION', 'PRO TEAM 6 QT MICRO FILTER 10/PKG - QUARTERVAC/AVIATION', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_192_vXFEPzM5G.jpg', NULL, '#000000', '', '0', NULL, 7, NULL, NULL, NULL, NULL, NULL, 1, 'box|', NULL, 'pro-team-6-qt-micro-filter-10-pkg---quartervac-aviation', '');
INSERT INTO `products` VALUES (193, 'PT101338', 0, 'WAND 2 PIECE 2 BEND', 7, 'Constructed to last, ensuring you get the most productivity out of your equipment. lightweight by design, making it easy to clean the toughest messes.\r\n-1 1/2" size\r\n-Complete with tool couplings', 0, 'WAND 2 PIECE 2 BEND', 'WAND 2 PIECE 2 BEND', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_193_LPYkumF06.jpg', NULL, '#000000', '', '0', NULL, 40, NULL, NULL, NULL, NULL, NULL, 1, 'box|', NULL, 'wand-2-piece-2-bend', '');
INSERT INTO `products` VALUES (194, 'PT107310', 0, 'SUPER COACH PRO 6 W/XOVER KIT', 7, 'The next generation in cleaning comfort. Ergonomic backpack design with patented articulating harness increases range of motion, reduces fatigue, and improves productivity. New triangular shape fits closer to the body and moves with the user, reducing the chance of bumping into doorways, walls, or furniture. The die-cast aluminum tri-latch system assures air performance. Four Level Filtration w/HEPA captures 99.97 percent of particulates 0.3 microns or larger, including fine carbon dust from the motor, for improved IAQ. Due to the angle of the rear exhaust filters, the unit will not disturb paper on desks as it passes. Visit www.proteamnextgen.com.\r\n\r\nIncludes: 1 1/2" static-dissipating vacuum hose, a 50'' extension cord and two Intercept Micro Filters.\r\n\r\n\r\nWatts: 1108 W, 66 dBA, 159 CFM, 96" Static Lift, 9.5A amp draw, 6 qt capacity', 0, 'SUPER COACH PRO 6 W/XOVER KIT', 'SUPER COACH PRO 6 W/XOVER KIT', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_194_3cf4BKyxc.jpg', NULL, '#000000', '', '0', NULL, 370, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', 1, 'super-coach-pro-6-w-xover-kit', '');
INSERT INTO `products` VALUES (195, 'PT840011', 0, 'HARNESS ASSEMBLY COMPLETE FOR  SUPER COACH PRO 6 & 10', 7, 'Lightweight. Fully loaded. Upgrade your Super Coach Pro® with a FlexFit® harness and discover a higher level of cleaning efficiency, comfort and power. Increased padding. Improved sternum strap strength and adjustability. Improved lumbar support.\r\nNew harness with enhanced back and shoulder pads and open weave, heat-dissipating design to upgrade on existing Super Coach Pro® units.', 0, 'HARNESS ASSEMBLY COMPLETE FOR  SUPER COACH PRO 6 & 10', 'HARNESS ASSEMBLY COMPLETE FOR  SUPER COACH PRO 6 & 10', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '022818_195_pEBMe95MN.jpg', NULL, '#000000', '', '0', NULL, 110, NULL, NULL, NULL, NULL, NULL, 1, 'cartons boxes|', NULL, 'harness-assembly-complete-for-super-coach-pro-6-10', '');
INSERT INTO `products` VALUES (196, 'PT101155', 0, 'REPLACEMENT BRUSH FOR EZ GLIDE TOOL (PT100147)', 7, 'REPLACEMENT BRUSH FOR EZ GLIDE TOOL (PT100147)', 0, 'REPLACEMENT BRUSH FOR EZ GLIDE TOOL (PT100147)', 'REPLACEMENT BRUSH FOR EZ GLIDE TOOL (PT100147)', '1', '0', '1', '0', '0', '1', '1', '0', '0', '0', '0', NULL, NULL, 0, '022818_196_V2dpo0JjH.jpg', NULL, '#000000', '', '0', NULL, 3.5, NULL, NULL, NULL, NULL, NULL, 1, 'box|', 17, 'replacement-brush-for-ez-glide-tool-pt100147', '');

-- --------------------------------------------------------

-- 
-- Структура таблицы `rel_states_products`
-- 

CREATE TABLE `rel_states_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Дамп данных таблицы `rel_states_products`
-- 

INSERT INTO `rel_states_products` VALUES (1, 13, 1);
INSERT INTO `rel_states_products` VALUES (2, 13, 2);

-- --------------------------------------------------------

-- 
-- Структура таблицы `rel_suppliers_products`
-- 

CREATE TABLE `rel_suppliers_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

-- 
-- Дамп данных таблицы `rel_suppliers_products`
-- 

INSERT INTO `rel_suppliers_products` VALUES (31, 1, 196);
INSERT INTO `rel_suppliers_products` VALUES (32, 3, 196);

-- --------------------------------------------------------

-- 
-- Структура таблицы `rel_upsell_prod`
-- 

CREATE TABLE `rel_upsell_prod` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upsell_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- Дамп данных таблицы `rel_upsell_prod`
-- 

INSERT INTO `rel_upsell_prod` VALUES (8, 2, 10);
INSERT INTO `rel_upsell_prod` VALUES (9, 1, 61);
INSERT INTO `rel_upsell_prod` VALUES (10, 4, 61);

-- --------------------------------------------------------

-- 
-- Структура таблицы `rel_warehouse_product`
-- 

CREATE TABLE `rel_warehouse_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_price` float DEFAULT NULL,
  `warehouse_tax` varchar(50) DEFAULT NULL,
  `warehouse_discount` varchar(50) DEFAULT NULL,
  `warehouse_stock` int(11) DEFAULT NULL,
  `warehouse_count` int(11) DEFAULT NULL,
  `warehouse_availability` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 AUTO_INCREMENT=153 ;

-- 
-- Дамп данных таблицы `rel_warehouse_product`
-- 

INSERT INTO `rel_warehouse_product` VALUES (17, 1, 62, 28.45, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (18, 1, 63, 42.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (20, 1, 65, 37.81, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (21, 1, 66, 37.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (22, 2, 66, 0, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (23, 1, 67, 39.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (24, 1, 68, 52.87, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (25, 1, 69, 11.99, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (26, 1, 70, 4.98, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (27, 1, 71, 21.75, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (28, 1, 72, 11.67, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (29, 1, 73, 6.9, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (30, 1, 74, 29.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (31, 1, 75, 59.87, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (32, 1, 76, 49.87, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (33, 1, 77, 55.94, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (34, 1, 78, 52.75, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (35, 1, 79, 14.75, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (36, 1, 80, 5.19, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (37, 1, 82, 39.97, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (38, 1, 83, 51.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (39, 1, 84, 27, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (40, 1, 85, 15.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (42, 1, 86, 68.99, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (43, 1, 87, 49.95, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (44, 1, 88, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (45, 1, 89, 5, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (46, 1, 90, 41.19, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (47, 1, 91, 35.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (48, 1, 92, 37.81, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (49, 1, 93, 42.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (50, 1, 94, 39.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (51, 1, 95, 39.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (52, 1, 96, 52.85, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (53, 1, 97, 4, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (55, 1, 99, 35.56, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (56, 1, 100, 49, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (57, 1, 101, 27, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (58, 1, 102, 6.68, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (59, 1, 103, 12, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (60, 1, 104, 4.98, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (61, 1, 105, 7.35, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (62, 1, 106, 18, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (63, 1, 107, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (64, 1, 108, 9.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (65, 1, 109, 42, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (66, 1, 110, 6.5, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (67, 1, 111, 4.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (68, 1, 112, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (69, 1, 113, 59.95, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (70, 1, 114, 29.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (71, 1, 115, 13, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (72, 1, 116, 47.89, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (73, 1, 117, 15.98, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (74, 1, 118, 8.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (75, 1, 119, 25, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (76, 1, 120, 7, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (77, 1, 121, 7.16, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (78, 1, 122, 6.99, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (79, 1, 123, 10, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (80, 1, 124, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (81, 1, 125, 15, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (82, 1, 126, 93, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (83, 1, 127, 44.96, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (84, 1, 128, 69.75, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (85, 1, 129, 7.28, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (86, 1, 130, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (87, 1, 131, 4, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (88, 1, 132, 15, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (89, 1, 133, 84.25, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (90, 1, 134, 27.83, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (91, 1, 135, 68.95, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (92, 1, 136, 45.04, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (93, 1, 137, 35.87, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (94, 1, 138, 35.97, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (95, 1, 139, 37.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (96, 1, 140, 29.95, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (97, 1, 141, 90, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (98, 1, 142, 79.88, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (99, 1, 143, 3, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (100, 1, 144, 34, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (101, 1, 145, 35.5, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (102, 1, 146, 68.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (103, 1, 147, 24, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (104, 1, 148, 28, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (105, 1, 149, 15, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (106, 1, 150, 8, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (107, 1, 151, 24, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (108, 1, 152, 10, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (109, 1, 153, 29.8, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (110, 1, 154, 27.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (111, 1, 155, 52.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (112, 1, 156, 35.94, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (113, 1, 157, 160, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (114, 1, 158, 42.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (115, 1, 159, 8.99, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (116, 1, 160, 51.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (117, 1, 161, 39.97, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (118, 1, 162, 39.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (119, 1, 163, 15.23, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (120, 1, 164, 25, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (121, 1, 165, 18.45, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (122, 1, 166, 49.95, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (123, 1, 167, 49.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (124, 1, 168, 54.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (125, 1, 169, 49.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (126, 1, 170, 49.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (127, 1, 171, 14, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (128, 1, 172, 14, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (129, 1, 173, 12, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (130, 1, 174, 5.19, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (131, 1, 175, 5.19, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (132, 1, 176, 35.82, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (133, 1, 177, 42.82, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (134, 1, 178, 55.94, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (135, 1, 179, 52.75, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (136, 1, 180, 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (137, 1, 181, 43, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (138, 1, 182, 32.73, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (139, 1, 183, 33.75, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (140, 1, 184, 35.87, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (141, 1, 185, 25.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (142, 1, 186, 29.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (143, 1, 187, 35.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (144, 1, 188, 59.87, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (145, 1, 189, 66.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (146, 1, 190, 47.85, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (147, 1, 191, 12, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (148, 1, 192, 7, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (149, 1, 193, 40, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (150, 1, 194, 360, '0', '0', 0, 0, 1);
INSERT INTO `rel_warehouse_product` VALUES (151, 1, 195, 110, NULL, NULL, NULL, NULL, 1);
INSERT INTO `rel_warehouse_product` VALUES (152, 1, 196, 3.5, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

-- 
-- Структура таблицы `related_аdditions`
-- 

CREATE TABLE `related_аdditions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `old_price` int(10) NOT NULL DEFAULT '0',
  `new_price` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- Дамп данных таблицы `related_аdditions`
-- 

INSERT INTO `related_аdditions` VALUES (1, 7, 25, 'Параметр 1', 'Описание дополнения', 350, 500);
INSERT INTO `related_аdditions` VALUES (2, 7, 26, 'Параметр_2', '', 100, 50);
INSERT INTO `related_аdditions` VALUES (3, 7, 27, 'Параметр_21', '', 100, 50);
INSERT INTO `related_аdditions` VALUES (4, 8, 28, 'Параметр 3', '', 1000, 950);
INSERT INTO `related_аdditions` VALUES (5, 8, 29, 'Параметр 4', '', 1550, 500);
INSERT INTO `related_аdditions` VALUES (7, 0, 0, 'Дополнения 1', 'Модель описание', 0, 0);
INSERT INTO `related_аdditions` VALUES (8, 0, 0, 'Дополнения 2', 'Описание Модели 2', 0, 0);

-- --------------------------------------------------------

-- 
-- Структура таблицы `related_assingment`
-- 

CREATE TABLE `related_assingment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `related_product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Дамп данных таблицы `related_assingment`
-- 

INSERT INTO `related_assingment` VALUES (1, 1, '2,3,4,5,6,7,8');

-- --------------------------------------------------------

-- 
-- Структура таблицы `settings`
-- 

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titleSite` text,
  `descriptionSite` text,
  `minSumCart` int(11) DEFAULT '1',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `titleHome` text,
  `descriptionHome` text,
  `googleCode` text,
  `permissionComments` tinyint(2) DEFAULT '0',
  `contentHomePage` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Дамп данных таблицы `settings`
-- 

INSERT INTO `settings` VALUES (1, 'ZupplyBox', 'ZUPPLY BOX description', 10, 'test@admin.com', '206-707-9407', 'Home', '', 'kq2dHJGUktWDtrj0vjaezO6k-yEQFPjq-1aL_cQARck', 0, '&lt;div class=&quot;benefitsBox clear&quot;&gt;\r\n&lt;h3 class=&quot;stipeHeading&quot;&gt;Benefits for your Business&lt;/h3&gt;\r\n\r\n&lt;div class=&quot;textInformer&quot;&gt;\r\n&lt;p&gt;When you buy from Zupply&amp;nbsp;Box you support your local business and your local economy. Companies from your area deliver directly to your&amp;nbsp;door at a competitive price, great&amp;nbsp;customer service and you invest in your local schools, infrastructure and job market.&lt;/p&gt;\r\n\r\n&lt;p&gt;Everything in one place for all your business needs. Fast free local delivery. When you buy from Zupply&amp;nbsp;Box you support your local business and your local economy.&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;imageIdentity&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n');

-- --------------------------------------------------------

-- 
-- Структура таблицы `settings_slider`
-- 

CREATE TABLE `settings_slider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8,
  `description` text CHARACTER SET utf8,
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Дамп данных таблицы `settings_slider`
-- 

INSERT INTO `settings_slider` VALUES (1, '', '&lt;div class=&quot;videoSplitter clear&quot;&gt;\r\n&lt;video controls=&quot;controls&quot; height=&quot;267&quot; poster=&quot;video/del.jpg&quot; width=&quot;400&quot;&gt;&lt;source avc1.42e01e=&quot;&quot; src=&quot;http://zupplybox.com/video/zupply.mp4&quot; type=&quot;video/mp4; codecs=&quot; /&gt; Тег video не поддерживается вашим браузером. Обновитесь. &lt;a href=&quot;../video/duel.mp4&quot;&gt;Скачайте видео&lt;/a&gt;.&lt;/video&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;videoSplitter clear&quot;&gt;\r\n&lt;h2 class=&quot;wellCome&quot;&gt;Welcome.&lt;/h2&gt;\r\n&lt;a class=&quot;button&quot; href=&quot;/registration&quot;&gt;Create account&lt;/a&gt;&lt;/div&gt;\r\n', '');

-- --------------------------------------------------------

-- 
-- Структура таблицы `settings_statictext`
-- 

CREATE TABLE `settings_statictext` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_text` text,
  `upsell_text` text,
  `order_final_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Дамп данных таблицы `settings_statictext`
-- 

INSERT INTO `settings_statictext` VALUES (1, 'example text_1', 'example upsell text_4', 'example final text_4');

-- --------------------------------------------------------

-- 
-- Структура таблицы `special_mark`
-- 

CREATE TABLE `special_mark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- 
-- Дамп данных таблицы `special_mark`
-- 

INSERT INTO `special_mark` VALUES (1, 'sale', 'mark_sale');
INSERT INTO `special_mark` VALUES (2, 'stock', 'stock_id');
INSERT INTO `special_mark` VALUES (3, 'upsell', 'upsell_product');
INSERT INTO `special_mark` VALUES (4, 'hit', 'mark_hit');
INSERT INTO `special_mark` VALUES (5, 'expert', 'mark_expert');
INSERT INTO `special_mark` VALUES (6, 'discontinued', 'mark_discontinued');
INSERT INTO `special_mark` VALUES (8, 'fast delivery', 'fast_delivery');
INSERT INTO `special_mark` VALUES (9, 'free delivery', 'free_delivery');
INSERT INTO `special_mark` VALUES (10, 'perfect delivery', 'perfect_delivery');
INSERT INTO `special_mark` VALUES (11, 'exchange product', 'exchange_prod');
INSERT INTO `special_mark` VALUES (12, 'warrantly months', 'warranty_months');
INSERT INTO `special_mark` VALUES (13, 'upsell product', 'upsell_product');

-- --------------------------------------------------------

-- 
-- Структура таблицы `states`
-- 

CREATE TABLE `states` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=52 ;

-- 
-- Дамп данных таблицы `states`
-- 

INSERT INTO `states` VALUES (1, 'Alaska', 'AK');
INSERT INTO `states` VALUES (2, 'Alabama', 'AL');
INSERT INTO `states` VALUES (3, 'Arkansas', 'AR');
INSERT INTO `states` VALUES (4, 'Arizona', 'AZ');
INSERT INTO `states` VALUES (5, 'California', 'CA');
INSERT INTO `states` VALUES (6, 'Colorado', 'CO');
INSERT INTO `states` VALUES (7, 'Connecticut', 'CT');
INSERT INTO `states` VALUES (8, 'District of Columbia', 'DC');
INSERT INTO `states` VALUES (9, 'Delaware', 'DE');
INSERT INTO `states` VALUES (10, 'Florida', 'FL');
INSERT INTO `states` VALUES (11, 'Georgia', 'GA');
INSERT INTO `states` VALUES (12, 'Hawaii', 'HI');
INSERT INTO `states` VALUES (13, 'Iowa', 'IA');
INSERT INTO `states` VALUES (14, 'Idaho', 'ID');
INSERT INTO `states` VALUES (15, 'Illinois', 'IL');
INSERT INTO `states` VALUES (16, 'Indiana', 'IN');
INSERT INTO `states` VALUES (17, 'Kansas', 'KS');
INSERT INTO `states` VALUES (18, 'Kentucky', 'KY');
INSERT INTO `states` VALUES (19, 'Louisiana', 'LA');
INSERT INTO `states` VALUES (20, 'Massachusetts', 'MA');
INSERT INTO `states` VALUES (21, 'Maryland', 'MD');
INSERT INTO `states` VALUES (22, 'Maine', 'ME');
INSERT INTO `states` VALUES (23, 'Michigan', 'MI');
INSERT INTO `states` VALUES (24, 'Minnesota', 'MN');
INSERT INTO `states` VALUES (25, 'Missouri', 'MO');
INSERT INTO `states` VALUES (26, 'Mississippi', 'MS');
INSERT INTO `states` VALUES (27, 'Montana', 'MT');
INSERT INTO `states` VALUES (28, 'North Carolina', 'NC');
INSERT INTO `states` VALUES (29, 'North Dakota', 'ND');
INSERT INTO `states` VALUES (30, 'Nebraska', 'NE');
INSERT INTO `states` VALUES (31, 'New Hampshire', 'NH');
INSERT INTO `states` VALUES (32, 'New Jersey', 'NJ');
INSERT INTO `states` VALUES (33, 'New Mexico', 'NM');
INSERT INTO `states` VALUES (34, 'Nevada', 'NV');
INSERT INTO `states` VALUES (35, 'New York', 'NY');
INSERT INTO `states` VALUES (36, 'Ohio', 'OH');
INSERT INTO `states` VALUES (37, 'Oklahoma', 'OK');
INSERT INTO `states` VALUES (38, 'Oregon', 'OR');
INSERT INTO `states` VALUES (39, 'Pennsylvania', 'PA');
INSERT INTO `states` VALUES (40, 'Rhode Island', 'RI');
INSERT INTO `states` VALUES (41, 'South Carolina', 'SC');
INSERT INTO `states` VALUES (42, 'South Dakota', 'SD');
INSERT INTO `states` VALUES (43, 'Tennessee', 'TN');
INSERT INTO `states` VALUES (44, 'Texas', 'TX');
INSERT INTO `states` VALUES (45, 'Utah', 'UT');
INSERT INTO `states` VALUES (46, 'Virginia', 'VA');
INSERT INTO `states` VALUES (47, 'Vermont', 'VT');
INSERT INTO `states` VALUES (48, 'Washington', 'WA');
INSERT INTO `states` VALUES (49, 'Wisconsin', 'WI');
INSERT INTO `states` VALUES (50, 'West Virginia', 'WV');
INSERT INTO `states` VALUES (51, 'Wyoming', 'WY');

-- --------------------------------------------------------

-- 
-- Структура таблицы `stock`
-- 

CREATE TABLE `stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `mini_description` text,
  `stock_img` varchar(255) DEFAULT NULL,
  `stock_thumbnail` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `activation` tinyint(2) NOT NULL DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- 
-- Дамп данных таблицы `stock`
-- 

INSERT INTO `stock` VALUES (23, 'stock-test#9', 'stock-test-9', 'asasas', 'dfdfdfdfdfdf', '121117_23_2eXmMjeZ1.png', '121117_23_hd3m1Rs5T.png', NULL, '2018-01-20 11:11:00', 0, NULL);

-- --------------------------------------------------------

-- 
-- Структура таблицы `subscription_goods`
-- 

CREATE TABLE `subscription_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL,
  `subscribe_date` datetime NOT NULL,
  `unsubscribe_date` datetime NOT NULL,
  `code_unsubscribe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- 
-- Дамп данных таблицы `subscription_goods`
-- 

INSERT INTO `subscription_goods` VALUES (7, 'admin', 'pudzia009@gmail.com', 1, 2, '2017-07-16 01:03:13', '0000-00-00 00:00:00', 'XCPrwtmCMz');
INSERT INTO `subscription_goods` VALUES (8, 'admin', 'pudzia009@gmail.com', 0, 5, '2017-07-16 02:51:21', '2017-07-16 03:12:05', 'X236jJBfth');
INSERT INTO `subscription_goods` VALUES (9, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-16 22:21:57', '2017-07-16 22:25:08', '8xNhKig8uR');
INSERT INTO `subscription_goods` VALUES (10, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-16 22:25:29', '2017-07-16 22:36:09', 'WgKPKOC41f');
INSERT INTO `subscription_goods` VALUES (11, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-21 13:45:28', '2017-07-21 13:47:15', 'NA6abJRnsO');
INSERT INTO `subscription_goods` VALUES (12, 'admincv', 'sdsdsd@sdsd.com', 1, 1, '2017-07-21 14:08:06', '0000-00-00 00:00:00', '4ahjOvwVEj');
INSERT INTO `subscription_goods` VALUES (13, 'dsdsd', 'sdsdsd@dsdsdsd.com', 1, 1, '2017-07-21 14:08:46', '0000-00-00 00:00:00', 'OzcZeehSgn');
INSERT INTO `subscription_goods` VALUES (14, 'dfdfdf', 'dfdf@dfdf.com', 1, 1, '2017-07-21 14:10:26', '0000-00-00 00:00:00', '874SUi96xn');
INSERT INTO `subscription_goods` VALUES (15, 'dfdfdfdfdf', 'dfdfdf@dsdsds.com', 1, 1, '2017-07-21 14:14:26', '0000-00-00 00:00:00', 'TR7MLNKWhR');
INSERT INTO `subscription_goods` VALUES (16, 'sdsdsdsd', 'pudzia009@gmail.com', 1, 1, '2017-07-21 14:16:05', '0000-00-00 00:00:00', 'e48Z7joh3N');
INSERT INTO `subscription_goods` VALUES (17, 'Rtrttrtu', 'dffd@ghhhh.cpm', 1, 4, '2017-07-21 20:14:30', '0000-00-00 00:00:00', 'oizMDYsbzm');

-- --------------------------------------------------------

-- 
-- Структура таблицы `suppliers`
-- 

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `meta_d` text,
  `meta_k` text,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `visible` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Дамп данных таблицы `suppliers`
-- 

INSERT INTO `suppliers` VALUES (1, 'supplier2', 'supplier2', 'supplier', 'supplier', 'supplier', 'Arizona', 'test city', 87000, '', '', '1');
INSERT INTO `suppliers` VALUES (3, 'test-2', 'test 2', 'description', 'meta desc', 'meta key', 'Alaska', 'fgfg', 7878, 'test@email.com', '+1100800500', '1');
INSERT INTO `suppliers` VALUES (5, 'test4', 'test4', '', '', '', 'Alaska', 'test city', 87500, 'freeit@gmail.com', '917889999', '1');

-- --------------------------------------------------------

-- 
-- Структура таблицы `team_admin_access`
-- 

CREATE TABLE `team_admin_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `team_alias` varchar(100) CHARACTER SET utf8 NOT NULL,
  `access_level` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Дамп данных таблицы `team_admin_access`
-- 

INSERT INTO `team_admin_access` VALUES (1, 'Managers ', 'managers', 0);
INSERT INTO `team_admin_access` VALUES (2, 'Editors', 'editors', 0);

-- --------------------------------------------------------

-- 
-- Структура таблицы `team_admin_users`
-- 

CREATE TABLE `team_admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_time_work` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `ext_phone` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `admin_access_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Дамп данных таблицы `team_admin_users`
-- 

INSERT INTO `team_admin_users` VALUES (1, 'general_manager', 'manager@gmail.com', '123456', 'General manager', '', '', '', 0, '1969-12-31', '', 1);
INSERT INTO `team_admin_users` VALUES (2, 'manager 1', 'manager1@gmail.com', '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'name', '', '+11111111111', '+11111111111', 20, '1980-12-20', 'education', 1);

-- --------------------------------------------------------

-- 
-- Структура таблицы `test`
-- 

CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `article` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `available` tinyint(2) NOT NULL DEFAULT '1',
  `stock_id` int(10) unsigned NOT NULL,
  `upsell_product` enum('0','1') NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  `count_prod` int(11) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  `states_id` int(10) NOT NULL DEFAULT '0',
  `states_name` varchar(255) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `availability_id` int(10) unsigned NOT NULL DEFAULT '0',
  `availability_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Дамп данных таблицы `test`
-- 

INSERT INTO `test` VALUES (13, '#21221', 'product-test_13_13', 21, 1, 1, '0', 249.99, 200, 13, 1, 1, 'washington', 'category_1_1_1', 1, 'published');
INSERT INTO `test` VALUES (13, '#21221', 'product-test_13_13', 21, 1, 1, '0', 249.99, 200, 13, 2, 2, 'vermont', 'category_1_1_1', 1, 'published');

-- --------------------------------------------------------

-- 
-- Структура таблицы `upsell`
-- 

CREATE TABLE `upsell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upsell_price` float DEFAULT NULL,
  `default_price` float DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `position` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- 
-- Дамп данных таблицы `upsell`
-- 

INSERT INTO `upsell` VALUES (1, 1, 'upsell 1', 1200, NULL, 'upsell_1', 1);
INSERT INTO `upsell` VALUES (4, 3, 'test_2', 850, 1200, 'null', NULL);
INSERT INTO `upsell` VALUES (6, 3, 'test_2', 850, 1200, 'null', NULL);
INSERT INTO `upsell` VALUES (9, 3, 'test_2', 850, 1200, 'null', NULL);
INSERT INTO `upsell` VALUES (10, 3, 'test_2', 850, 1200, 'null', NULL);
INSERT INTO `upsell` VALUES (11, 3, 'test_2', 850, 1200, 'null', NULL);
INSERT INTO `upsell` VALUES (12, 60, NULL, 100.56, 1200, NULL, NULL);
INSERT INTO `upsell` VALUES (13, 61, NULL, 100.56, 1200, NULL, NULL);
INSERT INTO `upsell` VALUES (14, 61, NULL, 100.56, 1200, NULL, NULL);
INSERT INTO `upsell` VALUES (15, 61, NULL, 100.56, 1200, NULL, NULL);
INSERT INTO `upsell` VALUES (16, 3, NULL, 100.56, 1200.22, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Структура таблицы `users`
-- 

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` int(2) unsigned NOT NULL DEFAULT '0',
  `oauth_uid_facebook` varchar(100) DEFAULT NULL,
  `oauth_uid_google` varchar(100) DEFAULT NULL,
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pass` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'no-image.png',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `surname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `patronymic` varchar(100) DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `birthday` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `warehouse` int(10) unsigned NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

-- 
-- Дамп данных таблицы `users`
-- 

INSERT INTO `users` VALUES (1, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxcxcx@gmail.com', '', '', 0, '2017-06-25 23:50:40', '127.0.0.1');
INSERT INTO `users` VALUES (2, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxcxcx@gmail.com', '', '', 0, '2017-06-25 23:52:18', '127.0.0.1');
INSERT INTO `users` VALUES (3, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxxcxccxcx@gmail.com', '', '', 0, '2017-06-26 00:00:45', '127.0.0.1');
INSERT INTO `users` VALUES (4, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxxcxccxcx@gmail.com', '', '', 0, '2017-06-26 00:00:56', '127.0.0.1');
INSERT INTO `users` VALUES (5, 0, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:12:08', '127.0.0.1');
INSERT INTO `users` VALUES (6, 0, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:22', '127.0.0.1');
INSERT INTO `users` VALUES (7, 0, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:37', '127.0.0.1');
INSERT INTO `users` VALUES (8, 0, NULL, NULL, 0, '9nm2rv8qdaa1391b2912c15ba922e0eb90fd0de22yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:55', '127.0.0.1');
INSERT INTO `users` VALUES (9, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgrgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:15:05', '127.0.0.1');
INSERT INTO `users` VALUES (10, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgrgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:15:22', '127.0.0.1');
INSERT INTO `users` VALUES (11, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxcx@gmail.com', '', '', 0, '2017-06-27 02:53:58', '127.0.0.1');
INSERT INTO `users` VALUES (12, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxcx@gmail.com', '', '', 0, '2017-06-27 02:54:49', '127.0.0.1');
INSERT INTO `users` VALUES (13, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxhjjcx@gmail.com', '', '', 0, '2017-06-27 02:56:35', '127.0.0.1');
INSERT INTO `users` VALUES (14, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:09', '127.0.0.1');
INSERT INTO `users` VALUES (15, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:11', '127.0.0.1');
INSERT INTO `users` VALUES (16, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:33', '127.0.0.1');
INSERT INTO `users` VALUES (17, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:49', '127.0.0.1');
INSERT INTO `users` VALUES (18, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 03:00:15', '127.0.0.1');
INSERT INTO `users` VALUES (19, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcnmnxcxcx@gmail.com', '', '', 0, '2017-06-27 03:00:26', '127.0.0.1');
INSERT INTO `users` VALUES (20, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcnmnxcxcx@gmail.com', '', '', 0, '2017-06-27 03:06:53', '127.0.0.1');
INSERT INTO `users` VALUES (21, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'sdsghghghdsd@hghg.com', '', '', 0, '2017-06-27 03:07:40', '127.0.0.1');
INSERT INTO `users` VALUES (22, 0, NULL, NULL, 0, '9nm2rv8qe4e95fc0fd4d6f7e176c6b21e0acf57d2yo6z', '', 'no-image.png', 0, '', 'sdsdd', '', 0, '', '', 'sdsdsd@hghg.com', '', '', 0, '2017-06-27 03:15:55', '127.0.0.1');
INSERT INTO `users` VALUES (23, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'sdssdsdddsd@hghg.com', '', '', 0, '2017-06-27 03:31:04', '127.0.0.1');
INSERT INTO `users` VALUES (24, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'sdssdsdddsd@hghg.com', '', '', 0, '2017-06-27 03:31:08', '127.0.0.1');
INSERT INTO `users` VALUES (25, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'pudfgzia009@gmail.com', '', '', 0, '2017-06-27 03:32:40', '127.0.0.1');
INSERT INTO `users` VALUES (26, 0, NULL, NULL, 0, '9nm2rv8qda70c317d67c464fa004aa382da55d522yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'test@gmail.com', '', '', 0, '2017-06-27 03:39:03', '127.0.0.1');
INSERT INTO `users` VALUES (27, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxcxklklcxcx@gmail.com', '', '', 0, '2017-06-27 03:43:14', '127.0.0.1');
INSERT INTO `users` VALUES (28, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudzljlia009@gmail.com', '', '', 0, '2017-06-27 03:44:56', '127.0.0.1');
INSERT INTO `users` VALUES (29, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'jhjhj', '', 0, '', '', 'pudziart009@gmail.com', '', '', 0, '2017-06-27 08:23:18', '127.0.0.1');
INSERT INTO `users` VALUES (30, 0, NULL, NULL, 0, '9nm2rv8q3d0ae2da1c51f64994f3c2f5faa66c002yo6z', '', 'no-image.png', 0, '', 'asdf', '', 0, '', '', 'puyjyjdzia009@gmail.com', '', '', 0, '2017-07-03 02:41:39', '127.0.0.1');
INSERT INTO `users` VALUES (31, 0, NULL, NULL, 0, '9nm2rv8qf930483127f4b2467fd18eaa66b5d4ad2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudzkiikia009@gmail.com', '', '', 0, '2017-07-03 02:43:37', '127.0.0.1');
INSERT INTO `users` VALUES (32, 0, NULL, NULL, 0, '9nm2rv8qbdcad8a9812b0ceacb41cf6bf3d70c432yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudfdfdzia009@gmail.com', '', '', 0, '2017-07-03 02:49:41', '127.0.0.1');
INSERT INTO `users` VALUES (33, 0, NULL, NULL, 0, '9nm2rv8qf0e9520d80d822f7e5a4a47ff719be992yo6z', '', 'no-image.png', 0, '', 'hjhjfhf', '', 0, '', '', 'sdsdsfhfhd@hghg.com', '', '', 0, '2017-07-03 02:59:50', '127.0.0.1');
INSERT INTO `users` VALUES (34, 0, NULL, NULL, 0, '9nm2rv8q90d18a5d706c39f565fd94466b7fc53e2yo6z', '', 'no-image.png', 0, '', 'jhjhj', '', 0, '', '', 'sd454sdsd@hghg.com', '', '', 0, '2017-07-03 03:00:34', '127.0.0.1');
INSERT INTO `users` VALUES (35, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '123456', '', 0, '', '', '123@gmail.com', '', '', 0, '2017-07-03 04:52:49', '127.0.0.1');
INSERT INTO `users` VALUES (36, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '123', '', 0, '', '', '789@gmail.com', '', '', 0, '2017-07-03 05:02:13', '127.0.0.1');
INSERT INTO `users` VALUES (37, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'pOwxF1hae7', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudzia45545@ggfgg.com', '', '', 0, '2017-07-03 11:08:20', '127.0.0.1');
INSERT INTO `users` VALUES (38, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'h2b54oIQjK', 'no-image.png', 0, '', 'df545', '', 0, '', '', 'pucvcvdzia009@gmail.comc', '', '', 0, '2017-07-03 11:34:48', '127.0.0.1');
INSERT INTO `users` VALUES (39, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'W3IXHiyLLG', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudzixcxca009@gmail.com', '', '', 0, '2017-07-03 12:12:08', '127.0.0.1');
INSERT INTO `users` VALUES (40, 0, NULL, NULL, 0, '9nm2rv8qc6e3d292722ecb653ce71d1cd2cff9642yo6z', 'QWGdPGPKSi', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudxcxczia009@gmail.com', '', '', 0, '2017-07-03 12:13:55', '127.0.0.1');
INSERT INTO `users` VALUES (41, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '5tF7mUtYLR', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'frexceitgroupe@gmail.comxc', '', '', 0, '2017-07-03 12:17:03', '127.0.0.1');
INSERT INTO `users` VALUES (42, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'iojrYToVTW', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitxcxcgroupe@gmail.comxcxc', '', '', 0, '2017-07-03 12:17:14', '127.0.0.1');
INSERT INTO `users` VALUES (43, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'RICoWSIlK4', 'no-image.png', 0, '', 'freeitgroupe', '', 0, '', '', 'freeitgroupe@gmail.comxxc', '', '', 0, '2017-07-03 12:19:31', '127.0.0.1');
INSERT INTO `users` VALUES (44, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'KoNN7h27N2', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitgxcroupe@gmail.com', '', '', 0, '2017-07-03 12:21:00', '127.0.0.1');
INSERT INTO `users` VALUES (45, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'TBc5VpsXnO', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitggtffgroupe@gmail.com', '', '', 0, '2017-07-03 12:22:38', '127.0.0.1');
INSERT INTO `users` VALUES (46, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'PKOC41fsAb', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitgr;loupe@gmail.com', '', '', 0, '2017-07-03 13:20:56', '127.0.0.1');
INSERT INTO `users` VALUES (47, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'iOp1tDlQea', 'no-image.png', 1, 'Ивановr', 'Roman', 'Иванович', 2, '54.54.5454', 'Киев', 'freeitgroupe@gmail.com', '+38(111) 111-11-11', 'пр.Мира 191, кв.1220', 0, '2017-07-03 13:21:32', '127.0.0.1');
INSERT INTO `users` VALUES (48, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'xBRQnuxetj', 'no-image.png', 0, '', '123456', '', 0, '', '', 'xcxc@ssdsd.com', '', '', 0, '2017-07-03 14:28:05', '127.0.0.1');
INSERT INTO `users` VALUES (49, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'gwOMrHDPu0', 'no-image.png', 0, '', 'dfdfdf', '', 0, '', '', 'pudzia009@gmail.com', '', '', 0, '2017-07-04 21:17:34', '193.111.156.142');
INSERT INTO `users` VALUES (50, 0, NULL, NULL, 0, '9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z', 'bItjBhHNuY', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:04:48', '127.0.0.1');
INSERT INTO `users` VALUES (51, 0, NULL, NULL, 0, '9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z', 'eNK0MI1VRn', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:07:23', '127.0.0.1');
INSERT INTO `users` VALUES (52, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'LtAkkjMjCK', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:32', '127.0.0.1');
INSERT INTO `users` VALUES (53, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'Wopm3lYHBG', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:44', '127.0.0.1');
INSERT INTO `users` VALUES (54, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'EITBkE5SLd', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:56', '127.0.0.1');
INSERT INTO `users` VALUES (55, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '92jbogKlba', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:14:01', '127.0.0.1');
INSERT INTO `users` VALUES (56, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '1ybeEYIvqQ', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:14:37', '127.0.0.1');
INSERT INTO `users` VALUES (57, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '4ph1pQGYYM', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:15:08', '127.0.0.1');
INSERT INTO `users` VALUES (58, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '2Ypw8JvmIK', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzia@rambler.ru', '', '', 0, '2017-10-05 18:33:27', '127.0.0.1');
INSERT INTO `users` VALUES (59, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'EoPpe28kLb', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzia001@rambler.ru', '', '', 0, '2017-10-05 18:35:54', '127.0.0.1');
INSERT INTO `users` VALUES (60, 0, NULL, NULL, 0, '9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z', '7PM3oi6EUz', 'no-image.png', 0, '', '', '', 0, '', '', 'sssdsd@gmail.com', '', '', 0, '2017-10-05 18:57:09', '127.0.0.1');
INSERT INTO `users` VALUES (61, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'sXh0PU1UbL', 'no-image.png', 0, '', '', '', 0, '', '', 'sssddsd@gmail.com', '', '', 0, '2017-10-05 19:35:18', '127.0.0.1');
INSERT INTO `users` VALUES (62, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'SQZyuVkzhy', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammme@gmail.com', '', '', 0, '2017-10-05 19:52:32', '127.0.0.1');
INSERT INTO `users` VALUES (63, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'gpbaNPqQPO', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziamxcxcmm@gmail.com', '', '', 0, '2017-10-05 19:52:53', '127.0.0.1');
INSERT INTO `users` VALUES (64, 0, NULL, NULL, 0, '9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z', 'm35gSf675Y', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzidfammm@gmail.com', '', '', 0, '2017-10-05 19:54:21', '127.0.0.1');
INSERT INTO `users` VALUES (65, 0, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '4B0JHrwe0t', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammdddddm@gmail.com', '', '', 0, '2017-10-05 19:55:15', '127.0.0.1');
INSERT INTO `users` VALUES (66, 0, NULL, NULL, 0, '9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z', 'GkqX6TbnHN', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziadfdfdfmmm@gmail.com', '', '', 0, '2017-10-05 19:55:38', '127.0.0.1');
INSERT INTO `users` VALUES (67, 0, NULL, NULL, 0, '9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z', 'TNvLYK8exV', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm565656@gmail.com', '', '', 0, '2017-10-05 19:57:01', '127.0.0.1');
INSERT INTO `users` VALUES (68, 0, NULL, NULL, 0, '9nm2rv8q3f4cc94b6bd0ad3727d925af1ba288372yo6z', 'cnpgAXwLBp', 'no-image.png', 0, '', '', '', 0, '', '', 'pudsdsdsziammm@gmail.com', '', '', 0, '2017-10-05 19:59:42', '127.0.0.1');
INSERT INTO `users` VALUES (69, 0, NULL, NULL, 0, '9nm2rv8q63f0bd0078cf046d2b127ae3a4c1b3432yo6z', 'SRBiuTU4BO', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziassasammm@gmail.com', '', '', 0, '2017-10-05 20:00:25', '127.0.0.1');
INSERT INTO `users` VALUES (70, 0, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'jp0yK2R3LO', 'no-image.png', 0, '', '', '', 0, '', '', 'qqq@qqq.com', '', '', 0, '2017-10-09 11:38:43', '127.0.0.1');
INSERT INTO `users` VALUES (71, 2, '', NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'OMSqxaXx3z', 'no-image.png', 0, '', 'Admin Admin', '', 0, '', '', 'admin@gmail.com', '1(111)1111-111-111', '', 0, '2017-10-20 10:11:46', '127.0.0.1');

-- --------------------------------------------------------

-- 
-- Структура таблицы `users_group`
-- 

CREATE TABLE `users_group` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Дамп данных таблицы `users_group`
-- 

INSERT INTO `users_group` VALUES (1, 'Обычный пользователь', 0, 'default');
INSERT INTO `users_group` VALUES (2, 'Менеджер', 1, 'manager');

-- --------------------------------------------------------

-- 
-- Структура таблицы `warehouse`
-- 

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `warehouse_article` varchar(100) DEFAULT NULL,
  `region_code` varchar(100) DEFAULT NULL,
  `warehouse_index` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` int(100) DEFAULT NULL,
  `coordinate_long` varchar(100) DEFAULT NULL,
  `coordinate_latitude` varchar(100) DEFAULT NULL,
  `license_number` varchar(100) DEFAULT NULL,
  `enterprise_id` varchar(100) DEFAULT NULL,
  `official_registration` enum('0','1') NOT NULL DEFAULT '1',
  `responsible_person` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `hotline_phone` varchar(100) DEFAULT NULL,
  `tax_summ` float DEFAULT NULL,
  `notice` text,
  `main_warehouse` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- Дамп данных таблицы `warehouse`
-- 

INSERT INTO `warehouse` VALUES (1, 'Walter E nelson', 48, 'Kent', '#12121', '', '98032', '7915 S. 184th St, BLD C', NULL, '', '', 'license', '', '0', 'Wendy Steiner', '(253) 893-1909', '', 11.12, '', '1');
INSERT INTO `warehouse` VALUES (2, 'warehouse_1_1', 1, 'warehouse_article', 'warehouse_article', 'warehouse_article', 'warehouse_article', 'add', NULL, 'coooooo', 'cvcvcv', 'lilil', '', '1', 'fgfgfg', '56565656', '5665656', 20.1, 'dfdfdfdfdfdfdf', '0');
INSERT INTO `warehouse` VALUES (3, 'warehouse_2', 5, 'sdsd', 'sdsd', 'sdsd', 'sdsd', 'sdsd', NULL, 'sdsd', 'sssssss', '343434', 'ererdfd', '1', 'dfdf', 'dfdf', 'dfdf', 10, 'dddddddddddddd', '0');
INSERT INTO `warehouse` VALUES (4, 'warehouse_3', 5, 'sdsd', 'sdsd', 'sdsd', 'sdsd', 'sdsd', NULL, 'sdsd', 'sssssss', '343434', 'ererdfd', '1', 'dfdf', 'dfdf', 'dfdf', 10, 'dddddddddddddd', '0');

-- --------------------------------------------------------

-- 
-- Структура таблицы `watch_list`
-- 

CREATE TABLE `watch_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `watch_product_id` int(10) unsigned NOT NULL,
  `watch_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `watch_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 AUTO_INCREMENT=298 ;

-- 
-- Дамп данных таблицы `watch_list`
-- 

INSERT INTO `watch_list` VALUES (1, 13, '2017-11-02 10:15:44', '127.0.0.1');
INSERT INTO `watch_list` VALUES (2, 14, '2017-11-02 10:19:53', '127.0.0.1');
INSERT INTO `watch_list` VALUES (3, 6, '2017-10-03 21:38:31', '127.0.0.1');
INSERT INTO `watch_list` VALUES (4, 1, '2017-12-12 06:20:19', '127.0.0.1');
INSERT INTO `watch_list` VALUES (5, 4, '2017-10-03 10:02:56', '127.0.0.1');
INSERT INTO `watch_list` VALUES (6, 2, '2017-12-12 03:59:24', '127.0.0.1');
INSERT INTO `watch_list` VALUES (7, 11, '2018-01-17 10:19:28', '127.0.0.1');
INSERT INTO `watch_list` VALUES (8, 41, '2017-10-07 10:29:27', '127.0.0.1');
INSERT INTO `watch_list` VALUES (9, 10, '2017-12-08 17:06:51', '127.0.0.1');
INSERT INTO `watch_list` VALUES (10, 12, '2017-10-30 06:11:31', '127.0.0.1');
INSERT INTO `watch_list` VALUES (11, 29, '2017-10-07 23:52:01', '127.0.0.1');
INSERT INTO `watch_list` VALUES (12, 21, '2017-12-10 20:14:56', '127.0.0.1');
INSERT INTO `watch_list` VALUES (13, 30, '2017-10-30 23:16:06', '127.0.0.1');
INSERT INTO `watch_list` VALUES (14, 5, '2017-10-09 00:12:30', '127.0.0.1');
INSERT INTO `watch_list` VALUES (15, 3, '2017-11-29 03:07:53', '127.0.0.1');
INSERT INTO `watch_list` VALUES (16, 18, '2017-10-09 00:55:04', '127.0.0.1');
INSERT INTO `watch_list` VALUES (17, 17, '2017-10-09 03:22:38', '127.0.0.1');
INSERT INTO `watch_list` VALUES (18, 15, '2018-01-15 05:24:41', '127.0.0.1');
INSERT INTO `watch_list` VALUES (19, 20, '2017-11-28 15:56:19', '127.0.0.1');
INSERT INTO `watch_list` VALUES (20, 60, '2017-11-02 10:15:50', '127.0.0.1');
INSERT INTO `watch_list` VALUES (21, 57, '2017-12-10 20:55:12', '127.0.0.1');
INSERT INTO `watch_list` VALUES (22, 2, '2017-12-12 03:59:24', '188.163.87.158');
INSERT INTO `watch_list` VALUES (23, 59, '2017-11-07 23:25:53', '193.111.156.142');
INSERT INTO `watch_list` VALUES (24, 10, '2017-12-08 17:06:51', '46.160.71.23');
INSERT INTO `watch_list` VALUES (25, 17, '2017-11-08 04:57:34', '46.160.71.23');
INSERT INTO `watch_list` VALUES (26, 58, '2017-12-12 05:45:57', '193.111.156.142');
INSERT INTO `watch_list` VALUES (27, 11, '2018-01-17 10:19:28', '174.127.133.49');
INSERT INTO `watch_list` VALUES (28, 16, '2017-11-14 05:31:45', '174.127.133.49');
INSERT INTO `watch_list` VALUES (29, 17, '2017-11-14 16:38:03', '37.204.156.184');
INSERT INTO `watch_list` VALUES (30, 2, '2017-12-12 03:59:24', '193.111.156.142');
INSERT INTO `watch_list` VALUES (31, 18, '2017-11-16 02:41:09', '193.111.156.142');
INSERT INTO `watch_list` VALUES (32, 11, '2018-01-17 10:19:28', '193.111.156.142');
INSERT INTO `watch_list` VALUES (33, 58, '2017-12-12 05:45:57', '127.0.0.1');
INSERT INTO `watch_list` VALUES (34, 24, '2017-12-10 20:14:12', '127.0.0.1');
INSERT INTO `watch_list` VALUES (35, 23, '2017-11-27 10:46:03', '127.0.0.1');
INSERT INTO `watch_list` VALUES (36, 28, '2017-11-27 10:59:48', '127.0.0.1');
INSERT INTO `watch_list` VALUES (37, 26, '2017-11-29 09:17:59', '127.0.0.1');
INSERT INTO `watch_list` VALUES (38, 61, '2017-12-12 06:19:08', '127.0.0.1');
INSERT INTO `watch_list` VALUES (39, 1, '2017-12-12 06:20:19', '193.111.156.142');
INSERT INTO `watch_list` VALUES (40, 61, '2017-12-12 06:19:08', '193.111.156.142');
INSERT INTO `watch_list` VALUES (41, 61, '2017-12-20 23:55:42', '174.127.133.58');
INSERT INTO `watch_list` VALUES (42, 17, '2017-12-28 00:57:13', '176.193.145.30');
INSERT INTO `watch_list` VALUES (43, 15, '2018-01-15 05:24:41', '193.111.156.142');
INSERT INTO `watch_list` VALUES (44, 61, '2018-01-04 23:53:31', '174.127.133.105');
INSERT INTO `watch_list` VALUES (45, 63, '2018-02-19 08:05:39', '193.111.156.142');
INSERT INTO `watch_list` VALUES (46, 62, '2018-04-20 20:15:57', '193.111.156.142');
INSERT INTO `watch_list` VALUES (47, 62, '2018-04-20 20:15:57', '188.163.86.188');
INSERT INTO `watch_list` VALUES (48, 62, '2018-04-20 20:15:57', '138.197.183.207');
INSERT INTO `watch_list` VALUES (49, 62, '2018-04-20 20:15:57', '73.169.211.60');
INSERT INTO `watch_list` VALUES (50, 66, '2018-01-25 14:58:17', '73.169.211.60');
INSERT INTO `watch_list` VALUES (51, 67, '2018-04-20 20:16:30', '73.169.211.60');
INSERT INTO `watch_list` VALUES (52, 68, '2018-04-20 20:17:06', '73.169.211.60');
INSERT INTO `watch_list` VALUES (53, 69, '2018-01-25 15:24:36', '73.169.211.60');
INSERT INTO `watch_list` VALUES (54, 71, '2018-04-20 20:16:02', '73.169.211.60');
INSERT INTO `watch_list` VALUES (55, 72, '2018-01-25 16:42:43', '73.169.211.60');
INSERT INTO `watch_list` VALUES (56, 73, '2018-04-20 20:16:58', '73.169.211.60');
INSERT INTO `watch_list` VALUES (57, 74, '2018-02-15 12:17:40', '73.169.211.60');
INSERT INTO `watch_list` VALUES (58, 75, '2018-04-20 20:15:59', '73.169.211.60');
INSERT INTO `watch_list` VALUES (59, 76, '2018-02-10 04:34:30', '73.169.211.60');
INSERT INTO `watch_list` VALUES (60, 79, '2018-01-26 09:27:43', '73.169.211.60');
INSERT INTO `watch_list` VALUES (61, 80, '2018-04-20 20:16:25', '73.169.211.60');
INSERT INTO `watch_list` VALUES (62, 68, '2018-04-20 20:17:06', '91.217.101.202');
INSERT INTO `watch_list` VALUES (63, 71, '2018-04-20 20:16:02', '91.217.101.202');
INSERT INTO `watch_list` VALUES (64, 80, '2018-04-20 20:16:25', '91.217.101.202');
INSERT INTO `watch_list` VALUES (65, 76, '2018-02-10 04:34:30', '91.217.101.202');
INSERT INTO `watch_list` VALUES (66, 79, '2018-01-26 09:27:43', '193.111.156.142');
INSERT INTO `watch_list` VALUES (67, 66, '2018-01-26 08:55:33', '193.111.156.142');
INSERT INTO `watch_list` VALUES (68, 73, '2018-04-20 20:16:58', '188.163.86.188');
INSERT INTO `watch_list` VALUES (69, 68, '2018-04-20 20:17:06', '188.163.86.188');
INSERT INTO `watch_list` VALUES (70, 78, '2018-02-14 17:00:00', '188.163.86.188');
INSERT INTO `watch_list` VALUES (71, 74, '2018-02-15 12:17:40', '188.163.86.188');
INSERT INTO `watch_list` VALUES (72, 79, '2018-01-27 18:15:18', '188.163.87.216');
INSERT INTO `watch_list` VALUES (73, 75, '2018-04-20 20:15:59', '188.163.87.216');
INSERT INTO `watch_list` VALUES (74, 82, '2018-01-27 20:08:26', '73.169.211.60');
INSERT INTO `watch_list` VALUES (75, 82, '2018-01-28 02:52:56', '188.163.87.216');
INSERT INTO `watch_list` VALUES (76, 83, '2018-01-28 03:24:03', '73.169.211.60');
INSERT INTO `watch_list` VALUES (77, 84, '2018-01-28 11:49:34', '73.169.211.60');
INSERT INTO `watch_list` VALUES (78, 85, '2018-01-28 03:42:30', '73.169.211.60');
INSERT INTO `watch_list` VALUES (79, 86, '2018-03-26 21:26:13', '73.169.211.60');
INSERT INTO `watch_list` VALUES (80, 71, '2018-04-20 20:16:02', '188.163.87.216');
INSERT INTO `watch_list` VALUES (81, 88, '2018-04-20 20:16:32', '188.163.87.216');
INSERT INTO `watch_list` VALUES (82, 89, '2018-04-20 20:16:04', '73.169.211.60');
INSERT INTO `watch_list` VALUES (83, 88, '2018-04-20 20:16:32', '73.169.211.60');
INSERT INTO `watch_list` VALUES (84, 87, '2018-01-28 04:59:19', '73.169.211.60');
INSERT INTO `watch_list` VALUES (85, 89, '2018-04-20 20:16:04', '188.163.87.216');
INSERT INTO `watch_list` VALUES (86, 84, '2018-01-28 11:49:34', '188.163.87.216');
INSERT INTO `watch_list` VALUES (87, 77, '2018-04-20 20:16:22', '193.111.156.142');
INSERT INTO `watch_list` VALUES (88, 74, '2018-02-15 12:17:40', '188.163.87.216');
INSERT INTO `watch_list` VALUES (89, 83, '2018-01-30 11:57:28', '188.163.87.216');
INSERT INTO `watch_list` VALUES (90, 70, '2018-01-30 13:48:57', '188.163.87.216');
INSERT INTO `watch_list` VALUES (91, 85, '2018-01-30 13:09:30', '188.163.87.216');
INSERT INTO `watch_list` VALUES (92, 78, '2018-02-14 17:00:00', '188.163.87.216');
INSERT INTO `watch_list` VALUES (93, 72, '2018-01-30 20:11:15', '174.127.133.71');
INSERT INTO `watch_list` VALUES (94, 70, '2018-01-30 20:18:03', '174.127.133.74');
INSERT INTO `watch_list` VALUES (95, 75, '2018-04-20 20:15:59', '174.127.133.72');
INSERT INTO `watch_list` VALUES (96, 62, '2018-04-20 20:15:57', '46.101.232.242');
INSERT INTO `watch_list` VALUES (97, 68, '2018-04-20 20:17:06', '46.101.232.242');
INSERT INTO `watch_list` VALUES (98, 79, '2018-02-02 09:32:49', '188.163.86.188');
INSERT INTO `watch_list` VALUES (99, 77, '2018-04-20 20:16:22', '188.163.86.188');
INSERT INTO `watch_list` VALUES (100, 62, '2018-04-20 20:15:57', '188.163.87.216');
INSERT INTO `watch_list` VALUES (101, 80, '2018-04-20 20:16:25', '188.163.84.243');
INSERT INTO `watch_list` VALUES (102, 74, '2018-02-15 12:17:40', '188.163.84.243');
INSERT INTO `watch_list` VALUES (103, 62, '2018-04-20 20:15:57', '188.163.84.243');
INSERT INTO `watch_list` VALUES (104, 73, '2018-04-20 20:16:58', '46.160.71.23');
INSERT INTO `watch_list` VALUES (105, 68, '2018-04-20 20:17:06', '46.160.71.23');
INSERT INTO `watch_list` VALUES (106, 88, '2018-04-20 20:16:32', '188.163.84.243');
INSERT INTO `watch_list` VALUES (107, 78, '2018-02-14 17:00:00', '188.163.84.243');
INSERT INTO `watch_list` VALUES (108, 75, '2018-04-20 20:15:59', '174.127.133.79');
INSERT INTO `watch_list` VALUES (109, 89, '2018-04-20 20:16:04', '174.127.133.85');
INSERT INTO `watch_list` VALUES (110, 71, '2018-04-20 20:16:02', '174.127.133.85');
INSERT INTO `watch_list` VALUES (111, 62, '2018-04-20 20:15:57', '174.127.133.80');
INSERT INTO `watch_list` VALUES (112, 72, '2018-02-12 21:24:10', '174.127.133.85');
INSERT INTO `watch_list` VALUES (113, 70, '2018-02-12 21:28:35', '174.127.133.85');
INSERT INTO `watch_list` VALUES (114, 70, '2018-02-14 16:59:57', '188.163.84.243');
INSERT INTO `watch_list` VALUES (115, 71, '2018-04-20 20:16:02', '188.163.84.243');
INSERT INTO `watch_list` VALUES (116, 77, '2018-04-20 20:16:22', '46.160.71.23');
INSERT INTO `watch_list` VALUES (117, 75, '2018-04-20 20:15:59', '38.100.21.68');
INSERT INTO `watch_list` VALUES (118, 62, '2018-04-20 20:15:57', '38.100.21.68');
INSERT INTO `watch_list` VALUES (119, 71, '2018-04-20 20:16:02', '38.100.21.68');
INSERT INTO `watch_list` VALUES (120, 82, '2018-02-18 15:34:15', '188.163.84.243');
INSERT INTO `watch_list` VALUES (121, 75, '2018-04-20 20:15:59', '193.111.156.142');
INSERT INTO `watch_list` VALUES (122, 71, '2018-04-20 20:16:02', '193.111.156.142');
INSERT INTO `watch_list` VALUES (123, 71, '2018-04-20 20:16:02', '66.220.152.139');
INSERT INTO `watch_list` VALUES (124, 77, '2018-04-20 20:16:22', '188.163.84.243');
INSERT INTO `watch_list` VALUES (125, 75, '2018-04-20 20:15:59', '174.127.133.47');
INSERT INTO `watch_list` VALUES (126, 89, '2018-04-20 20:16:04', '174.127.133.48');
INSERT INTO `watch_list` VALUES (127, 72, '2018-02-20 21:00:22', '174.127.133.50');
INSERT INTO `watch_list` VALUES (128, 70, '2018-02-20 21:04:28', '174.127.133.48');
INSERT INTO `watch_list` VALUES (129, 62, '2018-04-20 20:15:57', '66.192.178.200');
INSERT INTO `watch_list` VALUES (130, 62, '2018-04-20 20:15:57', '158.69.228.14');
INSERT INTO `watch_list` VALUES (131, 66, '2018-02-22 13:32:55', '192.99.66.39');
INSERT INTO `watch_list` VALUES (132, 71, '2018-04-20 20:16:02', '192.99.66.39');
INSERT INTO `watch_list` VALUES (133, 74, '2018-02-26 17:30:42', '193.178.228.212');
INSERT INTO `watch_list` VALUES (134, 76, '2018-02-26 17:31:10', '193.178.228.212');
INSERT INTO `watch_list` VALUES (135, 62, '2018-04-20 20:15:57', '193.178.228.212');
INSERT INTO `watch_list` VALUES (136, 75, '2018-04-20 20:15:59', '174.127.133.31');
INSERT INTO `watch_list` VALUES (137, 89, '2018-04-20 20:16:04', '174.127.133.31');
INSERT INTO `watch_list` VALUES (138, 71, '2018-04-20 20:16:02', '174.127.133.30');
INSERT INTO `watch_list` VALUES (139, 71, '2018-04-20 20:16:02', '174.127.133.62');
INSERT INTO `watch_list` VALUES (140, 72, '2018-02-26 19:39:56', '174.127.133.62');
INSERT INTO `watch_list` VALUES (141, 70, '2018-02-26 19:44:39', '174.127.133.62');
INSERT INTO `watch_list` VALUES (142, 86, '2018-03-26 21:26:13', '174.127.133.26');
INSERT INTO `watch_list` VALUES (143, 78, '2018-02-26 19:56:46', '174.127.133.26');
INSERT INTO `watch_list` VALUES (144, 89, '2018-04-20 20:16:04', '188.163.84.243');
INSERT INTO `watch_list` VALUES (145, 90, '2018-04-20 20:16:53', '193.178.228.212');
INSERT INTO `watch_list` VALUES (146, 91, '2018-02-27 19:10:32', '193.178.228.212');
INSERT INTO `watch_list` VALUES (147, 92, '2018-02-27 19:22:17', '193.178.228.212');
INSERT INTO `watch_list` VALUES (148, 94, '2018-02-27 19:40:25', '193.178.228.212');
INSERT INTO `watch_list` VALUES (149, 66, '2018-02-27 19:40:45', '193.178.228.212');
INSERT INTO `watch_list` VALUES (150, 68, '2018-04-20 20:17:06', '193.178.228.212');
INSERT INTO `watch_list` VALUES (151, 68, '2018-04-20 20:17:06', '172.58.44.18');
INSERT INTO `watch_list` VALUES (152, 96, '2018-04-20 20:17:11', '172.58.44.18');
INSERT INTO `watch_list` VALUES (153, 97, '2018-04-20 20:16:20', '193.178.228.212');
INSERT INTO `watch_list` VALUES (154, 102, '2018-02-27 21:01:27', '193.178.228.212');
INSERT INTO `watch_list` VALUES (155, 109, '2018-02-27 21:35:23', '193.178.228.212');
INSERT INTO `watch_list` VALUES (156, 114, '2018-02-27 21:56:04', '193.178.228.212');
INSERT INTO `watch_list` VALUES (157, 121, '2018-04-20 20:16:48', '73.169.211.60');
INSERT INTO `watch_list` VALUES (158, 116, '2018-02-28 02:00:44', '73.169.211.60');
INSERT INTO `watch_list` VALUES (159, 125, '2018-02-28 02:01:35', '73.169.211.60');
INSERT INTO `watch_list` VALUES (160, 115, '2018-02-28 02:03:03', '73.169.211.60');
INSERT INTO `watch_list` VALUES (161, 85, '2018-02-28 10:11:28', '193.178.228.212');
INSERT INTO `watch_list` VALUES (162, 181, '2018-03-05 04:42:14', '73.169.211.60');
INSERT INTO `watch_list` VALUES (163, 144, '2018-02-28 15:15:13', '73.169.211.60');
INSERT INTO `watch_list` VALUES (164, 173, '2018-04-20 20:17:04', '73.169.211.60');
INSERT INTO `watch_list` VALUES (165, 177, '2018-04-03 05:50:42', '73.169.211.60');
INSERT INTO `watch_list` VALUES (166, 196, '2018-04-17 06:26:32', '73.169.211.60');
INSERT INTO `watch_list` VALUES (167, 77, '2018-04-20 20:16:22', '73.169.211.60');
INSERT INTO `watch_list` VALUES (168, 194, '2018-02-28 15:27:39', '73.169.211.60');
INSERT INTO `watch_list` VALUES (169, 164, '2018-04-20 20:16:35', '73.169.211.60');
INSERT INTO `watch_list` VALUES (170, 97, '2018-04-20 20:16:20', '73.169.211.60');
INSERT INTO `watch_list` VALUES (171, 158, '2018-02-28 15:37:37', '73.169.211.60');
INSERT INTO `watch_list` VALUES (172, 171, '2018-04-20 20:16:38', '73.169.211.60');
INSERT INTO `watch_list` VALUES (173, 167, '2018-02-28 15:39:34', '73.169.211.60');
INSERT INTO `watch_list` VALUES (174, 163, '2018-02-28 15:39:46', '73.169.211.60');
INSERT INTO `watch_list` VALUES (175, 158, '2018-02-28 15:39:49', '193.178.228.212');
INSERT INTO `watch_list` VALUES (176, 189, '2018-02-28 15:42:02', '73.169.211.60');
INSERT INTO `watch_list` VALUES (177, 177, '2018-04-03 05:50:42', '193.178.228.212');
INSERT INTO `watch_list` VALUES (178, 77, '2018-04-20 20:16:22', '193.178.228.212');
INSERT INTO `watch_list` VALUES (179, 75, '2018-04-20 20:15:59', '193.178.228.212');
INSERT INTO `watch_list` VALUES (180, 168, '2018-02-28 15:59:30', '73.169.211.60');
INSERT INTO `watch_list` VALUES (181, 128, '2018-02-28 15:59:51', '73.169.211.60');
INSERT INTO `watch_list` VALUES (182, 127, '2018-02-28 16:10:53', '73.169.211.60');
INSERT INTO `watch_list` VALUES (183, 149, '2018-02-28 16:17:29', '73.169.211.60');
INSERT INTO `watch_list` VALUES (184, 150, '2018-02-28 16:16:35', '73.169.211.60');
INSERT INTO `watch_list` VALUES (185, 177, '2018-04-03 05:50:42', '193.111.156.142');
INSERT INTO `watch_list` VALUES (186, 97, '2018-04-20 20:16:20', '193.111.156.142');
INSERT INTO `watch_list` VALUES (187, 120, '2018-04-20 20:16:45', '193.111.156.142');
INSERT INTO `watch_list` VALUES (188, 110, '2018-04-20 20:17:01', '188.163.84.243');
INSERT INTO `watch_list` VALUES (189, 181, '2018-03-05 04:42:14', '138.197.174.79');
INSERT INTO `watch_list` VALUES (190, 188, '2018-03-05 09:33:43', '188.163.84.243');
INSERT INTO `watch_list` VALUES (191, 163, '2018-03-05 15:20:23', '188.163.84.243');
INSERT INTO `watch_list` VALUES (192, 89, '2018-04-20 20:16:04', '172.58.41.151');
INSERT INTO `watch_list` VALUES (193, 75, '2018-04-20 20:15:59', '174.127.133.101');
INSERT INTO `watch_list` VALUES (194, 89, '2018-04-20 20:16:04', '174.127.133.101');
INSERT INTO `watch_list` VALUES (195, 71, '2018-04-20 20:16:02', '174.127.133.100');
INSERT INTO `watch_list` VALUES (196, 189, '2018-03-07 20:35:22', '174.127.133.105');
INSERT INTO `watch_list` VALUES (197, 153, '2018-03-07 20:48:05', '174.127.133.101');
INSERT INTO `watch_list` VALUES (198, 170, '2018-03-07 20:53:27', '174.127.133.102');
INSERT INTO `watch_list` VALUES (199, 116, '2018-03-07 20:57:09', '174.127.133.102');
INSERT INTO `watch_list` VALUES (200, 167, '2018-03-07 20:58:08', '174.127.133.102');
INSERT INTO `watch_list` VALUES (201, 177, '2018-04-03 05:50:42', '174.127.133.102');
INSERT INTO `watch_list` VALUES (202, 178, '2018-04-16 16:26:51', '174.127.133.102');
INSERT INTO `watch_list` VALUES (203, 115, '2018-03-07 21:04:29', '174.127.133.103');
INSERT INTO `watch_list` VALUES (204, 121, '2018-04-20 20:16:48', '188.163.87.216');
INSERT INTO `watch_list` VALUES (205, 196, '2018-04-17 06:26:32', '188.163.87.216');
INSERT INTO `watch_list` VALUES (206, 196, '2018-04-17 06:26:32', '31.13.114.83');
INSERT INTO `watch_list` VALUES (207, 196, '2018-04-17 06:26:32', '173.252.86.89');
INSERT INTO `watch_list` VALUES (208, 75, '2018-04-20 20:15:59', '174.127.133.57');
INSERT INTO `watch_list` VALUES (209, 89, '2018-04-20 20:16:04', '174.127.133.55');
INSERT INTO `watch_list` VALUES (210, 189, '2018-03-12 20:46:55', '174.127.133.55');
INSERT INTO `watch_list` VALUES (211, 153, '2018-03-12 21:05:16', '174.127.133.57');
INSERT INTO `watch_list` VALUES (212, 170, '2018-03-12 21:11:27', '174.127.133.56');
INSERT INTO `watch_list` VALUES (213, 116, '2018-03-12 21:15:05', '174.127.133.56');
INSERT INTO `watch_list` VALUES (214, 177, '2018-04-03 05:50:42', '174.127.133.58');
INSERT INTO `watch_list` VALUES (215, 167, '2018-03-12 21:16:23', '174.127.133.56');
INSERT INTO `watch_list` VALUES (216, 196, '2018-04-17 06:26:32', '104.45.18.178');
INSERT INTO `watch_list` VALUES (217, 196, '2018-04-17 06:26:32', '104.209.188.207');
INSERT INTO `watch_list` VALUES (218, 196, '2018-04-17 06:26:32', '24.19.235.197');
INSERT INTO `watch_list` VALUES (219, 173, '2018-04-20 20:17:04', '38.100.21.61');
INSERT INTO `watch_list` VALUES (220, 75, '2018-04-20 20:15:59', '174.127.133.77');
INSERT INTO `watch_list` VALUES (221, 189, '2018-03-19 19:09:05', '174.127.133.79');
INSERT INTO `watch_list` VALUES (222, 177, '2018-04-03 05:50:42', '174.127.133.82');
INSERT INTO `watch_list` VALUES (223, 62, '2018-04-20 20:15:57', '104.192.74.18');
INSERT INTO `watch_list` VALUES (224, 71, '2018-04-20 20:16:02', '104.192.74.18');
INSERT INTO `watch_list` VALUES (225, 75, '2018-04-20 20:15:59', '104.192.74.18');
INSERT INTO `watch_list` VALUES (226, 89, '2018-04-20 20:16:04', '104.192.74.18');
INSERT INTO `watch_list` VALUES (227, 62, '2018-04-20 20:15:57', '23.237.4.26');
INSERT INTO `watch_list` VALUES (228, 71, '2018-04-20 20:16:02', '23.237.4.26');
INSERT INTO `watch_list` VALUES (229, 75, '2018-04-20 20:15:59', '23.237.4.26');
INSERT INTO `watch_list` VALUES (230, 89, '2018-04-20 20:16:04', '23.237.4.26');
INSERT INTO `watch_list` VALUES (231, 97, '2018-04-20 20:16:20', '23.237.4.26');
INSERT INTO `watch_list` VALUES (232, 77, '2018-04-20 20:16:22', '23.237.4.26');
INSERT INTO `watch_list` VALUES (233, 80, '2018-04-20 20:16:25', '23.237.4.26');
INSERT INTO `watch_list` VALUES (234, 154, '2018-04-20 20:16:27', '23.237.4.26');
INSERT INTO `watch_list` VALUES (235, 67, '2018-04-20 20:16:30', '23.237.4.26');
INSERT INTO `watch_list` VALUES (236, 88, '2018-04-20 20:16:32', '23.237.4.26');
INSERT INTO `watch_list` VALUES (237, 164, '2018-04-20 20:16:35', '23.237.4.26');
INSERT INTO `watch_list` VALUES (238, 171, '2018-04-20 20:16:38', '23.237.4.26');
INSERT INTO `watch_list` VALUES (239, 162, '2018-04-20 20:16:40', '23.237.4.26');
INSERT INTO `watch_list` VALUES (240, 119, '2018-04-20 20:16:43', '23.237.4.26');
INSERT INTO `watch_list` VALUES (241, 120, '2018-04-20 20:16:45', '23.237.4.26');
INSERT INTO `watch_list` VALUES (242, 121, '2018-04-20 20:16:48', '23.237.4.26');
INSERT INTO `watch_list` VALUES (243, 122, '2018-04-20 20:16:50', '23.237.4.26');
INSERT INTO `watch_list` VALUES (244, 90, '2018-04-20 20:16:53', '23.237.4.26');
INSERT INTO `watch_list` VALUES (245, 191, '2018-04-20 20:16:56', '23.237.4.26');
INSERT INTO `watch_list` VALUES (246, 73, '2018-04-20 20:16:58', '23.237.4.26');
INSERT INTO `watch_list` VALUES (247, 110, '2018-04-20 20:17:01', '23.237.4.26');
INSERT INTO `watch_list` VALUES (248, 173, '2018-04-20 20:17:04', '23.237.4.26');
INSERT INTO `watch_list` VALUES (249, 68, '2018-04-20 20:17:06', '23.237.4.26');
INSERT INTO `watch_list` VALUES (250, 147, '2018-04-20 20:17:09', '23.237.4.26');
INSERT INTO `watch_list` VALUES (251, 96, '2018-04-20 20:17:11', '23.237.4.26');
INSERT INTO `watch_list` VALUES (252, 145, '2018-04-20 20:17:14', '23.237.4.26');
INSERT INTO `watch_list` VALUES (253, 155, '2018-03-25 09:21:24', '95.153.131.44');
INSERT INTO `watch_list` VALUES (254, 75, '2018-04-20 20:15:59', '174.127.133.26');
INSERT INTO `watch_list` VALUES (255, 189, '2018-03-26 21:12:14', '174.127.133.28');
INSERT INTO `watch_list` VALUES (256, 119, '2018-04-20 20:16:43', '193.111.156.142');
INSERT INTO `watch_list` VALUES (257, 176, '2018-04-02 14:05:14', '188.163.57.232');
INSERT INTO `watch_list` VALUES (258, 196, '2018-04-17 06:26:32', '188.163.57.232');
INSERT INTO `watch_list` VALUES (259, 178, '2018-04-16 16:26:51', '91.217.101.202');
INSERT INTO `watch_list` VALUES (260, 75, '2018-04-20 20:15:59', '174.127.133.78');
INSERT INTO `watch_list` VALUES (261, 189, '2018-04-01 21:08:56', '174.127.133.81');
INSERT INTO `watch_list` VALUES (262, 177, '2018-04-03 05:50:42', '174.127.133.83');
INSERT INTO `watch_list` VALUES (263, 187, '2018-04-07 08:19:43', '188.163.57.232');
INSERT INTO `watch_list` VALUES (264, 97, '2018-04-20 20:16:20', '188.163.57.232');
INSERT INTO `watch_list` VALUES (265, 178, '2018-04-16 16:26:51', '188.163.57.232');
INSERT INTO `watch_list` VALUES (266, 164, '2018-04-20 20:16:35', '188.163.57.232');
INSERT INTO `watch_list` VALUES (267, 176, '2018-04-03 05:42:33', '193.111.156.142');
INSERT INTO `watch_list` VALUES (268, 178, '2018-04-16 16:26:51', '193.111.156.142');
INSERT INTO `watch_list` VALUES (269, 89, '2018-04-20 20:16:04', '91.217.101.202');
INSERT INTO `watch_list` VALUES (270, 167, '2018-04-03 14:34:02', '91.217.101.202');
INSERT INTO `watch_list` VALUES (271, 196, '2018-04-17 06:26:32', '193.111.156.142');
INSERT INTO `watch_list` VALUES (272, 122, '2018-04-20 20:16:50', '193.111.156.142');
INSERT INTO `watch_list` VALUES (273, 189, '2018-04-05 14:23:57', '188.163.57.232');
INSERT INTO `watch_list` VALUES (274, 187, '2018-04-07 08:19:43', '193.111.156.142');
INSERT INTO `watch_list` VALUES (275, 196, '2018-04-17 06:26:32', '91.217.101.202');
INSERT INTO `watch_list` VALUES (276, 120, '2018-04-20 20:16:45', '188.163.57.232');
INSERT INTO `watch_list` VALUES (277, 119, '2018-04-20 20:16:43', '188.163.57.232');
INSERT INTO `watch_list` VALUES (278, 89, '2018-04-20 20:16:04', '188.163.57.232');
INSERT INTO `watch_list` VALUES (279, 121, '2018-04-20 20:16:48', '188.163.57.232');
INSERT INTO `watch_list` VALUES (280, 75, '2018-04-20 20:15:59', '174.127.133.61');
INSERT INTO `watch_list` VALUES (281, 189, '2018-04-11 20:22:52', '174.127.133.65');
INSERT INTO `watch_list` VALUES (282, 89, '2018-04-20 20:16:04', '174.127.133.65');
INSERT INTO `watch_list` VALUES (283, 62, '2018-04-20 20:15:57', '91.250.35.239');
INSERT INTO `watch_list` VALUES (284, 75, '2018-04-20 20:15:59', '5.105.20.135');
INSERT INTO `watch_list` VALUES (285, 187, '2018-04-15 06:44:56', '5.105.20.135');
INSERT INTO `watch_list` VALUES (286, 178, '2018-04-16 16:27:58', '31.13.114.246');
INSERT INTO `watch_list` VALUES (287, 75, '2018-04-20 20:15:59', '34.211.255.39');
INSERT INTO `watch_list` VALUES (288, 89, '2018-04-20 20:16:04', '34.211.255.39');
INSERT INTO `watch_list` VALUES (289, 71, '2018-04-20 20:16:02', '34.211.255.39');
INSERT INTO `watch_list` VALUES (290, 62, '2018-04-20 20:15:57', '34.211.255.39');
INSERT INTO `watch_list` VALUES (291, 189, '2018-04-16 22:09:01', '34.211.255.39');
INSERT INTO `watch_list` VALUES (292, 153, '2018-04-16 23:37:30', '34.211.255.39');
INSERT INTO `watch_list` VALUES (293, 127, '2018-04-16 23:42:16', '34.211.255.39');
INSERT INTO `watch_list` VALUES (294, 140, '2018-04-16 23:51:44', '34.211.255.39');
INSERT INTO `watch_list` VALUES (295, 146, '2018-04-17 00:33:36', '34.211.255.39');
INSERT INTO `watch_list` VALUES (296, 89, '2018-04-20 20:16:04', '38.100.21.61');
INSERT INTO `watch_list` VALUES (297, 75, '2018-04-22 10:59:33', '188.163.57.232');

-- --------------------------------------------------------

-- 
-- Структура таблицы `wish_users`
-- 

CREATE TABLE `wish_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- 
-- Дамп данных таблицы `wish_users`
-- 

INSERT INTO `wish_users` VALUES (1, 115, 47, 10, '2017-10-07 12:06:10');
INSERT INTO `wish_users` VALUES (2, 116, 47, 1, '2017-10-07 12:07:49');
INSERT INTO `wish_users` VALUES (4, 118, 47, 14, '2017-10-07 12:17:35');
INSERT INTO `wish_users` VALUES (5, 118, 47, 13, '2017-10-07 13:03:18');
INSERT INTO `wish_users` VALUES (6, 115, 47, 11, '2017-10-07 13:13:53');
INSERT INTO `wish_users` VALUES (8, 118, 47, 29, '2017-10-07 13:29:13');
INSERT INTO `wish_users` VALUES (9, 113, 47, 21, '2017-10-07 13:38:05');
INSERT INTO `wish_users` VALUES (12, 120, 70, 10, '2017-10-08 21:46:43');
INSERT INTO `wish_users` VALUES (13, 121, 70, 14, '2017-10-08 23:25:30');
INSERT INTO `wish_users` VALUES (15, 120, 70, 13, '2017-10-08 23:55:27');
INSERT INTO `wish_users` VALUES (16, 121, 70, 11, '2017-10-09 02:24:07');
INSERT INTO `wish_users` VALUES (20, 125, 71, 15, '2017-10-30 22:59:42');
INSERT INTO `wish_users` VALUES (21, 125, 71, 10, '2017-11-02 08:43:46');
INSERT INTO `wish_users` VALUES (22, 125, 71, 11, '2017-11-03 02:07:17');
INSERT INTO `wish_users` VALUES (30, 126, 49, 26, '2017-11-29 08:55:31');
INSERT INTO `wish_users` VALUES (31, 126, 49, 2, '2017-11-29 08:55:37');
INSERT INTO `wish_users` VALUES (32, 125, 71, 58, '2018-01-08 12:06:37');
INSERT INTO `wish_users` VALUES (33, 125, 71, 89, '2018-01-31 03:49:23');
INSERT INTO `wish_users` VALUES (34, 127, 71, 77, '2018-02-19 15:13:34');
INSERT INTO `wish_users` VALUES (35, 128, 71, 82, '2018-02-19 15:13:50');
INSERT INTO `wish_users` VALUES (36, 127, 71, 83, '2018-02-19 15:14:47');
INSERT INTO `wish_users` VALUES (39, 125, 71, 144, '2018-04-05 14:43:40');
INSERT INTO `wish_users` VALUES (40, 127, 71, 173, '2018-04-05 14:43:48');

-- --------------------------------------------------------

-- 
-- Структура таблицы `wishlist`
-- 

CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `default` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

-- 
-- Дамп данных таблицы `wishlist`
-- 

INSERT INTO `wishlist` VALUES (113, 'Список 1а', 47, '2017-08-02 17:03:49', 0);
INSERT INTO `wishlist` VALUES (114, 'тестинг', 51, '2017-08-08 05:26:41', 0);
INSERT INTO `wishlist` VALUES (115, 'rrrrrrrr', 47, '2017-10-07 12:06:10', 0);
INSERT INTO `wishlist` VALUES (116, 'rtrt', 47, '2017-10-07 12:07:49', 0);
INSERT INTO `wishlist` VALUES (117, 'fffffff', 47, '2017-10-07 12:14:34', 0);
INSERT INTO `wishlist` VALUES (118, 'aqqq', 47, '2017-10-07 12:17:35', 0);
INSERT INTO `wishlist` VALUES (120, 'trr', 70, '2017-10-08 21:46:43', 0);
INSERT INTO `wishlist` VALUES (121, 'qqq', 70, '2017-10-08 23:25:30', 0);
INSERT INTO `wishlist` VALUES (125, 'test', 71, '2017-10-30 22:59:42', 0);
INSERT INTO `wishlist` VALUES (126, 'testing', 49, '2017-11-29 04:12:14', 0);
INSERT INTO `wishlist` VALUES (127, 'test2', 71, '2018-02-19 15:13:34', 0);
INSERT INTO `wishlist` VALUES (128, 'test6', 71, '2018-02-19 15:13:50', 0);
