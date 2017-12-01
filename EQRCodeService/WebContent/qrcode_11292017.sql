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
INSERT INTO `mstr_products_image` VALUES (8,16,'�\��\�\0JFIF\0\0H\0H\0\0�\�\n\0Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0��i\0\0\0\0\0\0\0�\0\0\0\�\0\n��\0\0\'\0\n��\0\0\'Adobe Photoshop CS3 Windows\02013:04:08 16:16:22\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0V�\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0\�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0:\0V\"\0�\�\0\0�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�/?��\0��\��OJ\�_G\"��g�\�����\Z\nz�_]�\'A\�]�z�C�\�\�d��\�}\Zמ�O�\��\\\�\��\�<m��{\�m�Z�e�.s��u2V\�կ�=[\��\�\�\�b\�\�t��\�[��\�\�Y�r\�\�m����?Y�;�\�W��\�\�6��\'#�bg�����[\�\�\�6��r�\0b�_��\0Q�����\�q~ߐ\�sr���\0�c��o��2j�1���\�.\�\�\�\�e�ш���C�;�ec�C?��k\�p{��`\�\�\�u�\�-ne��\�n8{�\�sw�UtJl\���\�{b\��I�.��\�\�\�\�\�n\�;�\���Be}\0�JF<=�\�@>\"\n��2��;��9��K\\Z��C$�!�no\�o\�AM��}V�Eć�ۄ\�	�3\�{�=��\��\0\�\�IO�\��}b�\�{\�7MX\��D{��\0��x=�\�m��\�\\��\\N����b��׾����\�\��\�pel\�\�}��\���\��\�\\�լJ���s\��o Rd��\�u[\�\�\�_���\0i�3�\�՜F0��ΫN�o�?V\��\�\��\�Y�X�2\��X?E���/n\��\�ƥ�X�����\�\�Stip�߽��~\�W\�\�N��o�\���\�\�mѼ�=����o\�#\�<��^�`�\�\�\�]\n,�8Λ\r�9�g7\�GL\�\�ǳ\�8~�v�ޣ!\�g�/�ǵq9⫯��\�oH\�M\�ʫ\�鰺��?\�\�׹��\0���񁟟\����\�+s	�\�e�啸{���\��\�^i�.��[o\�\�*�\�\�nMd�\�Wc\�ߣ�?��63�vM=\�\�?���m\��^�׎���\�\�C��k\�|\r�\�[�\�\�\�c\�m�^\"ƒ׏V}�m=r�@\�-k\�sZ\0q�\0`oӳ�oWi\�+ =�\�B ��\�\�n\rsL<\r�\�`x�h֖�s߻���\0\�Y����\�6�5\�\�7�\�d֫ZC!���\�mni&\�\����\0�g�O\�X\�f\�\�\�\�Yq��5\��sG����\�AN�,-\�\�w�sK�\�L�\0Z=��\0�ߣ��J���\�\�^ȸ�}\�9��\0�jI)�ѹ\�h7�<\�\�\�+{Yi{�³Ծ��\�\�u\�\�z��mo�\�\�\�\��\0>�l���qsl��\�\�\�\0��͇]�7\�\���R�\0o\�x�B��-\�\�n>%~�vd4v_[�\�7\��\�\��n\�ݶ���\�[X\�Wrn�\�U6N\��\�mO����?sj��~�_Ч�\0).��ֿ\Z�\�\�\�1�\�`!�\�{�m�g\�\�T�(�\�2�1\��5��\�Ÿ�8\�Z\�-\n\�+���0ˌ�\ZK��~�}e\�}�7�\�E�p,eZ\�\��]��\��	:%����ˬ�Y\�\�\��\0[qߗE\�%\�\�q�}\'\�l�F5�\�\�A�s\�G\�Vu��,�\�\�\�V^X7�\rt�n\�k3��Z���)\�~\'S��\�\�m��\�dl{�D|�?W0/nVGey;��h���\�v\�\�\�\�\�%�!��M���K7�o{}�?�\�4�3~ǉfK�\�\�k<��\0�\�{гs\�ߧp�\�՘ՙh=�}�#\"웍׻s��Z?u�F�@�8\�.%\�\'���r6&3��Y�\�\�2�\�\��Z\�81��\�0֎I]/J\�\�c��\�7\��\�\�յ7=6z~�{#lyp��H��\��\n�\�m��\�/!ּ\r\\@\�\�\��-DN�Jq:�H\�\�{h\�N��\�2�����\�\\�G��\�,���<����e֍��?\�p\��\�\�)#\��?�Q��\�t_�]:\'K�ַQfQ6��\�\�\�\�yY\Z>\������>廛����\0]\�f~w�\�K���R\�\�n�\rn��\\\�\�Y\�$\�I��\�\��\�}%������\0YWtSO�\�\�\r͗\�~��\��?�\�q$�R�I$��\0�\��\�Photoshop 3.0\08BIM\0\0\0\0\0\0\0j\08BIM%\0\0\0\0\0ʣrM0ȣ\��\�߃�18BIM/\0\0\0\0\0J�\0X\0\0X\0\0\0\0\0\0\0\0\0\0{\Z\0\0�\0\0���������\Z\0\0�\0\0\0{\0\0\�\0\0\0\'\0llun\0\0\0\0\0\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\0x8BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\n\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0S\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\0\0\0V\0\0\0\0f\0i\0l\0m\0e\0t\0r\0i\0c\0s\0_\0i\0c\0o\0n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0V\0\0\0:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0:\0\0\0\0Rghtlong\0\0\0V\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0\0:\0\0\0\0Rghtlong\0\0\0V\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0V\0\0\0:\0\0\0\0:\�\0\0\�\0\0�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0:\0V\"\0�\�\0\0�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�/?��\0��\��OJ\�_G\"��g�\�����\Z\nz�_]�\'A\�]�z�C�\�\�d��\�}\Zמ�O�\��\\\�\��\�<m��{\�m�Z�e�.s��u2V\�կ�=[\��\�\�\�b\�\�t��\�[��\�\�Y�r\�\�m����?Y�;�\�W��\�\�6��\'#�bg�����[\�\�\�6��r�\0b�_��\0Q�����\�q~ߐ\�sr���\0�c��o��2j�1���\�.\�\�\�\�e�ш���C�;�ec�C?��k\�p{��`\�\�\�u�\�-ne��\�n8{�\�sw�UtJl\���\�{b\��I�.��\�\�\�\�\�n\�;�\���Be}\0�JF<=�\�@>\"\n��2��;��9��K\\Z��C$�!�no\�o\�AM��}V�Eć�ۄ\�	�3\�{�=��\��\0\�\�IO�\��}b�\�{\�7MX\��D{��\0��x=�\�m��\�\\��\\N����b��׾����\�\��\�pel\�\�}��\���\��\�\\�լJ���s\��o Rd��\�u[\�\�\�_���\0i�3�\�՜F0��ΫN�o�?V\��\�\��\�Y�X�2\��X?E���/n\��\�ƥ�X�����\�\�Stip�߽��~\�W\�\�N��o�\���\�\�mѼ�=����o\�#\�<��^�`�\�\�\�]\n,�8Λ\r�9�g7\�GL\�\�ǳ\�8~�v�ޣ!\�g�/�ǵq9⫯��\�oH\�M\�ʫ\�鰺��?\�\�׹��\0���񁟟\����\�+s	�\�e�啸{���\��\�^i�.��[o\�\�*�\�\�nMd�\�Wc\�ߣ�?��63�vM=\�\�?���m\��^�׎���\�\�C��k\�|\r�\�[�\�\�\�c\�m�^\"ƒ׏V}�m=r�@\�-k\�sZ\0q�\0`oӳ�oWi\�+ =�\�B ��\�\�n\rsL<\r�\�`x�h֖�s߻���\0\�Y����\�6�5\�\�7�\�d֫ZC!���\�mni&\�\����\0�g�O\�X\�f\�\�\�\�Yq��5\��sG����\�AN�,-\�\�w�sK�\�L�\0Z=��\0�ߣ��J���\�\�^ȸ�}\�9��\0�jI)�ѹ\�h7�<\�\�\�+{Yi{�³Ծ��\�\�u\�\�z��mo�\�\�\�\��\0>�l���qsl��\�\�\�\0��͇]�7\�\���R�\0o\�x�B��-\�\�n>%~�vd4v_[�\�7\��\�\��n\�ݶ���\�[X\�Wrn�\�U6N\��\�mO����?sj��~�_Ч�\0).��ֿ\Z�\�\�\�1�\�`!�\�{�m�g\�\�T�(�\�2�1\��5��\�Ÿ�8\�Z\�-\n\�+���0ˌ�\ZK��~�}e\�}�7�\�E�p,eZ\�\��]��\��	:%����ˬ�Y\�\�\��\0[qߗE\�%\�\�q�}\'\�l�F5�\�\�A�s\�G\�Vu��,�\�\�\�V^X7�\rt�n\�k3��Z���)\�~\'S��\�\�m��\�dl{�D|�?W0/nVGey;��h���\�v\�\�\�\�\�%�!��M���K7�o{}�?�\�4�3~ǉfK�\�\�k<��\0�\�{гs\�ߧp�\�՘ՙh=�}�#\"웍׻s��Z?u�F�@�8\�.%\�\'���r6&3��Y�\�\�2�\�\��Z\�81��\�0֎I]/J\�\�c��\�7\��\�\�յ7=6z~�{#lyp��H��\��\n�\�m��\�/!ּ\r\\@\�\�\��-DN�Jq:�H\�\�{h\�N��\�2�����\�\\�G��\�,���<����e֍��?\�p\��\�\�)#\��?�Q��\�t_�]:\'K�ַQfQ6��\�\�\�\�yY\Z>\������>廛����\0]\�f~w�\�K���R\�\�n�\rn��\\\�\�Y\�$\�I��\�\��\�}%������\0YWtSO�\�\�\r͗\�~��\��?�\�q$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\03\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�\�http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c036 46.276720, Mon Feb 19 2007 22:40:08        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:xap=\"http://ns.adobe.com/xap/1.0/\" xmlns:xapMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" dc:format=\"image/jpeg\" xap:CreatorTool=\"Adobe Photoshop CS3 Windows\" xap:CreateDate=\"2013-01-25T10:17:08-08:00\" xap:ModifyDate=\"2013-04-08T16:16:22+08:00\" xap:MetadataDate=\"2013-04-08T16:16:22+08:00\" xapMM:DocumentID=\"uuid:C05434581B67E211AE5194F81EB48984\" xapMM:InstanceID=\"uuid:6E7A6B8424A0E2119908CDF11B7FB58B\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" photoshop:History=\"\" tiff:Orientation=\"1\" tiff:XResolution=\"720000/10000\" tiff:YResolution=\"720000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;70DB372FD07091AEE6C7B35F9D854FF5\" exif:PixelXDimension=\"86\" exif:PixelYDimension=\"58\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;4D1D621C0E1DC13CED4B3DFCDDEF5D79\"> <xapMM:DerivedFrom stRef:instanceID=\"uuid:9E89D0641A67E211AE5194F81EB48984\" stRef:documentID=\"uuid:9E89D0641A67E211AE5194F81EB48984\"/> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe\0d@\0\0\0�\�\0�\0		\n\n				\r\n	\n\r��\0\0:\0V\0�\�\0\0�\��\0\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\0s\0!1AQa\"q�2���B#�R\�\�3b�$r��%C4S���cs\�5D\'���6Tdt\�\�\�&�	\n��EF��V\�U(\Z�\��\�\�\��eu����\�\�\��fv����\�\�\��7GWgw����\�\�\��8HXhx����\�\�\��)9IYiy����\�\�\��*:JZjz����\�\�\��\0m\0!1AQa\"q��2����\�\�#BRbr�3$4C��S%�c�\�s\�5\�D�T�	\n&6E\Z\'dtU7�\�()\�\�󄔤�\�\�\��eu����\�\�\��FVfv����\�\�\��GWgw����\�\�\��8HXhx����\�\�\��9IYiy����\�\�\��*:JZjz����\�\�\���\�\0\0\0?\0���*\�U�\��\�7�\�\�\��\�Ⱥ\�5�[�O\�8W\��\��\�݅\�ۤ?#V�\0\'34���\�w��\�_�?��\0���Ͽ4\�\��\�;]/��\0Hz�\"\�uwǥZy\�F\��\��\�\��\�A\�z>B��\��䶽!�\��\0;�\�&�\�\�\�~\\`�\�\�3;�;N?�5�˽\�_�\Z���C�Ho�+5\�}v\�c�%\�\�\Zw\�\�\�%a?�cf��P\r���K�\0*�?\�\��U��\��\����\�c\n\�\ZW���Q�a�W��\Z0o�\�4��hȸv\�8��C<��ŦˤY\��\�\�:ǜ��֬���\�V���ıwk�j\�W\�\�\�\�gw��wP������F��V\0�������UqW�\�����*�|�\0���\0��?��U����\���\rm\�\�6[0&���ZZ�\�(���e~*�\��of�ǎ|����+`�~�=SP\�/n5\rN\�[\�˩\ZY癙ݝ�K31$�z��\\b\"(\r�c�\�/�Ư�\�\�o�\�\�V\��N\�//yG����\02�pSL�+�\�5\��z�\Z/�\�\�v�-8 \�{�8�\��\��\08�\0�\08A�\08\��A���y�4�\�h�\���\��\�d^�eo*��J��\�&��\�s�\���\\\�ɡ\�&8\�C\�2i6w��\�=-F+%0�K˺��1Pn�$�E)F\�`��L��\��\r~;u�\� �]GG��X5U��zN?w\"��E|� �\�/yS\��U����\0�TZ\�!��CVc�8iQz��i�۽\�\�s�\�\�\�!S\Z�>�,z��][\�rZ\�<V\�s����a�g�\�!\�\Z\'���TbQz��\Z(\�T�JԦ�D�3ʚ�p\���m4֗��\�b�7�^TJ�j#�>����\0�\����\09��\09\r�\�侯\�)��\�|�&@X�2!2\\�Ԉ\�ۿ\�34:o(�N�g.�L5=N�\0X��\��;�.ﯥy��%b\�\�#ffbI$��s��DEA\�\��;�q#�q�W�\0���\�\�<�o,\�w�4�\�U�\��#\�\���Q5\\�\�\�O��\0g0�CX4\�\�s;X\�\�_ԏ���\��\0,i6>E�֑k\�\�\�\�;X\�\�\�\�$\�F�JKM\�b�\�\�5j\�8�\�S���%\�\�ߜ�E��\�埞<�\�\�dy\�w���7\�e��\�\�S��� eg��<r\'J�FOO�\�\�%WK!b���a�\0�U~~~[\�\�\�\�λO7�\�B�\�i\Z|�Z%�ȣ�-�\�w\'�we\��;\�\�=��g�p\'�O�G\"���p7�r\�\�?�7Z\�\�G\�=��\�ߐ!�\�D��k7�䵫�s\�\�A$7P�\�	U�j\�7\�\�1T񛌙c�;\�חuI�]<=\�k�g#\�j�\�\�.!<_��-�/�\�[kϿ3�R\�{h�4O�]C-���7���\�q�n\�#8�\�K����\�\\U\�&Mv^\�/�\�e�-����%�9c�P\0\Z�\�u��1���\Z\�X<�\���y�\�\�-^y�in��H��[ԘlPU\nP3A\�ҧ�\�O�~)��\0\�!\�%\����\\\��\0��X�P�\r\��\�vZv���Yg���S\�j\Z(�Tv<QI9\�vfHi�x�\�.���9��\�^I�\0�l򞑧j���\�\� y\��\�\��\�I�I5����,�~�~��U�����J(�g\���\�%��|���[\�\�_\�\��\��\�\��\�ߔ�=/\�\�jږ�\�\�-\�˯\�\�_\��E\�8�bDX�>G\�bN\�9�^�&�W3ɾ0\�\��\�y%�\�\�o���\�\\^5�\�hP=\�#�}�|\�,�-\��<�\�\�\�o�\�\�\�(�֜�6��\�\�֞f�\�\�\����(\�ߊ�/|U�u�\0>\��\��\��\0����\�<�\�cX��~�m<�<\�\�ks��3\�Oq,�£�\�EC��%_\�]�����\�\�x4SO�^����-��$0\�ܸ?\�w)��3�9*\�bM�|�\��5#�7�\�df��\�t��~d(\�Xg��\�\rهI\�|\�c�\�\�\�4�ͯ$�碜��\�\�\�\�#�\� s#\�Z��j\�|\�]\�Լ��y�x�%��h�ekx`-�\�M~�`b��\�J�A^�i�붟�:����\���TTצ\��F7\�S�Rv�c\�SjaW�\�\�?�z,�`�\��\�\�5�\�\�/R�ӵ\�﮵�\�\�Tj^aүdamk}�Ĳ2\�\Z\�\�$Ri\�<=;5\�<��l�\�\�\0�~/�Y݌yg\��a��խ&�\�4VZ��g\�/,�\0,?3�����Ф�ʚ\�\�FJ<\�.��\�~�hWz\�(�\Z��\�=\�\�\�+\�jw~Z��޳ue{�\�i��jw�tr\�g-đ+J�\�\�ZE��%�@R�\�Uf�̼ߢ\�ڦ����y\�\�0(y�̶77\�D�+\�\�s2�LLR���SP�ҼZ��1�A��ܯ\�o\�_�\�o\�O�\�_:�\��O�s/\�:��<�\�K\�\�\�\"\�\�\�ʿX�f�Ӟ\��7�7\���|\'\�\�u\��M=\\�P=\�f\'\����q\��r�pZ\���O�q\��yK\�\�qӯ�-\� \� �{\�\�\��\�#�9T3\"/\�xҕ�\�n���\������d�גtmEu\rg�K\�h4�F�ح����\0�=@jH\�b\0�\�>d\�\0f޿\�A\�)\�j���\0�<\�p\�\�\�\�\�Y��W�q�$����\�\�u�H\�7�\\O%\��\���\�!\�v�ʏ�Y7�<�?��Ŧyv\�7�k�\�V�\�3�ڣ\�\�\r\���>\�\�K�\�W��\�\���<xq���\��\��&��H����\04-<��y���\���6\�\�/�l|ɦ\�m=ݸ\����\�n.�D�./\n�\�\�S�ؖ\�|1j\�\�o&o����\08�\�-i4�GP֯�]Ui���\�^\��v\�H\�4�h\�Ky�D��N����1t�K;s�<\�\'.ߏ\�\�\�:}�i�6Z|sMr�0Gn�2f�D�\�#n\�iROS�\�\���\��\�\�䖟�[�ey�X����\�L\��R�\���\�\�0�ƈ?��_d\�fV�I�9�2��6i���\08\��\09\�\�to3j>@�\�\��\r���v��%�ަ���e�ɠ�l=0�Y��\�b�)�?�\�/�\�\�ֽg\�\�\��\��?G�N�)�ҵ�i\n\�m-\�\�\�B�#�W�b�+	��\�\�v:l��\�\Z\���	t�\0#i���U5I5�(\�N\�)\�p�\�cA/��\�\�g\�:��޽x/5S\n��Г_F\�	�Wĝ\��ʥ+T�..\�-\�\�\�弾��Ege��W=W�\��\��{��\�yK�\�P�\��&��)c\�!�n�ў\�;�\�;�e�R�^�\�\n��\����yoA\�5\rsW\�4�{-S̳Eq�\� ^Kb�g\�\�Z�0�O�S��]�+\�/\�\�/\�_?]\���\�\��埖\�K,\Zf�\���o\�\�%i\�Us\"9qD}}�\0��E��\�/��\�\�E����jy\���R�Y\�\��\�+{�\"�\�*,�ӱ5\�3�\�\�b*4\�\�\�\��\0ɿ�󉟖F�g\�/��u�f\��\�	e\�oQՃ+�\��iL\�ˮ\�3fE��{/�?3|\�\� �^\�\�\r��\�і\�?\�}3ͅ<[0�&�\�\�m�\"V�\�\�m���>bI�\�\0�zG�*��懍\�қCӜ�Z��[���\�}41�}]\�?\�/�6�۞��μn���=R;�j6�=�\�NL\nW�W\�\�WW\�\��\�����v*\�튼�\�_fo�C~\��.�\�*�����\0\�\�?^*�\�&}��\0\���8_kz>*\�Uث�W�\�','image/png',1,1,'2017-11-23 05:07:17');
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
