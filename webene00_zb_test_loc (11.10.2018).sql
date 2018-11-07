-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 11 2018 г., 15:51
-- Версия сервера: 5.6.38
-- Версия PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webene00_zb_test_loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `additional_attribute`
--

CREATE TABLE `additional_attribute` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `additional_attribute`
--

INSERT INTO `additional_attribute` (`id`, `title`, `value`) VALUES
(1, 'Text', 'text'),
(2, 'Textarea', 'textarea'),
(3, 'Number', 'number'),
(4, 'Radio', 'radio'),
(5, 'Checkbox', 'checkbox'),
(6, 'Link', 'link');

-- --------------------------------------------------------

--
-- Структура таблицы `additions_products`
--

CREATE TABLE `additions_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `related_additions_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `additions_products`
--

INSERT INTO `additions_products` (`id`, `product_id`, `related_additions_id`) VALUES
(1, 75, 76),
(2, 75, 80),
(3, 75, 81),
(4, 75, 82);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `attribute_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `availability_products`
--

CREATE TABLE `availability_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `availability_products`
--

INSERT INTO `availability_products` (`id`, `title`, `alias`) VALUES
(1, 'published', 'published'),
(2, 'archive', 'archive'),
(3, 'coming soon', 'coming_soon'),
(4, 'sold out', 'sold_out'),
(5, 'Do not display', 'do_not_display');

-- --------------------------------------------------------

--
-- Структура таблицы `bonuses`
--

CREATE TABLE `bonuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `action` tinyint(2) NOT NULL DEFAULT '0',
  `sum` int(10) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bonuses`
--

INSERT INTO `bonuses` (`id`, `title`, `start_time`, `end_time`, `action`, `sum`) VALUES
(1, 'E-burpy', '2017-07-07 00:00:00', '2018-06-07 00:00:00', 1, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_id_product` int(11) NOT NULL,
  `additions_for_cart_id` varchar(255) DEFAULT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  `cookie_key` varchar(100) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_warehouse_id` int(11) DEFAULT NULL,
  `cart_id_supplier` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_id_product`, `additions_for_cart_id`, `cart_price`, `cart_count`, `status`, `cart_datetime`, `cart_ip`, `cookie_key`, `user_id`, `cart_warehouse_id`, `cart_id_supplier`) VALUES
(168, 77, NULL, 56, 4, 0, '2018-09-12 15:28:46', '127.0.0.1', 'ltj6CubDoTgk', 71, NULL, 1),
(169, 71, NULL, 22, 10, 0, '2018-09-12 15:43:01', '127.0.0.1', 'ltj6CubDoTgk', 71, NULL, 1),
(170, 77, NULL, 56, 10, 0, '2018-09-12 15:43:03', '127.0.0.1', '0V3AsGXvqroI', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'nophoto.jpg',
  `description` varchar(255) NOT NULL,
  `m_description` varchar(255) NOT NULL DEFAULT 'm_description_text',
  `m_keywords` varchar(255) NOT NULL,
  `additional_attribute_category` text,
  `category_views` int(10) UNSIGNED DEFAULT NULL,
  `view` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent`, `title`, `alias`, `image`, `description`, `m_description`, `m_keywords`, `additional_attribute_category`, `category_views`, `view`) VALUES
