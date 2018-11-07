-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: zupplyboxcom.ipagemysql.com    Database: webene00_zb_test
-- ------------------------------------------------------
-- Server version	5.6.37-82.2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_attribute`
--

DROP TABLE IF EXISTS `additional_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_attribute` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_attribute`
--

LOCK TABLES `additional_attribute` WRITE;
/*!40000 ALTER TABLE `additional_attribute` DISABLE KEYS */;
INSERT INTO `additional_attribute` VALUES (1,'Text','text'),(2,'Textarea','textarea'),(3,'Number','number'),(4,'Radio','radio'),(5,'Checkbox','checkbox'),(6,'Link','link');
/*!40000 ALTER TABLE `additional_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additions_products`
--

DROP TABLE IF EXISTS `additions_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additions_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `related_additions_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additions_products`
--

LOCK TABLES `additions_products` WRITE;
/*!40000 ALTER TABLE `additions_products` DISABLE KEYS */;
INSERT INTO `additions_products` VALUES (1,13,12),(2,13,11);
/*!40000 ALTER TABLE `additions_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_product`
--

DROP TABLE IF EXISTS `attribute_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_product`
--

LOCK TABLES `attribute_product` WRITE;
/*!40000 ALTER TABLE `attribute_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_value`
--

DROP TABLE IF EXISTS `attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value` (
  `attribute_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value`
--

LOCK TABLES `attribute_value` WRITE;
/*!40000 ALTER TABLE `attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability_products`
--

DROP TABLE IF EXISTS `availability_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability_products`
--

LOCK TABLES `availability_products` WRITE;
/*!40000 ALTER TABLE `availability_products` DISABLE KEYS */;
INSERT INTO `availability_products` VALUES (1,'published','published'),(2,'archive','archive'),(3,'coming soon','coming_soon'),(4,'sold out','sold_out'),(5,'Do not display','do_not_display');
/*!40000 ALTER TABLE `availability_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonuses`
--

DROP TABLE IF EXISTS `bonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `action` tinyint(2) NOT NULL DEFAULT '0',
  `sum` int(10) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonuses`
--

LOCK TABLES `bonuses` WRITE;
/*!40000 ALTER TABLE `bonuses` DISABLE KEYS */;
INSERT INTO `bonuses` VALUES (1,'E-burpy','2017-07-07 00:00:00','2018-06-07 00:00:00',1,100);
/*!40000 ALTER TABLE `bonuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id_product` int(11) NOT NULL,
  `additions_for_cart_id` varchar(255) DEFAULT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  `cart_warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (97,2,'',251,1,0,'2017-07-21 22:49:01','188.163.86.171',NULL),(108,15,NULL,250,1,0,'2017-11-08 02:11:28','193.111.156.141',NULL),(109,10,NULL,250,1,0,'2017-11-08 11:56:54','46.160.71.23',NULL),(110,17,NULL,250,1,0,'2017-11-08 11:57:37','46.160.71.23',NULL),(111,58,NULL,56,4,0,'2017-12-11 02:11:48','127.0.0.1',NULL),(112,61,NULL,444444,1,0,'2017-12-11 02:35:42','127.0.0.1',NULL),(115,58,NULL,56,1,0,'2018-01-06 12:43:40','188.163.86.188',NULL),(124,15,NULL,250,1,0,'2018-01-07 03:51:33','188.163.86.188',NULL),(125,15,NULL,250,90,0,'2018-01-17 12:11:17','193.111.156.142',NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'PAPER PRODUCT','category_al_1','011218_URyMwsirj.jpg','Toilet tissue, paper towels, facial tissue e.t.c.','paper product','paper towels, toilet tissue','[{\"additionaltext_label\":\"xcxcx\",\"id_val\":\"\",\"position_val\":\"\",\"type_val\":\"text\",\"description_val\":\"\",\"init_id\":1511229936},{\"additionaltext_label\":\"sdsd\",\"id_val\":\"fderfdf\",\"position_val\":\"10\",\"type_val\":\"number\",\"description_val\":\"\",\"init_id\":1511262680},{\"additionaltext_label\":\"kjkj\",\"id_val\":\"ghghghg\",\"position_val\":\"54\",\"type_val\":\"radio\",\"description_val\":\"\",\"init_id\":1511262695},{\"additionaltext_label\":\"kjkj\",\"id_val\":\"jjjh\",\"position_val\":\"uy\",\"type_val\":\"link\",\"description_val\":\"\",\"init_id\":1511262707}]','1'),(2,0,'GLOVES','category_2','110717_JlpsQI24y.jpg','\r\nANY KIND OF GLOVES FOR YOU NEEDS','gloves','Gloves, nitrile gloves, latex gloves',NULL,'1'),(3,0,'PACKAGING','category_3','011218_V2H9U3GTI.jpg','\r\nProduct for your mailroom needs; boxes, envelopes, bubbles, e.t.c.','m_description_text','BOXES, PACKAGING',NULL,'1'),(4,0,'BREAK  ROOM','category_4','011218_2yFraezYN.jpg','All your break room or kitchenette needs; plates, cups cutlery.','m_description_text','',NULL,'1'),(5,0,'LINERS','category_5','011218_DHRyqHLai.jpg','We have a big variety of can liners; low density, high density, biodegradable and more.','m_description_text','can liners',NULL,'1'),(6,0,'SKIN CARE','category_6','110717_1strbgmUz.jpg','THIS CATEGORY FOR SOAP AND HAND SANITIZERS. BIG VARIETY OF   SOAP, FOAM SOAP WITH MOISTURIZERS, ANTIBACTERIAL, ANTIMICROBIAL, AND REGULAR ONES WITH FRAGRANCE OR FRAGRANCE-FREE.','SKIN CARE PRODUCT','SOAP, SANITIZERS',NULL,'1'),(7,0,'CLEANING TOOLS','category_7','011218_4RaRjTEJD.jpg','Righ tools for the job.','m_description_text','Cleaning tools, mops, bucket, brushes',NULL,'1'),(8,0,'CHEMICALS','category_8','011218_RHwjRNbuY.jpg','Cleaning solution to make you job easy','Cleaning solution','',NULL,'1'),(9,1,'Функциональные конструкция_1','funktsionalnye-konstruktsiya1','thumb6.jpg','','m_description_text','','[{\"additionaltext_label\":\"sdsd\",\"id_val\":\"ghghghg\",\"position_val\":\"\",\"type_val\":\"text\",\"description_val\":\"\",\"init_id\":1511264093},{\"additionaltext_label\":\"dfdfdf\",\"id_val\":\"dfdf\",\"position_val\":\"\",\"type_val\":\"text\",\"description_val\":\"\",\"init_id\":1511264100},{\"additionaltext_label\":\"sdsd33\",\"id_val\":\"ghghghg\",\"position_val\":\"10\",\"type_val\":\"number\",\"description_val\":\"xxxxxxxxxxxxxxxxx\",\"init_id\":1511264569}]','0'),(10,2,'Хранение_1','hranenie1','thumb6.jpg','','m_description_text','',NULL,'0'),(11,3,'Бокс и единоборства_1','box1','thumb6.jpg','','m_description_text','',NULL,'0'),(12,1,'Силовое оборудование_1','silovoe-oborudovanie1','110717_NfOeJIfjQ.png','fdfdfdf','m_description_text','',NULL,'0'),(13,5,'Функциональное оборудование_1','','thumb6.jpg','','m_description_text','',NULL,'1'),(14,7,'Аксессуары_1','','thumb6.jpg','','m_description_text','',NULL,'1'),(15,8,'Спортивные добавки_1','','thumb6.jpg','','m_description_text','',NULL,'1'),(20,9,'category_1_1','category_1_1','thumb4.jpg','','m_description_text','',NULL,'0'),(24,20,'авава','avava-24','110717_1L6PYmZYb.png','fdfdfdf','dfdfdf','dfdf',NULL,'0'),(25,24,'test','test','110717_IrFxCEnfX.png','uu','fgfgfg','fgfgfg','','1');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,0,'Иван','test@gmail.com','ntrcn',1,'good','bad','1',2,1,'2018-01-15 14:49:22',0),(2,1,'sun','email','comment text',1,'good','bad','1',2,1,'2017-12-11 21:27:08',1),(3,0,'Иван','test@gmail.com','ntrcn',1,'good','bad','1',2,0,'2017-12-11 21:10:31',0),(4,1,'asasa','SDZADsdzd@dsdsd.com','sdsdsdsdsd',1,'','','1',2,1,'2017-12-11 21:27:01',0),(5,1,'asasa','SDZADsdzd@dsdsd.com','sdsdsdsdsd',1,'','','1',2,0,'2017-12-11 21:11:17',0),(6,1,'asasa','SDZADsdzd@dsdsd.com','sdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:19:32',0),(7,1,'asasa','SDZADsdzd@dsdsd.com','sdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:19:36',0),(8,1,'asasa','SDZADsdzd@dsdsd.com','sdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:19:39',0),(9,6,'Roman','sdsdsdsdsd@sddsd.com','Комментарий',1,'','','1',0,0,'2017-07-21 14:19:42',0),(10,6,'Roman','sdsdsdsdsd@sddsd.com','Комментарий',1,'','','1',0,0,'2017-07-21 14:23:57',0),(11,1,'asasasasa','sasasasasas@asas.com','asasasdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:19:47',0),(12,1,'sdsdsdsdsdsds','sdsdsdsds@sadsd.com','sdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:19:51',0),(13,1,'sdsdsdsdsdsdsd','dssdsdd@sdsd.com','sdsdssdsdsdsdsdsd',1,'sdsds','dsd','1',0,0,'2017-07-21 14:24:01',0),(14,13,'dsdsdsd','sdsdsd@dsdsd.com','sdsdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:24:04',0),(15,12,'sdsd','sdsdsdsd@sds.com','sdsdsdsdsddsdsdsd',1,'sdsds','dsdsdsd','1',0,0,'2017-07-21 14:20:09',0),(16,1,'asasasas','asas@sdsd.coms','dsdsdsdsdsdsdsdsd',1,'','','1',0,0,'2017-07-21 14:24:07',0),(17,1,'sdsdsdsd','sdsds@sdsd.com','dsdsdsdsdvbvbvb',1,'','','1',0,0,'2017-07-21 14:20:07',0),(18,1,'wewewewewe','wewewe@dfdfd.com','wewewewewewewewewe',1,'','','1',0,0,'2017-07-21 14:24:11',0),(19,1,'wwewewewewe','wewewe@dfdfd.com','weweweweasasasas',1,'','','1',1,1,'2017-12-11 21:25:09',0),(20,2,'sdsdsdsds','wewewe@dfdfd.com','sdsdsdsdsddsdsdsd',1,'','sdsd','1',0,0,'2017-07-21 14:24:14',0),(21,0,'fgfgfgfgfg','gfgfgfg@fmfmf.com','fgfgfdfdfdfdfdfdfdf',1,'','','1',1,1,'2017-12-11 21:13:00',0),(22,0,'sdsdsdsd','sdsdsd@dsdsd.com','sdsdsdsdsdsdsdsdsd',3,'dsdsdsdsds','dsdsdsd','1',0,0,'2017-07-21 14:24:18',0),(23,22,'assaasasasa','asasasasas@sdsdsd.com','asasasassdsdsd',3,'sasasas','asasas','1',0,0,'2017-07-21 14:24:21',0),(24,23,'xzxzxzxzx','sdsds@sdsds.com','dsdsdxzxzxzxzx',3,'sdsdsdsdsd','sdsdsdsdsd','1',0,0,'2017-07-21 14:24:24',0),(25,0,'asasasas','wewewe@dfdfd.com','asasasasasasasasasas',3,'asasasa','sasasasas','1',0,0,'2017-07-21 14:19:56',0),(26,3,'вмвммвмвмв','admin@gmail.com','вмвмвмв',1,'good products. thanks','no bad','0',0,0,'2017-12-11 18:38:33',0),(27,3,'my test name','admin@gmail.com','thank you for website',1,'very good products','no bad','0',0,0,'2017-12-11 18:41:52',0),(28,2,'cvcvcvcv','email@gmail.com','vcvcvcvcvdfdfdf',1,'cvcv','cvc','0',0,0,'2017-12-11 18:54:56',0),(29,1,'xcxcxcxc','email@gmail.com','xcxcxcxcxc',1,'xc','cxc','0',0,0,'2017-12-11 19:21:34',0);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_votes`
--

DROP TABLE IF EXISTS `comments_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `comments_id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_votes`
--

LOCK TABLES `comments_votes` WRITE;
/*!40000 ALTER TABLE `comments_votes` DISABLE KEYS */;
INSERT INTO `comments_votes` VALUES (16,'127.0.0.1','WIN-QJF2VCB52DD',4,'2017-12-12'),(17,'127.0.0.1','WIN-QJF2VCB52DD',2,'2017-12-12'),(18,'127.0.0.1','agro',1,'2018-01-15');
/*!40000 ALTER TABLE `comments_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `position` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Доставка курьером','couriers',1),(2,'Самовывоз','self_delivery',2),(3,'По почте','per_post',3);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fealtures`
--

DROP TABLE IF EXISTS `fealtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fealtures` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `fealtures` tinyint(3) unsigned NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fealtures`
--

LOCK TABLES `fealtures` WRITE;
/*!40000 ALTER TABLE `fealtures` DISABLE KEYS */;
/*!40000 ALTER TABLE `fealtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_admin`
--

DROP TABLE IF EXISTS `menu_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_admin`
--

LOCK TABLES `menu_admin` WRITE;
/*!40000 ALTER TABLE `menu_admin` DISABLE KEYS */;
INSERT INTO `menu_admin` VALUES (1,'Home','home','empty','empty',1,0,'home','1'),(2,'Products','product-options','home','home home',2,0,'home','1'),(3,'Category','category-product-options','category-product-options','category-product-options',2,3,'','1'),(4,'Category Add','edit-category-product/new','edit-category-product','edit-category-product',4,0,'content_paste','0'),(5,'Product Add','add-product/new','description','keywords',5,3,'queue','0'),(6,'Warehouse','warehouse','','',5,0,'compare','1'),(7,'Warehouse Add','edit-warehouse/new','','',6,0,'queue','0'),(8,'Upsell','upsell','upsell options','upsell options',5,3,'local_mall','1'),(9,'Stock','stock','Stock options','Stock options',6,3,'local_play','1'),(10,'Orders','orders-options','orders options','orders options',8,0,'local_play','1'),(11,'Comments','comments','comments options','comments options',7,0,'local_play','0'),(12,'Users','users','users options','users options',7,0,'insert_emoticon','1'),(13,'Team','team','team options','team options',6,0,'insert_emoticon','1'),(14,'Pages','static-pages','Pages options','Pages options',9,0,'library_books','1'),(15,'Settings','settings','Settings options','Settings options',10,0,'settings','1'),(16,'CSV import','product-import','CSV import','CSV import',11,3,'play_for_work','1'),(17,'Product fields','category-fields','Product fields','Product fields',12,3,'settings_applications','1');
/*!40000 ALTER TABLE `menu_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_office`
--

DROP TABLE IF EXISTS `menu_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_office`
--

LOCK TABLES `menu_office` WRITE;
/*!40000 ALTER TABLE `menu_office` DISABLE KEYS */;
INSERT INTO `menu_office` VALUES (1,'Main','/profile','profile menu','profile menu',1,0,'fa fa-user'),(2,'Finance','#','finance desc','Ключевые фразы',2,0,'fa fa-user'),(3,'Orders','/orders','orders','Корзин пользователя - описание',3,0,'fa fa-user'),(4,'Wish list','/wish-list','wish list user','ключевые слова',4,0,'fa fa-user');
/*!40000 ALTER TABLE `menu_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models_product`
--

DROP TABLE IF EXISTS `models_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `old_price` float NOT NULL,
  `new_price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models_product`
--

LOCK TABLES `models_product` WRITE;
/*!40000 ALTER TABLE `models_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `models_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2017-07-06 00:00:00','2017-07-06 00:00:00',10,8555,0,'имя клиента','email','phone','address',1,1,0,'note'),(2,'2017-07-06 18:15:25','2017-07-06 18:15:25',10,8555,0,'имя клиента','email','phone','address',1,1,0,''),(3,'2017-07-06 18:28:40','2017-07-06 18:28:40',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(4,'2017-07-06 18:30:10','2017-07-06 18:30:10',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(5,'2017-07-06 18:31:27','2017-07-06 18:31:27',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(6,'2017-07-06 19:01:47','2017-07-06 19:01:47',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(7,'2017-07-06 19:03:17','2017-07-06 19:03:17',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(8,'2017-07-06 19:04:20','2017-07-06 19:04:20',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(9,'2017-07-06 19:06:47','2017-07-06 19:06:47',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(10,'2017-07-06 19:08:08','2017-07-06 19:08:08',15,16772,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(11,'2017-07-06 19:08:36','2017-07-06 19:08:36',12,3024,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(12,'2017-07-06 19:09:42','2017-07-06 19:09:42',12,3024,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(13,'2017-07-06 19:11:43','2017-07-06 19:11:43',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(14,'2017-07-06 19:12:45','2017-07-06 19:12:45',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(15,'2017-07-06 19:12:59','2017-07-06 19:12:59',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(16,'2017-07-06 19:50:40','2017-07-06 19:50:40',16,4027,0,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf'),(17,'2017-07-06 19:52:35','2017-07-06 19:52:35',16,4027,0,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf'),(18,'2017-07-06 19:57:29','2017-07-06 19:57:29',16,4027,0,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf'),(19,'2017-07-06 20:00:38','2017-07-06 20:00:38',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(20,'2017-07-06 20:00:44','2017-07-06 20:00:44',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(21,'2017-07-06 20:18:25','2017-07-06 20:18:25',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(22,'2017-07-06 20:18:47','2017-07-06 20:18:47',16,4027,0,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(23,'2017-07-06 20:19:19','2017-07-06 20:19:19',16,4027,0,'Иванович','pudzia009@gmail.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,''),(24,'2017-07-07 11:29:00','2017-07-07 11:29:00',23,9032,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(25,'2017-07-07 11:32:09','2017-07-07 11:32:09',23,9032,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(26,'2017-07-07 13:02:10','2017-07-07 13:02:10',23,9032,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(27,'2017-07-07 14:05:43','2017-07-07 14:05:43',23,9032,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(28,'2017-07-07 14:41:08','2017-07-07 14:41:08',23,9032,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(29,'2017-07-07 14:42:45','2017-07-07 14:42:45',1,251,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(30,'2017-07-07 15:27:50','2017-07-07 15:27:50',1,251,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(31,'2017-07-07 15:33:35','2017-07-07 15:33:35',2,503,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(32,'2017-07-07 15:37:00','2017-07-07 15:37:00',1,252,0,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,''),(33,'2017-07-18 15:16:06','2017-07-18 15:16:06',1,252,0,'admin','pudzia009@gmail.com','+38(021) 212-12-12,+38(021) 212-12-12','долодлолдололо',3,1,0,''),(34,'2017-07-21 13:58:05','2017-07-21 13:58:05',1,250,0,'sxsxs','freeitteam1000@gmail.com','+38(222) 222-22-22,+38(222) 222-22-22','asasasasaasasasas',3,1,0,'sasasasasasasas');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(10) NOT NULL,
  `sum_item` float NOT NULL,
  `article_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (51,28,3,'33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',252,13,3276,'article-12d-test'),(52,28,1,'111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',250,3,750,'article-12d-test'),(53,28,2,'222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',251,6,1506,'article-12d-test'),(54,28,5,'45541LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',3500,1,3500,'article-12d-test'),(55,29,2,'222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',251,1,251,'article-12d-test'),(56,30,2,'222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',251,1,251,'article-12d-test'),(57,31,3,'33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',252,1,252,'article-12d-test'),(58,31,2,'222LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',251,1,251,'article-12d-test'),(59,32,3,'33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',252,1,252,'article-12d-test'),(60,33,3,'33__LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',252,10,2520,'article-12d-test'),(61,34,1,'111LOREM IPSUM DOLOR SIT AMET CONSE CTETUR ADIPISICING ELIT, SED DO EIUSMOD(НАИМЕНОВАНИЕ ТОВАРА',250,1,250,'article-12d-test'),(62,35,10,'product-test_10',249.99,20,5000,''),(63,35,1,'Coffee stuff for Lovers_1',233.99,16,3744,''),(64,35,2,'Coffee stuff for Lovers_2',233.99,12,2808,''),(65,37,10,'product-test_10',249.99,1,250,'article'),(66,37,11,'product-test_11',249.99,1,250,'article'),(67,38,1,'Coffee stuff for Lovers_1',233.99,1,234,'#54d874'),(68,38,2,'Coffee stuff for Lovers_2',233.99,1,234,'#54d874'),(69,39,11,'product-test_11',249.99,4,1000,'article'),(70,39,2,'Coffee stuff for Lovers_2',233.99,7,1638,'#54d874'),(71,39,13,'product-test_13_13',249.99,3,750,'#21221'),(72,39,21,'product-test_21',249.99,2,500,'article'),(73,39,16,'product-test_16',249.99,10,2500,'article'),(74,40,20,'product-test_20',249.99,1,250,'article'),(75,41,20,'product-test_20',249.99,1,250,'article'),(76,42,24,'product-test_24',249.99,10,2499.9,'article'),(77,43,24,'product-test_24',249.99,1,250,'article'),(78,44,20,'product-test_20',249.99,1,250,'article'),(79,45,21,'product-test_21',249.99,1,250,'article'),(80,46,24,'product-test_24',249.99,1,250,'article'),(81,47,23,'product-test_23',249.99,1,250,'article'),(84,49,32,'product-test_32',249.99,10,2499.9,'article'),(86,49,34,'product-test_34',249.99,4,1000,'article'),(87,49,35,'product-test_35',249.99,10,2499.9,'article'),(88,50,24,'product-test_24',249.99,50,12499.5,'article'),(89,50,2,'Coffee stuff for Lovers_2',233.99,30,7019.7,'#54d874'),(90,50,27,'product-test_27',249.99,1,250,'article'),(91,50,20,'product-test_20',249.99,1,250,'article'),(92,50,21,'product-test_21',249.99,10,2500,'article'),(93,50,22,'product-test_22',249.99,1,250,'article'),(94,50,26,'product-test_26',249.99,1,250,'article'),(95,51,20,'product-test_20',249.99,1,250,'article'),(96,51,21,'product-test_21',249.99,1,250,'article'),(97,52,58,'ENMOTION ROLL TOWEL',55.55,1,56,'CZ89460'),(98,53,58,'ENMOTION ROLL TOWEL',55.55,1,55.55,'CZ89460');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items_paypal`
--

DROP TABLE IF EXISTS `order_items_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(5) NOT NULL,
  `gross_amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items_paypal`
--

LOCK TABLES `order_items_paypal` WRITE;
/*!40000 ALTER TABLE `order_items_paypal` DISABLE KEYS */;
INSERT INTO `order_items_paypal` VALUES (1,2,'58',1,55.55),(3,3,'58',1,55.55),(4,4,'58',1,55.55),(5,4,'15',1,249.99);
/*!40000 ALTER TABLE `order_items_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_processing`
--

DROP TABLE IF EXISTS `order_processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_processing`
--

LOCK TABLES `order_processing` WRITE;
/*!40000 ALTER TABLE `order_processing` DISABLE KEYS */;
INSERT INTO `order_processing` VALUES (3,49,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: created new qty:2','2017-12-03 18:22:57'),(9,49,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: created new qty:2','2017-12-03 18:22:57'),(12,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: ','2017-12-03 21:33:19'),(13,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: ','2017-12-03 21:33:46'),(14,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: ','2017-12-03 21:33:56'),(15,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: ','2017-12-03 21:40:47'),(16,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: ','2017-12-03 21:40:56'),(17,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: new status','2017-12-03 21:41:58'),(18,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: new status','2017-12-03 21:44:01'),(19,48,71,'Admin Admin','admin@gmail.com','Admin Admin(admin@gmail.com) activity: new status in2017-12-03 21:44:50','2017-12-03 21:44:50'),(23,48,71,'Admin Admin','admin@gmail.com','update qty from 12to 12','2017-12-03 22:33:51'),(25,48,71,'Admin Admin','admin@gmail.com','update qty from 12to 12','2017-12-03 22:38:04'),(26,48,71,'Admin Admin','admin@gmail.com','update qty from 12 to 80','2017-12-03 22:38:44'),(27,48,71,'Admin Admin','admin@gmail.com','ArrayArray update qty from 80 to 55','2017-12-03 22:40:02'),(28,48,71,'Admin Admin','admin@gmail.com','ArrayArray update qty from 55 to 55','2017-12-03 22:40:04'),(29,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 55 to 55','2017-12-03 22:40:30'),(30,48,71,'Admin Admin','admin@gmail.com','update qty from 55 to 10','2017-12-03 22:54:30'),(31,48,71,'Admin Admin','admin@gmail.com','update qty from 10 to 10','2017-12-03 22:56:45'),(32,48,71,'Admin Admin','admin@gmail.com','update qty from 10 to 10','2017-12-03 22:56:52'),(33,48,71,'Admin Admin','admin@gmail.com','update qty from 10 to 8','2017-12-03 23:00:46'),(34,48,71,'Admin Admin','admin@gmail.com','update qty from 8 to 8','2017-12-03 23:06:18'),(35,48,71,'Admin Admin','admin@gmail.com','update qty from 8 to 8','2017-12-03 23:08:10'),(36,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 8 to 80 2017-12-03 23:11:49','2017-12-03 23:11:49'),(37,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 80 to 80 2017-12-03 23:12:57','2017-12-03 23:12:57'),(38,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 80 to 77 2017-12-03 23:13:04','2017-12-03 23:13:04'),(39,48,71,'Admin Admin','admin@gmail.com','test test test','2017-12-03 23:31:40'),(40,48,71,'Admin Admin','admin@gmail.com','testsds  (comment: Admin Admin in 2017-12-03 23:35:50)','2017-12-03 23:35:50'),(41,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 77 to 0 2017-12-03 23:36:02','2017-12-03 23:36:02'),(42,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 0 to 40 2017-12-03 23:36:12','2017-12-03 23:36:12'),(43,48,71,'Admin Admin','admin@gmail.com','Admin Admin update status from  to  2017-12-03 23:53:43','2017-12-03 23:53:43'),(44,48,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Order has been sent to Order has been sent 2017-12-03 23:55:16','2017-12-03 23:55:16'),(45,48,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 40 to 40 2017-12-03 23:59:26','2017-12-03 23:59:26'),(46,48,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Delivered to Order is processed 2017-12-03 23:59:33','2017-12-03 23:59:33'),(47,48,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Order is processed to Cancelled 2017-12-03 23:59:41','2017-12-03 23:59:41'),(48,49,71,'Admin Admin','admin@gmail.com','Admin Admin product is removed (product-test_28) 2017-12-04 00:15:45','2017-12-04 00:15:45'),(49,49,71,'Admin Admin','admin@gmail.com','Admin Admin product is removed (product-test_33) 2017-12-04 00:16:04','2017-12-04 00:16:04'),(50,50,71,'Admin Admin','admin@gmail.com','gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:20)','2017-12-05 10:43:20'),(51,50,71,'Admin Admin','admin@gmail.com','gfgfgfgfgf (comment: Admin Admin in 2017-12-05 10:43:33)','2017-12-05 10:43:33'),(52,50,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 3 to 30 2017-12-05 10:43:42','2017-12-05 10:43:42'),(53,50,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Cancelled to Order has been sent 2017-12-05 10:43:51','2017-12-05 10:43:51'),(54,50,71,'Admin Admin','admin@gmail.com','dffdfdfdfdfdf (comment: Admin Admin in 2017-12-05 11:24:00)','2017-12-05 11:24:00'),(55,50,71,'Admin Admin','admin@gmail.com','fdf fdssxsdsd (comment: Admin Admin in 2017-12-05 11:30:42)','2017-12-05 11:30:42'),(56,33,71,'Admin Admin','admin@gmail.com','test_test (comment: Admin Admin in 2017-12-12 11:14:10)','2017-12-12 11:14:10'),(57,33,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Order is processed to Cancelled 2017-12-12 11:14:38','2017-12-12 11:14:38'),(58,33,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 1 to 10 2017-12-12 11:16:47','2017-12-12 11:16:47'),(59,52,71,'Admin Admin','admin@gmail.com','comment (comment: Admin Admin in 2017-12-12 11:18:07)','2017-12-12 11:18:07'),(60,53,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 1 to 10 2018-01-15 10:56:15','2018-01-15 10:56:15'),(61,53,71,'Admin Admin','admin@gmail.com','Admin Admin update status from Unprocessed to Unprocessed 2018-01-17 03:12:37','2018-01-17 03:12:37'),(62,53,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 10 to 11 2018-01-17 06:37:14','2018-01-17 06:37:14'),(63,53,71,'Admin Admin','admin@gmail.com','Admin Admin update qty from 11 to 1 2018-01-17 06:37:25','2018-01-17 06:37:25'),(64,53,71,'Admin Admin','admin@gmail.com','test comment\r\n (comment: Admin Admin in 2018-01-17 06:37:39)','2018-01-17 06:37:39');
/*!40000 ALTER TABLE `order_processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `param_status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Order is processed','processed',1),(2,'Order has been sent','sent',2),(3,'Delivered','delivered',3),(4,'Unprocessed','unprocessed',0),(5,'Cancelled','cancelled',4);
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `delivery` tinyint(2) NOT NULL,
  `type_pay` tinyint(2) NOT NULL,
  `pay` tinyint(2) NOT NULL,
  `note` text NOT NULL,
  `team_admin_users_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-07-06 00:00:00','2017-07-06 00:00:00',10,8555,1,'имя клиента','email','phone','address',1,1,0,'note',1,0),(2,'2017-07-06 18:15:25','2017-07-06 18:15:25',10,8555,1,'имя клиента','email','phone','address',1,1,0,'',1,0),(3,'2017-07-06 18:28:40','2017-07-06 18:28:40',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(4,'2017-07-06 18:30:10','2017-07-06 18:30:10',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(5,'2017-07-06 18:31:27','2017-07-06 18:31:27',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(6,'2017-07-06 19:01:47','2017-07-06 19:01:47',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(7,'2017-07-06 19:03:17','2017-07-06 19:03:17',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(8,'2017-07-06 19:04:20','2017-07-06 19:04:20',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(9,'2017-07-06 19:06:47','2017-07-06 19:06:47',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(10,'2017-07-06 19:08:08','2017-07-06 19:08:08',15,16772,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(11,'2017-07-06 19:08:36','2017-07-06 19:08:36',12,3024,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(12,'2017-07-06 19:09:42','2017-07-06 19:09:42',12,3024,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(13,'2017-07-06 19:11:43','2017-07-06 19:11:43',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(14,'2017-07-06 19:12:45','2017-07-06 19:12:45',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(15,'2017-07-06 19:12:59','2017-07-06 19:12:59',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(16,'2017-07-06 19:50:40','2017-07-06 19:50:40',16,4027,1,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf',1,0),(17,'2017-07-06 19:52:35','2017-07-06 19:52:35',16,4027,1,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf',1,0),(18,'2017-07-06 19:57:29','2017-07-06 19:57:29',16,4027,1,'dfdfdfdfdfdf','pudzia009@gmail.com','+38(665) 656-56-65','dfdfdfdfdfdf',2,1,0,'dfdfdfdf',1,0),(19,'2017-07-06 20:00:38','2017-07-06 20:00:38',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(20,'2017-07-06 20:00:44','2017-07-06 20:00:44',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(21,'2017-07-06 20:18:25','2017-07-06 20:18:25',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(22,'2017-07-06 20:18:47','2017-07-06 20:18:47',16,4027,1,'Иванович','sdsdsd@ssdd.com','+38(999) 999-99-99,+38(999) 999-99-99','вавававававава',2,2,0,'',1,0),(28,'2017-07-07 14:41:08','2017-07-07 14:41:08',23,9032,1,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,'',1,0),(29,'2017-07-07 14:42:45','2017-07-07 14:42:45',1,251,1,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,'',1,0),(30,'2017-07-07 15:27:50','2017-07-07 15:27:50',1,251,1,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,'',1,0),(31,'2017-07-07 15:33:35','2017-07-07 15:33:35',2,503,1,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,'',1,0),(32,'2017-07-07 15:37:00','2017-12-02 13:05:04',1,252,3,'admin','pudzia009@gmail.com','+38(545) 454-54-54','njhihuhuhuuhuhuhu',2,2,0,'',1,0),(33,'2017-07-18 15:16:06','2017-07-18 15:16:06',1,252,1,'admin','pudzia009@gmail.com','+38(021) 212-12-12,+38(021) 212-12-12','долодлолдололо',3,1,0,'',1,0),(34,'2017-07-21 13:58:05','2017-07-21 13:58:05',1,250,1,'sxsxs','freeitteam1000@gmail.com','+38(222) 222-22-22,+38(222) 222-22-22','asasasasaasasasas',3,1,0,'sasasasasasasas',1,0),(35,'2017-10-19 15:55:39','2017-10-19 15:55:39',48,11551.5,1,'Иванович','freeitteam1000@gmail.com','+380678478947','xxxx',3,2,0,'',1,0),(36,'2017-10-20 03:42:55','2017-10-20 03:42:55',48,11551.5,1,'Иванович','freeitteam1000@gmail.com','+380678478947','xxxx',3,1,0,'',1,0),(37,'2017-10-20 03:46:03','2017-10-20 03:46:03',2,499.98,1,'Иванович','freeitteam1000@gmail.com','+380678478947','xxxx',3,2,0,'',1,0),(38,'2017-10-20 04:22:10','2017-10-20 04:22:10',2,467.98,1,'Иванович','freeitteam1000@gmail.com','+380678478947','xxxx',1,4,0,'',1,0),(39,'2017-11-27 14:51:58','2017-11-27 14:51:58',26,6387.74,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,1,0,';l;l;l;',1,0),(40,'2017-11-27 15:59:33','2017-11-27 15:59:33',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,4,0,';l;l;l;',1,0),(41,'2017-11-27 16:10:02','2017-11-27 16:10:02',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',3,4,0,'fsfsdfsdfsdf',1,0),(42,'2017-11-27 16:11:51','2017-12-02 13:04:21',10,2499.9,2,'уыв','freeitgroupe@gmail.com','12345678900','kllk',3,2,0,'fsfsdfsdfsdf',1,0),(43,'2017-11-27 16:18:46','2017-11-27 16:18:46',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,4,0,'fsfsdfsdfsdf',1,0),(44,'2017-11-27 16:20:06','2017-11-27 16:20:06',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,4,0,'fsfsdfsdfsdf',1,0),(45,'2017-11-27 16:44:13','2017-11-27 16:44:13',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,4,0,'fsfsdfsdfsdf',1,0),(46,'2017-11-27 16:45:07','2017-11-27 16:45:07',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,2,0,'fsfsdfsdfsdf',1,0),(47,'2017-11-27 16:46:32','2017-11-27 16:46:32',1,249.99,1,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,2,0,'fsfsdfsdfsdf',1,0),(48,'2017-11-27 16:47:55','2017-12-01 20:37:21',0,0,2,'уыв','freeitgroupe@gmail.com','12345678900','kllk',1,2,0,'fsfsdfsdfsdf',1,0),(49,'2017-11-29 12:26:07','2017-12-01 20:02:06',24,5999.8,1,'dfdfdf','pudzia009@gmail.com','','',2,1,0,'dcdcdc',1,0),(50,'2017-12-02 13:50:27','2017-12-05 10:43:51',94,23019.2,2,'Admin Admin','admin@gmail.com','1(111)1111-111-111','',2,1,0,'xzvxvzvxcvZv',0,0),(51,'2017-12-02 15:02:30','2017-12-02 15:02:30',2,499.98,0,'Admin Admin','admin@gmail.com','1(111)1111-111-111','',2,4,0,'чччччччччччччччччччччччччччч',0,0),(52,'2017-12-14 14:14:33','2017-12-14 14:14:33',6,444722,0,'Admin Admin','admin@gmail.com','1(111)1111-111-111','',3,1,0,'vbvbvbvbvbvbvbv',0,71),(53,'2017-12-15 13:25:02','2018-01-17 06:37:25',1,55.55,0,'Admin Admin','admin@gmail.com','1(111)1111-111-111','',2,1,0,'frerer',0,71);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'call','call','test description','test description key','&lt;div class=&quot;benefitsBox clear&quot;&gt;\r\n&lt;h3&gt;&amp;nbsp;&lt;/h3&gt;\r\n\r\n&lt;h3&gt;Benefits for your Business&lt;/h3&gt;\r\n\r\n&lt;div class=&quot;textInformer&quot;&gt;\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo eligendi facere quaerat optio quasi, voluptatum corporis voluptates placeat cupiditate. Perspiciatis facilis eligendi necessitatibus commodi veniam consequatur mollitia voluptatibus praesentium ut cumque eos, quis, sunt soluta quo, nemo iusto voluptates ratione ea quibusdam reiciendis facere laudantium. Vero mollitia quam aspernatur delectus.&lt;/p&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;imageIdentity&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;clear semanticBox&quot;&gt;\r\n&lt;h3&gt;Semantic heading&lt;/h3&gt;\r\n\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus ab deserunt tempora accusantium, ad, esse, voluptates eaque officiis voluptatum rem optio culpa illum facilis laudantium quae cupiditate debitis. Ducimus excepturi itaque praesentium nulla magnam eligendi tempore temporibus corporis quaerat inventore, tenetur eveniet harum deleniti porro hic neque tempora minima laborum. Soluta distinctio dignissimos placeat quos voluptatum. Odit labore, culpa aperiam consequatur voluptates adipisci facilis itaque, accusamus explicabo deleniti recusandae deserunt optio rem voluptatem quasi. Iusto voluptates ipsam incidunt, reiciendis inventore quisquam facilis nulla non iure delectus ut provident, amet accusantium suscipit porro quo ullam molestias fugiat saepe itaque. Voluptate, minima.&lt;/p&gt;\r\n&lt;/div&gt;\r\n',0,NULL,'2018-01-17 08:56:47',1,0),(2,'test_1','test_1','КЛЮЧЕВОЕ описание','Ключевые фразы','&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-family:Verdana,Geneva,sans-serif&quot;&gt;&lt;strong&gt;&lt;u&gt;Benefits for your&lt;/u&gt;&lt;/strong&gt; Business Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo eligendi facere quaerat optio quasi, voluptatum corporis voluptates placeat cupiditate. Perspiciatis facilis eligendi necessitatibus commodi veniam consequatur mollitia voluptatibus praesentium ut cumque eos, quis, sunt soluta quo, nemo iusto voluptates ratione ea quibusdam reiciendis facere laudantium. Vero mollitia quam aspernatur delectus. Semantic heading Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus ab deserunt tempora accusantium, ad, esse, voluptates eaque officiis voluptatum rem optio culpa illum facilis laudantium quae cupiditate debitis. Ducimus excepturi itaque praesentium nulla magnam eligendi tempore temporibus corporis quaerat inventore, tenetur eveniet harum deleniti porro hic neque tempora minima laborum. Soluta distinctio dignissimos placeat quos voluptatum. Odit labore, culpa aperiam consequatur voluptates adipisci facilis itaque, accusamus explicabo deleniti recusandae deserunt optio rem voluptatem quasi. Iusto voluptates ipsam incidunt, reiciendis inventore quisquam facilis nulla non iure delectus ut provident, amet accusantium suscipit porro quo ullam molestias fugiat saepe itaque. Voluptate, minima.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/uploads_images/uploads_all_img/images/blog1.jpg&quot; style=&quot;height:267px; width:400px&quot; /&gt;&lt;/p&gt;\r\n',1,NULL,'2018-01-17 07:05:12',2,0),(4,'Гарантия','garantiya','guarantee','guarantee','&lt;p&gt;guarantee&lt;/p&gt;\r\n',1,NULL,'2018-01-17 06:19:57',4,1),(5,'Как купить','kak-kupit','how-to-buy','how-to-buy','&lt;p&gt;how-to-buy&lt;/p&gt;\r\n',1,NULL,'2018-01-17 06:20:04',5,1),(6,'Доставка','dostavka','Доставка','Доставка','&lt;p&gt;Доставка&lt;/p&gt;\r\n',1,NULL,'2018-01-17 06:20:11',6,1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_section`
--

DROP TABLE IF EXISTS `pages_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_section` (
  `section_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_section`
--

LOCK TABLES `pages_section` WRITE;
/*!40000 ALTER TABLE `pages_section` DISABLE KEYS */;
INSERT INTO `pages_section` VALUES (1,'header'),(2,'footer'),(3,'Дополнительно');
/*!40000 ALTER TABLE `pages_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_form`
--

DROP TABLE IF EXISTS `pay_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_form` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `position` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_form`
--

LOCK TABLES `pay_form` WRITE;
/*!40000 ALTER TABLE `pay_form` DISABLE KEYS */;
INSERT INTO `pay_form` VALUES (1,'Оплата наличными','cash',1),(2,'Безналичный расчет','cashless_payments',2),(3,'Кредит','credit',3),(4,'Оплата на карту ПриватБанка','privatbank',4);
/*!40000 ALTER TABLE `pay_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'5R889851UM583442G',55.55,'USD','Completed','pudzia009-buy@gmail.com'),(2,'2XT17783N23645232',55.55,'USD','Completed','pudzia009-buy@gmail.com'),(3,'70G424612N166392V',55.55,'USD','Completed','pudzia009-buy@gmail.com'),(4,'63K35742FB439953G',305.54,'USD','Completed','pudzia009-buy@gmail.com');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_info_rating`
--

DROP TABLE IF EXISTS `prod_info_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_info_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ip` varchar(100) DEFAULT NULL,
  `ip_locale_address` varchar(100) DEFAULT NULL,
  `prod_rating_id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_info_rating`
--

LOCK TABLES `prod_info_rating` WRITE;
/*!40000 ALTER TABLE `prod_info_rating` DISABLE KEYS */;
INSERT INTO `prod_info_rating` VALUES (6,'127.0.0.1','art.loc',13,'2017-10-31'),(7,'127.0.0.1','art.loc',14,'2017-10-31'),(8,'127.0.0.1','art.loc',1,'2017-10-31'),(9,'127.0.0.1','art.loc',2,'2017-11-02'),(10,'127.0.0.1','art.loc',60,'2017-11-02'),(11,'127.0.0.1','art.loc',10,'2017-11-06'),(12,'193.111.156.142','mail.pstu.edu',59,'2017-11-08'),(13,'127.0.0.1','WIN-QJF2VCB52DD',57,'2017-11-19'),(14,'127.0.0.1','WIN-QJF2VCB52DD',58,'2017-11-19'),(15,'127.0.0.1','WIN-QJF2VCB52DD',24,'2017-12-11'),(16,'193.111.156.142','mail.pstu.edu',15,'2017-12-28');
/*!40000 ALTER TABLE `prod_info_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_rating`
--

DROP TABLE IF EXISTS `prod_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Block, 0 = Unblock',
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_rating`
--

LOCK TABLES `prod_rating` WRITE;
/*!40000 ALTER TABLE `prod_rating` DISABLE KEYS */;
INSERT INTO `prod_rating` VALUES (11,13,1,5,'2017-10-31 11:31:07','2017-10-31 11:31:07',1),(12,14,1,5,'2017-10-31 11:34:29','2017-10-31 11:34:29',1),(13,1,1,5,'2017-10-31 11:35:12','2017-10-31 11:35:12',1),(14,2,2,10,'2017-11-02 21:49:04','2017-11-15 07:59:41',1),(15,60,1,5,'2017-11-02 22:15:33','2017-11-02 22:15:33',1),(16,10,1,5,'2017-11-06 11:50:03','2017-11-06 11:50:03',1),(17,59,1,5,'2017-11-08 06:25:56','2017-11-08 06:25:56',1),(18,57,1,5,'2017-11-19 21:55:55','2017-11-19 21:55:55',1),(19,58,1,5,'2017-11-19 22:41:40','2017-11-19 22:41:40',1),(20,24,1,5,'2017-12-11 03:14:18','2017-12-11 03:14:18',1),(21,15,1,5,'2017-12-28 07:43:12','2017-12-28 07:43:12',1);
/*!40000 ALTER TABLE `prod_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_status`
--

DROP TABLE IF EXISTS `product_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `icon_style` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_status`
--

LOCK TABLES `product_status` WRITE;
/*!40000 ALTER TABLE `product_status` DISABLE KEYS */;
INSERT INTO `product_status` VALUES (1,'В наличии','available','fa-check'),(2,'Ожидается','waiting',''),(3,'Нет в наличии','not_available','');
/*!40000 ALTER TABLE `product_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'#54d874',1,'Coffee stuff for Lovers_1',21,'Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers',0,'Coffee stuff for Lovers Coffee stuff for LoversCoffee stuff for Lovers v','Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers','1','0','1','0','0','1','0','0','0','1','1','1|2','',16,'110217_1_qmbalk8Kv.jpg','nophoto.jpg','#000000','','0','',233.99,0,10,5,1,100,2,'sdsd|ff',34,'CoffeestuffforLovers_1',''),(2,'#54d874',2,'Coffee stuff for Lovers_2',1,'Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers',0,'Coffee stuff for Lovers Coffee stuff for LoversCoffee stuff for Lovers v','Coffee stuff for Lovers Coffee stuff for Lovers Coffee stuff for Lovers','1','1','1','1','0','1','1','0','0','0','0','','',0,'110217_2_jkB7WtjVM.jpg','110217_2_GxyFiPDZW.jpg|110217_2_sDk5camTD.jpg|110217_2_KNqpH5xDy.jpg|110217_2_6HbHtOdMx.jpg|110217_2_HNKCYWzE7.jpg|110217_2_ssb1nA8fb.jpg','#000000','https://www.youtube.com/watch?v=N83bm6seS3g','1','',233.99,0,10,5,1,100,2,'gfgfg|gfgfg',18,'CoffeestuffforLovers_2',''),(3,'article',3,'product-test_3',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',4,'product-test_3',NULL),(4,'article',3,'product-test_4',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_4',NULL),(5,'article',3,'product-test_5',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_5',NULL),(6,'article',3,'product-test_6',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',14,'product-test_6',NULL),(7,'article',3,'product-test_7',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_7',NULL),(8,'article',3,'product-test_8',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_8',NULL),(10,'article',3,'product-test_10',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',7,'product-test_10',NULL),(11,'article',3,'product-test_11',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',14,'product-test_11',NULL),(12,'article',3,'product-test_12',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',6,'product-test_12',NULL),(13,'#21221',3,'product-test_13_13',21,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test_meta_k product-test product-test ','product-test_meta_d product-test product-test product-test ','1','1','1','0','0','0','0','0','0','0','0','1','',0,'single.jpg','thumb.jpg|thumb2.jpg|thumb4.jpg|thumb6.jpg|thumb7.jpg','','','1','',249.99,350.99,10,8,1,200,1,'product-test product-test product-test product-test product-test ',46,'product-test_13',NULL),(14,'article',3,'product-test_14',21,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','0','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',31,'product-test_14',NULL),(15,'article',3,'product-test_15',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',7,'product-test_15',NULL),(16,'article',3,'product-test_16',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_16',NULL),(17,'article',3,'product-test_17',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',4,'product-test_17',NULL),(18,'article',3,'product-test_18',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',2,'product-test_18',''),(19,'article',3,'product-test_19',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_19',''),(20,'article',3,'product-test_20',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',3,'product-test_20',NULL),(21,'article',3,'product-test_21',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',5,'product-test_21',NULL),(22,'article',3,'product-test_22',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_22',NULL),(23,'article',3,'product-test_23',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_23',NULL),(24,'article',3,'product-test_24',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',5,'product-test_24',NULL),(26,'article',3,'product-test_26',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_26',NULL),(27,'article',3,'product-test_27',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_27',NULL),(28,'article',3,'product-test_28',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_28',NULL),(29,'article',3,'product-test_29',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',2,'product-test_29',NULL),(30,'article',3,'product-test_30',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',2,'product-test_30',NULL),(31,'article',3,'product-test_31',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_31',NULL),(32,'article',3,'product-test_32',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_32',NULL),(33,'article',3,'product-test_33',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_33',NULL),(34,'article',3,'product-test_34',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_34',NULL),(35,'article',3,'product-test_35',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_35',NULL),(36,'article',3,'product-test_36',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_36',NULL),(37,'article',3,'product-test_37',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_37',NULL),(38,'article',3,'product-test_38',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_38',NULL),(39,'article',3,'product-test_39',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_39',NULL),(40,'article',3,'product-test_40',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_40',NULL),(41,'article',3,'product-test_41',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',1,'product-test_41',NULL),(42,'article',3,'product-test_42',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_42',NULL),(43,'article',3,'product-test_43',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_43',NULL),(44,'article',3,'product-test_44',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_44',NULL),(45,'article',3,'product-test_45',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_45',NULL),(46,'article',3,'product-test_46',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_46',NULL),(47,'article',3,'product-test_47',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_47',NULL),(48,'article',3,'product-test_48',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_48',NULL),(49,'article',3,'product-test_49',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_49',''),(50,'article',3,'product-test_50',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_50',''),(51,'article',3,'product-test_51',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_51',''),(52,'article',3,'product-test_52',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_52',''),(53,'article',3,'product-test_53',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test ','product-test product-test product-test product-test ','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test ',NULL,'product-test_53',NULL),(54,'article',3,'product-test_54',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_54',''),(55,'article',3,'product-test_55',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_55',''),(56,'article',3,'product-test_56',1,'product-testproduct-testproduct-testproduct-test product-test',0,'product-test product-test product-test','product-test product-test product-test product-test','1','1','1','0','0','1','0','0','0','0','0','1','',0,'thumb1.jpg','','#000000','','1','',249.99,0,10,8,1,200,2,'product-test product-test product-test product-test product-test|',NULL,'product-test_56',''),(57,'BW458',0,'Bay West ROLL TOWEL',1,'ROLL TOWEL UNIVERSAL NAT 8\" 800\' 45800 ECOSOFT GREEN SEAL 6/CS.',0,'Paper towel','BAY WEST ROLL TOWEL UNIVERSAL','0','0','1','0','0','1','0','0','0','0','0','',NULL,1,'110717_57_yqRER9xWQ.jpg',NULL,'#000000','','0',NULL,100,NULL,NULL,NULL,NULL,NULL,1,'6 rolls per case|',2,'bay-west-roll-towel',''),(58,'CZ89460',0,'ENMOTION ROLL TOWEL',1,'ENMOTION ROLL TOWEL 10\"X800\' WHITE PREMIUM LG CAPACITY 6/CS',0,'ENMOTION ROLL TOWEL','ENMOTION ROLL TOWEL','0','0','1','0','0','1','0','0','0','0','0','2|',NULL,0,'110717_58_D6ufKuS5y.jpg',NULL,'#000000','','0',NULL,55.55,NULL,NULL,NULL,NULL,NULL,1,'6 X CASE|',22,'enmotion-roll-towel',''),(60,'CZ89460',5,'test',1,'',NULL,'','','1','0','0','0','0','0','1','0','1','0','1','',NULL,0,'110917_60_7OiWacnwV.png','110917_60_LpE1wFngb.png|110917_60_yZ39KCevW.png|110917_60_LsjCAhwhu.png','#000000','','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'cvcv|',NULL,'ves',''),(61,'№2222',2,'авава',1,'',0,'ыыы','','1','0','1','0','0','1','0','0','0','0','0','',NULL,0,'nophoto.jpg',NULL,'#000000','','0',NULL,444444,NULL,NULL,NULL,NULL,NULL,1,'фыфы|',6,'avava',''),(62,'3WDS02',0,'URINAL SCREEN WAVE 3D',8,'URINAL SCREEN WAVE 3D NON PARA CUCUMBER MELON 10/BOX',0,'URINAL SCREEN','','0','0','0','0','0','0','0','0','0','0','0',NULL,NULL,0,'011218_62_Ox8ydcoav.jpg','011218_62_h7VJZz1cQ.jpg|','#000000','','0',NULL,0,NULL,NULL,NULL,NULL,NULL,1,'12/box|',NULL,'urinal-screen-wave-3d','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_states_products`
--

DROP TABLE IF EXISTS `rel_states_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_states_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `state_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_states_products`
--

LOCK TABLES `rel_states_products` WRITE;
/*!40000 ALTER TABLE `rel_states_products` DISABLE KEYS */;
INSERT INTO `rel_states_products` VALUES (1,13,1),(2,13,2);
/*!40000 ALTER TABLE `rel_states_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_upsell_prod`
--

DROP TABLE IF EXISTS `rel_upsell_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_upsell_prod` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upsell_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_upsell_prod`
--

LOCK TABLES `rel_upsell_prod` WRITE;
/*!40000 ALTER TABLE `rel_upsell_prod` DISABLE KEYS */;
INSERT INTO `rel_upsell_prod` VALUES (8,2,10),(9,1,61),(10,4,61);
/*!40000 ALTER TABLE `rel_upsell_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_warehouse_product`
--

DROP TABLE IF EXISTS `rel_warehouse_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_warehouse_product`
--

LOCK TABLES `rel_warehouse_product` WRITE;
/*!40000 ALTER TABLE `rel_warehouse_product` DISABLE KEYS */;
INSERT INTO `rel_warehouse_product` VALUES (1,1,1,249.99,'5','10',0,10,2),(2,2,1,4444,'5','10',0,NULL,1),(3,3,1,2.22,'5','45',0,NULL,3),(4,4,2,249.99,'5','10',0,NULL,2),(7,4,1,0,'0','0',0,NULL,2),(11,1,58,66.85,'0','0',0,10,1),(12,2,58,0,'0','10',0,0,5),(13,1,60,500,'10','10',0,222,1),(14,3,58,0,'0','0',0,0,5),(16,1,61,0,'0','0',0,10,1),(17,1,62,25.45,'0','0',0,0,1);
/*!40000 ALTER TABLE `rel_warehouse_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_аdditions`
--

DROP TABLE IF EXISTS `related_аdditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_аdditions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `old_price` int(10) NOT NULL DEFAULT '0',
  `new_price` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_аdditions`
--

LOCK TABLES `related_аdditions` WRITE;
/*!40000 ALTER TABLE `related_аdditions` DISABLE KEYS */;
INSERT INTO `related_аdditions` VALUES (1,7,25,'Параметр 1','Описание дополнения',350,500),(2,7,26,'Параметр_2','',100,50),(3,7,27,'Параметр_21','',100,50),(4,8,28,'Параметр 3','',1000,950),(5,8,29,'Параметр 4','',1550,500),(7,0,0,'Дополнения 1','Модель описание',0,0),(8,0,0,'Дополнения 2','Описание Модели 2',0,0);
/*!40000 ALTER TABLE `related_аdditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_assingment`
--

DROP TABLE IF EXISTS `related_assingment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_assingment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `related_product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_assingment`
--

LOCK TABLES `related_assingment` WRITE;
/*!40000 ALTER TABLE `related_assingment` DISABLE KEYS */;
INSERT INTO `related_assingment` VALUES (1,1,'2,3,4,5,6,7,8');
/*!40000 ALTER TABLE `related_assingment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'ZupplyBox','ZUPPLYBOX description',10000,'test@admin.com','+1.1000 10 11','Home','','kq2dHJGUktWDtrj0vjaezO6k-yEQFPjq-1aL_cQARck',1,'&lt;div class=&quot;benefitsBox clear&quot;&gt;\r\n&lt;h3 class=&quot;stipeHeading&quot;&gt;Benefits for your Business&lt;/h3&gt;\r\n&lt;div class=&quot;textInformer&quot;&gt;\r\n&lt;p&gt;\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo eligendi facere quaerat optio quasi, voluptatum corporis voluptates placeat cupiditate. Perspiciatis facilis eligendi necessitatibus commodi veniam consequatur mollitia voluptatibus praesentium ut cumque eos, quis, sunt soluta quo, nemo iusto voluptates ratione ea quibusdam reiciendis facere laudantium. Vero mollitia quam aspernatur delectus.\r\n&lt;/p&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;imageIdentity&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;semanticBox clear&quot;&gt;\r\n&lt;h3 class=&quot;stipeHeading&quot;&gt;Semantic heading&lt;/h3&gt;\r\n&lt;p&gt;\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus ab deserunt tempora accusantium, ad, esse, voluptates eaque officiis voluptatum rem optio culpa illum facilis laudantium quae cupiditate debitis. Ducimus excepturi itaque praesentium nulla magnam eligendi tempore temporibus corporis quaerat inventore, tenetur eveniet harum deleniti porro hic neque tempora minima laborum. Soluta distinctio dignissimos placeat quos voluptatum. Odit labore, culpa aperiam consequatur voluptates adipisci facilis itaque, accusamus explicabo deleniti recusandae deserunt optio rem voluptatem quasi. Iusto voluptates ipsam incidunt, reiciendis inventore quisquam facilis nulla non iure delectus ut provident, amet accusantium suscipit porro quo ullam molestias fugiat saepe itaque. Voluptate, minima.\r\n&lt;/p&gt;\r\n&lt;/div&gt;');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_statictext`
--

DROP TABLE IF EXISTS `settings_statictext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_statictext` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cart_text` text,
  `upsell_text` text,
  `order_final_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_statictext`
--

LOCK TABLES `settings_statictext` WRITE;
/*!40000 ALTER TABLE `settings_statictext` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_statictext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_mark`
--

DROP TABLE IF EXISTS `special_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_mark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_mark`
--

LOCK TABLES `special_mark` WRITE;
/*!40000 ALTER TABLE `special_mark` DISABLE KEYS */;
INSERT INTO `special_mark` VALUES (1,'sale','mark_sale'),(2,'stock','stock_id'),(3,'upsell','upsell_product'),(4,'hit','mark_hit'),(5,'expert','mark_expert'),(6,'discontinued','mark_discontinued'),(8,'fast delivery','fast_delivery'),(9,'free delivery','free_delivery'),(10,'perfect delivery','perfect_delivery'),(11,'exchange product','exchange_prod'),(12,'warrantly months','warranty_months'),(13,'upsell product','upsell_product');
/*!40000 ALTER TABLE `special_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Alaska','AK'),(2,'Alabama','AL'),(3,'Arkansas','AR'),(4,'Arizona','AZ'),(5,'California','CA'),(6,'Colorado','CO'),(7,'Connecticut','CT'),(8,'District of Columbia','DC'),(9,'Delaware','DE'),(10,'Florida','FL'),(11,'Georgia','GA'),(12,'Hawaii','HI'),(13,'Iowa','IA'),(14,'Idaho','ID'),(15,'Illinois','IL'),(16,'Indiana','IN'),(17,'Kansas','KS'),(18,'Kentucky','KY'),(19,'Louisiana','LA'),(20,'Massachusetts','MA'),(21,'Maryland','MD'),(22,'Maine','ME'),(23,'Michigan','MI'),(24,'Minnesota','MN'),(25,'Missouri','MO'),(26,'Mississippi','MS'),(27,'Montana','MT'),(28,'North Carolina','NC'),(29,'North Dakota','ND'),(30,'Nebraska','NE'),(31,'New Hampshire','NH'),(32,'New Jersey','NJ'),(33,'New Mexico','NM'),(34,'Nevada','NV'),(35,'New York','NY'),(36,'Ohio','OH'),(37,'Oklahoma','OK'),(38,'Oregon','OR'),(39,'Pennsylvania','PA'),(40,'Rhode Island','RI'),(41,'South Carolina','SC'),(42,'South Dakota','SD'),(43,'Tennessee','TN'),(44,'Texas','TX'),(45,'Utah','UT'),(46,'Virginia','VA'),(47,'Vermont','VT'),(48,'Washington','WA'),(49,'Wisconsin','WI'),(50,'West Virginia','WV'),(51,'Wyoming','WY');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (23,'stock-test#9','stock-test-9','asasas','dfdfdfdfdfdf','121117_23_2eXmMjeZ1.png','121117_23_hd3m1Rs5T.png',NULL,'2018-01-20 11:11:00',0,NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_goods`
--

DROP TABLE IF EXISTS `subscription_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_goods`
--

LOCK TABLES `subscription_goods` WRITE;
/*!40000 ALTER TABLE `subscription_goods` DISABLE KEYS */;
INSERT INTO `subscription_goods` VALUES (7,'admin','pudzia009@gmail.com',1,2,'2017-07-16 01:03:13','0000-00-00 00:00:00','XCPrwtmCMz'),(8,'admin','pudzia009@gmail.com',0,5,'2017-07-16 02:51:21','2017-07-16 03:12:05','X236jJBfth'),(9,'admin','pudzia009@gmail.com',0,1,'2017-07-16 22:21:57','2017-07-16 22:25:08','8xNhKig8uR'),(10,'admin','pudzia009@gmail.com',0,1,'2017-07-16 22:25:29','2017-07-16 22:36:09','WgKPKOC41f'),(11,'admin','pudzia009@gmail.com',0,1,'2017-07-21 13:45:28','2017-07-21 13:47:15','NA6abJRnsO'),(12,'admincv','sdsdsd@sdsd.com',1,1,'2017-07-21 14:08:06','0000-00-00 00:00:00','4ahjOvwVEj'),(13,'dsdsd','sdsdsd@dsdsdsd.com',1,1,'2017-07-21 14:08:46','0000-00-00 00:00:00','OzcZeehSgn'),(14,'dfdfdf','dfdf@dfdf.com',1,1,'2017-07-21 14:10:26','0000-00-00 00:00:00','874SUi96xn'),(15,'dfdfdfdfdf','dfdfdf@dsdsds.com',1,1,'2017-07-21 14:14:26','0000-00-00 00:00:00','TR7MLNKWhR'),(16,'sdsdsdsd','pudzia009@gmail.com',1,1,'2017-07-21 14:16:05','0000-00-00 00:00:00','e48Z7joh3N'),(17,'Rtrttrtu','dffd@ghhhh.cpm',1,4,'2017-07-21 20:14:30','0000-00-00 00:00:00','oizMDYsbzm');
/*!40000 ALTER TABLE `subscription_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_admin_access`
--

DROP TABLE IF EXISTS `team_admin_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_admin_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `team_alias` varchar(100) CHARACTER SET utf8 NOT NULL,
  `access_level` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_admin_access`
--

LOCK TABLES `team_admin_access` WRITE;
/*!40000 ALTER TABLE `team_admin_access` DISABLE KEYS */;
INSERT INTO `team_admin_access` VALUES (1,'Managers ','managers',0),(2,'Editors','editors',0);
/*!40000 ALTER TABLE `team_admin_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_admin_users`
--

DROP TABLE IF EXISTS `team_admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_admin_users`
--

LOCK TABLES `team_admin_users` WRITE;
/*!40000 ALTER TABLE `team_admin_users` DISABLE KEYS */;
INSERT INTO `team_admin_users` VALUES (1,'general_manager','manager@gmail.com','123456','General manager','','','',0,'1969-12-31','',1),(2,'manager 1','manager1@gmail.com','9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','name','','+11111111111','+11111111111',20,'1980-12-20','education',1);
/*!40000 ALTER TABLE `team_admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (13,'#21221','product-test_13_13',21,1,1,'0',249.99,200,13,1,1,'washington','category_1_1_1',1,'published'),(13,'#21221','product-test_13_13',21,1,1,'0',249.99,200,13,2,2,'vermont','category_1_1_1',1,'published');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upsell`
--

DROP TABLE IF EXISTS `upsell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upsell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `upsell_price` float DEFAULT NULL,
  `default_price` float DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `position` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upsell`
--

LOCK TABLES `upsell` WRITE;
/*!40000 ALTER TABLE `upsell` DISABLE KEYS */;
INSERT INTO `upsell` VALUES (1,1,'upsell 1',1200,NULL,'upsell_1',1),(4,3,'test_2',850,1200,'null',NULL),(6,3,'test_2',850,1200,'null',NULL),(9,3,'test_2',850,1200,'null',NULL),(10,3,'test_2',850,1200,'null',NULL),(11,3,'test_2',850,1200,'null',NULL),(12,60,NULL,100.56,1200,NULL,NULL),(13,61,NULL,100.56,1200,NULL,NULL),(14,61,NULL,100.56,1200,NULL,NULL),(15,61,NULL,100.56,1200,NULL,NULL),(16,3,NULL,100.56,1200.22,NULL,NULL);
/*!40000 ALTER TABLE `upsell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` int(2) unsigned NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','xcxcxcxc','',0,'','','xcxcxcxcx@gmail.com','','',0,'2017-06-25 23:50:40','127.0.0.1'),(2,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','xcxcxcxc','',0,'','','xcxcxcxcx@gmail.com','','',0,'2017-06-25 23:52:18','127.0.0.1'),(3,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','xcxcxcxc','',0,'','','xcxcxxcxccxcx@gmail.com','','',0,'2017-06-26 00:00:45','127.0.0.1'),(4,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','xcxcxcxc','',0,'','','xcxcxxcxccxcx@gmail.com','','',0,'2017-06-26 00:00:56','127.0.0.1'),(5,0,0,'9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxcxgcx@gmail.com','','',0,'2017-06-26 01:12:08','127.0.0.1'),(6,0,0,'9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxcxgcx@gmail.com','','',0,'2017-06-26 01:13:22','127.0.0.1'),(7,0,0,'9nm2rv8q0aaa72aed69f34607bd40c5c26b1bb092yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxcxgcx@gmail.com','','',0,'2017-06-26 01:13:37','127.0.0.1'),(8,0,0,'9nm2rv8qdaa1391b2912c15ba922e0eb90fd0de22yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxfgfgcxgcx@gmail.com','','',0,'2017-06-26 01:13:55','127.0.0.1'),(9,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxfgfgrgcxgcx@gmail.com','','',0,'2017-06-26 01:15:05','127.0.0.1'),(10,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','ghghgh','',0,'','','xcxcxfgfgrgcxgcx@gmail.com','','',0,'2017-06-26 01:15:22','127.0.0.1'),(11,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','df55','',0,'','','xcxcxdfcxcx@gmail.com','','',0,'2017-06-27 02:53:58','127.0.0.1'),(12,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','df55','',0,'','','xcxcxdfcxcx@gmail.com','','',0,'2017-06-27 02:54:49','127.0.0.1'),(13,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','df55','',0,'','','xcxcxdfcxhjjcx@gmail.com','','',0,'2017-06-27 02:56:35','127.0.0.1'),(14,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcxcxcx@gmail.com','','',0,'2017-06-27 02:59:09','127.0.0.1'),(15,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcxcxcx@gmail.com','','',0,'2017-06-27 02:59:11','127.0.0.1'),(16,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcxcxcx@gmail.com','','',0,'2017-06-27 02:59:33','127.0.0.1'),(17,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcxcxcx@gmail.com','','',0,'2017-06-27 02:59:49','127.0.0.1'),(18,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcxcxcx@gmail.com','','',0,'2017-06-27 03:00:15','127.0.0.1'),(19,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcnmnxcxcx@gmail.com','','',0,'2017-06-27 03:00:26','127.0.0.1'),(20,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxhjhjcnmnxcxcx@gmail.com','','',0,'2017-06-27 03:06:53','127.0.0.1'),(21,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','sdsghghghdsd@hghg.com','','',0,'2017-06-27 03:07:40','127.0.0.1'),(22,0,0,'9nm2rv8qe4e95fc0fd4d6f7e176c6b21e0acf57d2yo6z','','no-image.png',0,'','sdsdd','',0,'','','sdsdsd@hghg.com','','',0,'2017-06-27 03:15:55','127.0.0.1'),(23,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','12345678','',0,'','','sdssdsdddsd@hghg.com','','',0,'2017-06-27 03:31:04','127.0.0.1'),(24,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','12345678','',0,'','','sdssdsdddsd@hghg.com','','',0,'2017-06-27 03:31:08','127.0.0.1'),(25,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','12345678','',0,'','','pudfgzia009@gmail.com','','',0,'2017-06-27 03:32:40','127.0.0.1'),(26,0,0,'9nm2rv8qda70c317d67c464fa004aa382da55d522yo6z','','no-image.png',0,'','hjhj','',0,'','','test@gmail.com','','',0,'2017-06-27 03:39:03','127.0.0.1'),(27,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','xcxcxklklcxcx@gmail.com','','',0,'2017-06-27 03:43:14','127.0.0.1'),(28,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','hjhj','',0,'','','pudzljlia009@gmail.com','','',0,'2017-06-27 03:44:56','127.0.0.1'),(29,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','jhjhj','',0,'','','pudziart009@gmail.com','','',0,'2017-06-27 08:23:18','127.0.0.1'),(30,0,0,'9nm2rv8q3d0ae2da1c51f64994f3c2f5faa66c002yo6z','','no-image.png',0,'','asdf','',0,'','','puyjyjdzia009@gmail.com','','',0,'2017-07-03 02:41:39','127.0.0.1'),(31,0,0,'9nm2rv8qf930483127f4b2467fd18eaa66b5d4ad2yo6z','','no-image.png',0,'','hjhj','',0,'','','pudzkiikia009@gmail.com','','',0,'2017-07-03 02:43:37','127.0.0.1'),(32,0,0,'9nm2rv8qbdcad8a9812b0ceacb41cf6bf3d70c432yo6z','','no-image.png',0,'','hjhj','',0,'','','pudfdfdzia009@gmail.com','','',0,'2017-07-03 02:49:41','127.0.0.1'),(33,0,0,'9nm2rv8qf0e9520d80d822f7e5a4a47ff719be992yo6z','','no-image.png',0,'','hjhjfhf','',0,'','','sdsdsfhfhd@hghg.com','','',0,'2017-07-03 02:59:50','127.0.0.1'),(34,0,0,'9nm2rv8q90d18a5d706c39f565fd94466b7fc53e2yo6z','','no-image.png',0,'','jhjhj','',0,'','','sd454sdsd@hghg.com','','',0,'2017-07-03 03:00:34','127.0.0.1'),(35,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','123456','',0,'','','123@gmail.com','','',0,'2017-07-03 04:52:49','127.0.0.1'),(36,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','','no-image.png',0,'','123','',0,'','','789@gmail.com','','',0,'2017-07-03 05:02:13','127.0.0.1'),(37,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','pOwxF1hae7','no-image.png',0,'','xcxc','',0,'','','pudzia45545@ggfgg.com','','',0,'2017-07-03 11:08:20','127.0.0.1'),(38,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','h2b54oIQjK','no-image.png',0,'','df545','',0,'','','pucvcvdzia009@gmail.comc','','',0,'2017-07-03 11:34:48','127.0.0.1'),(39,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','W3IXHiyLLG','no-image.png',0,'','xcxc','',0,'','','pudzixcxca009@gmail.com','','',0,'2017-07-03 12:12:08','127.0.0.1'),(40,0,0,'9nm2rv8qc6e3d292722ecb653ce71d1cd2cff9642yo6z','QWGdPGPKSi','no-image.png',0,'','xcxc','',0,'','','pudxcxczia009@gmail.com','','',0,'2017-07-03 12:13:55','127.0.0.1'),(41,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','5tF7mUtYLR','no-image.png',0,'','xcxc','',0,'','','frexceitgroupe@gmail.comxc','','',0,'2017-07-03 12:17:03','127.0.0.1'),(42,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','iojrYToVTW','no-image.png',0,'','xcxc','',0,'','','freeitxcxcgroupe@gmail.comxcxc','','',0,'2017-07-03 12:17:14','127.0.0.1'),(43,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','RICoWSIlK4','no-image.png',0,'','freeitgroupe','',0,'','','freeitgroupe@gmail.comxxc','','',0,'2017-07-03 12:19:31','127.0.0.1'),(44,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','KoNN7h27N2','no-image.png',0,'','xcxc','',0,'','','freeitgxcroupe@gmail.com','','',0,'2017-07-03 12:21:00','127.0.0.1'),(45,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','TBc5VpsXnO','no-image.png',0,'','xcxc','',0,'','','freeitggtffgroupe@gmail.com','','',0,'2017-07-03 12:22:38','127.0.0.1'),(46,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','PKOC41fsAb','no-image.png',0,'','xcxc','',0,'','','freeitgr;loupe@gmail.com','','',0,'2017-07-03 13:20:56','127.0.0.1'),(47,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','iOp1tDlQea','no-image.png',1,'Ивановr','Roman','Иванович',2,'54.54.5454','Киев','freeitgroupe@gmail.com','+38(111) 111-11-11','пр.Мира 191, кв.1220',0,'2017-07-03 13:21:32','127.0.0.1'),(48,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','xBRQnuxetj','no-image.png',0,'','123456','',0,'','','xcxc@ssdsd.com','','',0,'2017-07-03 14:28:05','127.0.0.1'),(49,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','a0YM24CjzQ','no-image.png',0,'','dfdfdf','',0,'','','pudzia009@gmail.com','','',0,'2017-07-04 21:17:34','127.0.0.1'),(50,0,0,'9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z','bItjBhHNuY','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:04:48','127.0.0.1'),(51,0,0,'9nm2rv8q28e352e8a88e003aefdf5dcadf5d51fa2yo6z','eNK0MI1VRn','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:07:23','127.0.0.1'),(52,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','LtAkkjMjCK','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:12:32','127.0.0.1'),(53,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','Wopm3lYHBG','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:12:44','127.0.0.1'),(54,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','EITBkE5SLd','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:12:56','127.0.0.1'),(55,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','92jbogKlba','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:14:01','127.0.0.1'),(56,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','1ybeEYIvqQ','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:14:37','127.0.0.1'),(57,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','4ph1pQGYYM','no-image.png',0,'','','',0,'','','pudziammm@gmail.com','','',0,'2017-10-05 18:15:08','127.0.0.1'),(58,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','2Ypw8JvmIK','no-image.png',0,'','','',0,'','','pudzia@rambler.ru','','',0,'2017-10-05 18:33:27','127.0.0.1'),(59,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','EoPpe28kLb','no-image.png',0,'','','',0,'','','pudzia001@rambler.ru','','',0,'2017-10-05 18:35:54','127.0.0.1'),(60,0,0,'9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z','7PM3oi6EUz','no-image.png',0,'','','',0,'','','sssdsd@gmail.com','','',0,'2017-10-05 18:57:09','127.0.0.1'),(61,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','sXh0PU1UbL','no-image.png',0,'','','',0,'','','sssddsd@gmail.com','','',0,'2017-10-05 19:35:18','127.0.0.1'),(62,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','SQZyuVkzhy','no-image.png',0,'','','',0,'','','pudziammme@gmail.com','','',0,'2017-10-05 19:52:32','127.0.0.1'),(63,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','gpbaNPqQPO','no-image.png',0,'','','',0,'','','pudziamxcxcmm@gmail.com','','',0,'2017-10-05 19:52:53','127.0.0.1'),(64,0,0,'9nm2rv8q8cefde1ceb04014cd7e15b6c712ca0892yo6z','m35gSf675Y','no-image.png',0,'','','',0,'','','pudzidfammm@gmail.com','','',0,'2017-10-05 19:54:21','127.0.0.1'),(65,0,0,'9nm2rv8q211033a5dd945a29c27be56981297e692yo6z','4B0JHrwe0t','no-image.png',0,'','','',0,'','','pudziammdddddm@gmail.com','','',0,'2017-10-05 19:55:15','127.0.0.1'),(66,0,0,'9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z','GkqX6TbnHN','no-image.png',0,'','','',0,'','','pudziadfdfdfmmm@gmail.com','','',0,'2017-10-05 19:55:38','127.0.0.1'),(67,0,0,'9nm2rv8q851df5229a18c551dc2d4fba9a86b1b52yo6z','TNvLYK8exV','no-image.png',0,'','','',0,'','','pudziammm565656@gmail.com','','',0,'2017-10-05 19:57:01','127.0.0.1'),(68,0,0,'9nm2rv8q3f4cc94b6bd0ad3727d925af1ba288372yo6z','cnpgAXwLBp','no-image.png',0,'','','',0,'','','pudsdsdsziammm@gmail.com','','',0,'2017-10-05 19:59:42','127.0.0.1'),(69,0,0,'9nm2rv8q63f0bd0078cf046d2b127ae3a4c1b3432yo6z','SRBiuTU4BO','no-image.png',0,'','','',0,'','','pudziassasammm@gmail.com','','',0,'2017-10-05 20:00:25','127.0.0.1'),(70,0,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','jp0yK2R3LO','no-image.png',0,'','','',0,'','','qqq@qqq.com','','',0,'2017-10-09 11:38:43','127.0.0.1'),(71,2,0,'9nm2rv8qe388f02f750e65ebba95ab9493cda01e2yo6z','OMSqxaXx3z','no-image.png',0,'','Admin Admin','',0,'','','admin@gmail.com','1(111)1111-111-111','',0,'2017-10-20 10:11:46','127.0.0.1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_group`
--

DROP TABLE IF EXISTS `users_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_group` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `role` tinyint(2) NOT NULL,
  `alias` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_group`
--

LOCK TABLES `users_group` WRITE;
/*!40000 ALTER TABLE `users_group` DISABLE KEYS */;
INSERT INTO `users_group` VALUES (1,'Обычный пользователь',0,'default'),(2,'Менеджер',1,'manager');
/*!40000 ALTER TABLE `users_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Walter E nelson',48,'Kent','#12121','','98032','7915 S. 184th St, BLD C',NULL,'','','license','','0','Wendy Steiner','(253) 893-1909','',11.12,'','1'),(2,'warehouse_1_1',1,'warehouse_article','warehouse_article','warehouse_article','warehouse_article','add',NULL,'coooooo','cvcvcv','lilil','','1','fgfgfg','56565656','5665656',20.1,'dfdfdfdfdfdfdf','0'),(3,'warehouse_2',5,'sdsd','sdsd','sdsd','sdsd','sdsd',NULL,'sdsd','sssssss','343434','ererdfd','1','dfdf','dfdf','dfdf',10,'dddddddddddddd','0'),(4,'warehouse_3',5,'sdsd','sdsd','sdsd','sdsd','sdsd',NULL,'sdsd','sssssss','343434','ererdfd','1','dfdf','dfdf','dfdf',10,'dddddddddddddd','0');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_list`
--

DROP TABLE IF EXISTS `watch_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `watch_product_id` int(10) unsigned NOT NULL,
  `watch_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `watch_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_list`
--

LOCK TABLES `watch_list` WRITE;
/*!40000 ALTER TABLE `watch_list` DISABLE KEYS */;
INSERT INTO `watch_list` VALUES (1,13,'2017-11-02 14:15:44','127.0.0.1'),(2,14,'2017-11-02 14:19:53','127.0.0.1'),(3,6,'2017-10-04 01:38:31','127.0.0.1'),(4,1,'2017-12-12 11:20:19','127.0.0.1'),(5,4,'2017-10-03 14:02:56','127.0.0.1'),(6,2,'2017-12-12 08:59:24','127.0.0.1'),(7,11,'2018-01-17 15:19:28','127.0.0.1'),(8,41,'2017-10-07 14:29:27','127.0.0.1'),(9,10,'2017-12-08 22:06:51','127.0.0.1'),(10,12,'2017-10-30 10:11:31','127.0.0.1'),(11,29,'2017-10-08 03:52:01','127.0.0.1'),(12,21,'2017-12-11 01:14:56','127.0.0.1'),(13,30,'2017-10-31 03:16:06','127.0.0.1'),(14,5,'2017-10-09 04:12:30','127.0.0.1'),(15,3,'2017-11-29 08:07:53','127.0.0.1'),(16,18,'2017-10-09 04:55:04','127.0.0.1'),(17,17,'2017-10-09 07:22:38','127.0.0.1'),(18,15,'2018-01-15 10:24:41','127.0.0.1'),(19,20,'2017-11-28 20:56:19','127.0.0.1'),(20,60,'2017-11-02 14:15:50','127.0.0.1'),(21,57,'2017-12-11 01:55:12','127.0.0.1'),(22,2,'2017-12-12 08:59:24','188.163.87.158'),(23,59,'2017-11-08 04:25:53','193.111.156.142'),(24,10,'2017-12-08 22:06:51','46.160.71.23'),(25,17,'2017-11-08 09:57:34','46.160.71.23'),(26,58,'2017-12-12 10:45:57','193.111.156.142'),(27,11,'2018-01-17 15:19:28','174.127.133.49'),(28,16,'2017-11-14 10:31:45','174.127.133.49'),(29,17,'2017-11-14 21:38:03','37.204.156.184'),(30,2,'2017-12-12 08:59:24','193.111.156.142'),(31,18,'2017-11-16 07:41:09','193.111.156.142'),(32,11,'2018-01-17 15:19:28','193.111.156.142'),(33,58,'2017-12-12 10:45:57','127.0.0.1'),(34,24,'2017-12-11 01:14:12','127.0.0.1'),(35,23,'2017-11-27 15:46:03','127.0.0.1'),(36,28,'2017-11-27 15:59:48','127.0.0.1'),(37,26,'2017-11-29 14:17:59','127.0.0.1'),(38,61,'2017-12-12 11:19:08','127.0.0.1'),(39,1,'2017-12-12 11:20:19','193.111.156.142'),(40,61,'2017-12-12 11:19:08','193.111.156.142'),(41,61,'2017-12-21 04:55:42','174.127.133.58'),(42,17,'2017-12-28 05:57:13','176.193.145.30'),(43,15,'2018-01-15 10:24:41','193.111.156.142'),(44,61,'2018-01-05 04:53:31','174.127.133.105');
/*!40000 ALTER TABLE `watch_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_users`
--

DROP TABLE IF EXISTS `wish_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wish_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_users`
--

LOCK TABLES `wish_users` WRITE;
/*!40000 ALTER TABLE `wish_users` DISABLE KEYS */;
INSERT INTO `wish_users` VALUES (1,115,47,10,'2017-10-07 16:06:10'),(2,116,47,1,'2017-10-07 16:07:49'),(4,118,47,14,'2017-10-07 16:17:35'),(5,118,47,13,'2017-10-07 17:03:18'),(6,115,47,11,'2017-10-07 17:13:53'),(8,118,47,29,'2017-10-07 17:29:13'),(9,113,47,21,'2017-10-07 17:38:05'),(10,119,47,15,'2017-10-08 02:51:27'),(11,119,47,30,'2017-10-08 02:52:59'),(12,120,70,10,'2017-10-09 01:46:43'),(13,121,70,14,'2017-10-09 03:25:30'),(15,120,70,13,'2017-10-09 03:55:27'),(16,121,70,11,'2017-10-09 06:24:07'),(20,125,71,15,'2017-10-31 02:59:42'),(21,125,71,10,'2017-11-02 12:43:46'),(22,125,71,11,'2017-11-03 06:07:17'),(30,126,49,26,'2017-11-29 13:55:31'),(31,126,49,2,'2017-11-29 13:55:37'),(32,125,71,58,'2018-01-08 17:06:37');
/*!40000 ALTER TABLE `wish_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `default` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (113,'Список 1а',47,'2017-08-02 21:03:49',0),(114,'тестинг',51,'2017-08-08 09:26:41',0),(115,'rrrrrrrr',47,'2017-10-07 16:06:10',0),(116,'rtrt',47,'2017-10-07 16:07:49',0),(117,'fffffff',47,'2017-10-07 16:14:34',0),(118,'vvvvv',47,'2017-10-07 16:17:35',0),(119,'test',47,'2017-10-08 02:51:27',0),(120,'trr',70,'2017-10-09 01:46:43',0),(121,'qqq',70,'2017-10-09 03:25:30',0),(125,'test',71,'2017-10-31 02:59:42',0),(126,'testing',49,'2017-11-29 09:12:14',0);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22  6:27:35
