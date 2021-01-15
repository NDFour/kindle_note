-- MySQL dump 10.13  Distrib 5.7.10, for osx10.9 (x86_64)
--
-- Host: localhost    Database: kindle_note
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add upload_ record',7,'add_upload_record'),(26,'Can change upload_ record',7,'change_upload_record'),(27,'Can delete upload_ record',7,'delete_upload_record'),(28,'Can view upload_ record',7,'view_upload_record');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$juUJ3A27TbzB$i2N9CAx1YW0rMuM1b1Bp6w10TyeLzn4CsC4Imo3kmqA=','2021-01-15 13:18:17.791307',1,'lynn','','','',1,1,'2021-01-15 13:18:06.676917');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-01-15 14:48:42.890095','1','Upload_Record object (1)',3,'',7,1),(2,'2021-01-15 15:00:40.720404','3','Upload_Record object (3)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(3,'2021-01-15 15:05:32.751271','3','Upload_Record object (3)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(4,'2021-01-15 15:05:44.509997','2','Upload_Record object (2)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(5,'2021-01-15 15:18:12.343474','3','Upload_Record object (3)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(6,'2021-01-15 15:22:30.709989','2','Upload_Record object (2)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(7,'2021-01-15 15:23:34.313006','5','Upload_Record object (5)',2,'[{\"changed\": {\"fields\": [\"export_status\"]}}]',7,1),(8,'2021-01-15 15:23:44.902568','2','Upload_Record object (2)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(9,'2021-01-15 17:27:51.064211','7','Upload_Record object (7)',1,'[{\"added\": {}}]',7,1),(10,'2021-01-15 17:41:19.075795','6','Upload_Record object (6)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(11,'2021-01-15 17:41:26.198566','4','Upload_Record object (4)',2,'[{\"changed\": {\"fields\": [\"export_status\", \"export_msg\"]}}]',7,1),(12,'2021-01-15 17:41:31.752587','3','Upload_Record object (3)',2,'[{\"changed\": {\"fields\": [\"export_status\"]}}]',7,1),(13,'2021-01-15 18:01:38.186669','7','Upload_Record object (7)',2,'[{\"changed\": {\"fields\": [\"download_status\"]}}]',7,1),(14,'2021-01-15 18:01:45.067135','4','Upload_Record object (4)',2,'[{\"changed\": {\"fields\": [\"export_msg\", \"download_status\"]}}]',7,1),(15,'2021-01-15 18:31:35.412558','8','Upload_Record object (8)',2,'[{\"changed\": {\"fields\": [\"export_status\"]}}]',7,1),(16,'2021-01-15 18:31:48.772818','9','Upload_Record object (9)',1,'[{\"added\": {}}]',7,1),(17,'2021-01-15 18:33:36.367679','4','Upload_Record object (4)',2,'[{\"changed\": {\"fields\": [\"is_deleted\"]}}]',7,1),(18,'2021-01-15 18:47:08.923973','9','Upload_Record object (9)',3,'',7,1),(19,'2021-01-15 18:47:08.927296','8','Upload_Record object (8)',3,'',7,1),(20,'2021-01-15 18:47:08.928214','7','Upload_Record object (7)',3,'',7,1),(21,'2021-01-15 18:47:08.929046','6','Upload_Record object (6)',3,'',7,1),(22,'2021-01-15 18:47:08.930058','5','Upload_Record object (5)',3,'',7,1),(23,'2021-01-15 18:47:08.931164','4','Upload_Record object (4)',3,'',7,1),(24,'2021-01-15 18:47:08.932073','3','Upload_Record object (3)',3,'',7,1),(25,'2021-01-15 18:47:08.933548','2','Upload_Record object (2)',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'export','upload_record'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-01-15 13:15:56.937690'),(2,'auth','0001_initial','2021-01-15 13:15:57.013177'),(3,'admin','0001_initial','2021-01-15 13:15:57.129752'),(4,'admin','0002_logentry_remove_auto_add','2021-01-15 13:15:57.162214'),(5,'admin','0003_logentry_add_action_flag_choices','2021-01-15 13:15:57.173715'),(6,'contenttypes','0002_remove_content_type_name','2021-01-15 13:15:57.210824'),(7,'auth','0002_alter_permission_name_max_length','2021-01-15 13:15:57.226706'),(8,'auth','0003_alter_user_email_max_length','2021-01-15 13:15:57.246647'),(9,'auth','0004_alter_user_username_opts','2021-01-15 13:15:57.257880'),(10,'auth','0005_alter_user_last_login_null','2021-01-15 13:15:57.277132'),(11,'auth','0006_require_contenttypes_0002','2021-01-15 13:15:57.279030'),(12,'auth','0007_alter_validators_add_error_messages','2021-01-15 13:15:57.289849'),(13,'auth','0008_alter_user_username_max_length','2021-01-15 13:15:57.308894'),(14,'auth','0009_alter_user_last_name_max_length','2021-01-15 13:15:57.330990'),(15,'auth','0010_alter_group_name_max_length','2021-01-15 13:15:57.351187'),(16,'auth','0011_update_proxy_permissions','2021-01-15 13:15:57.361496'),(17,'export','0001_initial','2021-01-15 13:15:57.374551'),(18,'export','0002_auto_20200912_2104','2021-01-15 13:15:57.403590'),(19,'export','0003_auto_20200912_2135','2021-01-15 13:15:57.420397'),(20,'export','0004_auto_20200912_2135','2021-01-15 13:15:57.424087'),(21,'export','0005_auto_20210115_1904','2021-01-15 13:15:57.516109'),(22,'export','0006_auto_20210115_1912','2021-01-15 13:15:57.536498'),(23,'export','0007_auto_20210115_2037','2021-01-15 13:15:57.554696'),(24,'export','0008_auto_20210115_2115','2021-01-15 13:15:57.560768'),(25,'sessions','0001_initial','2021-01-15 13:15:57.573182'),(26,'export','0009_auto_20210115_2230','2021-01-15 14:31:00.260419'),(27,'export','0010_auto_20210115_2324','2021-01-15 15:24:30.969115'),(28,'export','0011_auto_20210116_0127','2021-01-15 17:27:27.976640'),(29,'export','0012_auto_20210116_0215','2021-01-15 18:15:30.184870');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('aet2ffna28st83cvtusifj1y92rbz1s8','N2MzYjgzYWI2NTNjNTNjNzg0MmJmYWUzNmFkMDI2MjBiMmNlNWU1NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMjg5MjdjZGUxMGZkZmYwNjg2ZWU0Y2M0OWUzOGMxOTQzMzA2ZTM5In0=','2021-01-29 13:18:17.793524');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_upload_record`
--

DROP TABLE IF EXISTS `export_upload_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_upload_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `upload_time` datetime(6) NOT NULL,
  `download_status` varchar(255) NOT NULL,
  `download_time` datetime(6) NOT NULL,
  `export_status` varchar(255) NOT NULL,
  `is_export_anki` varchar(10) NOT NULL,
  `export_name` varchar(255) NOT NULL,
  `export_msg` longtext NOT NULL,
  `export_time` datetime(6) NOT NULL,
  `is_deleted` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_upload_record`
--

LOCK TABLES `export_upload_record` WRITE;
/*!40000 ALTER TABLE `export_upload_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_upload_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-16  2:50:52