(1, 0, 'PAPER PRODUCT', 'category_al_1', '011218_URyMwsirj.jpg', 'Toilet tissue, paper towels, facial tissue e.t.c.', 'paper product', 'paper towels, toilet tissue', '[{\"additionaltext_label\":\"xcxcx\",\"id_val\":\"\",\"position_val\":\"\",\"type_val\":\"text\",\"description_val\":\"\",\"init_id\":1511229936},{\"additionaltext_label\":\"sdsd\",\"id_val\":\"fderfdf\",\"position_val\":\"10\",\"type_val\":\"number\",\"description_val\":\"\",\"init_id\":1511262680},{\"additionaltext_label\":\"kjkj\",\"id_val\":\"ghghghg\",\"position_val\":\"54\",\"type_val\":\"radio\",\"description_val\":\"\",\"init_id\":1511262695},{\"additionaltext_label\":\"kjkj\",\"id_val\":\"jjjh\",\"position_val\":\"uy\",\"type_val\":\"link\",\"description_val\":\"\",\"init_id\":1511262707},{\"additionaltext_label\":\"xcxcx\",\"id_val\":\"cvcv\",\"position_val\":\"vcvcv\",\"type_val\":\"textarea\",\"description_val\":\"dfdfdfdf\",\"init_id\":1516821847}]', 35, '1'),
(2, 0, 'GLOVES', 'category_2', '110717_JlpsQI24y.jpg', '\r\nANY KIND OF GLOVES FOR YOU NEEDS', 'gloves', 'Gloves, nitrile gloves, latex gloves', NULL, NULL, '1'),
(3, 0, 'PACKAGING', 'category_3', '011218_V2H9U3GTI.jpg', '\r\nProduct for your mailroom needs; boxes, envelopes, bubbles, e.t.c.', 'm_description_text', 'BOXES, PACKAGING', NULL, NULL, '1'),
(4, 0, 'BREAK  ROOM', 'category_4', '011218_2yFraezYN.jpg', 'All your break room or kitchenette needs; plates, cups cutlery.', 'm_description_text', '', NULL, 4, '1'),
(5, 0, 'LINERS', 'category_5', '011218_DHRyqHLai.jpg', 'We have a big variety of can liners; low density, high density, biodegradable and more.', 'm_description_text', 'can liners', NULL, NULL, '1'),
(6, 0, 'SKIN CARE', 'category_6', '110717_1strbgmUz.jpg', 'THIS CATEGORY FOR SOAP AND HAND SANITIZERS. BIG VARIETY OF   SOAP, FOAM SOAP WITH MOISTURIZERS, ANTIBACTERIAL, ANTIMICROBIAL, AND REGULAR ONES WITH FRAGRANCE OR FRAGRANCE-FREE.', 'SKIN CARE PRODUCT', 'SOAP, SANITIZERS', NULL, 2, '1'),
(7, 0, 'CLEANING TOOLS', 'category_7', '011218_4RaRjTEJD.jpg', 'Righ tools for the job.', 'm_description_text', 'Cleaning tools, mops, bucket, brushes', NULL, NULL, '1'),
(8, 0, 'CHEMICALS', 'category_8', '011218_RHwjRNbuY.jpg', 'Cleaning solution to make you job easy', 'Cleaning solution', '', NULL, 11, '1'),
(26, 8, 'Odor control', 'odor-control', '012218_5Zn9aVBId.jpg', 'Air fresheners, odor bacteria eliminators, everything you need to keep your troubled areas fresh.', 'Air freshener, odor control, deodoriser', 'AIR FRESHENER, ODOR CONTROL, DEODORISER', NULL, 7, '1'),
(28, 6, 'DISPENSERS', 'dispensers', '012818_9LjejM6ar.jpg', 'dispensers for soap, foam soap, manual and touch-free.', '', 'sOAP dISPENSERS', NULL, 1, '1'),
(29, 28, 'disperence 2', 'disperence-2', 'nophoto.jpg', 'DISPERENCE 2', 'DISPERENCE 2', 'DISPERENCE 2', NULL, NULL, '1'),
(30, 6, 'disperence_scincare', 'disperence_scincare', 'nophoto.jpg', 'DISPERENCE_SCINCARE', 'DISPERENCE_SCINCARE', 'DISPERENCE_SCINCARE', NULL, NULL, '1'),
(31, 29, 'disperence 3', 'disperence-3', 'nophoto.jpg', 'DISPERENCE 3', 'DISPERENCE 3', 'DISPERENCE 3', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `author_email` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_product_id` int(11) NOT NULL,
  `comment_good` text NOT NULL,
  `comment_bad` text NOT NULL,
  `approved` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '''0''-ожидают проверки,"1" - Опубликованные,"2"-Спам,"3"-Удаленные',
  `count_like` int(10) UNSIGNED NOT NULL,
  `count_dislike` int(10) UNSIGNED NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `parent`, `author_name`, `author_email`, `comment_text`, `comment_product_id`, `comment_good`, `comment_bad`, `approved`, `count_like`, `count_dislike`, `created_add`, `is_admin`) VALUES
(1, 0, 'Иван', 'test@gmail.com', 'ntrcn', 1, 'good', 'bad', '1', 2, 1, '2018-01-15 06:49:22', 0),
(2, 1, 'sun', 'email', 'comment text', 1, 'good', 'bad', '1', 2, 1, '2017-12-11 13:27:08', 1),
(3, 0, 'Иван', 'test@gmail.com', 'ntrcn', 1, 'good', 'bad', '1', 2, 0, '2017-12-11 13:10:31', 0),
(4, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 2, 1, '2017-12-11 13:27:01', 0),
(5, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 2, 0, '2017-12-11 13:11:17', 0),
(6, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:19:32', 0),
(7, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:19:36', 0),
(8, 1, 'asasa', 'SDZADsdzd@dsdsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:19:39', 0),
(9, 6, 'Roman', 'sdsdsdsdsd@sddsd.com', 'Комментарий', 1, '', '', '1', 0, 0, '2017-07-21 07:19:42', 0),
(10, 6, 'Roman', 'sdsdsdsdsd@sddsd.com', 'Комментарий', 1, '', '', '1', 0, 0, '2017-07-21 07:23:57', 0),
(11, 1, 'asasasasa', 'sasasasasas@asas.com', 'asasasdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:19:47', 0),
(12, 1, 'sdsdsdsdsdsds', 'sdsdsdsds@sadsd.com', 'sdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:19:51', 0),
(13, 1, 'sdsdsdsdsdsdsd', 'dssdsdd@sdsd.com', 'sdsdssdsdsdsdsdsd', 1, 'sdsds', 'dsd', '1', 0, 0, '2017-07-21 07:24:01', 0),
(14, 13, 'dsdsdsd', 'sdsdsd@dsdsd.com', 'sdsdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:24:04', 0),
(15, 12, 'sdsd', 'sdsdsdsd@sds.com', 'sdsdsdsdsddsdsdsd', 1, 'sdsds', 'dsdsdsd', '1', 0, 0, '2017-07-21 07:20:09', 0),
(16, 1, 'asasasas', 'asas@sdsd.coms', 'dsdsdsdsdsdsdsdsd', 1, '', '', '1', 0, 0, '2017-07-21 07:24:07', 0),
(17, 1, 'sdsdsdsd', 'sdsds@sdsd.com', 'dsdsdsdsdvbvbvb', 1, '', '', '1', 0, 0, '2017-07-21 07:20:07', 0),
(18, 1, 'wewewewewe', 'wewewe@dfdfd.com', 'wewewewewewewewewe', 1, '', '', '1', 0, 0, '2017-07-21 07:24:11', 0),
(19, 1, 'wwewewewewe', 'wewewe@dfdfd.com', 'weweweweasasasas', 1, '', '', '1', 1, 1, '2017-12-11 13:25:09', 0),
(20, 2, 'sdsdsdsds', 'wewewe@dfdfd.com', 'sdsdsdsdsddsdsdsd', 1, '', 'sdsd', '1', 0, 0, '2017-07-21 07:24:14', 0),
(21, 0, 'fgfgfgfgfg', 'gfgfgfg@fmfmf.com', 'fgfgfdfdfdfdfdfdfdf', 1, '', '', '1', 1, 1, '2017-12-11 13:13:00', 0),
(22, 0, 'sdsdsdsd', 'sdsdsd@dsdsd.com', 'sdsdsdsdsdsdsdsdsd', 3, 'dsdsdsdsds', 'dsdsdsd', '1', 0, 0, '2017-07-21 07:24:18', 0),
(23, 22, 'assaasasasa', 'asasasasas@sdsdsd.com', 'asasasassdsdsd', 3, 'sasasas', 'asasas', '1', 0, 0, '2017-07-21 07:24:21', 0),
(24, 23, 'xzxzxzxzx', 'sdsds@sdsds.com', 'dsdsdxzxzxzxzx', 3, 'sdsdsdsdsd', 'sdsdsdsdsd', '1', 0, 0, '2017-07-21 07:24:24', 0),
(25, 0, 'asasasas', 'wewewe@dfdfd.com', 'asasasasasasasasasas', 3, 'asasasa', 'sasasasas', '1', 0, 0, '2017-07-21 07:19:56', 0),
(26, 3, 'вмвммвмвмв', 'admin@gmail.com', 'вмвмвмв', 1, 'good products. thanks', 'no bad', '0', 0, 0, '2017-12-11 10:38:33', 0),
(27, 3, 'my test name', 'admin@gmail.com', 'thank you for website', 1, 'very good products', 'no bad', '0', 0, 0, '2017-12-11 10:41:52', 0),
(28, 2, 'cvcvcvcv', 'email@gmail.com', 'vcvcvcvcvdfdfdf', 1, 'cvcv', 'cvc', '0', 0, 0, '2017-12-11 10:54:56', 0),
(29, 1, 'xcxcxcxc', 'email@gmail.com', 'xcxcxcxcxc', 1, 'xc', 'cxc', '0', 0, 0, '2017-12-11 11:21:34', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `comments_votes`
--

CREATE TABLE `comments_votes` (
  `id` int(11) NOT NULL,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `comments_id` int(11) NOT NULL,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `comments_votes`
--

INSERT INTO `comments_votes` (`id`, `user_ip`, `ip_locale_address`, `comments_id`, `created`) VALUES
(16, '127.0.0.1', 'WIN-QJF2VCB52DD', 4, '2017-12-12'),
(17, '127.0.0.1', 'WIN-QJF2VCB52DD', 2, '2017-12-12'),
(18, '127.0.0.1', 'agro', 1, '2018-01-15');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'Hryvna', 'UAH', '', 'uah.', 25.80, '0'),
(2, 'Dollar', 'USD', '$', '', 1.00, '1'),
(3, 'Euro', 'EUR', '€', '', 0.88, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `position` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `delivery`
--

INSERT INTO `delivery` (`id`, `title`, `alias`, `position`) VALUES
(1, 'Доставка курьером', 'couriers', 1),
(2, 'Самовывоз', 'self_delivery', 2),
(3, 'По почте', 'per_post', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `percent` double DEFAULT NULL,
  `status_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `discount`
--

INSERT INTO `discount` (`id`, `title`, `start_date`, `end_date`, `percent`, `status_active`) VALUES
(1, 'cvvcvcv', '2018-10-02 00:00:00', '2018-10-10 00:00:00', 10, 1),
(2, 'test 2', '2018-10-01 00:00:00', '2018-10-07 00:00:00', 10, 1),
(3, 'test 2', '2018-10-01 00:00:00', '2018-10-07 00:00:00', 10, 1),
(4, 'sdsdsd', '1970-01-01 00:00:00', '2018-10-09 00:00:00', 0, 1),
(5, 'sdsdsd', '1970-01-01 00:00:00', '2018-10-09 00:00:00', 0, 1),
(6, 'sdsdsd', '1970-01-01 00:00:00', '2018-10-09 00:00:00', 0, 1),
(7, 'sdsdsd', '1970-01-01 00:00:00', '2018-10-09 00:00:00', 0, 1),
(8, 'sdsdsd', '1970-01-01 00:00:00', '2018-10-09 00:00:00', 0, 1),
(9, 'test 3', '2018-03-15 00:00:00', '2018-03-17 00:00:00', 10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fealtures`
--

CREATE TABLE `fealtures` (
  `id` int(5) UNSIGNED NOT NULL,
  `fealtures` tinyint(3) UNSIGNED NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu_admin`
--

CREATE TABLE `menu_admin` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `position` int(3) NOT NULL,
  `parent` int(10) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `view` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_admin`
--

INSERT INTO `menu_admin` (`id`, `title`, `alias`, `description`, `keywords`, `position`, `parent`, `icon`, `view`) VALUES
(1, 'Home', 'home', 'empty', 'empty', 1, 0, 'home', '1'),
(2, 'Products', 'product-options', 'home', 'home home', 2, 0, 'home', '1'),
(3, 'Category', 'category-product-options', 'category-product-options', 'category-product-options', 2, 3, '', '1'),
(4, 'Category Add', 'edit-category-product/new', 'edit-category-product', 'edit-category-product', 4, 0, 'content_paste', '0'),
(5, 'Product Add', 'add-product/new', 'description', 'keywords', 5, 3, 'queue', '0'),
(6, 'Warehouse', 'warehouse', '', '', 5, 0, 'compare', '1'),
(7, 'Warehouse Add', 'edit-warehouse/new', '', '', 6, 0, 'queue', '0'),
(8, 'Upsell', 'upsell', 'upsell options', 'upsell options', 5, 3, 'local_mall', '1'),
(9, 'Stock', 'stock', 'Stock options', 'Stock options', 6, 3, 'local_play', '1'),
(10, 'Orders', 'orders-options', 'orders options', 'orders options', 8, 0, 'local_play', '1'),
(11, 'Comments', 'comments', 'comments options', 'comments options', 7, 0, 'local_play', '0'),
(12, 'Users', 'users', 'users options', 'users options', 7, 0, 'insert_emoticon', '1'),
(13, 'Team', 'team', 'team options', 'team options', 6, 0, 'insert_emoticon', '1'),
(14, 'Pages', 'static-pages', 'Pages options', 'Pages options', 9, 0, 'library_books', '1'),
(15, 'Settings', 'settings', 'Settings options', 'Settings options', 10, 0, 'settings', '1'),
(16, 'CSV import', 'product-import', 'CSV import', 'CSV import', 11, 3, 'play_for_work', '1'),
(17, 'Product fields', 'category-fields', 'Product fields', 'Product fields', 12, 3, 'settings_applications', '1'),
(18, 'Suppliers', 'suppliers', 'Suppliers', 'Suppliers', 13, 0, 'Suppliers', '1'),
(19, 'Discount', 'discount', 'discount', 'discount', 14, 0, '', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_office`
--

CREATE TABLE `menu_office` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `position` int(3) NOT NULL,
  `parent` int(10) NOT NULL,
  `icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_office`
--

INSERT INTO `menu_office` (`id`, `title`, `alias`, `description`, `keywords`, `position`, `parent`, `icon`) VALUES
(1, 'Main', '/profile', 'profile menu', 'profile menu', 1, 0, 'fa fa-user'),
(2, 'Finance', '#', 'finance desc', 'Ключевые фразы', 2, 0, 'fa fa-user'),
(3, 'Orders', '/orders', 'orders', 'Корзин пользователя - описание', 3, 0, 'fa fa-user'),
(4, 'Wish list', '/wish-list', 'wish list user', 'ключевые слова', 4, 0, 'fa fa-user');

-- --------------------------------------------------------

--
-- Структура таблицы `models_product`
--

CREATE TABLE `models_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `old_price` float NOT NULL,
  `new_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `modification`
--

CREATE TABLE `modification` (
  `id` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `modification`
--

INSERT INTO `modification` (`id`, `product_id`, `title`, `price`) VALUES
(1, 75, 'white', 700),
(2, 75, 'silver', 600);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) NOT NULL,
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
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`, `delivery`, `type_pay`, `pay`, `note`) VALUES
(1, '2017-07-06 00:00:00', '2017-07-06 00:00:00', 10, 8555, 0, 'имя клиента', 'email', 'phone', 'address', 1, 1, 0, 'note'),
(2, '2017-07-06 18:15:25', '2017-07-06 18:15:25', 10, 8555, 0, 'имя клиента', 'email', 'phone', 'address', 1, 1, 0, ''),
(3, '2017-07-06 18:28:40', '2017-07-06 18:28:40', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(4, '2017-07-06 18:30:10', '2017-07-06 18:30:10', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(5, '2017-07-06 18:31:27', '2017-07-06 18:31:27', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(6, '2017-07-06 19:01:47', '2017-07-06 19:01:47', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(7, '2017-07-06 19:03:17', '2017-07-06 19:03:17', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(8, '2017-07-06 19:04:20', '2017-07-06 19:04:20', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(9, '2017-07-06 19:06:47', '2017-07-06 19:06:47', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(10, '2017-07-06 19:08:08', '2017-07-06 19:08:08', 15, 16772, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(11, '2017-07-06 19:08:36', '2017-07-06 19:08:36', 12, 3024, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(12, '2017-07-06 19:09:42', '2017-07-06 19:09:42', 12, 3024, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(13, '2017-07-06 19:11:43', '2017-07-06 19:11:43', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(14, '2017-07-06 19:12:45', '2017-07-06 19:12:45', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(15, '2017-07-06 19:12:59', '2017-07-06 19:12:59', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(16, '2017-07-06 19:50:40', '2017-07-06 19:50:40', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf'),
(17, '2017-07-06 19:52:35', '2017-07-06 19:52:35', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf'),
(18, '2017-07-06 19:57:29', '2017-07-06 19:57:29', 16, 4027, 0, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 1, 0, 'dfdfdfdf'),
(19, '2017-07-06 20:00:38', '2017-07-06 20:00:38', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(20, '2017-07-06 20:00:44', '2017-07-06 20:00:44', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(21, '2017-07-06 20:18:25', '2017-07-06 20:18:25', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(22, '2017-07-06 20:18:47', '2017-07-06 20:18:47', 16, 4027, 0, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(23, '2017-07-06 20:19:19', '2017-07-06 20:19:19', 16, 4027, 0, 'Иванович', 'pudzia009@gmail.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 2, 0, ''),
(24, '2017-07-07 11:29:00', '2017-07-07 11:29:00', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(25, '2017-07-07 11:32:09', '2017-07-07 11:32:09', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(26, '2017-07-07 13:02:10', '2017-07-07 13:02:10', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(27, '2017-07-07 14:05:43', '2017-07-07 14:05:43', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(28, '2017-07-07 14:41:08', '2017-07-07 14:41:08', 23, 9032, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(29, '2017-07-07 14:42:45', '2017-07-07 14:42:45', 1, 251, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(30, '2017-07-07 15:27:50', '2017-07-07 15:27:50', 1, 251, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(31, '2017-07-07 15:33:35', '2017-07-07 15:33:35', 2, 503, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(32, '2017-07-07 15:37:00', '2017-07-07 15:37:00', 1, 252, 0, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 2, 0, ''),
(33, '2017-07-18 15:16:06', '2017-07-18 15:16:06', 1, 252, 0, 'admin', 'pudzia009@gmail.com', '+38(021) 212-12-12,+38(021) 212-12-12', 'долодлолдололо', 3, 1, 0, ''),
(34, '2017-07-21 13:58:05', '2017-07-21 13:58:05', 1, 250, 0, 'sxsxs', 'freeitteam1000@gmail.com', '+38(222) 222-22-22,+38(222) 222-22-22', 'asasasasaasasasas', 3, 1, 0, 'sasasasasasasas');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
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
  `zipcode` int(8) UNSIGNED NOT NULL,
  `type_pay` tinyint(2) NOT NULL,
  `pay` tinyint(2) NOT NULL,
  `note` text NOT NULL,
  `team_admin_users_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`, `delivery`, `zipcode`, `type_pay`, `pay`, `note`, `team_admin_users_id`, `user_id`) VALUES
(1, '2017-07-06 00:00:00', '2017-07-06 00:00:00', 10, 8555, 1, 'имя клиента', 'email', 'phone', 'address', 1, 0, 1, 0, 'note', 1, 0),
(2, '2017-07-06 18:15:25', '2017-07-06 18:15:25', 10, 8555, 1, 'имя клиента', 'email', 'phone', 'address', 1, 0, 1, 0, '', 1, 0),
(3, '2017-07-06 18:28:40', '2017-07-06 18:28:40', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(4, '2017-07-06 18:30:10', '2017-07-06 18:30:10', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(5, '2017-07-06 18:31:27', '2017-07-06 18:31:27', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(6, '2017-07-06 19:01:47', '2017-07-06 19:01:47', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(7, '2017-07-06 19:03:17', '2017-07-06 19:03:17', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(8, '2017-07-06 19:04:20', '2017-07-06 19:04:20', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(9, '2017-07-06 19:06:47', '2017-07-06 19:06:47', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(10, '2017-07-06 19:08:08', '2017-07-06 19:08:08', 15, 16772, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(11, '2017-07-06 19:08:36', '2017-07-06 19:08:36', 12, 3024, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(12, '2017-07-06 19:09:42', '2017-07-06 19:09:42', 12, 3024, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(13, '2017-07-06 19:11:43', '2017-07-06 19:11:43', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(14, '2017-07-06 19:12:45', '2017-07-06 19:12:45', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(15, '2017-07-06 19:12:59', '2017-07-06 19:12:59', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(16, '2017-07-06 19:50:40', '2017-07-06 19:50:40', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 0, 1, 0, 'dfdfdfdf', 1, 0),
(17, '2017-07-06 19:52:35', '2017-07-06 19:52:35', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 0, 1, 0, 'dfdfdfdf', 1, 0),
(18, '2017-07-06 19:57:29', '2017-07-06 19:57:29', 16, 4027, 1, 'dfdfdfdfdfdf', 'pudzia009@gmail.com', '+38(665) 656-56-65', 'dfdfdfdfdfdf', 2, 0, 1, 0, 'dfdfdfdf', 1, 0),
(19, '2017-07-06 20:00:38', '2017-07-06 20:00:38', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(20, '2017-07-06 20:00:44', '2017-07-06 20:00:44', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(21, '2017-07-06 20:18:25', '2017-07-06 20:18:25', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(22, '2017-07-06 20:18:47', '2017-07-06 20:18:47', 16, 4027, 1, 'Иванович', 'sdsdsd@ssdd.com', '+38(999) 999-99-99,+38(999) 999-99-99', 'вавававававава', 2, 0, 2, 0, '', 1, 0),
(28, '2017-07-07 14:41:08', '2017-07-07 14:41:08', 23, 9032, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 0, 2, 0, '', 1, 0),
(29, '2017-07-07 14:42:45', '2017-07-07 14:42:45', 1, 251, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 0, 2, 0, '', 1, 0),
(30, '2017-07-07 15:27:50', '2017-07-07 15:27:50', 1, 251, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 0, 2, 0, '', 1, 0),
(31, '2017-07-07 15:33:35', '2017-07-07 15:33:35', 2, 503, 1, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 0, 2, 0, '', 1, 0),
(32, '2017-07-07 15:37:00', '2017-12-02 13:05:04', 1, 252, 3, 'admin', 'pudzia009@gmail.com', '+38(545) 454-54-54', 'njhihuhuhuuhuhuhu', 2, 0, 2, 0, '', 1, 0),
(33, '2017-07-18 15:16:06', '2017-07-18 15:16:06', 1, 252, 1, 'admin', 'pudzia009@gmail.com', '+38(021) 212-12-12,+38(021) 212-12-12', 'долодлолдололо', 3, 0, 1, 0, '', 1, 0),
(34, '2017-07-21 13:58:05', '2017-07-21 13:58:05', 1, 250, 1, 'sxsxs', 'freeitteam1000@gmail.com', '+38(222) 222-22-22,+38(222) 222-22-22', 'asasasasaasasasas', 3, 0, 1, 0, 'sasasasasasasas', 1, 0),
(35, '2017-10-19 15:55:39', '2017-10-19 15:55:39', 48, 11551.5, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', 3, 0, 2, 0, '', 1, 0),
(36, '2017-10-20 03:42:55', '2017-10-20 03:42:55', 48, 11551.5, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', 3, 0, 1, 0, '', 1, 0),
(37, '2017-10-20 03:46:03', '2017-10-20 03:46:03', 2, 499.98, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', 3, 0, 2, 0, '', 1, 0),
(38, '2017-10-20 04:22:10', '2017-10-20 04:22:10', 2, 467.98, 1, 'Иванович', 'freeitteam1000@gmail.com', '+380678478947', 'xxxx', 1, 0, 4, 0, '', 1, 0),
(39, '2017-11-27 14:51:58', '2017-11-27 14:51:58', 26, 6387.74, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 1, 0, ';l;l;l;', 1, 0),
(40, '2017-11-27 15:59:33', '2017-11-27 15:59:33', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 4, 0, ';l;l;l;', 1, 0),
(41, '2017-11-27 16:10:02', '2017-11-27 16:10:02', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 3, 0, 4, 0, 'fsfsdfsdfsdf', 1, 0),
(42, '2017-11-27 16:11:51', '2017-12-02 13:04:21', 10, 2499.9, 2, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 3, 0, 2, 0, 'fsfsdfsdfsdf', 1, 0),
(43, '2017-11-27 16:18:46', '2017-11-27 16:18:46', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 4, 0, 'fsfsdfsdfsdf', 1, 0),
(44, '2017-11-27 16:20:06', '2017-11-27 16:20:06', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 4, 0, 'fsfsdfsdfsdf', 1, 0),
(45, '2017-11-27 16:44:13', '2017-11-27 16:44:13', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 4, 0, 'fsfsdfsdfsdf', 1, 0),
(46, '2017-11-27 16:45:07', '2017-11-27 16:45:07', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 2, 0, 'fsfsdfsdfsdf', 1, 0),
(47, '2017-11-27 16:46:32', '2017-11-27 16:46:32', 1, 249.99, 1, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 2, 0, 'fsfsdfsdfsdf', 1, 0),
(48, '2017-11-27 16:47:55', '2017-12-01 20:37:21', 0, 0, 2, 'уыв', 'freeitgroupe@gmail.com', '12345678900', 'kllk', 1, 0, 2, 0, 'fsfsdfsdfsdf', 1, 0),
(49, '2017-11-29 12:26:07', '2017-12-01 20:02:06', 24, 5999.8, 1, 'dfdfdf', 'pudzia009@gmail.com', '', '', 2, 0, 1, 0, 'dcdcdc', 1, 0),
(50, '2017-12-02 13:50:27', '2017-12-05 10:43:51', 94, 23019.2, 2, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', 2, 0, 1, 0, 'xzvxvzvxcvZv', 0, 0),
(51, '2017-12-02 15:02:30', '2017-12-02 15:02:30', 2, 499.98, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', 2, 0, 4, 0, 'чччччччччччччччччччччччччччч', 0, 0),
(52, '2017-12-14 14:14:33', '2017-12-14 14:14:33', 6, 444722, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', 3, 0, 1, 0, 'vbvbvbvbvbvbvbv', 0, 71),
(53, '2017-12-15 13:25:02', '2018-01-17 06:37:25', 1, 55.55, 0, 'Admin Admin', 'admin@gmail.com', '1(111)1111-111-111', '', 2, 0, 1, 0, 'frerer', 0, 71);

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(10) NOT NULL,
  `sum_item` float NOT NULL,
  `article_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `title`, `price`, `qty_item`, `sum_item`, `article_number`) VALUES
(51, 28, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 13, 3276, 'article-12d-test'),
(52, 28, 1, '111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 250, 3, 750, 'article-12d-test'),
(53, 28, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 6, 1506, 'article-12d-test'),
(54, 28, 5, '45541LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 3500, 1, 3500, 'article-12d-test'),
(55, 29, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, 'article-12d-test'),
(56, 30, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, 'article-12d-test'),
(57, 31, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 1, 252, 'article-12d-test'),
(58, 31, 2, '222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 251, 1, 251, 'article-12d-test'),
(59, 32, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 1, 252, 'article-12d-test'),
(60, 33, 3, '33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 252, 10, 2520, 'article-12d-test'),
(61, 34, 1, '111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА', 250, 1, 250, 'article-12d-test'),
(62, 35, 10, 'product-test_10', 249.99, 20, 5000, ''),
(63, 35, 1, 'Coffee stuff for Lovers_1', 233.99, 16, 3744, ''),
(64, 35, 2, 'Coffee stuff for Lovers_2', 233.99, 12, 2808, ''),
(65, 37, 10, 'product-test_10', 249.99, 1, 250, 'article'),
(66, 37, 11, 'product-test_11', 249.99, 1, 250, 'article'),
(67, 38, 1, 'Coffee stuff for Lovers_1', 233.99, 1, 234, '#54d874'),
(68, 38, 2, 'Coffee stuff for Lovers_2', 233.99, 1, 234, '#54d874'),
(69, 39, 11, 'product-test_11', 249.99, 4, 1000, 'article'),
(70, 39, 2, 'Coffee stuff for Lovers_2', 233.99, 7, 1638, '#54d874'),
(71, 39, 13, 'product-test_13_13', 249.99, 3, 750, '#21221'),
(72, 39, 21, 'product-test_21', 249.99, 2, 500, 'article'),
(73, 39, 16, 'product-test_16', 249.99, 10, 2500, 'article'),
(74, 40, 20, 'product-test_20', 249.99, 1, 250, 'article'),
(75, 41, 20, 'product-test_20', 249.99, 1, 250, 'article'),
(76, 42, 24, 'product-test_24', 249.99, 10, 2499.9, 'article'),
(77, 43, 24, 'product-test_24', 249.99, 1, 250, 'article'),
(78, 44, 20, 'product-test_20', 249.99, 1, 250, 'article'),
(79, 45, 21, 'product-test_21', 249.99, 1, 250, 'article'),
(80, 46, 24, 'product-test_24', 249.99, 1, 250, 'article'),
(81, 47, 23, 'product-test_23', 249.99, 1, 250, 'article'),
(84, 49, 32, 'product-test_32', 249.99, 10, 2499.9, 'article'),
(86, 49, 34, 'product-test_34', 249.99, 4, 1000, 'article'),
(87, 49, 35, 'product-test_35', 249.99, 10, 2499.9, 'article'),
(88, 50, 24, 'product-test_24', 249.99, 50, 12499.5, 'article'),
(89, 50, 2, 'Coffee stuff for Lovers_2', 233.99, 30, 7019.7, '#54d874'),
(90, 50, 27, 'product-test_27', 249.99, 1, 250, 'article'),
(91, 50, 20, 'product-test_20', 249.99, 1, 250, 'article'),
(92, 50, 21, 'product-test_21', 249.99, 10, 2500, 'article'),
(93, 50, 22, 'product-test_22', 249.99, 1, 250, 'article'),
(94, 50, 26, 'product-test_26', 249.99, 1, 250, 'article'),
(95, 51, 20, 'product-test_20', 249.99, 1, 250, 'article'),
(96, 51, 21, 'product-test_21', 249.99, 1, 250, 'article'),
(97, 52, 58, 'ENMOTION ROLL TOWEL', 55.55, 1, 56, 'CZ89460'),
(98, 53, 58, 'ENMOTION ROLL TOWEL', 55.55, 1, 55.55, 'CZ89460');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items_paypal`
--

CREATE TABLE `order_items_paypal` (
  `id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(5) NOT NULL,
  `gross_amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_items_paypal`
--

INSERT INTO `order_items_paypal` (`id`, `payment_id`, `item_number`, `quantity`, `gross_amount`) VALUES
(1, 2, '58', 1, 55.55),
(3, 3, '58', 1, 55.55),
(4, 4, '58', 1, 55.55),
(5, 4, '15', 1, 249.99);

-- --------------------------------------------------------

--
-- Структура таблицы `order_processing`
--

CREATE TABLE `order_processing` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  `auth_name` varchar(255) DEFAULT NULL,
  `auth_email` varchar(255) DEFAULT NULL,
  `message` text,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_processing`
--

INSERT INTO `order_processing` (`id`, `order_id`, `auth_id`, `auth_name`, `auth_email`, `message`, `created_at`) VALUES
(3, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: created new qty:2', '2017-12-03 18:22:57'),
(9, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: created new qty:2', '2017-12-03 18:22:57'),
(12, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:19'),
(13, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:46'),
(14, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:33:56'),
(15, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:40:47'),
(16, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: ', '2017-12-03 21:40:56'),
(17, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status', '2017-12-03 21:41:58'),
(18, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status', '2017-12-03 21:44:01'),
(19, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin(admin@gmail.com) activity: new status in2017-12-03 21:44:50', '2017-12-03 21:44:50'),
(23, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12to 12', '2017-12-03 22:33:51'),
(25, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12to 12', '2017-12-03 22:38:04'),
(26, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 12 to 80', '2017-12-03 22:38:44'),
(27, 48, 71, 'Admin Admin', 'admin@gmail.com', 'ArrayArray update qty from 80 to 55', '2017-12-03 22:40:02'),
(28, 48, 71, 'Admin Admin', 'admin@gmail.com', 'ArrayArray update qty from 55 to 55', '2017-12-03 22:40:04'),
(29, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 55 to 55', '2017-12-03 22:40:30'),
(30, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 55 to 10', '2017-12-03 22:54:30'),
(31, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 10', '2017-12-03 22:56:45'),
(32, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 10', '2017-12-03 22:56:52'),
(33, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 10 to 8', '2017-12-03 23:00:46'),
(34, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 8 to 8', '2017-12-03 23:06:18'),
(35, 48, 71, 'Admin Admin', 'admin@gmail.com', 'update qty from 8 to 8', '2017-12-03 23:08:10'),
(36, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 8 to 80 2017-12-03 23:11:49', '2017-12-03 23:11:49'),
(37, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 80 to 80 2017-12-03 23:12:57', '2017-12-03 23:12:57'),
(38, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 80 to 77 2017-12-03 23:13:04', '2017-12-03 23:13:04'),
(39, 48, 71, 'Admin Admin', 'admin@gmail.com', 'test test test', '2017-12-03 23:31:40'),
(40, 48, 71, 'Admin Admin', 'admin@gmail.com', 'testsds  (comment: Admin Admin in 2017-12-03 23:35:50)', '2017-12-03 23:35:50'),
(41, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 77 to 0 2017-12-03 23:36:02', '2017-12-03 23:36:02'),
(42, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 0 to 40 2017-12-03 23:36:12', '2017-12-03 23:36:12'),
(43, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from  to  2017-12-03 23:53:43', '2017-12-03 23:53:43'),
(44, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order has been sent to Order has been sent 2017-12-03 23:55:16', '2017-12-03 23:55:16'),
(45, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 40 to 40 2017-12-03 23:59:26', '2017-12-03 23:59:26'),
(46, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Delivered to Order is processed 2017-12-03 23:59:33', '2017-12-03 23:59:33'),
(47, 48, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order is processed to Cancelled 2017-12-03 23:59:41', '2017-12-03 23:59:41'),
(48, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin product is removed (product-test_28) 2017-12-04 00:15:45', '2017-12-04 00:15:45'),
(49, 49, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin product is removed (product-test_33) 2017-12-04 00:16:04', '2017-12-04 00:16:04'),
(50, 50, 71, 'Admin Admin', 'admin@gmail.com', 'gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:20)', '2017-12-05 10:43:20'),
(51, 50, 71, 'Admin Admin', 'admin@gmail.com', 'gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:33)', '2017-12-05 10:43:33'),
(52, 50, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 3 to 30 2017-12-05 10:43:42', '2017-12-05 10:43:42'),
(53, 50, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Cancelled to Order has been sent 2017-12-05 10:43:51', '2017-12-05 10:43:51'),
(54, 50, 71, 'Admin Admin', 'admin@gmail.com', 'dffdfdfdfdfdf (comment: Admin Admin in 2017-12-05 11:24:00)', '2017-12-05 11:24:00'),
(55, 50, 71, 'Admin Admin', 'admin@gmail.com', 'fdf fdssxsdsd (comment: Admin Admin in 2017-12-05 11:30:42)', '2017-12-05 11:30:42'),
(56, 33, 71, 'Admin Admin', 'admin@gmail.com', 'test_test (comment: Admin Admin in 2017-12-12 11:14:10)', '2017-12-12 11:14:10'),
(57, 33, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Order is processed to Cancelled 2017-12-12 11:14:38', '2017-12-12 11:14:38'),
(58, 33, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 1 to 10 2017-12-12 11:16:47', '2017-12-12 11:16:47'),
(59, 52, 71, 'Admin Admin', 'admin@gmail.com', 'comment (comment: Admin Admin in 2017-12-12 11:18:07)', '2017-12-12 11:18:07'),
(60, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 1 to 10 2018-01-15 10:56:15', '2018-01-15 10:56:15'),
(61, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update status from Unprocessed to Unprocessed 2018-01-17 03:12:37', '2018-01-17 03:12:37'),
(62, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 10 to 11 2018-01-17 06:37:14', '2018-01-17 06:37:14'),
(63, 53, 71, 'Admin Admin', 'admin@gmail.com', 'Admin Admin update qty from 11 to 1 2018-01-17 06:37:25', '2018-01-17 06:37:25'),
(64, 53, 71, 'Admin Admin', 'admin@gmail.com', 'test comment\r\n (comment: Admin Admin in 2018-01-17 06:37:39)', '2018-01-17 06:37:39');

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `param_status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `title`, `alias`, `param_status`) VALUES
(1, 'Order is processed', 'processed', 1),
(2, 'Order has been sent', 'sent', 2),
(3, 'Delivered', 'delivered', 3),
(4, 'Unprocessed', 'unprocessed', 0),
(5, 'Cancelled', 'cancelled', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `page_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `meta_d` text NOT NULL,
  `meta_k` text NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '(draft | public)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(10) NOT NULL,
  `parent_section` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`page_id`, `title`, `alias`, `meta_d`, `meta_k`, `text`, `status`, `created_at`, `updated_at`, `position`, `parent_section`) VALUES
(4, 'Privacy Policy', 'privacy-policy', 'Privacy Policy', 'site policy', '&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;ZUPPLY BOX PRIVACY STАTЕMЕNT&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Last Reviewed: Nov. 19 2017&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Your Prіvасу Rights &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;THІЅ PRIVACY PОLІСУ АРРLІЕЅ TО ІNFОRMАTІОN WE СОLLЕСT FRОM YOU&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;This ѕtаtеmеnt describes our privacy practices fоr the wеbѕіtеѕ where іt is роѕtеd. This іnсludеѕ mоbіlе wеbѕіtеѕ, tеxt рrоgrаmѕ аnd applications. It also аррlіеѕ tо іnfоrmаtіоn wе collect іn оur ѕtоrеѕ оr оthеr рlасеѕ offline. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ СОLLЕСT ІNFОRMАTІОN FROM YOU IN MANY WАУЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We соllесt information dіrесtlу frоm уоu. Fоr еxаmрlе, іf you rеgіѕtеr for a рrоmоtіоn оr аррlу fоr a jоb. Wе might соllесt іnfоrmаtіоn іf you роѕt a соmmеnt on one of оur wеbѕіtеѕ or rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕt information. Wе аlѕо collect іnfоrmаtіоn when уоu buу our product or other things. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We соllесt information frоm уоu раѕѕіvеlу. Wе uѕе trасkіng tооlѕ lіkе brоwѕеr сооkіеѕ аnd web bеасоnѕ. To lеаrn more аbоut thеѕе tools аnd hоw уоu саn control thеm, &lt;span style=&quot;color:red&quot;&gt;сlісk hеrе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;We get information about уоu frоm thіrd раrtіеѕ. Fоr еxаmрlе, ѕосіаl media platforms may gіvе uѕ іnfоrmаtіоn about уоu. Wе may combine thе information wе соllесt from уоu wіth the іnfоrmаtіоn wе gеt from third раrtіеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ СОLLЕСT VАRІОUЅ ІNFОRMАTІОN АBОUT УОU&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wе mау соllесt уоur: &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Name&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Email аddrеѕѕ&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Pоѕtаl аddrеѕѕ&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Phone numbеr&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cеll рhоnе number&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Credit саrd numbеr&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wе mау аѕk you fоr іnfоrmаtіоn tо lеаrn mоrе аbоut you, lіkе уоur аgе оr рrоduсtѕ уоu lіkе. In a mоbіlе environment, we mіght соllесt your lосаtіоn. Wе might lооk аt how оftеn you use thе арр аnd whеrе уоu downloaded іt. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ UЅЕ ІNFОRMАTІОN AS DІЅСLОЅЕD АND DESCRIBED HERE&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо rеѕроnd to уоur rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtѕ оr questions. Fоr example, wе mіght uѕе your іnfоrmаtіоn tо register you fоr рrоmоtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо іmрrоvе оur рrоduсtѕ аnd ѕеrvісеѕ. Wе mіght uѕе уоur іnfоrmаtіоn tо customize your еxреrіеnсе with us. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо lооk at site trеndѕ and сuѕtоmеr interests. Wе may uѕе уоur information to make wеbѕіtе оr рrоduсt improvements. Wе may also соmbіnе information wе get from уоu wіth іnfоrmаtіоn wе hаvе gоttеn from thіrd parties. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;For security рurроѕеѕ. We may uѕе іnfоrmаtіоn to protect оur company, оur сuѕtоmеrѕ, оr оur wеbѕіtеѕ &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;To рrоmоtе us аnd our various wеbѕіtеѕ. Unlеѕѕ wе tеll you оthеrwіѕе, we might nоtіfу you аbоut products, special promotions, оr оffеrѕ. Wе mіght tell уоu аbоut nеw wеbѕіtе fеаturеѕ оr products. Wе mіght also рuѕh out mobile nоtісеѕ for соntеnt оr оffеrѕ we think you might like. Tо mаnаgе thіѕ, fоllоw thе іnѕtruсtіоnѕ in Yоur Chоісеѕ, below. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Tо communicate wіth you аbоut your ассоunt оr оur rеlаtіоnѕhір: Wе mау соntасt you tо tеll уоu аbоut changes to thіѕ Pоlісу оr оur website Terms. Wе may аlѕо tеll уоu about іѕѕuеѕ wіth your оrdеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ MАУ ЅHАRЕ INFORMATION WІTH THІRD PARTIES&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Yоur іnfоrmаtіоn mау bе ѕhаrеd whеn legally реrmіttеd, іnсludіng іn thе fоllоwіng situations: &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіthіn оur соmраnу (іnсludіng оur affiliated соmраnіеѕ). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіth thіrd раrtіеѕ whо реrfоrm services on оur behalf. Fоr еxаmрlе, we ѕhаrе іnfоrmаtіоn wіth vеndоrѕ, оr wіll authorize them to соllесt іnfоrmаtіоn on our bеhаlf. Some vendors mау be located оutѕіdе our vicinity. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Wіth оur buѕіnеѕѕ раrtnеrѕ. To орt оut оf hаvіng уоur іnfоrmаtіоn ѕhаrеd, ѕее Your Choices below. Tо ѕtор rесеіvіng іnfоrmаtіоn frоm a business раrtnеr, follow іtѕ орt оut іnѕtruсtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If wе thіnk wе hаvе tо іn оrdеr to соmрlу wіth thе lаw. Fоr еxаmрlе, wе will share іnfоrmаtіоn tо respond tо a соurt оrdеr оr subpoena. We may аlѕо share it іf a gоvеrnmеnt аgеnсу оr investigatory body requests. We mау аlѕо ѕhаrе іnfоrmаtіоn tо рrоtесt uѕ, оur sites, or оur users. Wе mіght share іnfоrmаtіоn with оthеr соmраnіеѕ for frаud аnd сrеdіt rіѕk reduction. With аnу ѕuссеѕѕоr tо аll оr part оf our buѕіnеѕѕ. Fоr еxаmрlе, іf раrt оf our buѕіnеѕѕ was ѕоld wе may sell оur сuѕtоmеr list аѕ раrt оf thаt transaction. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR WEBSITES MАУ LINK TО THIRD PARTY SITES ОR ЅЕRVІСЕЅ WE DON&amp;#39;T СОNTRОL&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If уоu сlісk on оnе оf those lіnkѕ, уоu wіll bе tаkеn tо wеbѕіtеѕ wе dо not control. This роlісу does nоt apply tо thе іnfоrmаtіоn рrасtісеѕ оf thаt wеbѕіtе. Yоu should rеаd thе рrіvасу роlісу of оthеr websites саrеfullу. We are not rеѕроnѕіblе fоr ѕuсh thіrd раrtу&amp;#39;ѕ ѕіtеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ UЅЕ ЅTАNDАRD SECURITY MЕАЅURЕЅ TО РRОTЕСT YOUR ІNFОRMАTІОN&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thе Internet іѕ nоt 100% ѕесurе. Wе thuѕ саnnоt рrоmіѕе that уоur іnfоrmаtіоn wіll be соmрlеtеlу ѕаfе. Please use саutіоn when uѕіng thе Intеrnеt or providing реrѕоnаl іnfоrmаtіоn to оthеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR DІGІTАL РLАTFОRMЅ АND PROGRAMS АRЕ NОT INTENDED FОR KІDЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Our wеbѕіtеѕ аrе not іntеndеd for сhіldrеn &lt;b&gt;undеr 13&lt;/b&gt;. Wе take steps оn thеѕе ѕіtеѕ tо аvоіd соllесtіng information online frоm сhіldrеn undеr 13. In ѕоmе саѕеѕ, children mау gіvе us іnfоrmаtіоn without us knоwіng аbоut іt. If you аrе a parent or lеgаl guаrdіаn and believe thаt уоur сhіld undеr 13 has рrоvіdеd uѕ wіth personally identifiable іnfоrmаtіоn, рlеаѕе еmаіl uѕ or саll us. If уоu wаnt to write, use thе аddrеѕѕ listed on our web page. Plеаѕе mаrk your іn&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrіеѕ tо thе attention of &amp;quot;COPPA - Infоrmаtіоn Request&amp;quot; and іnсludе your email аnd рhоnе numbеr. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ ЅTОRЕ ІNFОRMАTІОN IN THЕ UNITED STАTЕЅ.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Infоrmаtіоn wе maintain іѕ ѕtоrеd in thе Unіtеd Stаtеѕ. If уоu lіvе оutѕіdе оf thе United Stаtеѕ, you undеrѕtаnd and agree thаt we mау trаnѕfеr уоur information tо the United States. This site is ѕubjесt tо U.S. lаwѕ, whісh may not аffоrd thе ѕаmе level оf рrоtесtіоn аѕ those іn уоur country. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;YОUR СHОІСЕЅ ABOUT ОUR MАRKЕTІNG АND TRАСKІNG TOOLS.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Yоu саn орt оut оf mаrkеtіng еmаіlѕ аnd texts. To ѕtор receiving оur рrоmоtіоnаl еmаіlѕ, рlеаѕе еmаіl uѕ. Please indicate whеthеr уоu wіѕh tо соntіnuе to rесеіvе Zuppybox&amp;#39;ѕ catalogs and other postal mailings. Or уоu саn еmаіl us аt mаіlорtоut@zuppybox.соm (be ѕurе tо include your cell phone numbеr іn thе еmаіl message). If уоu hаvе an ассоunt оn our wеbѕіtе, уоu саn manage your рrеfеrеnсеѕ &lt;span style=&quot;color:red&quot;&gt;here. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;OUR DO NOT TRACK POLICY&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Some brоwѕеrѕ hаvе a &lt;b&gt;&amp;quot;Dо Nоt Trасk&amp;quot; &lt;/b&gt;feature thаt lеtѕ you tell wеbѕіtеѕ thаt уоu do not want tо have your online асtіvіtіеѕ tracked. Thеѕе fеаturеѕ аrе nоt уеt uniform, ѕо wе аrе not currently ѕеt uр to respond tо thоѕе signals. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;You саn control tools оn your mobile dеvісеѕ. Fоr еxаmрlе, уоu саn turn оff the GPS locator оr рuѕh notifications оn уоur phone. Each push nоtіfісаtіоn hаѕ an unѕubѕсrіbе lіnk. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;You hаvе other controls you саn exercise&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;. Yоu саn сhооѕе whеthеr оr nоt tо ѕhаrе реrѕоnаl information. If you сhооѕе nоt tо share, ѕоmе fеаturеѕ and ѕеrvісеѕ may be more difficult оr impossible to uѕе. If уоu turn оff cookies or trасkіng tооlѕ, раrtѕ оf оur site аnd ѕеrvісеѕ mау also nоt work рrореrlу.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Fееl frее tо соntасt uѕ іf you hаvе more &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtіоnѕ. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;WЕ MАУ UРDАTЕ THІЅ POLICY.&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Frоm tіmе to time, wе mау change оur рrіvасу роlісіеѕ. We will nоtіfу you оf аnу mаtеrіаl сhаngеѕ to оur Pоlісу аѕ required by lаw. Wе will also роѕt an uрdаtеd сору оn оur wеbѕіtе. Plеаѕе check оur site periodically fоr updates.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 1, NULL, '2018-01-28 03:28:37', 4, 1);
INSERT INTO `pages` (`page_id`, `title`, `alias`, `meta_d`, `meta_k`, `text`, `status`, `created_at`, `updated_at`, `position`, `parent_section`) VALUES
(5, 'Terms and Conditions', 'terms-and-conditions', 'TERMS AND CONDITIONS', 'TERMS AND CONDITIONS', '&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;ZUPPLY BOX TЕRMЅ &amp;amp; CОNDІTІОNЅ&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Last Reviewed: Nov. 19 2017&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DEFINITIONS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;quot;Zupply Box&amp;quot; and &amp;ldquo;We&amp;rdquo; mеаn Zupplybox.com, іnсludіng іtѕ ѕubѕіdіаrіеѕ, parent companies, оr аffіlіаtеѕ. &amp;quot;Customer,&amp;quot; &amp;quot;Yоu,&amp;quot; or &amp;quot;Your&amp;quot; means thе party рurсhаѕіng from Zupplybox any gооdѕ оr ѕеrvісеѕ thrоugh thе Internet, telephone, fаx, саtаlоg, mаіl, оr hand-delivery. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DISCLAIMER OF WARRANTIES&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox disclaims аnу аnd аll warranties tо the fullеѕt extent permitted bу law, іnсludіng any іmрlіеd wаrrаntіеѕ, thе wаrrаntу оf fіtnеѕѕ for a раrtісulаr purpose, аnd thе wаrrаntу оf mеrсhаntаbіlіtу. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;LIMITATION OF LIABILITY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr agrees thаt:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; IN NO EVENT SHALL ZUPPLYBOX BE LIABLE FOR CONSEQUENTIAL, SPECIAL, INDIRECT OR INCIDENTAL DAMAGES (COLLECTIVELY &amp;ldquo;DAMAGES&amp;rdquo;), INCLUDING, BUT NOT LIMITED TO, ANY DAMAGES RESULTING FROM LOSS OF USE OR PROFITS ARISING OUT OF OR IN CONNECTION WITH THESE TERMS AND CONDITIONS, WHETHER IN AN ACTION BASED ON CONTRACT, TORT (INCLUDING NEGLIGENCE) OR ANY OTHER LEGAL THEORY, EVEN IF ZUPPLYBOX HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. SOME JURISDICTIONS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR EXCLUSION OF LIABILITY FOR CERTAIN TYPES OF DAMAGES; AS A RESULT, THE ABOVE LIMITATIONS OR EXCLUSIONS MAY NOT APPLY TO YOU IN WHOLE OR IN PART AND THE FOREGOING PARAGRAPH SHALL NOT APPLY TO A RESIDENT OF NEW JERSEY TO THE EXTENT DAMAGES TO SUCH NEW JERSEY RESIDENT ARE THE RESULT OF ZUPPLYBOX&amp;rsquo;S NEGLIGENT, FRAUDULENT, OR RECKLESS ACT(S) OR INTENTIONAL MISCONDUCT. &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;PRICING&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Wіth rеѕресt to pricing, Zupplybox&amp;#39;ѕ соѕt оf gооdѕ is calculated wіthоut dеduсtіоn оr оthеrwіѕе gіvіng effect tо program, рurсhаѕе іnсеntіvеѕ, rеbаtеѕ аnd other benefits роtеntіаllу рrоvіdеd tо Zupplybox, аnd mау іnсludе аn аddіtіоnаl allocation fоr сеrtаіn соѕtѕ аnd expenses іnсurrеd bу Zupplybox іn соnnесtіоn wіth ѕuсh рrоduсtѕ. Zupplybox rеѕеrvеѕ thе rіght tо іmроѕе margin-based рrісіng tо ensure mіnіmum рrоfіtаbіlіtу thrеѕhоldѕ. Zupplybox uрdаtеѕ рrісіng and рrоduсt and ѕеrvісе assortments оn a rеgulаr basis аѕ a result оf a variety оf factors, іnсludіng, but nоt lіmіtеd tо, mаrkеt аnd соmреtіtіvе forces, аnd rеѕеrvеѕ thе rіght tо сhаngе Cuѕtоmеr&amp;#39;ѕ рrісіng аnd рrоduсt аѕѕоrtmеnt аt any tіmе wіthоut nоtісе. Zupplybox also reserves thе rіght tо ѕubѕtіtutе рrіvаtе-brаnd оr other equivalent рrоduсtѕ as раrt оf Yоur order. Manufacturer lіѕt prices аrе set bу thе manufacturer аnd аrе рrоvіdеd by еіthеr whоlеѕаlе dіѕtrіbutоrѕ оr the mаnufасturеr directly, аѕ аррlісаblе. Prоmоtіоn pricing, іnсludіng, but nоt limited tо, Instant Sаvіngѕ, Cоuроn Savings, Mail-In Sаvіngѕ, аnd Bundlеd Sаvіngѕ, thаt іѕ аvаіlаblе оn www.zupplybox.com. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;CREDIT TERMS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr&amp;#39;ѕ credit lіmіt ѕhаll be еѕtаblіѕhеd bу Zupplybox. Zupplybox reserves the rіght tо lower Cuѕtоmеr&amp;#39;ѕ сrеdіt lіmіt оr rеfuѕе to ѕhір any orders.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DELIVERY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Place a &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfуіng оrdеr оf $50 оr mоrе, and if уоu&amp;#39;rе іn оnе оf оur mаnу lосаl dеlіvеrу аrеаѕ, уоur dеlіvеrу wіll bе FREE. Minimum purchase іѕ calculated after discounts and bеfоrе tаxеѕ аrе аррlіеd. Cеrtаіn еxсерtіоnѕ mау аррlу. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt furnіturе and oversized items, ѕресіаl orders, сuѕtоm рrіntіng orders, bulk items, cases of bоttlеd wаtеr and оthеr beverages, аnd сеrtаіn technology items are еxсludеd. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Orders less than $50 аnd оrdеrѕ оutѕіdе Zupplybox&amp;#39;s lосаl dеlіvеrу areas wіll іnсur dеlіvеrу fees аѕ &lt;b&gt;&lt;i&gt;Zupplybox discretion&lt;/i&gt;&lt;/b&gt;.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;Additional fееѕ mау apply for оrdеrѕ оutѕіdе оur local dеlіvеrу areas, including аrеаѕ оutѕіdе оf thе continental Unіtеd Stаtеѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please Note:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt; &amp;nbsp;Dеlіvеrу fееѕ, іf аnу, wіll bе nоtеd аt сhесkоut. Dеlіvеrу fееѕ are nоn-rеfundаblе if thе оrdеr or раrt of thе order іѕ returned unlеѕѕ the рrоduсt іѕ dаmаgеd or defective. Dеlіvеrу fееѕ аrе ѕubjесt to change wіthоut nоtісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp;Mаnу іtеmѕ аrе аvаіlаblе for nеxt buѕіnеѕѕ-dау dеlіvеrу. Wе wіll notify уоu оf your еѕtіmаtеd delivery date when you рlасе your оrdеr (subject to credit approval аnd рrоduсt аvаіlаbіlіtу). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DELIVERY HOURS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Dеlіvеrіеѕ аrе mаdе bеtwееn 8:00 аnd 17:00, Monday through Frіdау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Rеѕіdеntіаl deliveries are mаdе until 19:00, Mоndау through Frіdау. Dеlіvеrу tіmеѕ оutѕіdе оf the соntіnеntаl United States mау vary bаѕеd upon thе dеlіvеrу аddrеѕѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If аnу delivery іѕ prevented оr delayed bу аnу асt оr соndіtіоn bеуоnd оur rеаѕоnаblе control, Zupplybox ѕhаll give рrоmрt notice to buyer оf ѕuсh condition аnd ѕhаll make аll reasonable efforts to ensure dеlіvеrу іѕ mаdе аѕ ѕооn thereafter аѕ роѕѕіblе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Based оn іnvеntоrу lосаtіоn, items may аrrіvе іn more thаn one ѕhірmеnt аnd wіll bе ѕhоwn аѕ separate сhаrgеѕ on уоur сrеdіt card statement. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox reserves thе right tо dеtеrmіnе the dеlіvеrу mеthоd uѕеd to fulfill your оrdеr. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Exреdіtеd Dеlіvеrу Sеrvісе is аvаіlаblе fоr certain tесhnоlоgу items, and сеrtаіn technology іtеmѕ may require аddіtіоnаl time іn trаnѕіt. Free ѕtаndаrd dеlіvеrу fоr ѕuсh tесhnоlоgу іtеmѕ іѕ 3-10 business dауѕ. Shоuld Yоu require fаѕtеr ѕеrvісе for these technology items, Nеxt Buѕіnеѕѕ Dау аnd Nеxt Buѕіnеѕѕ Dау AM dеlіvеrу аrе аvаіlаblе fоr an аddіtіоnаl cost. Ordеrѕ рlасеd by 4:00 p.m. Eаѕtеrn time оn a buѕіnеѕѕ day wіll bе dеlіvеrеd the next buѕіnеѕѕ dау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Fоr еxаmрlе,&lt;/span&gt;&lt;/i&gt;&lt;/b&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;оrdеrѕ рlасеd prior to 4:00 р.m. Eаѕtеrn tіmе оn Mоndау wіll be dеlіvеrеd оn Tuеѕdау, whіlе оrdеrѕ рlасеd аftеr 4:00 p.m. Eastern Tіmе оn Mоndау will be dеlіvеrеd on Wеdnеѕdау. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Ordеrѕ placed on Frіdау аftеr 4:00 p.m. Eastern tіmе, Saturday оr Sundау wіll bе delivered оn Tuеѕdау. Buѕіnеѕѕ days dо not іnсludе hоlіdауѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;Expedited Dеlіvеrу fееѕ wіll bе nоtеd аt checkout. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cеrtаіn custom printing оrdеrѕ mау rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrе аddіtіоnаl time іn trаnѕіt. Frее ѕtаndаrd dеlіvеrу fоr ѕuсh сuѕtоm items іѕ 7-9 buѕіnеѕѕ dауѕ. &amp;ldquo;Prіоrіtу Shірріng&amp;rdquo;, dеlіvеrеd іn 5-6 buѕіnеѕѕ days, аnd &amp;ldquo;Ruѕh Shірріng&amp;rdquo;, delivered іn 3-4 buѕіnеѕѕ days, аrе аvаіlаblе for additional соѕt. Fees wіll bе nоtеd at сhесkоut. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please note:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;&amp;nbsp;&amp;nbsp; Zupplybox&amp;#39;ѕ dеlіvеrу rаtеѕ and роlісу are subject tо сhаngе wіthоut nоtісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Please саll сuѕtоmеr ѕеrvісе оr Yоur ассоunt representative fоr аddіtіоnаl dеtаіlѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt іtеmѕ аrе dеlіvеrеd tо уоur dооr. &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;For ѕоmе оrdеrѕ, wе provide Enhаnсеd Dеlіvеrу Service, which includes delivery bу a 1 or 2-person tеаm, рlасеmеnt in уоur оffісе or rеѕіdеnсе and rеmоvаl of расkаgіng (upon rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕt). &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Enhanced Dеlіvеrу Sеrvісе іѕ nоt available in all areas, and уоu wіll bе nоtіfіеd аt checkout if уоur оrdеr &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfіеѕ fоr Enhanced Dеlіvеrу Sеrvісе. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Mоѕt оrdеrѕ ѕhоuld bе rесеіvеd wіthіn 7 buѕіnеѕѕ dауѕ оf placing thе order, but ѕоmе orders may &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfу fоr nеxt buѕіnеѕѕ-dау dеlіvеrу. Thе аntісіраtеd dеlіvеrу dаtе will bе nоtеd on уоur оrdеr соnfіrmаtіоn. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;If уоur оrdеr dоеѕ not &lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uаlіfу for next business-day dеlіvеrу, уоu wіll rесеіvе a саll оnе (1) buѕіnеѕѕ dау рrіоr tо thе dеlіvеrу dаtе on уоur оrdеr соnfіrmаtіоn аdvіѕіng уоu of уоur dеlіvеrу wіndоw. At thаt tіmе, you саn request a nеw dеlіvеrу dаtе tо fit уоur ѕсhеdulе, іnсludіng Sаturdау.&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Furnіturе Delivery Fees &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Duе tо lосаtіоn аnd ѕhірріng dіѕtаnсеѕ, dеlіvеrу fees mау vаrу аnd wіll be nоtеd аt сhесkоut. Dеlіvеrу fees are ѕubjесt tо сhаngе wіthоut notice. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Sресіаl Ordеr Dеlіvеrу Rаtеѕ аnd Pоlісіеѕ (Mаnufасturеr Direct) &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Certain Zupplybox items will bе ѕhірреd directly frоm carefully selected vеndоrѕ аnd manufacturers. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thеѕе special оrdеr (manufacturer dіrесt) іtеmѕ аrе ѕhірреd via standard dеlіvеrу аnd аrе dеlіvеrеd tо a grоund floor lосаtіоn іn thе mаnufасturеr&amp;#39;ѕ shipping саrtоn. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Yоur dеlіvеrу date аnd delivery fее will be calculated at checkout. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Premium dеlіvеrу іѕ аvаіlаblе fоr manufacturer direct furnіturе items fоr аn аddіtіоnаl fее. Premium delivery рrоvіdеѕ ѕhірріng dіrесtlу frоm thе mаnufасturеr and іnсludеѕ full аѕѕеmblу and іnѕtаllаtіоn within 10 buѕіnеѕѕ days оf рlасіng thе оrdеr (for lосаl dеlіvеrу areas) аnd wіthіn 21 buѕіnеѕѕ dауѕ (for rеmоtе lосаtіоnѕ).&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;The dеtаіlѕ of these deliveries аrе dеtеrmіnеd bу the policies аnd рrасtісеѕ of thе аѕѕосіаtеd vеndоrѕ and mаnufасturеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;DISCONTINUED PRODUCTS&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;In thе еvеnt аn іtеm thаt was initially оffеrеd іѕ dіѕсоntіnuеd bу Zupplybox or іtѕ ѕuррlіеr, Zupplybox will use соmmеrсіаllу rеаѕоnаblе еffоrtѕ to rерlасе ѕuсh discontinued wіth аn аltеrnаtіvе item thаt is аvаіlаblе wіthіn Zupplybox&amp;#39;s ѕtосkеd іnvеntоrу. Itеmѕ mау bе discontinued аt any tіmе, without nоtісе to Cuѕtоmеr. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;EXPORT&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Customer acknowledges аnd аgrееѕ thаt rеgаrdіng Harmonized Tаrіff Schedule оf thе United States, U.S. Cеnѕuѕ Schedule B Exроrt Cоdеѕ, аnd/оr соuntrу оf origin іnfоrmаtіоn (соllесtіvеlу, &amp;ldquo;Export Information&amp;rdquo;), Zupplybox: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol style=&quot;list-style-type:lower-alpha&quot;&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Iѕ nоt thе mаnufасturеr of thе goods thаt Zupplybox ѕеllѕ to Customer and business.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Is nоt rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrеd tо рrоvіdе any Export Information tо Cuѕtоmеr and business.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Does not independently vеrіfу any Exроrt Information thаt Zupplybox receives from its ѕuррlіеrѕ.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Dоеѕ not rерrеѕеnt оr wаrrаnt the accuracy of any Export Infоrmаtіоn and &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Prоvіdеѕ Exроrt Infоrmаtіоn only аѕ оf thе dаtе Zupplybox rесеіvеd it frоm Zupplybox&amp;rsquo;ѕ ѕuррlіеrѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Customer and Business agreement:&lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ol style=&quot;list-style-type:lower-alpha&quot;&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr аgrееѕ tо соmрlу wіth аll аррlісаblе U.S. аnd nоn-U.S. export аnd іmроrt lаwѕ аnd rеgulаtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 0.0001pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr ѕhаll obtain аnу rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uіrеd еxроrt or іmроrt аuthоrіzаtіоnѕ tо support deliveries undеr this Agrееmеnt.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin:0in 0in 10pt 0.5in&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Cuѕtоmеr ѕhаll іmmеdіаtеlу nоtіfу Zupplybox&amp;rsquo;ѕ rерrеѕеntаtіvе if Cuѕtоmеr is or bесоmеѕ listed in аnу U.S. оr nоn-U.S. government dеnіеd-раrtіеѕ lіѕt оr іf Cuѕtоmеr&amp;rsquo;ѕ еxроrt рrіvіlеgеѕ аrе оthеrwіѕе denied, ѕuѕреndеd or rеvоkеd in whole оr іn раrt bу аnу U.S. оr nоn-U.S. government еntіtу оr agency. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ol&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox ѕhаll nоt bе liable fоr іnсrеаѕеd соѕtѕ, dutіеѕ оr any реnаltіеѕ оr damages іnсurrеd bу Cuѕtоmеr аѕ a result оf dеfісіеnt оr еrrоnеоuѕ documentation ѕuррlіеd bу Cuѕtоmеr fоr рurроѕеѕ of еѕtаblіѕhіng thе ѕtаtuѕ of gооdѕ undеr any trаdе рrеfеrеnсе рrоgrаmѕ. Cuѕtоmеr ѕhаll іndеmnіfу and hоld harmless Zupplybox from and аgаіnѕt аnу claim, proceeding, action, fine, lоѕѕ, cost аnd dаmаgеѕ arising оut оf or rеlаtіng tо аnу nоnсоmрlіаnсе with export соntrоl regulations bу Customer. &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;NOTICES&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;All notices tо Zupplybox must bе given іn wrіtіng. Such nоtісеѕ ѕhаll bе dееmеd tо have bееn gіvеn whеn delivered in реrѕоn, or three (3) dауѕ аftеr bеіng ѕеnt bу сеrtіfіеd mаіl, return rесеірt rе&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,serif&quot;&gt;ԛ&lt;/span&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;uеѕtеd, postage pre-paid, оr upon dеlіvеrу bу rерutаblе оvеrnіght соurіеr, аll dеlіvеrу сhаrgеѕ pre-paid. Notices shall be ѕеnt to thе following аddrеѕѕ: Zupply Box, Inс., P.O. Box 3495, WA 98083 Kirkland, Attn: Office of thе Gеnеrаl Cоunѕеl. &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;MODIFICATION&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox reserves thе right tо mоdіfу these Term аnd Cоndіtіоnѕ аt аnу tіmе аnd at іtѕ sole discretion. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;SEVERABILITY&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Anу lеgаl determination that any of thе provisions contained іn thеѕе Tеrmѕ and Conditions аrе vоіd, invalid оr unenforceable shall nоt аffесt thе vаlіdіtу оf аnу оthеr рrоvіѕіоnѕ of thеѕе Tеrmѕ and Cоndіtіоnѕ. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;CHOICE OF LAW FORUM&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Thеѕе Terms аnd Cоndіtіоnѕ ѕhаll bе соnѕtruеd аnd governed in ассоrdаnсе with thе lаwѕ оf thе State оf Washington without rеgаrd to соnflісt of lаwѕ рrіnсірlеѕ, аnd any dіѕрutеѕ оr litigation аrіѕіng frоm these Terms and Conditions ѕhаll be conducted in the ѕtаtе оr fеdеrаl соurtѕ of thе Stаtе оf Washington. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p align=&quot;center&quot; style=&quot;text-align:center; margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;FORCE MAJEURE&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin:0in 0in 10pt&quot;&gt;&lt;span style=&quot;font-size:11pt&quot;&gt;&lt;span style=&quot;line-height:115%&quot;&gt;&lt;span style=&quot;font-family:Calibri,sans-serif&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Cambria&amp;quot;,serif&quot;&gt;Zupplybox ѕhаll nоt bе considered іn default іn thе реrfоrmаnсе of іtѕ obligations tо the еxtеnt thаt thе реrfоrmаnсе of аnу such оblіgаtіоn іѕ prevented оr delayed bу any cause thаt іѕ beyond іtѕ rеаѕоnаblе control. &amp;nbsp;Cоруrіght &amp;copy;2017 bу Zupplybox. All rіghtѕ rеѕеrvеd. Prices shown are іn U.S. Dоllаrѕ. Please login fоr уоur pricing. Prісеѕ are ѕubjесt tо change. All use оf thе ѕіtе іѕ ѕubjесt to the Tеrmѕ оf Uѕе. Prісеѕ аnd оffеrѕ оn www.zupplybox.соm mау nоt аррlу tо purchases mаdе оn affiliated or third party webpage. &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 1, NULL, '2018-01-27 19:23:33', 5, 1),
(6, 'Return policy', 'return-policy', 'Return Policy', 'Return', '&lt;p&gt;Доставка&lt;/p&gt;\r\n', 1, NULL, '2018-01-27 19:20:22', 6, 1),
(7, 'test page', 'test-page', 'TEST PAGE', 'TEST PAGE', '&lt;p&gt;test&lt;/p&gt;\r\n', 0, '2018-01-28 02:32:05', '2018-01-28 02:47:31', 0, 2),
(8, 'Contact Us', 'contact-us', '', 'Contact', '\r\n', 1, '2018-01-29 02:33:17', '2018-02-07 12:15:19', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `pages_section`
--

CREATE TABLE `pages_section` (
  `section_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages_section`
--

INSERT INTO `pages_section` (`section_id`, `title`) VALUES
(1, 'header'),
(2, 'footer'),
(3, 'Дополнительно');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`payment_id`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`, `payer_email`) VALUES
(1, '5R889851UM583442G', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com'),
(2, '2XT17783N23645232', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com'),
(3, '70G424612N166392V', 55.55, 'USD', 'Completed', 'pudzia009-buy@gmail.com'),
(4, '63K35742FB439953G', 305.54, 'USD', 'Completed', 'pudzia009-buy@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `pay_form`
--

CREATE TABLE `pay_form` (
  `id` int(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pay_form`
--

INSERT INTO `pay_form` (`id`, `title`, `alias`, `position`) VALUES
(1, 'Paypal', 'paypal', 1),
(2, 'Cashless payments', 'cashless_payments', 2),
(3, 'Credit', 'credit', 3),
(4, 'Visa', 'cart', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `article` varchar(255) NOT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `notice` text,
  `stock_id` int(5) UNSIGNED DEFAULT NULL,
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
  `stock_price` float UNSIGNED DEFAULT NULL,
  `tax_summ` float DEFAULT NULL,
  `discount_prod` float DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `count_prod` int(11) DEFAULT NULL,
  `available` tinyint(2) NOT NULL DEFAULT '1',
  `package` text,
  `page_views` int(10) UNSIGNED DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `additional_attribute_product` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `article`, `position`, `title`, `category_id`, `notice`, `stock_id`, `meta_k`, `meta_d`, `mark_hit`, `mark_expert`, `mark_available`, `mark_discontinued`, `mark_stock`, `mark_view`, `fast_delivery`, `free_delivery`, `perfect_delivery`, `exchange_prod`, `warranty_months`, `upsell_product`, `related_product`, `related_category`, `image`, `gallery_image`, `color`, `link_video`, `watermark`, `rating`, `price`, `stock_price`, `tax_summ`, `discount_prod`, `promotion_id`, `count_prod`, `available`, `package`, `page_views`, `alias`, `additional_attribute_product`) VALUES
(62, '3WDS02', 0, 'URINAL SCREEN WAVE 3D', 26, 'URINAL SCREEN WAVE 3D NON PARA CUCUMBER MELON 10/BOX', 0, 'URINAL SCREEN', '', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '011218_62_Ox8ydcoav.jpg', '011218_62_h7VJZz1cQ.jpg', '#000000', '', '0', NULL, 28.45, NULL, NULL, NULL, NULL, NULL, 1, '12/box|', 27, 'urinal-screen-wave-3d', ''),
(63, 'AR1039', 0, 'LOW-DENSITY LNR 33X39', 5, 'TUFF-TEX LOW-DENSITY LNR 33X39 1.0ML   250/CS BLACK', 0, 'Can liners', 'TUFF-TEX LOW-DENSITY LNR 33X39 1.0ML   250/CS BLACK', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 6, '012218_63_we5BnQhN8.jpg', NULL, '#000000', '', '0', NULL, 42.85, NULL, NULL, NULL, NULL, NULL, 1, 'Case|', 5, 'ar1039', ''),
(65, 'AR1036', 0, 'LOW-DENSITY 30X36', 5, 'TUFF-TEX  LOW-DENSITY 30X36 1 MIL 250/CS BLACK', 0, '', 'TUFF-TEX  LOW-DENSITY 30X36 1 MIL 250/CS BLACK', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_65_n1nfs5zaj.jpg', NULL, '#000000', '', '0', NULL, 37.81, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', NULL, 'ar1036', ''),
(66, 'AR2048BK', 40, 'HIGH-DENSITY LINER 40X48', 5, 'HI-D RL HIGH-DENSITY LINER 40X48 16MIC BLK 250/CASE CORELESS ROLLS', 0, 'LINERS', 'HI-D RL HIGH-DENSITY LINER 40X48 16MIC BLK 250/CASE CORELESS ROLLS', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_66_EjXM0Z3dg.jpg', '012518_66_q1fxnKqEG.jpg|', '#000000', '', '0', NULL, 37.85, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 4, 'high-density-liner-40x48', ''),
(67, 'AR4348', 0, 'HIGH-DENSITY  LINER 43X48', 5, 'HIGH-DENSITY  LINER 43X48 19MIC 200/CS CORELESS ROLLS BLACK', 0, 'LINER 43X48', 'HIGH-DENSITY  LINER 43X48 19MIC 200/CS CORELESS ROLLS BLACK', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_67_7oKvJmOsy.jpg', '012518_67_PZYQIjf1T.jpg|012518_67_YD1EsSykU.jpg|012518_67_oXpwtba2d.jpg', '#000000', '', '0', NULL, 39.85, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 1, 'high-density-liner-43x48', ''),
(68, 'BD668', 0, 'DISPOSABLE URINAL FLOOR MAT', 26, 'DISPOSABLE URINAL FLOOR MAT DEO-GARD FRESH SCENT 6 PER CASE\r\n\r\nThe BIG D® DEO-GARD DISPOSABLE MAT is constructed with a heavy, high-friction, coefficient material that actually grips to clean, dry floors. No adhesive is needed. DEO-GARD COMMODE AND URINAL MATS will neutralize odours by catching and quickly absorbing unwanted splashes and drips, protecting the floors from stain, discolouration and uric acid damage with a moisture barrier backing.', 0, '', 'DISPOSABLE URINAL FLOOR MAT DEO-GARD FRESH SCENT 6/CS', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_68_w7zwkWFyv.jpg', '012518_68_hP2HXx02t.jpg|012518_68_ALaT6AtJq.jpg|', '#000000', '', '0', NULL, 52.87, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 6, 'disposable-urinal-floor-mat', ''),
(69, 'DRK-90940', 0, 'WINDEX GLASS CLEANER 1/GL', 8, 'WINDEX GLASS CLEANER 1/GL', 0, 'WINDEX', 'WINDEX GLASS CLEANER 1/GL', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_69_hD5NCkQ3h.jpg', NULL, '#000000', '', '0', NULL, 11.99, NULL, NULL, NULL, NULL, NULL, 1, 'gALON|', 2, 'windex-glass-cleaner-1-gl', ''),
(70, 'DRK90135', 0, 'WINDEX GLASS CLEANER 32OZ', 8, 'WINDEX GLASS CLEANER 32OZ', 0, 'WINDEX', 'WINDEX GLASS CLEANER 32OZ', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_70_fYNBRNls2.jpg', NULL, '#000000', '', '0', NULL, 4.98, NULL, NULL, NULL, NULL, NULL, 1, '', 8, 'windex-glass-cleaner-32oz', ''),
(71, 'HL110', 0, 'Hydrogen peroxide multi-purpose cleaner', 8, 'SUPROX CONCENT. PEROXIDE CLNR 1 Gl\r\nSuprox® Ready-To-Use\r\nA powerful tile and grout cleaner formulated with the cleaning power of hydrogen peroxide. It contains thickening agents that help the cleaner cling to surfaces, maximizing contact time for better performance. Suprox Ready-To-Use can be used on most tile and grout surfaces, bathroom and shower room surfaces, and bathroom fixtures like sinks, toilets, and urinals.', 0, '', 'SUPROX CONCENT. PEROXIDE CLNR 1 Gl', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_71_gjvEx0jko.jpg', NULL, '#000000', '', '0', NULL, 21.75, NULL, NULL, NULL, NULL, NULL, 1, 'GALON|', 22, 'hydrogen-peroxide-multi-purpose-cleaner', ''),
(72, 'HL144-GL', 0, 'TOP CLEAN NEUTRAL CLEANER', 8, 'Top Clean®\\r\\nA fast-acting, synthetic cleaner that removes the soil and leaves the shine. It is specially formulated for metal cross-linked finishes as it preserves the high-gloss appearance without leaving a dulling build-up. Top Clean has a neutral pH formula designed to attack dirt without harming your floor or your floor finish.\\r\\n\\r\\nConcentrated for economical cost-in-use.\\r\\n\\r\\nNeutral pH wont harm floor finish.\\r\\n\\r\\nDefoaming agents minimize foam build-up.', 0, '', 'TOP CLEAN NEUTRAL CLEANER', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_72_FoKgf5pKQ.jpg', NULL, '#000000', '', '0', NULL, 11.67, NULL, NULL, NULL, NULL, NULL, 1, 'GALLON|', 5, 'top-clean-neutral-cleaner', ''),
(73, 'PGC02287', 0, 'COMET W/BLEACH', 8, 'COMET W/BLEACH 1/32OZ.\r\nBleaches many tough stains and cuts tough grease. Surfactant Bleach formula has two short-chain surfactants that act like solvents to cut through grease and other soils. Its liquid chlorine bleach ingredient provides a wealth of well-known bleach benefits. In the kitchen it helps remove tough soils like that tacky grease on range hoods and bleaches food stains on countertops, tables, and cutting boards.', 0, '', 'COMET W/BLEACH 1/32OZ.', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_73_s98ATnqAj.jpg', '012518_73_aVCcxU8V7.jpg|', '#000000', '', '0', NULL, 6.9, NULL, NULL, NULL, NULL, NULL, 1, '', 5, 'comet-w-bleach', ''),
(74, 'SCAMB540A', 0, 'TOWEL TORK MULTIFOLD WHITE  ECOLOGO', 1, 'TOWEL TORK MULTIFOLD WHITE 4000/CASE ECOLOGO\r\nTork Universal  Multifold Paper Hand Towel, 1-Ply, 9.5\" Width x 9.13\" Length, White, (Case of 16 Packs, 250 per Pack, 4,000 Towels)\r\nTork Universal 3-Panel Multifold Hand Towels provide the right combination of performance and value. Multifold design provides for less towel consumption leading to source reduction, storage space savings, and lower overall costs. Ideal for medium traffic washrooms, fits small spaces and provides both comfort and hygiene to your guests.', 0, '', 'TOWEL TORK MULTIFOLD WHITE 4000/CASE ECOLOGO', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_74_mIfFheEPY.jpg', '012518_74_OLuMbVM5Q.jpg|', '#000000', '', '0', NULL, 29.85, NULL, NULL, NULL, NULL, NULL, 1, '', 7, 'towel-tork-multifold-white-ecologo', ''),
(75, 'CZ89460', 0, 'ENMOTION TOWEL', 1, 'ENMOTION TOWEL, RECESSED DISP HIGH CAPACITY WHITE 6/700\'/CS\r\nThese cost-effective, high-quality roll paper towels are specifically designed to be used with our enMotion® 8” Recessed Automated Touchless Roll Paper Towel Dispenser and our enMotion® Impulse® 8\" 1-Roll Automated Touchless Roll Paper Towel Dispensers to provide reliable towel dispensing at the wave of a hand. Choose these towels for dependable performance and customer satisfaction.', 0, '', '', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_75_Qtalstq6s.jpg', '012518_75_HWbUb6lMs.jpg|012518_75_9gl3kx1PI.jpg|', '#000000', '', '0', NULL, 59.87, NULL, NULL, NULL, NULL, NULL, 1, '', 14, 'enmotion-towel', ''),
(76, 'KC01980', 0, 'TOWEL MULTIFOLD WHITE  SCOTTFOLD', 1, 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD 4375/CS\r\n\r\nScott Scottfold paper towels feature a patented fold that eliminates tearing and tabbing, so your guests and employees will waste less;\r\n They unfold to a generous 9.2” x 9.4”\r\nThe white paper disposable hand towels feature exclusive Absorbency Pockets for better absorbency\r\nHygienic, touchless dispensing with most universal folded towel dispensers: only touch the drying towel you use\r\nThe Scott Brand guarantees these multifold paper towels will be cost-neutral (vs. C-fold towels)', 0, '', 'TOWEL MULTIFOLD WHITE EPA 9.4X12.4 SCOTTFOLD 4375/CS', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_76_yJqkE39bG.jpg', '012518_76_z4pB5HltX.jpg|', '#000000', '', '0', NULL, 49.87, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 6, 'towel-multifold-white-scottfold', ''),
(77, 'KC04007', 0, 'CORELESS TOILET TISSUE 2 PLY', 1, 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', 0, '', 'CORELESS TOILET TISSUE 2 PLY  WHITE SCOTT 36/1000/CS', '1', '0', '1', '0', '0', '1', '1', '0', '1', '1', '1', NULL, NULL, 0, '012518_77_BnPS8XnaX.jpg', NULL, '#000000', '', '0', NULL, 55.94, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 18, 'coreless-toilet-tissue-2-ply', ''),
(78, 'KC13217', 0, 'TOILET TISSUE UNIVERSAL 2 PLY', 1, 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506\r\nWhite toilet tissue is neutral and goes to any restroom\r\nMade with 100% recycled fiber, this 2-ply bulk toilet paper is strong and absorbent\r\nScotts biodegradable toilet paper meets EPA minimum standards, and it’s FSC and EcoLogo certified so that you can feel confident about choosing a wholesale eco-friendly product at a great price\r\nThese commercial tissue rolls contain 75% post-consumer waste', 0, 'TOILET TISSUE UNIVERSAL', 'TOILET TISSUE UNIVERSAL 2 PLY 100% REC EPA GREENSEAL 80/506', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_78_oaFbFqJ8b.jpg', '012518_78_zINfqH1mA.jpg|', '#000000', '', '0', NULL, 52.75, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 8, 'toilet-tissue-universal-2-ply', ''),
(79, 'MMGCBLUE', 0, 'Microfiber Glass, Window and Mirror Towel', 7, 'Microfiber Glass, Window and Mirror Towel blue. 12 per pack', 0, '', 'Microfiber Glass, Window and Mirror Towel blue. 12 per pack', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_79_htXKlzRvY.jpg', '012518_79_8lImG964f.jpg|', '#000000', '', '0', NULL, 14.75, NULL, NULL, NULL, NULL, NULL, 1, 'pack of 12 towel|', 5, 'microfiber-glass-window-and-mirror-towel', ''),
(80, 'SZOGNPR-XL1M', 0, 'GLOVE, NITRILE BLU', 2, 'GLOVE, NITRILE BLU PF XL 100/BX GNPR-XL-1M\r\nBLUE NITRILE GLOVES\r\n POWDER FREE\r\n 100% LATEX FREE\r\n STANDARD LENGTH (9.65″ +/- 0.25″)\r\n Size XL\r\n PACKED 100/BX', 0, 'GLOVE, NITRILE', 'GLOVE, NITRILE BLU PF XL 100/BX GNPR-XL-1M', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012518_80_YUhQASa1M.jpg', '012518_80_x8OWZayf3.jpg|', '#000000', '', '0', NULL, 5.19, NULL, NULL, NULL, NULL, NULL, 1, 'pack|', 4, 'glove-nitrile-blu', ''),
(82, 'GO5785-04', 0, 'PROVON FOAMING HANDWASH 535ML', 6, 'PROVON FOAMING HANDWASH 535ML COUNTER TOP 4 PER CASE\r\n\r\nHigh-quality foaming hand soap with added skin conditioner.\r\nRefreshing cranberry fragrance\r\n\r\nEcoLogo™ certified', 0, '', 'PROVON FOAMING HANDWASH 535ML COUNTER TOP 4 PER CASE\r\n\r\nHigh-quality foaming hand soap with added skin conditioner.\r\nRefreshing cranberry fragrance\r\n\r\nEcoLogo™ certified', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012718_82_AHRa4CSwR.jpg', '012718_82_sz2A7ooL1.jpg|012718_82_0AilIXVtt.jpg|', '#000000', '', '0', NULL, 39.97, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 3, 'provon-foaming-handwash-535ml', ''),
(83, 'GO5361-02', 0, 'GOJO® Premium Foam Handwash with Skin Conditioners', 6, 'GOJO® Premium Foam Handwash with Skin Conditioners 1200 mL Refill for GOJO® TFX™ Dispenser\r\n2 PER CASE\r\nFoam handwash with a thick, rich lather.\r\n\r\nPleasant cranberry fragrance\r\nGentle on skin\r\nEcoLogo™ certified\r\nSANITARY SEALED™ refill helps prevent contamination\r\nFresh dispensing valve with each refill\r\nWORKS WITH TFX DISPENSER', 0, 'FOAM HANDWASH', 'GOJO® Premium Foam Handwash with Skin Conditioners 1200 mL Refill for GOJO® TFX™ Dispenser\r\n2 PER CASE\r\nFoam handwash with a thick, rich lather.\r\n\r\nPleasant cranberry fragrance\r\nGentle on skin\r\nEcoLogo™ certified\r\nSANITARY SEALED™ refill helps prevent contamination\r\nFresh dispensing valve with each refill\r\nWORKS WITH TFX DISPENSER', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_83_vVxwBq5BX.jpg', '012818_83_Exv8fvQzl.jpg|012818_83_JusuICB2L.jpg|012818_83_y5xxcU7uv.jpg|012818_83_Pqcjgyq6e.jpg|', '#000000', 'https://youtu.be/qiRj2KjZymI', '0', NULL, 51.45, NULL, NULL, NULL, NULL, NULL, 1, 'CASE|', 5, 'gojo-premium-foam-handwash-with-skin-conditioners', ''),
(84, '2740-12', 0, 'GOJO® TFX™ Dispenser', 6, 'GOJO® TFX™ Dispenser\r\nTouch-Free Dispenser for GOJO® Foam Soap', 0, 'Dispenser', 'GOJO® TFX™ Dispenser', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 6, '012818_84_ORKhbP7Mi.jpg', NULL, '#000000', 'https://youtu.be/RhcREW4Q6fk', '1', NULL, 27, NULL, NULL, NULL, NULL, NULL, 1, '', 4, 'gojo-tfx-dispenser', ''),
(85, 'FCFOAM-GL', 0, 'FOAM-ALL HAND & BODY SOAP', 6, 'FOAM-ALL HAND & BODY SOAP 1/GL\\r\\nFoam-All™ is the next generation of personal care products. Its high foaming characteristics allow the end-user to use less product. When used through the foaming dispenser, you can see the foam magically grow from the first squirt in your hand. No messy dripping as you apply it to hands, hair or body. For use in shower and restroom facilities in schools, athletic clubs, nursing homes and other public facilities. pH balanced and gentle on the skin. Rinses freely with water.', 0, 'FOAM SOAP', 'FOAM-ALL HAND & BODY SOAP 1/GL\\r\\nFoam-All™ is the next generation of personal care products. Its high foaming characteristics allow the end-user to use less product. When used through the foaming dispenser, you can see the foam magically grow from the first squirt in your hand. No messy dripping as you apply it to hands, hair or body. For use in shower and restroom facilities in schools, athletic clubs, nursing homes and other public facilities. pH balanced and gentle on the skin. Rinses freely with water.', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_85_6BGTgC0WG.jpg', NULL, '#000000', '', '0', NULL, 15.85, NULL, NULL, NULL, NULL, NULL, 1, 'GALON|', 2, 'foam-all-hand-body-soap', ''),
(86, 'GO5392-02', 0, 'PURELL® Advanced Hand Sanitizer', 6, 'PURELL® Advanced Hand Sanitizer E3 Rated Foam\r\n1200 mL Refill for PURELL® TFX™ Dispenser\r\n\r\n2 PER CASE\r\nLuxurious foam certified for use in food processing facilities.\r\n\r\nKills more than 99.99% of most common germs that may cause illness\r\nMeets guidelines for use in USDA and US federally-regulated food processing facilities\r\nListed with NSF International as an E3 for use in all departments of USDA-regulated food processing environments\r\nExceeds the chlorine equivalency standard set by NSF for E3 category status\r\nCertified Kosher\r\nPart of the GOJO Hygiene Management System for Food Processors\r\nFood Code Compliant\r\nOutperforms other hand sanitizers ounce-for-ounce¹\r\nClinically-proven to maintain skin health²\r\nAmerica’s #1 Instant Hand Sanitizer³', 0, 'sanitizer', 'PURELL® Advanced Hand Sanitizer E3 Rated Foam\r\n1200 mL Refill for PURELL® TFX™ Dispenser\r\n\r\n2 PER CASE\r\nLuxurious foam certified for use in food processing facilities.\r\n\r\nKills more than 99.99% of most common germs that may cause illness\r\nMeets guidelines for use in USDA and US federally-regulated food processing facilities\r\nListed with NSF International as an E3 for use in all departments of USDA-regulated food processing environments\r\nExceeds the chlorine equivalency standard set by NSF for E3 category status\r\nCertified Kosher\r\nPart of the GOJO Hygiene Management System for Food Processors\r\nFood Code Compliant\r\nOutperforms other hand sanitizers ounce-for-ounce¹\r\nClinically-proven to maintain skin health²\r\nAmerica’s #1 Instant Hand Sanitizer³', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_86_iRLfhKfzA.jpg', '012818_86_jXrhPr4P2.jpg|012818_86_jUUN3Szp9.jpg|', '#000000', '', '0', NULL, 68.99, NULL, NULL, NULL, NULL, NULL, 1, 'case|', 5, 'purell-advanced-hand-sanitizer', ''),
(87, 'HL39403', 0, 'Mandarin-Cranberry Premium Foam Soap', 6, 'Mandarin-Cranberry Premium Foam Soap\r\n	4 - 1,250mL cartridges	Affinity Manual Refill\r\n\r\n\r\nThis premium foaming soap has additional active ingredients that make it our thickest and most luxurious foaming soap yet. Infused with premium moisturizers that leave your skin smooth and clean with a refreshing citrus and berry scent.\r\n\r\nThick, luxurious foaming soap.\r\n\r\nMandarin-cranberry scent.\r\n\r\nGreen Seal Certified.', 0, '', 'Mandarin-Cranberry Premium Foam Soap\r\n\r\n	4 - 1,250mL cartridges	Affinity Manual Refill\r\n\r\n\r\nThis premium foaming soap has additional active ingredients that make it our thickest and most luxurious foaming soap yet. Infused with premium moisturizers that leave your skin smooth and clean with a refreshing citrus and berry scent.\r\n\r\nThick, luxurious foaming soap.\r\n\r\nMandarin-cranberry scent.\r\n\r\nGreen Seal Certified.', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_87_zMqi8VaVJ.jpg', NULL, '#000000', '', '0', NULL, 49.95, NULL, NULL, NULL, NULL, NULL, 1, '', 1, 'mandarin-cranberry-premium-foam-soap', ''),
(88, 'HIL22280', 0, 'Affinity Manual Soap Dispenser 1.25 L', 28, 'Affinity Manual Soap Dispenser 1.25 L \r\nOne reliable, robust dispenser delivering foam, liquid or gel. Space-saving dispenser design utilizes 25% less plastic by weight than other 1,250 mL dispensers without compromising reliability or durability.', 0, 'MANUAL SOAP DISPENSER', 'Affinity Manual Soap Dispenser 1.25 L \r\nOne reliable, robust dispenser delivering foam, liquid or gel. Space-saving dispenser design utilizes 25% less plastic by weight than other 1,250 mL dispensers without compromising reliability or durability.', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_88_0uDCN7mut.jpg', NULL, '#000000', '', '0', NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 'EACH|', 10, 'affinity-manual-soap-dispenser-1-25-l', ''),
(89, 'FCHYGL', 0, 'PINK HAND SOAP', 6, 'PINK HAND SOAP\r\n1 GALON\r\n\r\nAn economical, mild, hand cleaner. This product has a very soft, gentle feel and a pleasant fragrance. It rinses quickly and completely.', 0, '', 'PINK HAND SOAP\r\n1 GALON\r\nAn economical, mild, hand cleaner. This product has a very soft, gentle feel and a pleasant fragrance. It rinses quickly and completely.', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 0, '012818_89_pyl0LFKaN.jpg', NULL, '#000000', '', '0', NULL, 8.99, NULL, NULL, NULL, NULL, NULL, 1, '', 15, 'pink-hand-soap', ''),
(90, 'dfdf', 0, 'ddfdfdf', 1, '', 0, '', '', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 1, 'nophoto.jpg', NULL, '#000000', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'ddfdfdf', ''),
(91, 'ghghgh', 0, 'ghghgh', 1, '', 0, '', '', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', NULL, NULL, 1, 'nophoto.jpg', NULL, '#000000', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'ghghgh', ''),
(92, 'ghghghg', 0, 'hghgh', 1, '', 0, '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, 'nophoto.jpg', NULL, '#000000', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'hghgh', ''),
(93, 'ghghghg', 0, 'hghgh', 1, '', 0, '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, 'nophoto.jpg', NULL, '#000000', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'hghgh-93', ''),
(94, 'sdsdsd', 4, 'sdsdsd', 1, '', 0, '', '', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', NULL, NULL, 0, '031418_94_MdjY5IpNC.jpg', '031418_94_xmAhJvVnP.jpg|031418_94_kVqs7G7P7.jpg|031418_94_1nMhQrUQW.jpg', '#1b4b65', '', '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', 4, 'sdsdsd', ''),
(95, 'енененен', 0, 'некнене', 1, '', 0, '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, '031418_95_FAYtQHlJF.jpg', '031418_95_mN3bEYb6L.jpg|031418_95_Cs7GduFnu.jpg', '#8080ff', '', '1', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'neknene', ''),
(96, 'фыфыфы', 0, 'фыфы', 1, '', 0, '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 0, '031418_96_HEksyTyTU.jpg', '031518_96_HnadVW6si.png|031518_96_DKvj7VTig.png|', '#004080', '', '0', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, 'fyfy', '');

-- --------------------------------------------------------

--
-- Структура таблицы `product_status`
--

CREATE TABLE `product_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `icon_style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_status`
--

INSERT INTO `product_status` (`id`, `title`, `alias`, `icon_style`) VALUES
(1, 'В наличии', 'available', 'fa-check'),
(2, 'Ожидается', 'waiting', ''),
(3, 'Нет в наличии', 'not_available', '');

-- --------------------------------------------------------

--
-- Структура таблицы `prod_info_rating`
--

CREATE TABLE `prod_info_rating` (
  `id` int(11) NOT NULL,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `prod_rating_id` int(11) NOT NULL,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prod_info_rating`
--

INSERT INTO `prod_info_rating` (`id`, `user_ip`, `ip_locale_address`, `prod_rating_id`, `created`) VALUES
(6, '127.0.0.1', 'art.loc', 13, '2017-10-31'),
(7, '127.0.0.1', 'art.loc', 14, '2017-10-31'),
(8, '127.0.0.1', 'art.loc', 1, '2017-10-31'),
(9, '127.0.0.1', 'art.loc', 2, '2017-11-02'),
(10, '127.0.0.1', 'art.loc', 60, '2017-11-02'),
(11, '127.0.0.1', 'art.loc', 10, '2017-11-06'),
(12, '193.111.156.142', 'mail.pstu.edu', 59, '2017-11-08'),
(13, '127.0.0.1', 'WIN-QJF2VCB52DD', 57, '2017-11-19'),
(14, '127.0.0.1', 'WIN-QJF2VCB52DD', 58, '2017-11-19'),
(15, '127.0.0.1', 'WIN-QJF2VCB52DD', 24, '2017-12-11'),
(16, '193.111.156.142', 'mail.pstu.edu', 15, '2017-12-28'),
(17, '193.111.156.142', 'mail.pstu.edu', 62, '2018-01-24'),
(18, '127.0.0.1', 'admin-', 83, '2018-03-05'),
(19, '127.0.0.1', 'apple.loc', 77, '2018-08-30'),
(20, '127.0.0.1', 'apple.loc', 88, '2018-09-13');

-- --------------------------------------------------------

--
-- Структура таблицы `prod_rating`
--

CREATE TABLE `prod_rating` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Block, 0 = Unblock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `prod_rating`
--

INSERT INTO `prod_rating` (`rating_id`, `product_id`, `rating_number`, `total_points`, `created`, `modified`, `status`) VALUES
(11, 13, 1, 5, '2017-10-31 11:31:07', '2017-10-31 11:31:07', 1),
(12, 14, 1, 5, '2017-10-31 11:34:29', '2017-10-31 11:34:29', 1),
(13, 1, 1, 5, '2017-10-31 11:35:12', '2017-10-31 11:35:12', 1),
(14, 2, 2, 10, '2017-11-02 21:49:04', '2017-11-15 07:59:41', 1),
(15, 60, 1, 5, '2017-11-02 22:15:33', '2017-11-02 22:15:33', 1),
(16, 10, 1, 5, '2017-11-06 11:50:03', '2017-11-06 11:50:03', 1),
(17, 59, 1, 5, '2017-11-08 06:25:56', '2017-11-08 06:25:56', 1),
(18, 57, 1, 5, '2017-11-19 21:55:55', '2017-11-19 21:55:55', 1),
(19, 58, 1, 5, '2017-11-19 22:41:40', '2017-11-19 22:41:40', 1),
(20, 24, 1, 5, '2017-12-11 03:14:18', '2017-12-11 03:14:18', 1),
(21, 15, 1, 5, '2017-12-28 07:43:12', '2017-12-28 07:43:12', 1),
(22, 62, 1, 5, '2018-01-24 06:17:59', '2018-01-24 06:17:59', 1),
(23, 83, 1, 5, '2018-03-05 18:38:28', '2018-03-05 18:38:28', 1),
(24, 77, 1, 5, '2018-08-30 11:10:41', '2018-08-30 11:10:41', 1),
(25, 88, 1, 5, '2018-09-13 14:09:03', '2018-09-13 14:09:03', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `related_assingment`
--

CREATE TABLE `related_assingment` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `related_product_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `related_assingment`
--

INSERT INTO `related_assingment` (`id`, `product_id`, `related_product_id`) VALUES
(1, 1, '2,3,4,5,6,7,8');

-- --------------------------------------------------------

--
-- Структура таблицы `related_аdditions`
--

CREATE TABLE `related_аdditions` (
  `id` int(10) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `old_price` int(10) NOT NULL DEFAULT '0',
  `new_price` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `related_аdditions`
--

INSERT INTO `related_аdditions` (`id`, `parent_id`, `product_id`, `title`, `description`, `old_price`, `new_price`) VALUES
(1, 7, 25, 'Параметр 1', 'Описание дополнения', 350, 500),
(2, 7, 26, 'Параметр_2', '', 100, 50),
(3, 7, 27, 'Параметр_21', '', 100, 50),
(4, 8, 28, 'Параметр 3', '', 1000, 950),
(5, 8, 29, 'Параметр 4', '', 1550, 500),
(7, 0, 0, 'Дополнения 1', 'Модель описание', 0, 0),
(8, 0, 0, 'Дополнения 2', 'Описание Модели 2', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_states_products`
--

CREATE TABLE `rel_states_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rel_states_products`
--

INSERT INTO `rel_states_products` (`id`, `product_id`, `state_id`) VALUES
(1, 13, 1),
(2, 13, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_suppliers_products`
--

CREATE TABLE `rel_suppliers_products` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rel_suppliers_products`
--

INSERT INTO `rel_suppliers_products` (`id`, `supplier_id`, `product_id`) VALUES
(1, 1, 94),
(2, 3, 94),
(3, 1, 77),
(4, 3, 77),
(5, 1, 71),
(6, 3, 71);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_upsell_prod`
--

CREATE TABLE `rel_upsell_prod` (
  `id` int(10) UNSIGNED NOT NULL,
  `upsell_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rel_warehouse_product`
--

CREATE TABLE `rel_warehouse_product` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_price` float DEFAULT NULL,
  `warehouse_tax` varchar(50) DEFAULT NULL,
  `warehouse_discount` varchar(50) DEFAULT NULL,
  `warehouse_stock` int(11) DEFAULT NULL,
  `warehouse_count` int(11) DEFAULT NULL,
  `warehouse_availability` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rel_warehouse_product`
--

INSERT INTO `rel_warehouse_product` (`id`, `warehouse_id`, `product_id`, `warehouse_price`, `warehouse_tax`, `warehouse_discount`, `warehouse_stock`, `warehouse_count`, `warehouse_availability`) VALUES
(17, 1, 62, 28.45, '0', '0', 0, 0, 1),
(18, 1, 63, 42.85, '0', '0', 0, 0, 1),
(20, 1, 65, 37.81, '0', '0', 0, 0, 1),
(21, 1, 66, 37.85, '0', '0', 0, 0, 1),
(22, 2, 66, 0, '0', '0', 0, 0, 1),
(23, 1, 67, 39.85, '0', '0', 0, 0, 1),
(24, 1, 68, 52.87, NULL, NULL, NULL, NULL, 1),
(25, 1, 69, 11.99, '0', '0', 0, 0, 1),
(26, 1, 70, 4.98, NULL, NULL, NULL, NULL, 1),
(27, 1, 71, 21.75, '0', '0', 0, 0, 1),
(28, 1, 72, 11.67, '0', '0', 0, 0, 1),
(29, 1, 73, 6.9, '0', '0', 0, 0, 1),
(30, 1, 74, 29.85, '0', '0', 0, 0, 1),
(31, 1, 75, 59.87, NULL, NULL, NULL, NULL, 1),
(32, 1, 76, 49.87, '0', '0', 0, 0, 1),
(33, 1, 77, 55.94, NULL, NULL, NULL, NULL, 1),
(34, 1, 78, 52.75, NULL, NULL, NULL, NULL, 1),
(35, 1, 79, 14.75, '0', '0', 0, 0, 1),
(36, 1, 80, 5.19, NULL, NULL, NULL, NULL, 1),
(37, 1, 82, 39.97, '0', '0', 0, 0, 1),
(38, 1, 83, 51.45, NULL, NULL, NULL, NULL, 1),
(39, 1, 84, 27, NULL, NULL, NULL, NULL, 1),
(40, 1, 85, 15.85, '0', '0', 0, 0, 1),
(42, 1, 86, 68.99, '0', '0', 0, 0, 1),
(43, 1, 87, 49.95, NULL, NULL, NULL, NULL, 1),
(44, 1, 88, 4, NULL, NULL, NULL, NULL, 1),
(45, 1, 89, 5, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `titleSite` text,
  `descriptionSite` text,
  `minSumCart` int(11) DEFAULT '1',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `titleHome` text,
  `descriptionHome` text,
  `googleCode` text,
  `permissionComments` tinyint(2) DEFAULT '0',
  `contentHomePage` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `titleSite`, `descriptionSite`, `minSumCart`, `email`, `phone`, `titleHome`, `descriptionHome`, `googleCode`, `permissionComments`, `contentHomePage`) VALUES
(1, 'ZupplyBox', 'ZUPPLY BOX description', 100, 'test@admin.com', '206-707-9407', 'Home', '', 'kq2dHJGUktWDtrj0vjaezO6k-yEQFPjq-1aL_cQARck', 1, '&lt;div class=&quot;benefitsBox clear&quot;&gt;\r\n&lt;h3 class=&quot;stipeHeading&quot;&gt;Benefits for your Business&lt;/h3&gt;\r\n\r\n&lt;div class=&quot;textInformer&quot;&gt;\r\n&lt;p&gt;When you buy from Zupply&amp;nbsp;Box you support your local business and your local economy. Companies from your area deliver directly to your&amp;nbsp;door at a competitive price, great&amp;nbsp;customer service and you invest in your local schools, infrastructure and job market.&lt;/p&gt;\r\n\r\n&lt;p&gt;Everything in one place for all your business needs. Fast free local delivery. When you buy from Zupply&amp;nbsp;Box you support your local business and your local economy.&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;imageIdentity&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `settings_slider`
--

CREATE TABLE `settings_slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8,
  `description` text CHARACTER SET utf8,
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `settings_slider`
--

INSERT INTO `settings_slider` (`id`, `title`, `description`, `link`) VALUES
(1, '', '&lt;div class=&quot;videoSplitter clear&quot;&gt;\r\n&lt;video controls=&quot;controls&quot; height=&quot;267&quot; poster=&quot;video/del.jpg&quot; width=&quot;400&quot;&gt;&lt;source avc1.42e01e=&quot;&quot; src=&quot;http://zupplybox.com/video/zupply.mp4&quot; type=&quot;video/mp4; codecs=&quot; /&gt; Тег video не поддерживается вашим браузером. Обновитесь. &lt;a href=&quot;../video/duel.mp4&quot;&gt;Скачайте видео&lt;/a&gt;.&lt;/video&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;videoSplitter clear&quot;&gt;\r\n&lt;h2 class=&quot;wellCome&quot;&gt;Welcome.&lt;/h2&gt;\r\n&lt;a class=&quot;button&quot; href=&quot;/registration&quot;&gt;Create account&lt;/a&gt;&lt;/div&gt;\r\n', '');

-- --------------------------------------------------------

--
-- Структура таблицы `settings_statictext`
--

CREATE TABLE `settings_statictext` (
  `id` int(10) UNSIGNED NOT NULL,
  `cart_text` text,
  `upsell_text` text,
  `order_final_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings_statictext`
--

INSERT INTO `settings_statictext` (`id`, `cart_text`, `upsell_text`, `order_final_text`) VALUES
(1, 'example text_1', 'example upsell text_4', 'example final text_4');

-- --------------------------------------------------------

--
-- Структура таблицы `special_mark`
--

CREATE TABLE `special_mark` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `special_mark`
--

INSERT INTO `special_mark` (`id`, `title`, `alias`) VALUES
(1, 'sale', 'mark_sale'),
(2, 'stock', 'stock_id'),
(3, 'upsell', 'upsell_product'),
(4, 'hit', 'mark_hit'),
(5, 'expert', 'mark_expert'),
(6, 'discontinued', 'mark_discontinued'),
(8, 'fast delivery', 'fast_delivery'),
(9, 'free delivery', 'free_delivery'),
(10, 'perfect delivery', 'perfect_delivery'),
(11, 'exchange product', 'exchange_prod'),
(12, 'warrantly months', 'warranty_months'),
(13, 'upsell product', 'upsell_product');

-- --------------------------------------------------------

--
-- Структура таблицы `states`
--

CREATE TABLE `states` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `states`
--

INSERT INTO `states` (`id`, `name`, `state_code`) VALUES
(1, 'Alaska', 'AK'),
(2, 'Alabama', 'AL'),
(3, 'Arkansas', 'AR'),
(4, 'Arizona', 'AZ'),
(5, 'California', 'CA'),
(6, 'Colorado', 'CO'),
(7, 'Connecticut', 'CT'),
(8, 'District of Columbia', 'DC'),
(9, 'Delaware', 'DE'),
(10, 'Florida', 'FL'),
(11, 'Georgia', 'GA'),
(12, 'Hawaii', 'HI'),
(13, 'Iowa', 'IA'),
(14, 'Idaho', 'ID'),
(15, 'Illinois', 'IL'),
(16, 'Indiana', 'IN'),
(17, 'Kansas', 'KS'),
(18, 'Kentucky', 'KY'),
(19, 'Louisiana', 'LA'),
(20, 'Massachusetts', 'MA'),
(21, 'Maryland', 'MD'),
(22, 'Maine', 'ME'),
(23, 'Michigan', 'MI'),
(24, 'Minnesota', 'MN'),
(25, 'Missouri', 'MO'),
(26, 'Mississippi', 'MS'),
(27, 'Montana', 'MT'),
(28, 'North Carolina', 'NC'),
(29, 'North Dakota', 'ND'),
(30, 'Nebraska', 'NE'),
(31, 'New Hampshire', 'NH'),
(32, 'New Jersey', 'NJ'),
(33, 'New Mexico', 'NM'),
(34, 'Nevada', 'NV'),
(35, 'New York', 'NY'),
(36, 'Ohio', 'OH'),
(37, 'Oklahoma', 'OK'),
(38, 'Oregon', 'OR'),
(39, 'Pennsylvania', 'PA'),
(40, 'Rhode Island', 'RI'),
(41, 'South Carolina', 'SC'),
(42, 'South Dakota', 'SD'),
(43, 'Tennessee', 'TN'),
(44, 'Texas', 'TX'),
(45, 'Utah', 'UT'),
(46, 'Virginia', 'VA'),
(47, 'Vermont', 'VT'),
(48, 'Washington', 'WA'),
(49, 'Wisconsin', 'WI'),
(50, 'West Virginia', 'WV'),
(51, 'Wyoming', 'WY');

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE `stock` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `description` text,
  `mini_description` text,
  `stock_img` varchar(255) DEFAULT NULL,
  `stock_thumbnail` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `activation` tinyint(2) NOT NULL DEFAULT '1',
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stock`
--

INSERT INTO `stock` (`id`, `title`, `alias`, `description`, `mini_description`, `stock_img`, `stock_thumbnail`, `start_time`, `end_time`, `activation`, `position`) VALUES
(23, 'stock-test#9', 'stock-test-9', 'asasas', 'dfdfdfdfdfdf', '121117_23_2eXmMjeZ1.png', '121117_23_hd3m1Rs5T.png', NULL, '2018-01-20 11:11:00', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `subscription_goods`
--

CREATE TABLE `subscription_goods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL,
  `subscribe_date` datetime NOT NULL,
  `unsubscribe_date` datetime NOT NULL,
  `code_unsubscribe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subscription_goods`
--

INSERT INTO `subscription_goods` (`id`, `name_user`, `email_user`, `status`, `product_id`, `subscribe_date`, `unsubscribe_date`, `code_unsubscribe`) VALUES
(7, 'admin', 'pudzia009@gmail.com', 1, 2, '2017-07-16 01:03:13', '0000-00-00 00:00:00', 'XCPrwtmCMz'),
(8, 'admin', 'pudzia009@gmail.com', 0, 5, '2017-07-16 02:51:21', '2017-07-16 03:12:05', 'X236jJBfth'),
(9, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-16 22:21:57', '2017-07-16 22:25:08', '8xNhKig8uR'),
(10, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-16 22:25:29', '2017-07-16 22:36:09', 'WgKPKOC41f'),
(11, 'admin', 'pudzia009@gmail.com', 0, 1, '2017-07-21 13:45:28', '2017-07-21 13:47:15', 'NA6abJRnsO'),
(12, 'admincv', 'sdsdsd@sdsd.com', 1, 1, '2017-07-21 14:08:06', '0000-00-00 00:00:00', '4ahjOvwVEj'),
(13, 'dsdsd', 'sdsdsd@dsdsdsd.com', 1, 1, '2017-07-21 14:08:46', '0000-00-00 00:00:00', 'OzcZeehSgn'),
(14, 'dfdfdf', 'dfdf@dfdf.com', 1, 1, '2017-07-21 14:10:26', '0000-00-00 00:00:00', '874SUi96xn'),
(15, 'dfdfdfdfdf', 'dfdfdf@dsdsds.com', 1, 1, '2017-07-21 14:14:26', '0000-00-00 00:00:00', 'TR7MLNKWhR'),
(16, 'sdsdsdsd', 'pudzia009@gmail.com', 1, 1, '2017-07-21 14:16:05', '0000-00-00 00:00:00', 'e48Z7joh3N'),
(17, 'Rtrttrtu', 'dffd@ghhhh.cpm', 1, 4, '2017-07-21 20:14:30', '0000-00-00 00:00:00', 'oizMDYsbzm');

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
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
  `visible` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `alias`, `title`, `description`, `meta_d`, `meta_k`, `state`, `city`, `zip_code`, `email`, `phone`, `visible`) VALUES
(1, 'supplier2', 'supplier2', 'supplier', 'supplier', 'supplier', 'Arizona', 'test city', 87000, '', '', '1'),
(3, 'test-2', 'test 2', 'description', 'meta desc', 'meta key', 'Alaska', 'fgfg', 7878, 'test@email.com', '+1100800500', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `team_admin_access`
--

CREATE TABLE `team_admin_access` (
  `id` int(10) NOT NULL,
  `team_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `team_alias` varchar(100) CHARACTER SET utf8 NOT NULL,
  `access_level` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `team_admin_access`
--

INSERT INTO `team_admin_access` (`id`, `team_name`, `team_alias`, `access_level`) VALUES
(1, 'Managers ', 'managers', 0),
(2, 'Editors', 'editors', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `team_admin_users`
--

CREATE TABLE `team_admin_users` (
  `id` int(11) NOT NULL,
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
  `admin_access_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `team_admin_users`
--

INSERT INTO `team_admin_users` (`id`, `login`, `email`, `password`, `name`, `start_time_work`, `phone`, `ext_phone`, `age`, `date_birth`, `education`, `admin_access_id`) VALUES
(1, 'general_manager', 'manager@gmail.com', '123456', 'General manager', '', '', '', 0, '1969-12-31', '', 1),
(2, 'manager 1', 'manager1@gmail.com', '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'name', '', '+11111111111', '+11111111111', 20, '1980-12-20', 'education', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `article` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `available` tinyint(2) NOT NULL DEFAULT '1',
  `stock_id` int(10) UNSIGNED NOT NULL,
  `upsell_product` enum('0','1') NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  `count_prod` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `states_id` int(10) NOT NULL DEFAULT '0',
  `states_name` varchar(255) NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `availability_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `availability_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`id`, `article`, `title`, `category_id`, `available`, `stock_id`, `upsell_product`, `price`, `count_prod`, `product_id`, `state_id`, `states_id`, `states_name`, `category_title`, `availability_id`, `availability_title`) VALUES
(13, '#21221', 'product-test_13_13', 21, 1, 1, '0', 249.99, 200, 13, 1, 1, 'washington', 'category_1_1_1', 1, 'published'),
(13, '#21221', 'product-test_13_13', 21, 1, 1, '0', 249.99, 200, 13, 2, 2, 'vermont', 'category_1_1_1', 1, 'published');

-- --------------------------------------------------------

--
-- Структура таблицы `upsell`
--

CREATE TABLE `upsell` (
  `id` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upsell_price` float DEFAULT NULL,
  `default_price` float DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `position` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `upsell`
--

INSERT INTO `upsell` (`id`, `product_id`, `name`, `upsell_price`, `default_price`, `alias`, `position`) VALUES
(1, 1, 'upsell 1', 1200, NULL, 'upsell_1', 1),
(4, 3, 'test_2', 850, 1200, 'null', NULL),
(6, 3, 'test_2', 850, 1200, 'null', NULL),
(9, 3, 'test_2', 850, 1200, 'null', NULL),
(10, 3, 'test_2', 850, 1200, 'null', NULL),
(11, 3, 'test_2', 850, 1200, 'null', NULL),
(12, 60, NULL, 100.56, 1200, NULL, NULL),
(13, 61, NULL, 100.56, 1200, NULL, NULL),
(14, 61, NULL, 100.56, 1200, NULL, NULL),
(15, 61, NULL, 100.56, 1200, NULL, NULL),
(16, 3, NULL, 100.56, 1200.22, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `oauth_uid_facebook` varchar(100) DEFAULT NULL,
  `oauth_uid_google` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `discount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
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
  `warehouse` int(10) UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role`, `oauth_uid_facebook`, `oauth_uid_google`, `link`, `modified`, `discount`, `pass`, `code`, `avatar`, `type`, `surname`, `name`, `patronymic`, `sex`, `birthday`, `city`, `email`, `phone`, `address`, `warehouse`, `datetime`, `ip`) VALUES
(1, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxcxcx@gmail.com', '', '', 0, '2017-06-25 23:50:40', '127.0.0.1'),
(2, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxcxcx@gmail.com', '', '', 0, '2017-06-25 23:52:18', '127.0.0.1'),
(3, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxxcxccxcx@gmail.com', '', '', 0, '2017-06-26 00:00:45', '127.0.0.1'),
(4, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'xcxcxcxc', '', 0, '', '', 'xcxcxxcxccxcx@gmail.com', '', '', 0, '2017-06-26 00:00:56', '127.0.0.1'),
(5, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:12:08', '127.0.0.1'),
(6, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:22', '127.0.0.1'),
(7, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:37', '127.0.0.1'),
(8, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qdaa1391b2912c15ba922e0eb90fd0de22yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:13:55', '127.0.0.1'),
(9, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgrgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:15:05', '127.0.0.1'),
(10, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'ghghgh', '', 0, '', '', 'xcxcxfgfgrgcxgcx@gmail.com', '', '', 0, '2017-06-26 01:15:22', '127.0.0.1'),
(11, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxcx@gmail.com', '', '', 0, '2017-06-27 02:53:58', '127.0.0.1'),
(12, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxcx@gmail.com', '', '', 0, '2017-06-27 02:54:49', '127.0.0.1'),
(13, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'df55', '', 0, '', '', 'xcxcxdfcxhjjcx@gmail.com', '', '', 0, '2017-06-27 02:56:35', '127.0.0.1'),
(14, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:09', '127.0.0.1'),
(15, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:11', '127.0.0.1'),
(16, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:33', '127.0.0.1'),
(17, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 02:59:49', '127.0.0.1'),
(18, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcxcxcx@gmail.com', '', '', 0, '2017-06-27 03:00:15', '127.0.0.1'),
(19, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcnmnxcxcx@gmail.com', '', '', 0, '2017-06-27 03:00:26', '127.0.0.1'),
(20, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxhjhjcnmnxcxcx@gmail.com', '', '', 0, '2017-06-27 03:06:53', '127.0.0.1'),
(21, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'sdsghghghdsd@hghg.com', '', '', 0, '2017-06-27 03:07:40', '127.0.0.1'),
(22, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe4e95fc0fd4d6f7e176c6b21e0acf57d2yo6z', '', 'no-image.png', 0, '', 'sdsdd', '', 0, '', '', 'sdsdsd@hghg.com', '', '', 0, '2017-06-27 03:15:55', '127.0.0.1'),
(23, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'sdssdsdddsd@hghg.com', '', '', 0, '2017-06-27 03:31:04', '127.0.0.1'),
(24, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'sdssdsdddsd@hghg.com', '', '', 0, '2017-06-27 03:31:08', '127.0.0.1'),
(25, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '12345678', '', 0, '', '', 'pudfgzia009@gmail.com', '', '', 0, '2017-06-27 03:32:40', '127.0.0.1'),
(26, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qda70c317d67c464fa004aa382da55d522yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'test@gmail.com', '', '', 0, '2017-06-27 03:39:03', '127.0.0.1'),
(27, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'xcxcxklklcxcx@gmail.com', '', '', 0, '2017-06-27 03:43:14', '127.0.0.1'),
(28, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudzljlia009@gmail.com', '', '', 0, '2017-06-27 03:44:56', '127.0.0.1'),
(29, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', 'jhjhj', '', 0, '', '', 'pudziart009@gmail.com', '', '', 0, '2017-06-27 08:23:18', '127.0.0.1'),
(30, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q3d0ae2da1c51f64994f3c2f5faa66c002yo6z', '', 'no-image.png', 0, '', 'asdf', '', 0, '', '', 'puyjyjdzia009@gmail.com', '', '', 0, '2017-07-03 02:41:39', '127.0.0.1'),
(31, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qf930483127f4b2467fd18eaa66b5d4ad2yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudzkiikia009@gmail.com', '', '', 0, '2017-07-03 02:43:37', '127.0.0.1'),
(32, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qbdcad8a9812b0ceacb41cf6bf3d70c432yo6z', '', 'no-image.png', 0, '', 'hjhj', '', 0, '', '', 'pudfdfdzia009@gmail.com', '', '', 0, '2017-07-03 02:49:41', '127.0.0.1'),
(33, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qf0e9520d80d822f7e5a4a47ff719be992yo6z', '', 'no-image.png', 0, '', 'hjhjfhf', '', 0, '', '', 'sdsdsfhfhd@hghg.com', '', '', 0, '2017-07-03 02:59:50', '127.0.0.1'),
(34, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q90d18a5d706c39f565fd94466b7fc53e2yo6z', '', 'no-image.png', 0, '', 'jhjhj', '', 0, '', '', 'sd454sdsd@hghg.com', '', '', 0, '2017-07-03 03:00:34', '127.0.0.1'),
(35, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '123456', '', 0, '', '', '123@gmail.com', '', '', 0, '2017-07-03 04:52:49', '127.0.0.1'),
(36, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '', 'no-image.png', 0, '', '123', '', 0, '', '', '789@gmail.com', '', '', 0, '2017-07-03 05:02:13', '127.0.0.1'),
(37, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'pOwxF1hae7', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudzia45545@ggfgg.com', '', '', 0, '2017-07-03 11:08:20', '127.0.0.1'),
(38, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'h2b54oIQjK', 'no-image.png', 0, '', 'df545', '', 0, '', '', 'pucvcvdzia009@gmail.comc', '', '', 0, '2017-07-03 11:34:48', '127.0.0.1'),
(39, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'W3IXHiyLLG', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudzixcxca009@gmail.com', '', '', 0, '2017-07-03 12:12:08', '127.0.0.1'),
(40, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qc6e3d292722ecb653ce71d1cd2cff9642yo6z', 'QWGdPGPKSi', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'pudxcxczia009@gmail.com', '', '', 0, '2017-07-03 12:13:55', '127.0.0.1'),
(41, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', '5tF7mUtYLR', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'frexceitgroupe@gmail.comxc', '', '', 0, '2017-07-03 12:17:03', '127.0.0.1'),
(42, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'iojrYToVTW', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitxcxcgroupe@gmail.comxcxc', '', '', 0, '2017-07-03 12:17:14', '127.0.0.1'),
(43, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'RICoWSIlK4', 'no-image.png', 0, '', 'freeitgroupe', '', 0, '', '', 'freeitgroupe@gmail.comxxc', '', '', 0, '2017-07-03 12:19:31', '127.0.0.1'),
(44, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'KoNN7h27N2', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitgxcroupe@gmail.com', '', '', 0, '2017-07-03 12:21:00', '127.0.0.1'),
(45, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'TBc5VpsXnO', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitggtffgroupe@gmail.com', '', '', 0, '2017-07-03 12:22:38', '127.0.0.1'),
(46, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'PKOC41fsAb', 'no-image.png', 0, '', 'xcxc', '', 0, '', '', 'freeitgr;loupe@gmail.com', '', '', 0, '2017-07-03 13:20:56', '127.0.0.1'),
(47, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'iOp1tDlQea', 'no-image.png', 1, 'Ивановr', 'Roman', 'Иванович', 2, '54.54.5454', 'Киев', 'freeitgroupe@gmail.com', '+38(111) 111-11-11', 'пр.Мира 191, кв.1220', 0, '2017-07-03 13:21:32', '127.0.0.1'),
(48, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'xBRQnuxetj', 'no-image.png', 0, '', '123456', '', 0, '', '', 'xcxc@ssdsd.com', '', '', 0, '2017-07-03 14:28:05', '127.0.0.1'),
(49, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'gwOMrHDPu0', 'no-image.png', 0, '', 'dfdfdf', '', 0, '', '', 'pudzia009@gmail.com', '', '', 0, '2017-07-04 21:17:34', '193.111.156.142'),
(50, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z', 'bItjBhHNuY', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:04:48', '127.0.0.1'),
(51, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z', 'eNK0MI1VRn', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:07:23', '127.0.0.1'),
(52, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'LtAkkjMjCK', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:32', '127.0.0.1'),
(53, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'Wopm3lYHBG', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:44', '127.0.0.1'),
(54, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'EITBkE5SLd', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:12:56', '127.0.0.1'),
(55, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '92jbogKlba', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:14:01', '127.0.0.1'),
(56, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '1ybeEYIvqQ', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:14:37', '127.0.0.1'),
(57, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '4ph1pQGYYM', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm@gmail.com', '', '', 0, '2017-10-05 18:15:08', '127.0.0.1'),
(58, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '2Ypw8JvmIK', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzia@rambler.ru', '', '', 0, '2017-10-05 18:33:27', '127.0.0.1'),
(59, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'EoPpe28kLb', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzia001@rambler.ru', '', '', 0, '2017-10-05 18:35:54', '127.0.0.1'),
(60, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z', '7PM3oi6EUz', 'no-image.png', 0, '', '', '', 0, '', '', 'sssdsd@gmail.com', '', '', 0, '2017-10-05 18:57:09', '127.0.0.1'),
(61, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'sXh0PU1UbL', 'no-image.png', 0, '', '', '', 0, '', '', 'sssddsd@gmail.com', '', '', 0, '2017-10-05 19:35:18', '127.0.0.1'),
(62, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'SQZyuVkzhy', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammme@gmail.com', '', '', 0, '2017-10-05 19:52:32', '127.0.0.1'),
(63, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', 'gpbaNPqQPO', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziamxcxcmm@gmail.com', '', '', 0, '2017-10-05 19:52:53', '127.0.0.1'),
(64, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z', 'm35gSf675Y', 'no-image.png', 0, '', '', '', 0, '', '', 'pudzidfammm@gmail.com', '', '', 0, '2017-10-05 19:54:21', '127.0.0.1'),
(65, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q211033a5dd945a29c27be56981297e692yo6z', '4B0JHrwe0t', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammdddddm@gmail.com', '', '', 0, '2017-10-05 19:55:15', '127.0.0.1'),
(66, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z', 'GkqX6TbnHN', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziadfdfdfmmm@gmail.com', '', '', 0, '2017-10-05 19:55:38', '127.0.0.1'),
(67, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z', 'TNvLYK8exV', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziammm565656@gmail.com', '', '', 0, '2017-10-05 19:57:01', '127.0.0.1'),
(68, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q3f4cc94b6bd0ad3727d925af1ba288372yo6z', 'cnpgAXwLBp', 'no-image.png', 0, '', '', '', 0, '', '', 'pudsdsdsziammm@gmail.com', '', '', 0, '2017-10-05 19:59:42', '127.0.0.1'),
(69, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8q63f0bd0078cf046d2b127ae3a4c1b3432yo6z', 'SRBiuTU4BO', 'no-image.png', 0, '', '', '', 0, '', '', 'pudziassasammm@gmail.com', '', '', 0, '2017-10-05 20:00:25', '127.0.0.1'),
(70, 0, NULL, NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'jp0yK2R3LO', 'no-image.png', 0, '', '', '', 0, '', '', 'qqq@qqq.com', '', '', 0, '2017-10-09 11:38:43', '127.0.0.1'),
(71, 2, '', NULL, NULL, NULL, 0, '9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z', 'OMSqxaXx3z', 'no-image.png', 0, '', 'Admin Admin', '', 0, '', '', 'admin@gmail.com', '1(111)1111-111-111', '', 0, '2017-10-20 10:11:46', '127.0.0.1'),
(72, 0, NULL, NULL, NULL, NULL, 0, '$2y$10$eGOFmoTPVP98KznwBLG3WuyVDUmEWXIke0qqJwn75yRX8j2McdOLS', 'UDguy68PGJ', 'no-image.png', 0, NULL, NULL, NULL, 0, NULL, NULL, '77xcxc8826@ukr.net', NULL, NULL, 0, '0000-00-00 00:00:00', '127.0.0.1'),
(73, 0, NULL, NULL, NULL, NULL, 0, '$2y$10$ZXWP0FQi7QiNHDBbeu2yiu/cyRZPK5R0gTDKpiK8Ky7cvCg/w4OlO', 'FSyhjvcn60', 'no-image.png', 0, NULL, NULL, NULL, 0, NULL, NULL, '778826@ukr.net', NULL, NULL, 0, '2018-08-21 11:51:34', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `users_group`
--

CREATE TABLE `users_group` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_group`
--

INSERT INTO `users_group` (`id`, `title`, `role`, `alias`) VALUES
(1, 'Обычный пользователь', 0, 'default'),
(2, 'Менеджер', 1, 'manager');

-- --------------------------------------------------------

--
-- Структура таблицы `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
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
  `main_warehouse` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `warehouse`
--

INSERT INTO `warehouse` (`id`, `name`, `state_id`, `city`, `warehouse_article`, `region_code`, `warehouse_index`, `address`, `email`, `coordinate_long`, `coordinate_latitude`, `license_number`, `enterprise_id`, `official_registration`, `responsible_person`, `phone`, `hotline_phone`, `tax_summ`, `notice`, `main_warehouse`) VALUES
(1, 'Walter E nelson', 48, 'Kent', '#12121', '', '98032', '7915 S. 184th St, BLD C', NULL, '', '', 'license', '', '0', 'Wendy Steiner', '(253) 893-1909', '', 11.12, '', '1'),
(2, 'warehouse_1_1', 1, 'warehouse_article', 'warehouse_article', 'warehouse_article', 'warehouse_article', 'add', NULL, 'coooooo', 'cvcvcv', 'lilil', '', '1', 'fgfgfg', '56565656', '5665656', 20.1, 'dfdfdfdfdfdfdf', '0'),
(3, 'warehouse_2', 5, 'sdsd', 'sdsd', 'sdsd', 'sdsd', 'sdsd', NULL, 'sdsd', 'sssssss', '343434', 'ererdfd', '1', 'dfdf', 'dfdf', 'dfdf', 10, 'dddddddddddddd', '0'),
(4, 'warehouse_3', 5, 'sdsd', 'sdsd', 'sdsd', 'sdsd', 'sdsd', NULL, 'sdsd', 'sssssss', '343434', 'ererdfd', '1', 'dfdf', 'dfdf', 'dfdf', 10, 'dddddddddddddd', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `watch_list`
--

CREATE TABLE `watch_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `watch_product_id` int(10) UNSIGNED NOT NULL,
  `watch_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `watch_ip` varchar(100) NOT NULL,
  `watch_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `watch_list`
--

INSERT INTO `watch_list` (`id`, `watch_product_id`, `watch_date`, `watch_ip`, `watch_id`) VALUES
(1, 13, '2017-11-02 07:15:44', '127.0.0.1', NULL),
(2, 14, '2017-11-02 07:19:53', '127.0.0.1', NULL),
(3, 6, '2017-10-03 18:38:31', '127.0.0.1', NULL),
(4, 1, '2017-12-12 03:20:19', '127.0.0.1', NULL),
(5, 4, '2017-10-03 07:02:56', '127.0.0.1', NULL),
(6, 2, '2017-12-12 00:59:24', '127.0.0.1', NULL),
(7, 11, '2018-01-17 07:19:28', '127.0.0.1', NULL),
(8, 41, '2017-10-07 07:29:27', '127.0.0.1', NULL),
(9, 10, '2017-12-08 14:06:51', '127.0.0.1', NULL),
(10, 12, '2017-10-30 03:11:31', '127.0.0.1', NULL),
(11, 29, '2017-10-07 20:52:01', '127.0.0.1', NULL),
(12, 21, '2017-12-10 17:14:56', '127.0.0.1', NULL),
(13, 30, '2017-10-30 20:16:06', '127.0.0.1', NULL),
(14, 5, '2017-10-08 21:12:30', '127.0.0.1', NULL),
(15, 3, '2017-11-29 00:07:53', '127.0.0.1', NULL),
(16, 18, '2017-10-08 21:55:04', '127.0.0.1', NULL),
(17, 17, '2017-10-09 00:22:38', '127.0.0.1', NULL),
(18, 15, '2018-01-15 02:24:41', '127.0.0.1', NULL),
(19, 20, '2017-11-28 12:56:19', '127.0.0.1', NULL),
(20, 60, '2017-11-02 07:15:50', '127.0.0.1', NULL),
(21, 57, '2017-12-10 17:55:12', '127.0.0.1', NULL),
(22, 2, '2017-12-12 00:59:24', '188.163.87.158', NULL),
(23, 59, '2017-11-07 20:25:53', '193.111.156.142', NULL),
(24, 10, '2017-12-08 14:06:51', '46.160.71.23', NULL),
(25, 17, '2017-11-08 01:57:34', '46.160.71.23', NULL),
(26, 58, '2017-12-12 02:45:57', '193.111.156.142', NULL),
(27, 11, '2018-01-17 07:19:28', '174.127.133.49', NULL),
(28, 16, '2017-11-14 02:31:45', '174.127.133.49', NULL),
(29, 17, '2017-11-14 13:38:03', '37.204.156.184', NULL),
(30, 2, '2017-12-12 00:59:24', '193.111.156.142', NULL),
(31, 18, '2017-11-15 23:41:09', '193.111.156.142', NULL),
(32, 11, '2018-01-17 07:19:28', '193.111.156.142', NULL),
(33, 58, '2017-12-12 02:45:57', '127.0.0.1', NULL),
(34, 24, '2017-12-10 17:14:12', '127.0.0.1', NULL),
(35, 23, '2017-11-27 07:46:03', '127.0.0.1', NULL),
(36, 28, '2017-11-27 07:59:48', '127.0.0.1', NULL),
(37, 26, '2017-11-29 06:17:59', '127.0.0.1', NULL),
(38, 61, '2017-12-12 03:19:08', '127.0.0.1', NULL),
(39, 1, '2017-12-12 03:20:19', '193.111.156.142', NULL),
(40, 61, '2017-12-12 03:19:08', '193.111.156.142', NULL),
(41, 61, '2017-12-20 20:55:42', '174.127.133.58', NULL),
(42, 17, '2017-12-27 21:57:13', '176.193.145.30', NULL),
(43, 15, '2018-01-15 02:24:41', '193.111.156.142', NULL),
(44, 61, '2018-01-04 20:53:31', '174.127.133.105', NULL),
(45, 63, '2018-02-19 05:05:39', '193.111.156.142', NULL),
(46, 62, '2018-09-04 12:48:35', '193.111.156.142', NULL),
(47, 62, '2018-09-04 12:48:35', '188.163.86.188', NULL),
(48, 62, '2018-09-04 12:48:35', '138.197.183.207', NULL),
(49, 62, '2018-09-04 12:48:35', '73.169.211.60', NULL),
(50, 66, '2018-01-25 11:58:17', '73.169.211.60', NULL),
(51, 67, '2018-01-25 11:55:58', '73.169.211.60', NULL),
(52, 68, '2018-01-25 12:18:19', '73.169.211.60', NULL),
(53, 69, '2018-01-25 12:24:36', '73.169.211.60', NULL),
(54, 71, '2018-09-05 08:39:14', '73.169.211.60', NULL),
(55, 72, '2018-01-25 13:42:43', '73.169.211.60', NULL),
(56, 73, '2018-02-10 01:07:45', '73.169.211.60', NULL),
(57, 74, '2018-02-15 09:17:40', '73.169.211.60', NULL),
(58, 75, '2018-08-23 08:30:13', '73.169.211.60', NULL),
(59, 76, '2018-09-04 06:23:05', '73.169.211.60', NULL),
(60, 79, '2018-01-26 06:27:43', '73.169.211.60', NULL),
(61, 80, '2018-02-10 01:13:30', '73.169.211.60', NULL),
(62, 68, '2018-01-25 20:01:26', '91.217.101.202', NULL),
(63, 71, '2018-09-05 08:39:14', '91.217.101.202', NULL),
(64, 80, '2018-02-10 01:13:30', '91.217.101.202', NULL),
(65, 76, '2018-09-04 06:23:05', '91.217.101.202', NULL),
(66, 79, '2018-01-26 06:27:43', '193.111.156.142', NULL),
(67, 66, '2018-01-26 05:55:33', '193.111.156.142', NULL),
(68, 73, '2018-02-10 01:07:45', '188.163.86.188', NULL),
(69, 68, '2018-01-26 08:22:20', '188.163.86.188', NULL),
(70, 78, '2018-03-04 16:45:01', '188.163.86.188', NULL),
(71, 74, '2018-02-15 09:17:40', '188.163.86.188', NULL),
(72, 79, '2018-01-27 15:15:18', '188.163.87.216', NULL),
(73, 75, '2018-08-23 08:30:13', '188.163.87.216', NULL),
(74, 82, '2018-01-27 17:08:26', '73.169.211.60', NULL),
(75, 82, '2018-01-27 23:52:56', '188.163.87.216', NULL),
(76, 83, '2018-03-05 16:38:12', '73.169.211.60', NULL),
(77, 84, '2018-01-28 08:49:34', '73.169.211.60', NULL),
(78, 85, '2018-01-28 00:42:30', '73.169.211.60', NULL),
(79, 86, '2018-03-04 18:14:04', '73.169.211.60', NULL),
(80, 71, '2018-09-05 08:39:14', '188.163.87.216', NULL),
(81, 88, '2018-09-13 11:08:51', '188.163.87.216', NULL),
(82, 89, '2018-09-13 11:07:56', '73.169.211.60', NULL),
(83, 88, '2018-09-13 11:08:51', '73.169.211.60', NULL),
(84, 87, '2018-01-28 01:59:19', '73.169.211.60', NULL),
(85, 89, '2018-09-13 11:07:56', '188.163.87.216', NULL),
(86, 84, '2018-01-28 08:49:34', '188.163.87.216', NULL),
(87, 77, '2018-09-12 12:28:42', '193.111.156.142', NULL),
(88, 74, '2018-02-15 09:17:40', '188.163.87.216', NULL),
(89, 83, '2018-03-05 16:38:12', '188.163.87.216', NULL),
(90, 70, '2018-01-30 10:48:57', '188.163.87.216', NULL),
(91, 85, '2018-01-30 10:09:30', '188.163.87.216', NULL),
(92, 78, '2018-03-04 16:45:01', '188.163.87.216', NULL),
(93, 72, '2018-01-30 17:11:15', '174.127.133.71', NULL),
(94, 70, '2018-01-30 17:18:03', '174.127.133.74', NULL),
(95, 75, '2018-08-23 08:30:13', '174.127.133.72', NULL),
(96, 62, '2018-09-04 12:48:35', '46.101.232.242', NULL),
(97, 68, '2018-02-02 03:44:41', '46.101.232.242', NULL),
(98, 79, '2018-02-02 06:32:49', '188.163.86.188', NULL),
(99, 77, '2018-09-12 12:28:42', '188.163.86.188', NULL),
(100, 62, '2018-09-04 12:48:35', '188.163.87.216', NULL),
(101, 80, '2018-02-10 01:13:30', '188.163.84.243', NULL),
(102, 74, '2018-02-15 09:17:40', '188.163.84.243', NULL),
(103, 62, '2018-09-04 12:48:35', '188.163.84.243', NULL),
(104, 73, '2018-02-10 01:07:45', '46.160.71.23', NULL),
(105, 68, '2018-02-10 01:05:48', '46.160.71.23', NULL),
(106, 88, '2018-09-13 11:08:51', '188.163.84.243', NULL),
(107, 78, '2018-03-04 16:45:01', '188.163.84.243', NULL),
(108, 75, '2018-08-23 08:30:13', '174.127.133.79', NULL),
(109, 89, '2018-09-13 11:07:56', '174.127.133.85', NULL),
(110, 71, '2018-09-05 08:39:14', '174.127.133.85', NULL),
(111, 62, '2018-09-04 12:48:35', '174.127.133.80', NULL),
(112, 72, '2018-02-12 18:24:10', '174.127.133.85', NULL),
(113, 70, '2018-02-12 18:28:35', '174.127.133.85', NULL),
(114, 70, '2018-02-14 13:59:57', '188.163.84.243', NULL),
(115, 71, '2018-09-05 08:39:14', '188.163.84.243', NULL),
(116, 77, '2018-09-12 12:28:42', '46.160.71.23', NULL),
(117, 75, '2018-08-23 08:30:13', '38.100.21.68', NULL),
(118, 62, '2018-09-04 12:48:35', '38.100.21.68', NULL),
(119, 71, '2018-09-05 08:39:14', '38.100.21.68', NULL),
(120, 82, '2018-02-18 12:34:15', '188.163.84.243', NULL),
(121, 75, '2018-08-23 08:30:13', '193.111.156.142', NULL),
(122, 71, '2018-09-05 08:39:14', '193.111.156.142', NULL),
(123, 71, '2018-09-05 08:39:14', '66.220.152.139', NULL),
(124, 77, '2018-09-12 12:28:42', '188.163.84.243', NULL),
(125, 75, '2018-08-23 08:30:13', '174.127.133.47', NULL),
(126, 89, '2018-09-13 11:07:56', '174.127.133.48', NULL),
(127, 72, '2018-02-20 18:00:22', '174.127.133.50', NULL),
(128, 70, '2018-02-20 18:04:28', '174.127.133.48', NULL),
(129, 62, '2018-09-04 12:48:35', '66.192.178.200', NULL),
(130, 62, '2018-09-04 12:48:35', '158.69.228.14', NULL),
(131, 66, '2018-02-22 10:32:55', '192.99.66.39', NULL),
(132, 71, '2018-09-05 08:39:14', '192.99.66.39', NULL),
(133, 74, '2018-02-26 14:30:42', '193.178.228.212', NULL),
(134, 76, '2018-09-04 06:23:05', '193.178.228.212', NULL),
(135, 62, '2018-09-04 12:48:35', '193.178.228.212', NULL),
(136, 75, '2018-08-23 08:30:13', '174.127.133.31', NULL),
(137, 89, '2018-09-13 11:07:56', '174.127.133.31', NULL),
(138, 71, '2018-09-05 08:39:14', '174.127.133.30', NULL),
(139, 71, '2018-09-05 08:39:14', '174.127.133.62', NULL),
(140, 72, '2018-02-26 16:39:56', '174.127.133.62', NULL),
(141, 70, '2018-02-26 16:44:39', '174.127.133.62', NULL),
(142, 86, '2018-03-04 18:14:04', '174.127.133.26', NULL),
(143, 78, '2018-03-04 16:45:01', '174.127.133.26', NULL),
(144, 78, '2018-03-04 16:45:01', '127.0.0.1', NULL),
(145, 88, '2018-09-13 11:08:51', '127.0.0.1', NULL),
(146, 69, '2018-03-04 16:17:02', '127.0.0.1', NULL),
(147, 86, '2018-03-04 18:14:04', '127.0.0.1', NULL),
(148, 83, '2018-03-05 16:38:12', '127.0.0.1', NULL),
(149, 89, '2018-09-13 11:07:56', '127.0.0.1', NULL),
(150, 75, '2018-08-23 08:30:13', '127.0.0.1', NULL),
(151, 77, '2018-09-12 12:28:42', '127.0.0.1', NULL),
(152, 84, '2018-03-12 21:00:35', '127.0.0.1', NULL),
(153, 94, '2018-09-04 12:50:25', '127.0.0.1', NULL),
(154, 71, '2018-09-05 08:39:14', '127.0.0.1', NULL),
(155, 62, '2018-09-04 12:48:35', '127.0.0.1', NULL),
(156, 68, '2018-08-27 12:25:10', '127.0.0.1', NULL),
(157, 76, '2018-09-04 06:23:05', '127.0.0.1', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `default` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wishlist`
--

INSERT INTO `wishlist` (`id`, `title`, `user_id`, `created_add`, `default`) VALUES
(113, 'Список 1а', 47, '2017-08-02 14:03:49', 0),
(114, 'тестинг', 51, '2017-08-08 02:26:41', 0),
(115, 'rrrrrrrr', 47, '2017-10-07 09:06:10', 0),
(116, 'rtrt', 47, '2017-10-07 09:07:49', 0),
(117, 'fffffff', 47, '2017-10-07 09:14:34', 0),
(118, 'vvvvv', 47, '2017-10-07 09:17:35', 0),
(119, 'test', 47, '2017-10-07 19:51:27', 0),
(120, 'trr', 70, '2017-10-08 18:46:43', 0),
(121, 'qqq', 70, '2017-10-08 20:25:30', 0),
(125, 'testing', 71, '2017-10-30 19:59:42', 0),
(126, 'testing', 49, '2017-11-29 01:12:14', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wish_users`
--

CREATE TABLE `wish_users` (
  `id` int(11) NOT NULL,
  `wish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wish_users`
--

INSERT INTO `wish_users` (`id`, `wish_id`, `user_id`, `product_id`, `created_add`) VALUES
(1, 115, 47, 10, '2017-10-07 09:06:10'),
(2, 116, 47, 1, '2017-10-07 09:07:49'),
(4, 118, 47, 14, '2017-10-07 09:17:35'),
(5, 118, 47, 13, '2017-10-07 10:03:18'),
(6, 115, 47, 11, '2017-10-07 10:13:53'),
(8, 118, 47, 29, '2017-10-07 10:29:13'),
(9, 113, 47, 21, '2017-10-07 10:38:05'),
(10, 119, 47, 15, '2017-10-07 19:51:27'),
(11, 119, 47, 30, '2017-10-07 19:52:59'),
(12, 120, 70, 10, '2017-10-08 18:46:43'),
(13, 121, 70, 14, '2017-10-08 20:25:30'),
(15, 120, 70, 13, '2017-10-08 20:55:27'),
(16, 121, 70, 11, '2017-10-08 23:24:07'),
(20, 125, 71, 15, '2017-10-30 19:59:42'),
(21, 125, 71, 10, '2017-11-02 05:43:46'),
(22, 125, 71, 11, '2017-11-02 23:07:17'),
(30, 126, 49, 26, '2017-11-29 05:55:31'),
(31, 126, 49, 2, '2017-11-29 05:55:37'),
(32, 125, 71, 58, '2018-01-08 09:06:37'),
(33, 125, 71, 89, '2018-01-31 00:49:23');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `additional_attribute`
--
ALTER TABLE `additional_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `additions_products`
--
ALTER TABLE `additions_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `availability_products`
--
ALTER TABLE `availability_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments_votes`
--
ALTER TABLE `comments_votes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fealtures`
--
ALTER TABLE `fealtures`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_admin`
--
ALTER TABLE `menu_admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_office`
--
ALTER TABLE `menu_office`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `models_product`
--
ALTER TABLE `models_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modification`
--
ALTER TABLE `modification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items_paypal`
--
ALTER TABLE `order_items_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_processing`
--
ALTER TABLE `order_processing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Индексы таблицы `pages_section`
--
ALTER TABLE `pages_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Индексы таблицы `pay_form`
--
ALTER TABLE `pay_form`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prod_info_rating`
--
ALTER TABLE `prod_info_rating`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `prod_rating`
--
ALTER TABLE `prod_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Индексы таблицы `related_assingment`
--
ALTER TABLE `related_assingment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `related_аdditions`
--
ALTER TABLE `related_аdditions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_states_products`
--
ALTER TABLE `rel_states_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_suppliers_products`
--
ALTER TABLE `rel_suppliers_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_upsell_prod`
--
ALTER TABLE `rel_upsell_prod`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rel_warehouse_product`
--
ALTER TABLE `rel_warehouse_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings_slider`
--
ALTER TABLE `settings_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings_statictext`
--
ALTER TABLE `settings_statictext`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `special_mark`
--
ALTER TABLE `special_mark`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscription_goods`
--
ALTER TABLE `subscription_goods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Индексы таблицы `team_admin_access`
--
ALTER TABLE `team_admin_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `team_admin_users`
--
ALTER TABLE `team_admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `upsell`
--
ALTER TABLE `upsell`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_group`
--
ALTER TABLE `users_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `watch_list`
--
ALTER TABLE `watch_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `wish_users`
--
ALTER TABLE `wish_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `additional_attribute`
--
ALTER TABLE `additional_attribute`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `additions_products`
--
ALTER TABLE `additions_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `availability_products`
--
ALTER TABLE `availability_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `comments_votes`
--
ALTER TABLE `comments_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `fealtures`
--
ALTER TABLE `fealtures`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu_admin`
--
ALTER TABLE `menu_admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `menu_office`
--
ALTER TABLE `menu_office`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `models_product`
--
ALTER TABLE `models_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `modification`
--
ALTER TABLE `modification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `order_items_paypal`
--
ALTER TABLE `order_items_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `order_processing`
--
ALTER TABLE `order_processing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `pages_section`
--
ALTER TABLE `pages_section`
  MODIFY `section_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pay_form`
--
ALTER TABLE `pay_form`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT для таблицы `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `prod_info_rating`
--
ALTER TABLE `prod_info_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `prod_rating`
--
ALTER TABLE `prod_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `related_assingment`
--
ALTER TABLE `related_assingment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `related_аdditions`
--
ALTER TABLE `related_аdditions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `rel_states_products`
--
ALTER TABLE `rel_states_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rel_suppliers_products`
--
ALTER TABLE `rel_suppliers_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `rel_upsell_prod`
--
ALTER TABLE `rel_upsell_prod`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rel_warehouse_product`
--
ALTER TABLE `rel_warehouse_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `settings_slider`
--
ALTER TABLE `settings_slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `settings_statictext`
--
ALTER TABLE `settings_statictext`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `special_mark`
--
ALTER TABLE `special_mark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `subscription_goods`
--
ALTER TABLE `subscription_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `team_admin_access`
--
ALTER TABLE `team_admin_access`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `team_admin_users`
--
ALTER TABLE `team_admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `upsell`
--
ALTER TABLE `upsell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `users_group`
--
ALTER TABLE `users_group`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `watch_list`
--
ALTER TABLE `watch_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT для таблицы `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `wish_users`
--
ALTER TABLE `wish_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
