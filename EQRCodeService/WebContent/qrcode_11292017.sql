-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 192.168.18.150    Database: qrcode
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.12.04.1

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
-- Table structure for table `mstr_company`
--

DROP TABLE IF EXISTS `mstr_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` text,
  `email_address` varchar(50) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='List of company / clients';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_company`
--

LOCK TABLES `mstr_company` WRITE;
/*!40000 ALTER TABLE `mstr_company` DISABLE KEYS */;
INSERT INTO `mstr_company` VALUES (1,'Filmetrics Corporation','Triumph Bldg, 1610 Quezon Ave, Diliman, Quezon City, 1104 Metro Manila','hr@filmetrics.com.p','(02) 426 0182',1,1,'2017-10-10 08:51:04'),(3,'Thru Mobile','Reg Address','reg@mail.com','1234',1,1,'2017-11-17 02:50:44'),(4,'Filmetrics ','Triumph Bldg, 1610 Quezon Ave, Diliman, Quezon City, 1104 Metro Manila','hr@filmetrics.com','(02) 426 0182',1,1,'2017-11-17 02:50:44'),(5,'Tesla Inc.','Palo Alto, CA','tesla@mail.com.ca','0987654321',1,1,'2017-11-10 05:23:15'),(6,'Test','Test','test@mail.com','123456789',1,1,'2017-11-16 05:53:04'),(7,'Registration Thru Mobile','Reg Address','reg@mail.com','1234',0,1,'2017-10-10 08:49:22');
/*!40000 ALTER TABLE `mstr_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_mobile`
--

DROP TABLE IF EXISTS `mstr_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile_name` varchar(45) NOT NULL,
  `mac_address` varchar(45) NOT NULL,
  `mobile_model` varchar(45) NOT NULL,
  `mobile_brand` varchar(45) NOT NULL,
  `is_assigned` int(11) NOT NULL DEFAULT '0' COMMENT '1 - Assigned\n0 - Not yet assigned',
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_address_UNIQUE` (`mac_address`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='List of Mobiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_mobile`
--

LOCK TABLES `mstr_mobile` WRITE;
/*!40000 ALTER TABLE `mstr_mobile` DISABLE KEYS */;
INSERT INTO `mstr_mobile` VALUES (1,'3','3','r','3',3,1,2,'2017-10-10 08:51:04'),(2,'NOKIA','19:SD:09:SD','33110','',0,1,0,'2017-10-10 08:51:04'),(3,'werty','3245678','serttyui','1234',1,1,1,'2017-10-10 08:51:04'),(4,'wert','4567','46578','-098',1,1,1,'2017-11-22 03:38:45'),(5,'wertyoiuy','67','8765','45',1,1,1,'2017-11-22 03:38:45');
/*!40000 ALTER TABLE `mstr_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_products`
--

DROP TABLE IF EXISTS `mstr_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `product_code` varchar(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `token` varchar(10) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_company_id_UNIQUE` (`mstr_company_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Products Per Company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_products`
--

LOCK TABLES `mstr_products` WRITE;
/*!40000 ALTER TABLE `mstr_products` DISABLE KEYS */;
INSERT INTO `mstr_products` VALUES (1,7,'PRD1','Product1','Product desc 1','',1,0,'2017-11-16 01:55:03'),(2,1,'PRD2','Product2','Product desc 2','',1,0,'2017-11-16 01:55:05'),(3,5,'RPD3','Product3','Product desc 3','',1,0,'2017-11-16 01:55:07'),(4,1,'PRD4','Product4','Product desc 4','',1,0,'2017-11-16 01:58:04'),(6,5,'B456','Model X','a very nice car','pfvbTHJC3K',0,1,'2017-11-17 06:50:09'),(7,1,'F123','FBIOS','capture software','ELeP62Xk6C',1,1,'2017-11-17 07:46:51'),(8,3,'F234','REGEN','REGENERATE','SAMPLE',1,0,'2017-11-20 05:56:38'),(16,5,'T098','Tesla Vibe','Vibes','uNnmyj0RVt',1,1,'2017-11-23 05:07:10');
/*!40000 ALTER TABLE `mstr_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_products_image`
--

DROP TABLE IF EXISTS `mstr_products_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_products_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_product_id` int(11) NOT NULL,
  `product_image` longblob NOT NULL,
  `mimetype` varchar(45) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_mstr_product_id_idx` (`mstr_product_id`),
  CONSTRAINT `fk_mstr_product_id` FOREIGN KEY (`mstr_product_id`) REFERENCES `mstr_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Products Per Company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_products_image`
--

LOCK TABLES `mstr_products_image` WRITE;
/*!40000 ALTER TABLE `mstr_products_image` DISABLE KEYS */;
INSERT INTO `mstr_products_image` VALUES (8,16,'ˇ\ÿˇ\‡\0JFIF\0\0H\0H\0\0ˇ\·\n\0Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0éái\0\0\0\0\0\0\0§\0\0\0\–\0\n¸Ä\0\0\'\0\n¸Ä\0\0\'Adobe Photoshop CS3 Windows\02013:04:08 16:16:22\0\0\0\0†\0\0\0\0\0\0\0†\0\0\0\0\0\0\0V†\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0\ \0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ˇ\ÿˇ\‡\0JFIF\0\0\0H\0H\0\0ˇ\Ì\0Adobe_CM\0ˇ\Ó\0Adobe\0dÄ\0\0\0ˇ\€\0Ñ\0			\n\r\r\rˇ¿\0\0:\0V\"\0ˇ\›\0\0ˇ\ƒ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"qÅ2ë°±B#$R¡b34rÇ\—C%íS\·Òcs5¢≤É&DìTdE¬£t6\“U\‚eÚ≥Ñ\√\”u\„ÛF\'î§Ö¥ï\ƒ\‘\‰Ù•µ\≈\’\ÂıVfvÜñ¶∂\∆\÷\Êˆ7GWgwáóß∑\«\◊\Á˜\05\0!1AQaq\"2Åë°±B#¡R\—3$b\·rÇíCScs4Ò%¢≤É&5\¬\“DìT£dEU6te\‚Ú≥Ñ\√\”u\„ÛFî§Ö¥ï\ƒ\‘\‰Ù•µ\≈\’\ÂıVfvÜñ¶∂\∆\÷\Êˆ\'7GWgwáóß∑\«ˇ\⁄\0\0\0?\0ıTì/?˙ˇ\0ı˚\Ï˙OJ\Î_G\"ˆ˛g¸\À˝˜£ô\Z\nz¨_]˙\'A\›]∂z˘C˛\”\÷dè¯\«}\Z◊ûıOÒØ\◊Ú\\\·Ñ\⁄\Í<mù˛{\◊m∂ZÛeé.såíu2V\«’Ø™=[\Îß\Ï≠\·\÷b\Ï\Àt≠±\À[˛ñ\œ\‰µY°r\◊\Õmì≥üÆ?YØ;≠\ÍWèÉ\À\Í6´˝\'#¸bgê˛ö¸˚[\⁄\¬\Á6ø˚rˇ\0bÙ_´ˇ\0Q˛ÆÙ¶∂\⁄q~ﬂê\ﬁsrÄâˇ\0ÇcΩåoı∑2jØ1°Ç¶\⁄.\€\Ÿ\‘\…eé—à˙¶ûC•;¸ec˚C?µék\…p{˛¸`\’\÷\·uä\Õ-neµØ\Œn8{õ\Â∑sw™UtJl\»ñ´\Î{b\»˛I˙.˛∫\€\«\ƒ\«\∆n\⁄;ë\…¯πBe}\0ÚJF<=°\¬@>\"\ní∑2¶ó;∂∞9è≥K\\Z¡ªC$ó!†no\”o\—AM¥ñ}VìEƒáÄ€Ñ\◊	˜3\Ë{∑=øü\Õˇ\0\÷\“IOˇ\–Ìæ∫}b¢\Ÿ{\Î7MX\„˘D{¨ˇ\0≠µx=∂\Ÿmé≤\¬\\˜í\\N§íΩ¸bé°◊æ≥ìÇô\”\Ëµ\œpel\ﬂ\Ó}∂Ω\ﬂı∫\€˘\Ô\\ˆ’¨J´±ùs\Ìôo Rd±Å\„u[\ÿ\ﬂ\“_ùëˇ\0i3˘\€’úF0çùŒ´N≠o™?V\Ó˙\…\÷Ç\“YçXı2\ÌõX?Eøñ˝/n\∆¡\√∆•∏Xı∂ûüÇ\–\—StipΩﬂΩ≥Ûø~\≈W\ÍØ\’Nõıoı\·¸Ç\◊\›m—ºê=≠ˆÅ≥o\Ó#\Á<≥£^`í\Ì\«\¬]\n,π8Œõ\rí9˝g7\ÎGL\…\ƒ«≥\Ïî8~Øv°ﬁ£!\«g¯/§«µq9‚´ØÙ˙\ŒoH\ÍM\… ´\›È∞∫óí?\—\ÿ◊πªˇ\0Æ∫ØÒÅüü\“˛•˙\›+s	Ù\ŸeåÂï∏{ü¸ù\Œˆ\Ô^i˛.˙∑[o\÷\Ï*ÒÆ≤\∆\‰ønMdí\◊Wc\ﬁﬂ£˙?ßΩ63îvM=\Ô\‘?≠πùm\÷Ù^Æ◊é•à´\À\⁄CΩßk\Ÿ|\rµ\ﬂ[ø\Ì\’\›c\⁄mÆ^\"∆í◊èV}åm=rÅ@\ÿ-k\ﬂsZ\0qˇ\0`o”≥˘oWi\”+ =á\ÊB õî\◊\Ín\rsL<\rÆ\Õ`x˜h÷ñüsﬂª˘∫ˇ\0\œYÓõùπÇúô\‹6˝5\⁄\◊7˛\›d÷´ZC!Æä©\…mni&\∆\È¨†˜ˇ\0Çg˙O\œX\÷f\“\Ì\¬\ Yqçˆ5\—¡sG¯Éß˛\‹ANï,-\¬\»w•sKú\ﬁLó\0Z=åˇ\0äﬂ£∑˝J™ˆÙ\ÿ\Ô^»∏æ}\⁄9Øˇ\0®jI)ˇ—π\÷h7ı<\«\›\”+{Yi{¨¬≥‘æ∑ü\—\◊u\Ìü\÷zï≠mo¿\√\€\È\·ˇ\0>Ùl¨åöqsl§Ω\Õ\¬\Í\0˛çÕá]é7\⁄\ÁøˆáRˇ\0o\ÍxãB˛ê-\…\Õn>%~•vd4v_[ö\Á7\◊ˆ\‹\…ın\»›∂¸Ø˝\ƒ[X\ﬂWrn≤\ÀU6N\Íú˜\ÔmO©ÅµÜ?sj≥ˆ~Ø_–ßˇ\0).ÇÉ÷ø\Zß\‹\Ê∫\◊1•\Ó`!Ö\ƒ{çmøg\Ó\ÓT≥(æ\⁄21\Ì˚5˜µ\œ≈∏¥8\‰∫Z\Ìñ-\n\ÿ+≠¨∏0Àåì\ZKú±~≤}e\Ë}∂7®\⁄EÆp,eZ\⁄\ﬂ¯]øö\‘¿	:%Û˛ôıÀ¨˝Y\Õ\…\Ëˇ\0[qﬂóE\Ó%\‚\œq˜}\'\–l˝F5ø\Ë\◊Aıs\ÎG\‘Vu≤Ù,≥\Â\‰±\ÓV^X7˙\rtón\Ê±k3™˝Z˙¡é)\»~\'S´ê\◊\ÌmÉ˙\‘dl{˝D|´?W0/nVGey;´≥hñüΩ\Ôv\œ\Ïß\»\ƒ\Ô%¯!ªÉMû•ùK7Ùo{}≠?ò\œ4≤3~«âfKá\È≤\Ëk<Òˇ\0ö\ﬂ{–≥s\Î≠ﬂßpµ\Ì’ò’ôh=ù}ã#\"Ïõç◊ªs¯£Z?uÅFî@§8\Ó.%\œ\'ªéÆr6&3≤≤Yé\ﬂ\Œ2Û\‡\—ÙäZ\Á81Äπ\Ó0÷éI]/J\È\ﬂc®∫\»7\ŸÙ\»\‡’µ7=6z~ú{#lypíöH©ˇ\“ı\nÒ®™\ÀmÆ∞\€/!÷º\r\\@\⁄\›\«˘-DNíJq:ßH\Îπ\œ{h\ÎN¡°\‹2öº¯˜π\Œ\\ûG¯∂\È,Ωˆı<û•ûÚe÷ç°Æ?\ p\‹ı\Ë\È)#\«˙?ÛQ£¡\·t_™]:\'K•÷∑QfQ6º˙\‚\—\»\ÍyY\Z>\“˚çˆè˙>Âªõ¡˛çˇ\0]\Âf~w˝\Á¶Kã≠˝R\Âá\Ìnæ\rnøë\\\≈\ÈY\Ÿ$\œIáÛ\Ï\”¸\÷}%ªÖ¿˛èˇ\0YWtSO•\„\·\rÕó\⁄~ïé\Á˚?∫\’q$ëRíI$îˇ\0ˇ\Ÿˇ\ÌPhotoshop 3.0\08BIM\0\0\0\0\0\0\0j\08BIM%\0\0\0\0\0 £rM0»£\Â˝\ÈﬂÉˆ18BIM/\0\0\0\0\0JÉ\0X\0\0X\0\0\0\0\0\0\0\0\0\0{\Z\0\0ò\0\0äˇˇˇúˇˇˇÒ\Z\0\0¸\0\0\0{\0\0\‡\0\0\0\'\0llun\0\0\0\0\0\0\0\0\0\08BIM\Ì\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?Ä\0\08BIM\r\0\0\0\0\0\0\0\0x8BIM\0\0\0\0\0\0\0\08BIMÛ\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\n\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMı\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0°ôö\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM¯\0\0\0\0\0p\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\Ë\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\Ë\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\Ë\0\0\0\0ˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇˇ\Ë\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0\0\0V\0\0\0\0f\0i\0l\0m\0e\0t\0r\0i\0c\0s\0_\0i\0c\0o\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0:\0\0\0\0Rghtlong\0\0\0V\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0:\0\0\0\0Rghtlong\0\0\0V\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0\Ê\0\0\0\0\0\0V\0\0\0:\0\0\0\0:\Ë\0\0\ \0\0ˇ\ÿˇ\‡\0JFIF\0\0\0H\0H\0\0ˇ\Ì\0Adobe_CM\0ˇ\Ó\0Adobe\0dÄ\0\0\0ˇ\€\0Ñ\0			\n\r\r\rˇ¿\0\0:\0V\"\0ˇ\›\0\0ˇ\ƒ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"qÅ2ë°±B#$R¡b34rÇ\—C%íS\·Òcs5¢≤É&DìTdE¬£t6\“U\‚eÚ≥Ñ\√\”u\„ÛF\'î§Ö¥ï\ƒ\‘\‰Ù•µ\≈\’\ÂıVfvÜñ¶∂\∆\÷\Êˆ7GWgwáóß∑\«\◊\Á˜\05\0!1AQaq\"2Åë°±B#¡R\—3$b\·rÇíCScs4Ò%¢≤É&5\¬\“DìT£dEU6te\‚Ú≥Ñ\√\”u\„ÛFî§Ö¥ï\ƒ\‘\‰Ù•µ\≈\’\ÂıVfvÜñ¶∂\∆\÷\Êˆ\'7GWgwáóß∑\«ˇ\⁄\0\0\0?\0ıTì/?˙ˇ\0ı˚\Ï˙OJ\Î_G\"ˆ˛g¸\À˝˜£ô\Z\nz¨_]˙\'A\›]∂z˘C˛\”\÷dè¯\«}\Z◊ûıOÒØ\◊Ú\\\·Ñ\⁄\Í<mù˛{\◊m∂ZÛeé.såíu2V\«’Ø™=[\Îß\Ï≠\·\÷b\Ï\Àt≠±\À[˛ñ\œ\‰µY°r\◊\Õmì≥üÆ?YØ;≠\ÍWèÉ\À\Í6´˝\'#¸bgê˛ö¸˚[\⁄\¬\Á6ø˚rˇ\0bÙ_´ˇ\0Q˛ÆÙ¶∂\⁄q~ﬂê\ﬁsrÄâˇ\0ÇcΩåoı∑2jØ1°Ç¶\⁄.\€\Ÿ\‘\…eé—à˙¶ûC•;¸ec˚C?µék\…p{˛¸`\’\÷\·uä\Õ-neµØ\Œn8{õ\Â∑sw™UtJl\»ñ´\Î{b\»˛I˙.˛∫\€\«\ƒ\«\∆n\⁄;ë\…¯πBe}\0ÚJF<=°\¬@>\"\ní∑2¶ó;∂∞9è≥K\\Z¡ªC$ó!†no\”o\—AM¥ñ}VìEƒáÄ€Ñ\◊	˜3\Ë{∑=øü\Õˇ\0\÷\“IOˇ\–Ìæ∫}b¢\Ÿ{\Î7MX\„˘D{¨ˇ\0≠µx=∂\Ÿmé≤\¬\\˜í\\N§íΩ¸bé°◊æ≥ìÇô\”\Ëµ\œpel\ﬂ\Ó}∂Ω\ﬂı∫\€˘\Ô\\ˆ’¨J´±ùs\Ìôo Rd±Å\„u[\ÿ\ﬂ\“_ùëˇ\0i3˘\€’úF0çùŒ´N≠o™?V\Ó˙\…\÷Ç\“YçXı2\ÌõX?Eøñ˝/n\∆¡\√∆•∏Xı∂ûüÇ\–\—StipΩﬂΩ≥Ûø~\≈W\ÍØ\’Nõıoı\·¸Ç\◊\›m—ºê=≠ˆÅ≥o\Ó#\Á<≥£^`í\Ì\«\¬]\n,π8Œõ\rí9˝g7\ÎGL\…\ƒ«≥\Ïî8~Øv°ﬁ£!\«g¯/§«µq9‚´ØÙ˙\ŒoH\ÍM\… ´\›È∞∫óí?\—\ÿ◊πªˇ\0Æ∫ØÒÅüü\“˛•˙\›+s	Ù\ŸeåÂï∏{ü¸ù\Œˆ\Ô^i˛.˙∑[o\÷\Ï*ÒÆ≤\∆\‰ønMdí\◊Wc\ﬁﬂ£˙?ßΩ63îvM=\Ô\‘?≠πùm\÷Ù^Æ◊é•à´\À\⁄CΩßk\Ÿ|\rµ\ﬂ[ø\Ì\’\›c\⁄mÆ^\"∆í◊èV}åm=rÅ@\ÿ-k\ﬂsZ\0qˇ\0`o”≥˘oWi\”+ =á\ÊB õî\◊\Ín\rsL<\rÆ\Õ`x˜h÷ñüsﬂª˘∫ˇ\0\œYÓõùπÇúô\‹6˝5\⁄\◊7˛\›d÷´ZC!Æä©\…mni&\∆\È¨†˜ˇ\0Çg˙O\œX\÷f\“\Ì\¬\ Yqçˆ5\—¡sG¯Éß˛\‹ANï,-\¬\»w•sKú\ﬁLó\0Z=åˇ\0äﬂ£∑˝J™ˆÙ\ÿ\Ô^»∏æ}\⁄9Øˇ\0®jI)ˇ—π\÷h7ı<\«\›\”+{Yi{¨¬≥‘æ∑ü\—\◊u\Ìü\÷zï≠mo¿\√\€\È\·ˇ\0>Ùl¨åöqsl§Ω\Õ\¬\Í\0˛çÕá]é7\⁄\ÁøˆáRˇ\0o\ÍxãB˛ê-\…\Õn>%~•vd4v_[ö\Á7\◊ˆ\‹\…ın\»›∂¸Ø˝\ƒ[X\ﬂWrn≤\ÀU6N\Íú˜\ÔmO©ÅµÜ?sj≥ˆ~Ø_–ßˇ\0).ÇÉ÷ø\Zß\‹\Ê∫\◊1•\Ó`!Ö\ƒ{çmøg\Ó\ÓT≥(æ\⁄21\Ì˚5˜µ\œ≈∏¥8\‰∫Z\Ìñ-\n\ÿ+≠¨∏0Àåì\ZKú±~≤}e\Ë}∂7®\⁄EÆp,eZ\⁄\ﬂ¯]øö\‘¿	:%Û˛ôıÀ¨˝Y\Õ\…\Ëˇ\0[qﬂóE\Ó%\‚\œq˜}\'\–l˝F5ø\Ë\◊Aıs\ÎG\‘Vu≤Ù,≥\Â\‰±\ÓV^X7˙\rtón\Ê±k3™˝Z˙¡é)\»~\'S´ê\◊\ÌmÉ˙\‘dl{˝D|´?W0/nVGey;´≥hñüΩ\Ôv\œ\Ïß\»\ƒ\Ô%¯!ªÉMû•ùK7Ùo{}≠?ò\œ4≤3~«âfKá\È≤\Ëk<Òˇ\0ö\ﬂ{–≥s\Î≠ﬂßpµ\Ì’ò’ôh=ù}ã#\"Ïõç◊ªs¯£Z?uÅFî@§8\Ó.%\œ\'ªéÆr6&3≤≤Yé\ﬂ\Œ2Û\‡\—ÙäZ\Á81Äπ\Ó0÷éI]/J\È\ﬂc®∫\»7\ŸÙ\»\‡’µ7=6z~ú{#lypíöH©ˇ\“ı\nÒ®™\ÀmÆ∞\€/!÷º\r\\@\⁄\›\«˘-DNíJq:ßH\Îπ\œ{h\ÎN¡°\‹2öº¯˜π\Œ\\ûG¯∂\È,Ωˆı<û•ûÚe÷ç°Æ?\ p\‹ı\Ë\È)#\«˙?ÛQ£¡\·t_™]:\'K•÷∑QfQ6º˙\‚\—\»\ÍyY\Z>\“˚çˆè˙>Âªõ¡˛çˇ\0]\Âf~w˝\Á¶Kã≠˝R\Âá\Ìnæ\rnøë\\\≈\ÈY\Ÿ$\œIáÛ\Ï\”¸\÷}%ªÖ¿˛èˇ\0YWtSO•\„\·\rÕó\⁄~ïé\Á˚?∫\’q$ëRíI$îˇ\0ˇ\Ÿ8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\03\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0ˇ\·\Ãhttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"Ôªø\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c036 46.276720, Mon Feb 19 2007 22:40:08        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:xap=\"http://ns.adobe.com/xap/1.0/\" xmlns:xapMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" dc:format=\"image/jpeg\" xap:CreatorTool=\"Adobe Photoshop CS3 Windows\" xap:CreateDate=\"2013-01-25T10:17:08-08:00\" xap:ModifyDate=\"2013-04-08T16:16:22+08:00\" xap:MetadataDate=\"2013-04-08T16:16:22+08:00\" xapMM:DocumentID=\"uuid:C05434581B67E211AE5194F81EB48984\" xapMM:InstanceID=\"uuid:6E7A6B8424A0E2119908CDF11B7FB58B\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" photoshop:History=\"\" tiff:Orientation=\"1\" tiff:XResolution=\"720000/10000\" tiff:YResolution=\"720000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;70DB372FD07091AEE6C7B35F9D854FF5\" exif:PixelXDimension=\"86\" exif:PixelYDimension=\"58\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;4D1D621C0E1DC13CED4B3DFCDDEF5D79\"> <xapMM:DerivedFrom stRef:instanceID=\"uuid:9E89D0641A67E211AE5194F81EB48984\" stRef:documentID=\"uuid:9E89D0641A67E211AE5194F81EB48984\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ˇ\‚XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \Œ\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0ˆ\÷\0\0\0\0\0\”-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0Ñ\0\0\0lwtpt\0\0\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\ƒ\0\0\0àvued\0\0L\0\0\0Üview\0\0\‘\0\0\0$lumi\0\0¯\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0ÛQ\0\0\0\0\ÃXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o¢\0\08ı\0\0êXYZ \0\0\0\0\0\0bô\0\0∑Ö\0\0\⁄XYZ \0\0\0\0\0\0$†\0\0Ñ\0\0∂\œdesc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0§˛\0_.\0\œ\0\Ì\Ã\0\0\\û\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\Ámeas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0è\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0Å\0Ü\0ã\0ê\0ï\0ö\0ü\0§\0©\0Æ\0≤\0∑\0º\0¡\0\∆\0\À\0\–\0\’\0\€\0\‡\0\Â\0\Î\0\0ˆ\0˚\r%+28>ELRY`gnu|Éãíö°©±π¡\…\—\Ÿ\·\ÈÚ˙&/8AKT]gqzÑéò¢¨∂¡\À\’\‡\Îı\0!-8COZfr~äñ¢Æ∫\«\”\‡\Ï˘ -;HUcq~åö®∂\ƒ\”\·˛\r+:IXgwÜñ¶µ\≈\’\Âˆ\'7HYj{åùØ¿\—\„ı+=OatÜô¨ø\“\Â¯2FZnÇñ™æ\“\Á˚		%	:	O	d	y	è	§	∫	\œ	\Â	˚\n\n\'\n=\nT\nj\nÅ\nò\nÆ\n\≈\n\‹\nÛ\"9QiÄò∞\»\·˘*C\\uéß¿\ŸÛ\r\r\r&\r@\rZ\rt\ré\r©\r\√\r\ﬁ\r¯.Idõ∂\“\Ó	%A^zñ≥\œ\Ï	&Ca~õπ\◊ı1Omå™\…\Ë&EdÑ£\√\„#CcÉ§\≈\Â\'Ijã≠\Œ4VxõΩ\‡&Ilè≤\÷˙AeâÆ\“˜@eäØ\’˙ Ekë∑\›\Z\Z*\ZQ\Zw\Zû\Z\≈\Z\Ï;cä≤\⁄*R{£\ÃıGpô\√\Ï@jîæ\È>iîø\Í  A l ò \ƒ !!H!u!°!\Œ!˚\"\'\"U\"Ç\"Ø\"\›#\n#8#f#î#\¬#$$M$|$´$\⁄%	%8%h%ó%\«%˜&\'&W&á&∑&\Ë\'\'I\'z\'´\'\‹(\r(?(q(¢(\‘))8)k)ù)\–**5*h*õ*\œ++6+i+ù+\—,,9,n,¢,\◊--A-v-´-\·..L.Ç.∑.\Ó/$/Z/ë/\«/˛050l0§0\€11J1Ç1∫1Ú2*2c2õ2\‘3\r3F33∏3Ò4+4e4û4\ÿ55M5á5\¬5˝676r6Æ6\È7$7`7ú7\◊88P8å8\»99B99º9˘:6:t:≤:\Ô;-;k;™;\Ë<\'<e<§<\„=\"=a=°=\‡> >`>†>\‡?!?a?¢?\‚@#@d@¶@\ÁA)AjA¨A\ÓB0BrBµB˜C:C}C¿DDGDäD\ŒEEUEöE\ﬁF\"FgF´FG5G{G¿HHKHëH\◊IIcI©IJ7J}J\ƒKKSKöK\‚L*LrL∫MMJMìM\‹N%NnN∑O\0OIOìO\›P\'PqPªQQPQõQ\ÊR1R|R\«SS_S™SˆTBTèT\€U(UuU\¬VV\\V©V˜WDWíW\‡X/X}X\ÀY\ZYiY∏ZZVZ¶Zı[E[ï[\Â\\5\\Ü\\\÷]\']x]\…^\Z^l^Ω__a_≥``W`™`¸aOa¢aıbIbúbcCcóc\Îd@dîd\Èe=eíe\Áf=fíf\Ëg=gìg\Èh?hñh\ÏiCiöiÒjHjüj˜kOkßkˇlWlØmm`mπnnkn\ƒooxo\—p+pÜp\‡q:qïqrKr¶ss]s∏ttpt\Ãu(uÖu\·v>võv¯wVw≥xxnx\Ãy*yây\ÁzFz•{{c{\¬|!|Å|\·}A}°~~b~\¬#Ñ\ÂÄGÄ®Å\nÅkÅÕÇ0ÇíÇÙÉWÉ∫ÑÑÄÑ\„ÖGÖ´ÜÜrÜ◊á;áüààiàŒâ3âôâ˛ädä ã0ãñã¸åcå ç1çòçˇéféŒè6èûêênê÷ë?ë®íízí\„ìMì∂î îäîÙï_ï…ñ4ñüó\nóuó\‡òLò∏ô$ôêô¸öhö’õBõØúúâú˜ùdù“û@ûÆüüãü˙†i†ÿ°G°∂¢&¢ñ££v£\Ê§V§«•8•©¶\Z¶ã¶˝ßnß\‡®R®ƒ©7©©™™è´´u´\È¨\\¨–≠D≠∏Æ-Æ°ØØã∞\0∞u∞\Í±`±÷≤K≤¬≥8≥Æ¥%¥úµµä∂∂y∂∑h∑\‡∏Y∏—πJπ¬∫;∫µª.ªßº!ºõΩΩèæ\næÑæˇøzøı¿p¿\Ï¡g¡\„\¬_\¬\€\√X\√\‘\ƒQ\ƒ\Œ\≈K\≈\»\∆F\∆\√\«A«ø\»=»º\…:…π\ 8 ∑\À6À∂\Ã5Ãµ\Õ5Õµ\Œ6Œ∂\œ7œ∏\–9–∫\—<—æ\“?\“¡\”D\”\∆\‘I\‘\À\’N\’\—\÷U\÷\ÿ\◊\\\◊\‡\ÿd\ÿ\Ë\Ÿl\ŸÒ\⁄v\⁄˚€Ä\‹‹ä\››ñ\ﬁﬁ¢\ﬂ)ﬂØ\‡6\‡Ω\·D\·\Ã\‚S\‚\€\„c\„\Î\‰s\‰¸\ÂÑ\Ê\r\Êñ\Á\Á©\Ë2\Ëº\ÈF\È\–\Í[\Í\Â\Îp\Î˚\ÏÜ\Ì\Ìú\Ó(\Ó¥\Ô@\Ô\ÃX\ÂÒrÒˇÚåÛÛßÙ4Ù\¬ıPı\ﬁˆmˆ˚˜ä¯¯®˘8˘\«˙W˙\Á˚w¸¸ò˝)˝∫˛K˛\‹ˇmˇˇˇ\Ó\0Adobe\0d@\0\0\0ˇ\€\0Ñ\0		\n\n				\r\n	\n\rˇ¿\0\0:\0V\0ˇ\›\0\0ˇ\ƒ¢\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"qÅ2ë°±B#¡R\—\·3b$rÇÒ%C4Sí¢≤cs\¬5D\'ì£≥6Tdt\√\“\‚&É	\nÑîEF§¥V\”U(\ZÚ\„Û\ƒ\‘\‰ÙeuÖï•µ\≈\’\ÂıfvÜñ¶∂\∆\÷\Êˆ7GWgwáóß∑\«\◊\Á˜8HXhxàò®∏\»\ÿ\Ë¯)9IYiyâô©π\…\Ÿ\È˘*:JZjzäö™∫\ \⁄\Í˙\0m\0!1AQa\"qÅë2°±¡\—\·#BRbrÒ3$4CÇíS%¢c≤\¬s\“5\‚DÉTì	\n&6E\Z\'dtU7Ú£≥\√()\”\„ÛÑî§¥\ƒ\‘\‰ÙeuÖï•µ\≈\’\ÂıFVfvÜñ¶∂\∆\÷\ÊˆGWgwáóß∑\«\◊\Á˜8HXhxàò®∏\»\ÿ\Ë¯9IYiyâô©π\…\Ÿ\È˘*:JZjzäö™∫\ \⁄\Í˙ˇ\⁄\0\0\0?\0˚˜æ*\ÍåUÒ\œ¸\‰7¸\Ê\Ô\‰Ø¸\„»∫\”5ç[¸O\Á8W\·Úéí\ÍÚ\ƒ›Ö\‘€§?#Vˇ\0\'34∫∫É\Èw±î\ƒ_è?ôˇ\0Ûıøœø4\‹\‹¡\‰;]/Úˇ\0Hz¨\"\⁄uw«•Zy\ÎF\Ô†\Õˆ\ƒ\∆¨\€A\Ãz>BÛ¸\Ê¸‰∂Ω!π\’ˇ\0;¸\—&É\—\‘\’~\\`Ù\«\‹3;˘;N?Ñ5ÒÀΩ\Î_ï\Z˜¸¸CÛHoø+5\Õ}v\”cµ%\Õ\ƒ\Zw\Ã\‹\Í%a?écfÜÜP\rÉåøKˇ\0*Æ?\Á\‰˛Uñ¸\…¸\⁄¸´≥\”c\n\◊\ZWõÆìQæaµWûï\Z0oà\”4∫âh»∏v\ÿ8˙øC<ó˘≈¶À§Y\⁄˘\„\Ã:«úò∑÷¨¸™ó\◊V¨µ¢ƒ±wk∂j\ÂW\È\‰\⁄\◊gwıºwP¨â¢™≤£FÙ˜V\0èß¢â¶¯´UqWˇ\–˚˜ø∂*¸|ˇ\0ú˝ˇ\0ú˘?óßU¸õ¸ü\‘¿ÛÄ\rm\Ê\Ô6[0&¿ëÒZZ∞\È(˜è˚e~*ï\‹ˆofú«é|æˆúô+`˛~µ=SP\÷/n5\rN\Í[\€À©\ZYÁôô›ùçK31$ízìù\\b\"(\rúcª\È/˘∆Ø˘\ƒ\Õo˘\…\›V\‡˘N\⁄//yGêßôˇ\02µpSL¥+ª\≈5\ƒ¡z¢\Z/Ì≤å\¬\÷vÜ-8 \Ó{É8¿\…˚\«ˇ\08ˇ\0ˇ\08Aˇ\08\Ì˘A¶´°yø4º\’h†\Õ˘ó\Áå\¬d^Øeo*ò°JÙÙ\„&ü∂\›sò\‘ˆé\\\Ê…°\–&8\ƒC\ÍØ2i6w∂Ç\…=-F+%0˝KÀ∫˘∂1Pn¶$åE)F\Ã`ºüL¸í\—ı\r~;u˘\Ï ∑]GGø∂X5UéªzN?w\"ûÜE|Ú ´\Í/yS\À˛Uµöïü\0íTZ\À!ïíCVcÛ8iQzÆØi£€Ω\≈\ÀsÙ\–\»\–!S\Zê¬í>®,zä±][\ŒrZ\‹<V\Ôs˚´Öâaçgï\Ó!\È\Z\'¨úöTbQzëÒ\Z(\›TáJ‘¶óDÛ3 öÑp\⁄˘ím4÷óâÆ\‡b∞7™^TJôj#û>öö™ˇ\0ˇ\—˙Éˇ\09•ˇ\09\r¸\„Ø‰æØ\Ê)˘ø\Ã|Ùè&@X∑2!2\\ë‘à\‚€ø\ﬂ34:o(èN¨g.˛L5=Nˇ\0Xæª\‘ı;ô.ÔØ•yÆÆ%b\Ó\Ô#ffbI$öís∏åDEA\√\Ê˙;˛q#˛qªWˇ\0ú°¸\‡\”<Öo,\⁄wï4∏\◊U¸\√Û#\‚≥\”∏˙Q5\\∑\Ó\„ØOâˇ\0g0ªCX4\ÿ\Ïs;X\„\ƒ_‘èñºë\‰ˇ\0,i6>EÚ÷ëk\Âø\ \ﬂ\À;X\Ì\‚\–\Ìî$\‹F¢JKM\›bÚ\›\‰5j\”8©\ŒSëî∑%\À\·ﬂúæEÛü¸\ÂüÂüû<ô\Â\Õdy\Àw∞¢˘7\Ãeßä\‡\ÍñS£§Æ egÅî<r\'J™FOOò\‚\»%WK!büóûaˇ\0üU~~~[\ÿ\À\Áü\…ŒªO7˘\«B≠\Ài\Z|óZ%Û»£ì-•\‘w\'®we\‚°;\Ê\Ó=ØégÜp\'õOÑG\"˙ü˛p7˛r\œ\Œ?ü7Z\Ô\‰G\Á=é°\Êﬂê!ö\„D¸¿k7ä‰µ´˙s\€\ÍA$7Pæ\Ã	Uïj\‰7\√\Ì1TÒõåôcô;\Í◊óuIµ]<=\‰k•g#\⁄j∂\Î\—.!<_è˘-≥/±\Õ[kœø3ÆR\ﬁ{hµ4O©]C-ıùå7ê©∏\„qºn\À#8˝\‹KÚ¯ü\·\\U\‰&Mv^\ /˘\…eà-Üü®∑%ä9c©P\0\ZÚ\‰u°ä1ä≥ù\Z\ X<ó\Á£°yä\—\ÔØ-^y˝in¢éHíê[‘òlPU\nP3A\»“ßˇ\“O˛~)üˇ\0\Á!\Á%\„¸õÚ\\\Èˇ\0îæXãPÛ\r\›ı\‹vZvùıˆYgªªûS\≈j\Z(ëTv<QI9\–vfHi±xí\Á.üéç9ëß\«^Iˇ\0úlÚûëßjˆü≠\Ê\Ô y\⁄˘\Ì\‡Ú\‹I¶I5Üöó±,∂~¥~˛ÛUΩÖÆúúJ(ıg\‚µó®\Ì%éå|˙Ù˘[\„\Ë_\–\Á¸\‚Ø¸\‚ó\Âø¸\‚ﬂîµ=/\»\“j⁄ñ£\Ê\È-\ÔºÀØ\Î\Õ_\ŒÒE\∆8ôbDXñ>G\‡bN\Á9˝^Ø&¢W3…æ0\‰\ ¸\Ôy%è\‰\Ôõo£õÉ\‹\\^5˝\≈hP=\€#í}Ä|\√,ü-\œ¿<˚\Á\ﬂ\ o˘\¬\Ê\÷(ç÷úÛ6ëß\Í\⁄÷ûf±\“\Ó\–˙≥´(\‰Åﬂäß/|U¯uˇ\0>\Ó¸\ÿ¸\Î∂ˇ\0ú∂¸≥\”<Ø\ÊcX¥Û~§m<Ò¢<\“\Õks•≤3\›Oq,Ä¬£ö\»ECæÙ%_\”]˝ùæâ˘\ﬂ\Âx4SOá^≤øæÛ-çö$0\‹‹∏?\Èw)Ø´3ß9*\‘bMû|ï\È˙5#Û7õ\‚èdf≤ô\‘tı¨~d(\≈Xgü¸\≈\rŸáI\—|\Èc§\‹\ÿ\À4öÕØ$˝Á¢úÖΩ\≈\∆\‚\ﬁ#˛\Ì s#\·Zäæj\‘|\Â§]\‘‘ºΩ¶yÇx∏%æ´h≠ekx`-¡\ÂâM~´`bÉ£\ JúA^∑i¶Î∂üê:¶¶öç\Á¯èTT◊¶\‘˝F7\ÃSÉRvåc\·SjaWˇ\”\È?úz,æ`¸\Õ¸\≈\‘5Ø\»\Õ/R≥”µ\ÈÔÆµè\À\ÌTj^a“Ødamk}®ƒ≤2\Í\Z\›\¬$Ri\÷<=;5\Â<õÆl∞\‰\‡\0Ò~/ÉY›åyg\Ã˛a¸ª’≠&Úß\Ê4VZóóg\‘/,ˇ\0,?3£ò˛åû–§∑ ö\Ïë\‹FJ<\“.ß´\Âï~ßhWz\Ÿ(É\ZØñ\Í=\Ô\€\œ+\‹jw~ZÚ˝ﬁ≥ue{´\›i∂≥jwötr\√g-ƒë+Jˆ\—\ŒZEå±%û@Rª\ÊÆUfõÃºﬂ¢\Î⁄¶Ö˘Å˘y\Â\ﬂ0(yãÃ∂77\ﬁDÛ+\€\≈s2éLLR´£˙SP≤“ºZ£¶1†Aê±‹Ø\ƒo\À_˘\Ão\ŒO˘\≈_:˘\ÁÚO˛s/\ :óü<π\ÊK\È\Ê\’\"\‘\ \‹ øX¯f∏”û\Á˜7∂7\‚Ùπ|\'\Ï\”u\ÕˆM=\\P=\Õf\'\‘˙˜˛q\”˛r˛pZ\√Û˘O˛q\ÔÚêyK\Œ\ﬁq”ØÆ-\Ó \“ ∞{\È¨\”\÷˝\Õ#ø9T3\"/\¬x“ï†\Õnß≥≤\‡âîÜ¡∞d˜◊ítmEu\rgÛK\œh4≠F˙ÿ≠ïÑ≠ˇ\0˝=@jH\Ÿb\0®\Í>d\Ê\0fﬁø\ÁA\‰ü)\Íæj∫Ñˇ\0à<\€p\Õ\Â\Õ\œ\ÔYäµWÑqÅ$á∂˝´\‚®\‚uÇH\Ó¶7ì\\O%\’¸\Ô˛Óπïπ\…!\Ïvˆ è©Y7ï<π?õ¸≈¶yv\‹7˙kÛøï\›Vë\Ô3ì⁄£\·\Á\r\’˙˙>\”\ÍKÙ\ÍW˙Ø\’\È˙<xqßá≤\’ˇ\‘Ù&π˘Höøòˇ\04-<π˘y•˛î\—ıè6\⁄\≈/ñl|…¶\œm=›∏\‘£ø∑\Ên.ØDÖ./\nÜ\‚\ﬂS¥ÿñ\¬|1j\«\„o&o¶¸πˇ\08Ò\Ê-i4ΩGP÷Ø¥]Ui˛∑°\‹^\ﬁ˝v\ﬂH\‘4õh\·∂Ky˝D∑õNºÜ∂±1tÖK;s∏<\≈\'.ﬂè\∆\Èß\⁄:}¢iˆ6Z|sMrñ0Gnó2fêD°\…#n\ÃiROSò\÷\…Û¸\‰ó¸\‰ó\‰‰ñü¶[˛eyÜXµõ´®\ﬂL\“ÙR≥\Íˆï\€\ÎÇ0¿∆à?ò¸_d\‹fVüIì9®2êè6i˘´ˇ\08\”ˇ\09\Â\Ëto3j>@¸\Ë\—¿\rÆ†ˆv∫î%éﬁ¶ù©òeâ…†¨l=0úYÙÚ\‰b∂)Ú?¸\„/¸\„ü\Â÷Ωg\Êø\À\ﬂ˘\∆˝?GÛNõ)∏“µÉi\n\Àm-\◊\…\ÈöBÉ#ìWñb•+	ó˘\œ\œv:lıÛ\Ã\Z\›˝õ	tˇ\0#ií∂äU5I5¢(\≈N\·)\◊p≠\‘cA/ô¸\√\Êg\Õ:¥∫ﬁΩx/5S\nÄ¨–ì_F\›	¯Wƒù\ÿı •+T™..\Ó-\Ï\Ï\ÌÂºæºêEgeññW=W˙\Ï¯\Í˚{Ú´Ú\ËyKí\ÁPÙ\ÊÛ&¨µ)c\›!ånñ—û\·;ü\⁄;¯e¿RΩ^æ\«\nøˇ\’˚¡ßyoA\“5\rsW\”4´{-SÃ≥EqØ\Í ^Kbög\Í\‹ZÙ0íO¡S≠æ]+\Ê/\Õ\ /\œ_?]\Í˙¸\‰\’˜Âüñ\ÔK,\ZfÅ\Â´æço\“\…%i\›Us\"9qD}}ˇ\0¢ëE˘Û\Ê/˘ˆ\œ\ÂEÜπ´˛jy\”Û£ÛR˛Y\◊\⁄Ù\÷+{Ü\"§\…*,í”±5\€3£\⁄\Ÿb*4\„\‹\√\√ˇ\0…øìÛâüñFÚg\‰/óÆuãf\Á±\Á	e\÷oQ’É+∫\‰ÇiL\√ÀÆ\Õ3fEêà{/ò?3|\’\Ê ^\Î\Ô\rã¶\¬—ñ\“?\ }3ÕÖ<[0ã&ì\ƒ\Âm†\"VØ\Ó\Ìm¡ïâ>bIÒ\Îë\0ïzGñ*ºÒÊáç\„“õC”úéZû®[Ò¡˝\„}41ı}]\‰?\À/˘6û€û•≠Œºnıªê=R;§j6ç=á\“NL\nW§W\ÿ\·WW\ÿ\‚Øˇ\÷˚˘äªv*\—Ìäº∑\Œ_fo˘C~\œ˝.æ\ﬁ*Ò˝˙ˇ\0\‰ß\Í?^*˜\œ&}òˇ\0\Â˚˛8_kz>*\ÏUÿ´±Wˇ\Ÿ','image/png',1,1,'2017-11-23 05:07:17');
/*!40000 ALTER TABLE `mstr_products_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_promo_image`
--

DROP TABLE IF EXISTS `mstr_promo_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_promo_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_promo_id` int(11) NOT NULL,
  `promo_image` longblob NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_mstr_promo_id_idx` (`mstr_promo_id`),
  CONSTRAINT `fk_mstr_promo_id` FOREIGN KEY (`mstr_promo_id`) REFERENCES `mstr_promos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Products Per Company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_promo_image`
--

LOCK TABLES `mstr_promo_image` WRITE;
/*!40000 ALTER TABLE `mstr_promo_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `mstr_promo_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_promos`
--

DROP TABLE IF EXISTS `mstr_promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_promos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `promo_code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `promo_image` longblob,
  `is_active` int(1) DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_company_id_UNIQUE` (`mstr_company_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Promos Per Company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_promos`
--

LOCK TABLES `mstr_promos` WRITE;
/*!40000 ALTER TABLE `mstr_promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mstr_promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_user`
--

DROP TABLE IF EXISTS `mstr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_user_account_id` int(11) NOT NULL,
  `ref_login_level_id` int(11) NOT NULL,
  `ref_company_role_id` int(11) NOT NULL,
  `user_name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `email_address` varchar(60) NOT NULL,
  `mobile_registration` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `login_hash` tinytext CHARACTER SET latin1 NOT NULL,
  `last_login` int(11) NOT NULL,
  `is_password_changed` int(1) NOT NULL DEFAULT '0' COMMENT '1 - Already Change\n0 - Not Yet Change',
  `is_representative` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Representative\n0 - Not Representative',
  `is_email_confirmation` int(1) DEFAULT '0' COMMENT '1 - Confirmed\n0 - Not Confirmed',
  `login_used` varchar(50) NOT NULL DEFAULT '0' COMMENT '1 - Mobile User\n0 - Not Mobile User',
  `token` varchar(20) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mstr_user_account_id_UNIQUE` (`mstr_user_account_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`),
  KEY `fk_mu_mstr_user_account_ID_idx` (`mstr_user_account_id`),
  KEY `fk_ref_company_role_idx` (`ref_company_role_id`),
  CONSTRAINT `fk_mu_mstr_user_account_ID` FOREIGN KEY (`mstr_user_account_id`) REFERENCES `mstr_user_account` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_user`
--

LOCK TABLES `mstr_user` WRITE;
/*!40000 ALTER TABLE `mstr_user` DISABLE KEYS */;
INSERT INTO `mstr_user` VALUES (1,1,1,1,'admin','admin@yahoo.com','','admin','0',0,1,1,0,'0','0',1,0,'2017-10-11 01:11:03'),(2,2,1,1,'test','test@yahoo.com','','test','0',0,0,1,0,'0','0',1,0,'2017-11-17 08:18:11'),(6,6,1,1,'testrtyu','testtest@yahoo.com','','test','0',0,0,1,0,'0','0',1,0,'2017-11-20 07:55:04'),(16,5,1,4,'joward12@yahoo.com','joward12@yahoo.com','','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F','0',0,1,0,0,'0','0',1,1,'2017-11-21 09:54:32'),(20,7,1,1,'tyui','tsettset@yahoo.com','','567890','0',0,1,1,0,'0','0',1,1,'2017-11-22 04:43:59'),(22,8,0,4,'rbonifacio@filmetrics.com','rbonifacio@filmetrics.com','---','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F','0',0,1,0,0,'0','0',1,5,'2017-11-22 07:21:03'),(23,12,0,0,'apitogo@filmetricscorp.com.ph','apitogo@filmetricscorp.com.ph','---','8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92','0',0,0,0,0,'0','0',0,5,'2017-11-23 06:38:30'),(24,11,0,0,'dpangan@filmetricscorp.com','dpangan@filmetricscorp.com','---','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F','0',0,1,0,0,'0','0',1,5,'2017-11-24 01:26:42'),(25,10,0,0,'jmabasa@filmetricscorp.com','jmabasa@filmetricscorp.com','---','EF797C8118F02DFB649607DD5D3F8C7623048C9C063D532CC95C5ED7A898A64F','0',0,1,0,0,'0','0',1,5,'2017-11-24 01:51:12'),(26,13,0,4,'acabilos@filmetricscorp.com','acabilos@filmetricscorp.com','---','8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92','0',0,0,0,0,'0','0',1,5,'2017-11-24 03:15:33'),(27,9,0,4,'jmquipanes@filmetricscorp.com','jmquipanes@filmetricscorp.com','---','B03DDF3CA2E714A6548E7495E2A03F5E824EAAC9837CD7F159C67B90FB4B7342','0',0,1,0,0,'0','0',1,5,'2017-11-28 03:37:39');
/*!40000 ALTER TABLE `mstr_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_user_account`
--

DROP TABLE IF EXISTS `mstr_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `last_name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `first_name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `middle_name` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `suffix_name` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `contact_number` varchar(45) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(6) CHARACTER SET latin1 NOT NULL,
  `employee_number` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `job_title` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_mua_mstr_company_ID_idx` (`mstr_company_id`),
  CONSTRAINT `fk_mua_mstr_company_ID` FOREIGN KEY (`mstr_company_id`) REFERENCES `mstr_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_user_account`
--

LOCK TABLES `mstr_user_account` WRITE;
/*!40000 ALTER TABLE `mstr_user_account` DISABLE KEYS */;
INSERT INTO `mstr_user_account` VALUES (1,5,'Admin','Admin','Admin',NULL,'(02) 426 0182','M','1','Admin',1,0,'2017-10-11 01:09:38'),(2,1,'Last Last','First First','Middle Middle',NULL,'(02) 426 0182','m','1','Test',1,0,'2017-11-17 07:54:19'),(5,1,'Calusayan','Eduardo','Famisaran','Jr','09498808531','M','235235','Developer Analyst 2',1,0,'2017-11-20 07:09:11'),(6,1,'TRY','TR','T',NULL,'(02) 426 0182','F',NULL,'Mason',0,0,'2017-11-20 08:29:34'),(7,3,'sadasfasf','ewgfwe','asfasfas','ew','12441125','Male','12412412','Dev Analyst',0,0,'2017-11-20 10:02:10'),(8,3,'Bonifacio','Roderick','Paulate',NULL,'4260182','Male','8132742863','Developer',1,5,'2017-11-22 05:57:27'),(9,5,'Quipanes','Jose Marlon',NULL,NULL,'09498808531','Male','12345125','Developer Analyst 2',1,5,'2017-11-23 03:38:23'),(10,3,'Mabasa','Jayson',NULL,NULL,'8237649236','Male','8326592','Dev Analyst',1,8,'2017-11-23 03:39:21'),(11,3,'Pangan','Dante',NULL,NULL,'743653763784','Male','473568','Dev Analyst',1,8,'2017-11-23 03:42:06'),(12,3,'Pitogo','Andrew',NULL,NULL,'7438746','Male','73258535','QA Analyst',1,5,'2017-11-23 03:42:54'),(13,4,'Cabilos','Antonio','Santos',NULL,'32853285','Male','325235','Dev Analyst',1,5,'2017-11-24 03:01:27'),(14,4,'Patacsil','Gamaliel',NULL,NULL,'7632962375','Male','273254823','Programmer',1,5,'2017-11-29 01:51:22');
/*!40000 ALTER TABLE `mstr_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_user_account_details`
--

DROP TABLE IF EXISTS `mstr_user_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_user_account_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `middle_name` varchar(60) DEFAULT NULL,
  `suffix_name` varchar(15) DEFAULT NULL,
  `contact_number` varchar(45) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `employee_number` varchar(15) DEFAULT NULL,
  `job_title` varchar(45) DEFAULT NULL,
  `email_address` varchar(60) DEFAULT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `login_hash` tinytext NOT NULL,
  `last_login` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_user_account_details`
--

LOCK TABLES `mstr_user_account_details` WRITE;
/*!40000 ALTER TABLE `mstr_user_account_details` DISABLE KEYS */;
INSERT INTO `mstr_user_account_details` VALUES (1,1,'Admin','Admin','Admin',NULL,'(02) 426 0182','M','1','Admin','admin','admin','admin','',0,1,1,'2017-11-17 06:38:52'),(2,1,'Admin1','Admin1','Admin1',NULL,'(02) 426 0182','F','2','Admin1','admin1','admin1','admin1','',0,1,1,'2017-11-17 06:38:50'),(3,2,'Dela Cruz','Juan','Bonifacio','Jr','','M',NULL,NULL,NULL,'',NULL,'',0,0,0,'2017-11-17 06:38:50'),(4,4,'Calusayan','Eduardo','Famisaran','Jr.','09498808531','Male','235235','Developer Analyst','joward12@yahoo.com','samplelang','123456','0',0,0,1,'2017-11-20 08:10:40');
/*!40000 ALTER TABLE `mstr_user_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_company_role`
--

DROP TABLE IF EXISTS `ref_company_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_company_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_rolename_companyID` (`role_name`,`mstr_company_id`),
  KEY `fk_rcr_mstr_company_ID_idx` (`mstr_company_id`),
  CONSTRAINT `fk_rcr_mstr_company_ID` FOREIGN KEY (`mstr_company_id`) REFERENCES `mstr_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='List of defined roles per company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_company_role`
--

LOCK TABLES `ref_company_role` WRITE;
/*!40000 ALTER TABLE `ref_company_role` DISABLE KEYS */;
INSERT INTO `ref_company_role` VALUES (1,1,'Registrar','Registering Company',1,0,'2017-10-11 01:12:59'),(2,1,'Editor','Edit roles per user',0,5,'2017-11-22 02:52:39'),(3,1,'Sample','Sample',0,5,'2017-11-22 02:54:26'),(4,3,'Sample Role','Sample Role Only',0,5,'2017-11-23 06:15:48'),(5,3,'Sample 2','Sample 2 role',0,8,'2017-11-23 06:16:44'),(6,7,'New Role Sample','New Role Sampe sanmple',0,5,'2017-11-24 03:27:56');
/*!40000 ALTER TABLE `ref_company_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_components`
--

DROP TABLE IF EXISTS `ref_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(60) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`component`),
  UNIQUE KEY `component_UNIQUE` (`component`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_components`
--

LOCK TABLES `ref_components` WRITE;
/*!40000 ALTER TABLE `ref_components` DISABLE KEYS */;
INSERT INTO `ref_components` VALUES (1,'Box Number',1,0,'2017-11-17 02:37:32'),(2,'Catch Area',1,1,'2017-11-17 02:37:32'),(3,'Destination / Buyer',1,1,'2017-11-17 02:37:32'),(4,'EU Approval Number / USFDA Registration Number',1,0,'2017-11-17 02:37:32'),(5,'Loin Number',1,1,'2017-11-17 02:37:32'),(6,'Lot Code',1,1,'2017-11-17 02:37:32'),(7,'Net Weight',1,1,'2017-11-17 02:37:32'),(8,'Origin',1,1,'2017-11-17 02:37:32'),(9,'Producer / Exporter',1,1,'2017-11-17 02:37:32'),(10,'Product Type',1,1,'2017-11-17 02:37:32'),(11,'Expiry Date',1,1,'2017-11-17 02:37:32'),(12,'Fish Number',1,1,'2017-11-17 02:37:32'),(13,'Fishing Boat Name',1,1,'2017-11-17 02:37:32'),(14,'Gross Weight',1,1,'2017-11-17 02:37:32'),(15,'Method of Fishing',1,1,'2017-11-17 02:37:32'),(16,'Production Date',1,1,'2017-11-17 02:37:32'),(17,'Raw Materials Source',1,0,'2017-11-17 02:37:32'),(18,'Receiving Date',1,1,'2017-11-17 02:37:32'),(19,'Supplier',1,1,'2017-11-17 02:37:32'),(22,'Further',1,1,'2017-11-23 03:11:20');
/*!40000 ALTER TABLE `ref_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_login_level`
--

DROP TABLE IF EXISTS `ref_login_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_login_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `is_active` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_login_level`
--

LOCK TABLES `ref_login_level` WRITE;
/*!40000 ALTER TABLE `ref_login_level` DISABLE KEYS */;
INSERT INTO `ref_login_level` VALUES (1,'B - Basic','Login as Guest, details not registered','1',1,'2017-11-22 03:19:26'),(2,'R - Regular','Registered User','1',1,'2017-11-22 03:19:26'),(3,'P - Premium','Defined by Company','1',1,'2017-11-22 03:19:26'),(4,'E - Elite','Defined by Company','1',1,'2017-11-22 03:19:26');
/*!40000 ALTER TABLE `ref_login_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_qr_components`
--

DROP TABLE IF EXISTS `ref_qr_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_qr_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `mstr_product_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `component_UNIQUE` (`component_id`) USING BTREE,
  KEY `key_from_mstr_product` (`mstr_product_id`),
  KEY `key_from_mstr_company` (`mstr_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='Selected fields for QRCode';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_qr_components`
--

LOCK TABLES `ref_qr_components` WRITE;
/*!40000 ALTER TABLE `ref_qr_components` DISABLE KEYS */;
INSERT INTO `ref_qr_components` VALUES (147,3,8,1,1,1,'2017-11-23 00:32:30'),(149,1,7,1,1,1,'2017-11-23 00:33:59'),(151,1,2,1,1,1,'2017-11-23 00:37:50'),(152,1,2,3,1,1,'2017-11-23 00:38:35'),(154,1,7,12,1,0,'2017-11-23 09:24:51'),(155,1,7,17,1,0,'2017-11-23 09:25:01'),(156,1,4,1,1,0,'2017-11-23 09:25:27'),(158,1,4,5,1,0,'2017-11-23 09:25:42'),(159,1,4,6,1,0,'2017-11-23 09:25:42'),(160,1,4,3,1,0,'2017-11-23 09:25:53'),(162,5,6,7,1,0,'2017-11-23 09:27:20'),(163,5,6,8,1,0,'2017-11-23 09:27:20'),(164,5,6,22,1,0,'2017-11-23 09:27:46'),(165,1,7,2,1,0,'2017-11-23 09:45:21');
/*!40000 ALTER TABLE `ref_qr_components` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`acabilos`@`%`*/ /*!50003 TRIGGER AFTER_INSERT
AFTER INSERT ON ref_qr_components FOR EACH ROW
begin
  
 Declare cnt int;
 
 SELECT COUNT(1) INTO cnt from  tbl_qr_values where mstr_company_id = new.mstr_company_id and mstr_product_id = new.mstr_product_id and component_id = new.component_id;
 if cnt=0 THEN

 insert into tbl_qr_values(mstr_company_id,mstr_product_id,component_id,sort_by,is_token,is_active,created_by,created_datetime)
 values(new.mstr_company_id,new.mstr_product_id,new.component_id,1,0,new.is_active,new.created_by,now());

end if;
       
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`acabilos`@`%`*/ /*!50003 TRIGGER AFTER_DELETE
AFTER DELETE ON ref_qr_components FOR EACH ROW
begin
  
 
   DELETE FROM tbl_qr_values where mstr_company_id = old.mstr_company_id and mstr_product_id = old.mstr_product_id and component_id = old.component_id;

       
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ref_status`
--

DROP TABLE IF EXISTS `ref_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` varchar(4) NOT NULL,
  `description` varchar(100) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_code_UNIQUE` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Transactions status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_status`
--

LOCK TABLES `ref_status` WRITE;
/*!40000 ALTER TABLE `ref_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_user_module`
--

DROP TABLE IF EXISTS `ref_user_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_user_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_name_UNIQUE` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='List of defined application modules ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_user_module`
--

LOCK TABLES `ref_user_module` WRITE;
/*!40000 ALTER TABLE `ref_user_module` DISABLE KEYS */;
INSERT INTO `ref_user_module` VALUES (1,'Companies','Company Maintenance',1,0,'2017-10-11 01:12:00'),(2,'Roles','Role Assignment',1,0,'2017-11-27 10:01:40'),(3,'Users','User Maintenance',1,0,'2017-11-28 06:43:44'),(4,'QRCodes ','QR Code Generator',1,0,'2017-11-28 06:43:58'),(5,'Components','Components Maintenance',1,0,'2017-11-28 06:44:09'),(6,'Products','Product Maintenance',1,0,'2017-11-28 06:44:15');
/*!40000 ALTER TABLE `ref_user_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_login_components`
--

DROP TABLE IF EXISTS `tbl_login_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_login_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `ref_login_level_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_mstr_company_id_idx` (`mstr_company_id`),
  KEY `fk_ref_login_level_id_idx` (`ref_login_level_id`),
  KEY `fk_component_id_idx` (`component_id`),
  CONSTRAINT `fk_mstr_company_id` FOREIGN KEY (`mstr_company_id`) REFERENCES `mstr_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ref_login_level_id` FOREIGN KEY (`ref_login_level_id`) REFERENCES `ref_login_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_id` FOREIGN KEY (`component_id`) REFERENCES `ref_components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_login_components`
--

LOCK TABLES `tbl_login_components` WRITE;
/*!40000 ALTER TABLE `tbl_login_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_login_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promo_product`
--

DROP TABLE IF EXISTS `tbl_promo_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_promo_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `mstr_promo_id` int(11) NOT NULL,
  `mstr_product_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mstr_company_id_UNIQUE` (`mstr_company_id`),
  UNIQUE KEY `mstr_promo_id_UNIQUE` (`mstr_promo_id`),
  UNIQUE KEY `mstr_product_id_UNIQUE` (`mstr_product_id`),
  UNIQUE KEY `start_date_UNIQUE` (`start_date`),
  UNIQUE KEY `end_date_UNIQUE` (`end_date`),
  CONSTRAINT `fk_tpp_mstr_company_id` FOREIGN KEY (`mstr_company_id`) REFERENCES `mstr_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tpp_mstr_product_id` FOREIGN KEY (`mstr_product_id`) REFERENCES `mstr_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tpp_mstr_promo_id` FOREIGN KEY (`mstr_promo_id`) REFERENCES `mstr_promos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promo_product`
--

LOCK TABLES `tbl_promo_product` WRITE;
/*!40000 ALTER TABLE `tbl_promo_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_promo_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_qr_values`
--

DROP TABLE IF EXISTS `tbl_qr_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_qr_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `mstr_product_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `sort_by` int(11) NOT NULL,
  `is_token` int(1) NOT NULL DEFAULT '0',
  `is_active` int(1) NOT NULL COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mstr_company_id_UNIQUE` (`mstr_company_id`) USING BTREE,
  KEY `mstr_product_id_UNIQUE` (`mstr_product_id`) USING BTREE,
  KEY `component_UNIQUE` (`component_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='Values of selected fields/components';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_qr_values`
--

LOCK TABLES `tbl_qr_values` WRITE;
/*!40000 ALTER TABLE `tbl_qr_values` DISABLE KEYS */;
INSERT INTO `tbl_qr_values` VALUES (65,3,8,1,'value1',1,0,1,1,'2017-11-23 00:32:30'),(67,1,2,1,'value2',1,0,1,1,'2017-11-23 00:37:50'),(68,1,2,3,'value3',1,0,1,1,'2017-11-23 00:38:35'),(70,1,7,12,'value4',1,0,1,0,'2017-11-23 09:24:51'),(71,1,7,17,'value5',1,0,1,0,'2017-11-23 09:25:01'),(72,1,4,1,'value6',1,0,1,0,'2017-11-23 09:25:27'),(74,1,4,5,'value7',1,0,1,0,'2017-11-23 09:25:42'),(75,1,4,6,'value8',1,0,1,0,'2017-11-23 09:25:42'),(76,1,4,3,'value9',1,0,1,0,'2017-11-23 09:25:52'),(78,5,6,7,'value10',1,0,1,0,'2017-11-23 09:27:20'),(79,5,6,8,'value11',1,0,1,0,'2017-11-23 09:27:20'),(80,5,6,22,'value12',1,0,1,0,'2017-11-23 09:27:45'),(81,1,7,2,'value13',1,0,1,0,'2017-11-23 09:45:20'),(82,5,16,1,'sample box number',0,0,0,1,'2017-11-24 06:01:15'),(83,5,16,2,'sample catch area',0,0,0,1,'2017-11-24 06:01:15'),(84,5,16,3,'sample destination buyer',0,0,0,1,'2017-11-24 06:01:15'),(85,5,16,4,'sample EU number',0,0,0,1,'2017-11-24 06:01:15'),(86,5,16,5,'sample loin number',0,0,0,1,'2017-11-24 06:01:15');
/*!40000 ALTER TABLE `tbl_qr_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_qrcode`
--

DROP TABLE IF EXISTS `tbl_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_company_id` int(11) NOT NULL,
  `mstr_product_id` int(11) NOT NULL,
  `qr_code` text NOT NULL,
  `deactive_date` date NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tq_mstr_company_id_idx` (`mstr_company_id`),
  KEY `fk_tq_mstr_product_id_idx` (`mstr_product_id`),
  CONSTRAINT `fk_tq_mstr_company_id` FOREIGN KEY (`mstr_company_id`) REFERENCES `mstr_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tq_mstr_product_id` FOREIGN KEY (`mstr_product_id`) REFERENCES `mstr_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generated QRCode';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_qrcode`
--

LOCK TABLES `tbl_qrcode` WRITE;
/*!40000 ALTER TABLE `tbl_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_system_log`
--

DROP TABLE IF EXISTS `tbl_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(45) NOT NULL,
  `table_id` varchar(45) DEFAULT NULL,
  `field_name` varchar(45) NOT NULL,
  `old_value` text NOT NULL,
  `new_value` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Changes made in all tables using application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_system_log`
--

LOCK TABLES `tbl_system_log` WRITE;
/*!40000 ALTER TABLE `tbl_system_log` DISABLE KEYS */;
INSERT INTO `tbl_system_log` VALUES (3,'ref_components','1','components','','name',1,'2017-11-17 01:41:06'),(4,'ref_components','1','components','name','names',1,'2017-11-17 01:41:35'),(5,'ref_components','1','is_active','1','0',1,'2017-11-17 01:48:42');
/*!40000 ALTER TABLE `tbl_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_mobile`
--

DROP TABLE IF EXISTS `tbl_user_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mstr_user_id` int(11) NOT NULL,
  `mstr_mobile_id` int(11) NOT NULL,
  `login_hash` text NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mstr_user_id_UNIQUE` (`mstr_user_id`,`mstr_mobile_id`),
  KEY `fk_mstr_mobile_id_idx` (`mstr_mobile_id`),
  CONSTRAINT `fk_mstr_mobile_id` FOREIGN KEY (`mstr_mobile_id`) REFERENCES `mstr_mobile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mstr_user_id` FOREIGN KEY (`mstr_user_id`) REFERENCES `mstr_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='Link for user and mobile info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_mobile`
--

LOCK TABLES `tbl_user_mobile` WRITE;
/*!40000 ALTER TABLE `tbl_user_mobile` DISABLE KEYS */;
INSERT INTO `tbl_user_mobile` VALUES (56,6,1,'',0,0,'2017-11-21 01:25:11'),(58,6,2,'',1,0,'2017-11-21 02:59:47'),(63,1,4,'',0,0,'2017-11-21 03:05:26'),(64,1,3,'',0,0,'2017-11-21 03:05:28'),(72,1,2,'',1,0,'2017-11-21 03:26:07');
/*!40000 ALTER TABLE `tbl_user_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_privilege`
--

DROP TABLE IF EXISTS `tbl_user_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_company_role_id` int(11) NOT NULL,
  `ref_user_module_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1 - Active\n0 - Inactive',
  `created_by` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_role_module_id` (`ref_company_role_id`,`ref_user_module_id`),
  KEY `fk_tbl_user_privilege_module_id_idx` (`ref_user_module_id`),
  CONSTRAINT `fk_tbl_user_privilege_module_id` FOREIGN KEY (`ref_user_module_id`) REFERENCES `ref_user_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_user_privilege_role_id` FOREIGN KEY (`ref_company_role_id`) REFERENCES `ref_company_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='User accessible modules based on defined role.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_privilege`
--

LOCK TABLES `tbl_user_privilege` WRITE;
/*!40000 ALTER TABLE `tbl_user_privilege` DISABLE KEYS */;
INSERT INTO `tbl_user_privilege` VALUES (1,1,1,1,0,'2017-10-11 01:13:18'),(2,1,2,1,0,'2017-11-28 01:02:01'),(5,4,1,1,5,'2017-11-28 01:04:45'),(6,4,2,1,5,'2017-11-28 01:04:51'),(7,4,3,1,5,'2017-11-28 09:15:18');
/*!40000 ALTER TABLE `tbl_user_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qrcode'
--

--
-- Dumping routines for database 'qrcode'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-29 16:46:53
