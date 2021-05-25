/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.18-MariaDB : Database - baseapps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baseapps` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `baseapps`;

/*Table structure for table `assignments` */

DROP TABLE IF EXISTS `assignments`;

CREATE TABLE `assignments` (
  `assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `location_id` bigint(20) unsigned DEFAULT NULL,
  `assignment_name` varchar(120) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `assignments` */

insert  into `assignments`(`assignment_id`,`user_id`,`location_id`,`assignment_name`,`day`,`status`,`created_at`,`updated_at`) values 
(1,2,2,'Pengecekan pipa 1','2021-05-24','open','2021-05-23 10:18:31','2021-05-23 10:18:31'),
(2,4,6,'kontroling','2021-05-24','open','2021-05-23 10:20:15','2021-05-23 10:20:15');

/*Table structure for table `captcha` */

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `captcha_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  PRIMARY KEY (`captcha_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `captcha` */

insert  into `captcha`(`captcha_id`,`question`,`answer`) values 
(1,'berapa hasil 2X4 ?','8'),
(2,'ketik ulang kata ini \" <b>baseapps</b> \"','baseapps');

/*Table structure for table `departements` */

DROP TABLE IF EXISTS `departements`;

CREATE TABLE `departements` (
  `departement_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `departement_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`departement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `departements` */

insert  into `departements`(`departement_id`,`departement_name`,`created_at`,`created_by`,`is_deleted`) values 
(1,'superadmin','2021-04-17 21:12:58',1,0),
(2,'finance','2021-04-21 00:42:00',1,0),
(3,'hrd','2021-04-21 01:04:00',1,0),
(5,'development','2021-04-21 01:08:00',1,0),
(7,'virtual','2021-04-21 01:10:00',1,0);

/*Table structure for table `locations` */

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(100) DEFAULT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `lng` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `locations` */

insert  into `locations`(`location_id`,`location_code`,`location_name`,`lat`,`lng`,`created_at`,`updated_at`) values 
(1,'321','Turbin Gas','-6.2888498','107.120802','2021-05-11 22:40:00','2021-05-11 22:50:12'),
(2,'1003','Pipa 1','-6.2887924','107.1225186','2021-05-19 03:03:00',NULL),
(3,'1002','Pipa 2','-6.2889184','107.1224905','2021-05-19 03:07:00',NULL),
(4,'1004','Pipa 3','-6.2947328','106.8630016','2021-05-19 10:14:00',NULL),
(5,'1005','Monas','-6.2042811','106.8187164','2021-05-19 10:22:00',NULL),
(6,'1006','Babelan','-6.1449614','106.9982184','2021-05-19 10:25:00',NULL),
(7,'1008','MM2100','-6.2992983','107.0804904','2021-05-19 10:31:00',NULL),
(9,'2001','RS MEDIKA','-6.2808412','107.1485479','2021-05-19 10:42:00',NULL),
(11,'5555','Pratama','-6.2357708','106.872999','2021-05-21 19:53:00',NULL),
(12,'7589','GAS','-6.23575098','106.8728378','2021-05-21 19:57:00',NULL),
(13,'125','Babelan 2','-6.2357504','106.872832','2021-05-21 19:59:00',NULL),
(14,'127','Babelan 3','-6.2357504','106.872832','2021-05-21 20:00:00',NULL),
(15,'5654','Babelan 78','-6.2808412','106.8187164','2021-05-23 10:51:00',NULL);

/*Table structure for table `log_activity` */

DROP TABLE IF EXISTS `log_activity`;

CREATE TABLE `log_activity` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `log` text DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `log_activity` */

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `login_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_client` varchar(30) DEFAULT NULL,
  `log` int(11) DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_log` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(4,'2016_06_01_000004_create_oauth_clients_table',1),
(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `module_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `modules` */

insert  into `modules`(`module_id`,`module_name`,`created_at`,`created_by`,`is_deleted`) values 
(1,'permission','2021-04-17 21:23:35',1,0),
(2,'module','2021-04-17 21:23:52',1,0),
(3,'departement','2021-04-17 21:24:27',1,0),
(4,'position','2021-04-17 21:24:44',1,0),
(5,'sub_module','2021-04-21 15:17:00',1,0),
(6,'role','2021-04-21 20:33:00',1,0);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('185706e50b20df73fc65089254b8e60d837f089d0354b02b6c203c099120383d3e611c63df692e84',2,5,NULL,'[]',0,'2021-05-22 09:33:30','2021-05-22 09:33:30','2021-06-06 09:33:30'),
('7f11636f7670fde49bed6c24657f7633b66a20fad2016c352e18615393836197e49335759152fa0d',2,5,NULL,'[]',0,'2021-05-23 09:51:58','2021-05-23 09:51:58','2021-06-07 09:51:58'),
('8cc323b97eb0da178fc71afa6663ed72c42c41acaa7f2df263085a5bf28b806867d762c30edeec18',2,5,NULL,'[]',0,'2021-05-22 09:35:51','2021-05-22 09:35:51','2021-06-06 09:35:51'),
('a9ecaadc6c5fb8367ff4388578d3e20a1da797fa13ff1c9a77d2bae98f5aba5f52d1714b89f7282b',2,5,NULL,'[]',0,'2021-05-23 10:13:15','2021-05-23 10:13:15','2021-06-07 10:13:15'),
('d0619845deac604dc785b45af751780e0e5d49d8b1bbe9ced31f5550d659282d250db15c7b768be1',2,5,NULL,'[]',0,'2021-05-23 09:51:17','2021-05-23 09:51:17','2021-06-07 09:51:17'),
('e1032c113b36986d347cf9733819a3b1da17e95ee5501a85286fe89d888bbd71dbe58a56f39838d3',2,5,NULL,'[]',0,'2021-05-23 09:49:18','2021-05-23 09:49:18','2021-06-07 09:49:17'),
('ec9ec7c4f73709e571ce203955719928eea378596e0f0d397e1ca4f8a3fc1cf48503305e016a2359',2,5,NULL,'[]',0,'2021-05-23 09:53:38','2021-05-23 09:53:38','2021-06-07 09:53:38'),
('fa0798110c918bef5612a1a1d4f8acc334fab2092e7d77a30eca61b3c925d5dc915c239c7f507dd7',2,5,NULL,'[]',0,'2021-05-23 09:49:19','2021-05-23 09:49:19','2021-06-07 09:49:19');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'baseapps Personal Access Client','f669s8Vd3fqpJ3nv48fN8y0vZYg5gHNtxyTgFKnc',NULL,'http://localhost',1,0,0,'2021-05-08 19:52:04','2021-05-08 19:52:04'),
(2,NULL,'baseapps Password Grant Client','uTXKLrrjXkUJibPDMXKVzPlEhJR3Ov9P8iS8G0PX','users','http://localhost',0,1,0,'2021-05-08 19:52:04','2021-05-08 19:52:04'),
(3,NULL,'baseapps Personal Access Client','6mh1eJkf7skNHPUXqM57fbY75xGx7OO6gzY1GZAr',NULL,'http://localhost',1,0,0,'2021-05-08 19:52:15','2021-05-08 19:52:15'),
(4,NULL,'baseapps Password Grant Client','EnCtvWarh8XEPYxp1mbhGrQh28WBBzP00SFO1XZb','users','http://localhost',0,1,0,'2021-05-08 19:52:15','2021-05-08 19:52:15'),
(5,NULL,'mobile','BbCRGpPUSwiRWw5j70Hwyy6qfgrOkQgGU7X9ZCmo','users','http://localhost',0,1,0,'2021-05-09 21:01:17','2021-05-09 21:01:17'),
(6,NULL,'surat','3yoPM2bVo8eLXzpg6U6vkJcH9f17a4j16h5GNdAR','users','http://localhost',0,1,0,'2021-05-11 14:00:44','2021-05-11 14:00:44');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2021-05-08 19:52:04','2021-05-08 19:52:04'),
(2,3,'2021-05-08 19:52:15','2021-05-08 19:52:15');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

insert  into `oauth_refresh_tokens`(`id`,`access_token_id`,`revoked`,`expires_at`) values 
('277f76b3c205c6685208a16964b226365eb826bc03191f659364acde3d9339bb37236869ad399691','d0619845deac604dc785b45af751780e0e5d49d8b1bbe9ced31f5550d659282d250db15c7b768be1',0,'2021-06-22 09:51:17'),
('38923e06c5b936214872800d6b7fc9d0e39d2d3008949d4dac9d56f3ec128751394a7dd73e8abe04','ec9ec7c4f73709e571ce203955719928eea378596e0f0d397e1ca4f8a3fc1cf48503305e016a2359',0,'2021-06-22 09:53:38'),
('6a591a85a8dfb77c800d7f4e6e9f3920c09b5762f8f6afb762444832bad2b17b3f9414914d6b7936','e1032c113b36986d347cf9733819a3b1da17e95ee5501a85286fe89d888bbd71dbe58a56f39838d3',0,'2021-06-22 09:49:17'),
('98492c3bdcd4e72ad7c9ce25fc721546e420454401c2608af6afdea42e8587a893d4331165b44fc8','185706e50b20df73fc65089254b8e60d837f089d0354b02b6c203c099120383d3e611c63df692e84',0,'2021-06-21 09:33:30'),
('b872ac5d61b20d46ee937ceabba5d0b8b85aa539dd39c86a95a555636473c1e5fdaae54fa586ffbc','8cc323b97eb0da178fc71afa6663ed72c42c41acaa7f2df263085a5bf28b806867d762c30edeec18',0,'2021-06-21 09:35:51'),
('cecf329b03d75e65be78b2091b5c6ef1d7a9871cb81e3764feceba68b0f35262d1526242e22d03e8','fa0798110c918bef5612a1a1d4f8acc334fab2092e7d77a30eca61b3c925d5dc915c239c7f507dd7',0,'2021-06-22 09:49:19'),
('d0a871f24f57d76c3bc7ed388cd24a526e32787535dd5726bca52acb5cd12754938c7c0c543b56e7','7f11636f7670fde49bed6c24657f7633b66a20fad2016c352e18615393836197e49335759152fa0d',0,'2021-06-22 09:51:58'),
('e462cbe431ee7f221248cbadef6afe40eb3783b79190bd80b739d8350d76dd8b92a2425e34f348a5','a9ecaadc6c5fb8367ff4388578d3e20a1da797fa13ff1c9a77d2bae98f5aba5f52d1714b89f7282b',0,'2021-06-22 10:13:15');

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub_module_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `sub_module_id` (`sub_module_id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`sub_module_id`) REFERENCES `sub_modules` (`sub_module_id`),
  CONSTRAINT `permissions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `permissions_ibfk_4` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `permissions` */

insert  into `permissions`(`permission_id`,`sub_module_id`,`role_id`,`user_id`,`created_at`,`created_by`) values 
(1,9,1,NULL,'2021-04-20 23:17:57',1),
(2,10,1,NULL,'2021-04-20 23:18:20',1),
(3,11,1,NULL,'2021-04-20 23:18:40',1),
(4,12,1,NULL,'2021-04-20 23:18:46',1),
(5,13,1,NULL,'2021-04-21 08:32:20',1),
(6,14,1,NULL,'2021-04-21 08:32:27',1),
(7,15,1,NULL,'2021-04-21 08:32:34',1),
(8,16,1,NULL,'2021-04-21 08:32:41',1),
(9,5,1,NULL,'2021-04-21 14:35:28',1),
(10,6,1,NULL,'2021-04-21 14:35:38',1),
(11,7,1,NULL,'2021-04-21 14:35:47',1),
(12,8,1,NULL,'2021-04-21 14:35:56',1),
(13,17,1,NULL,'2021-04-21 15:36:32',1),
(14,18,1,NULL,'2021-04-21 15:36:41',1),
(15,19,1,NULL,'2021-04-21 15:36:49',1),
(16,20,1,NULL,'2021-04-21 15:36:56',1),
(17,21,1,NULL,'2021-04-21 20:34:48',1),
(18,22,1,NULL,'2021-04-21 20:34:57',1),
(19,23,1,NULL,'2021-04-21 20:35:04',1),
(20,24,1,NULL,'2021-04-21 20:35:13',1),
(21,1,1,NULL,'2021-04-22 03:03:58',1),
(22,2,1,NULL,'2021-04-22 03:04:04',1),
(23,3,1,NULL,'2021-04-22 03:04:12',1),
(24,4,1,NULL,'2021-04-22 03:04:19',1);

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `position_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `departement_id` bigint(20) DEFAULT NULL,
  `position_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `positions` */

insert  into `positions`(`position_id`,`departement_id`,`position_name`,`created_at`,`created_by`,`is_deleted`) values 
(1,1,'superadmin','2021-04-17 21:18:51',1,0),
(2,3,'manager','2021-04-21 09:05:00',1,0),
(3,2,'manager','2021-04-21 09:05:00',1,0),
(4,5,'manager','2021-04-21 09:05:00',1,0),
(5,7,'manager','2021-04-21 09:06:00',1,0),
(6,7,'supervisor','2021-04-21 09:06:00',1,0),
(7,2,'supervisor','2021-04-21 10:15:00',1,0),
(8,3,'supervisor','2021-04-21 09:07:00',1,0);

/*Table structure for table `profiles` */

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `profile_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `profiles` */

insert  into `profiles`(`profile_id`,`user_id`,`date_of_birth`,`gender`,`address`,`phone`,`created_at`,`updated_at`) values 
(1,1,'2021-04-17','male','bekasi','081911566664','2021-04-17 21:19:33',NULL),
(2,2,NULL,NULL,NULL,NULL,'2021-05-08 19:52:43','2021-05-08 19:52:43'),
(3,3,NULL,NULL,NULL,NULL,'2021-05-08 20:09:14','2021-05-08 20:09:14'),
(4,4,NULL,NULL,NULL,NULL,'2021-05-08 20:10:08','2021-05-08 20:10:08'),
(5,5,NULL,NULL,NULL,NULL,'2021-05-08 20:13:13','2021-05-08 20:13:13'),
(6,6,NULL,NULL,NULL,NULL,'2021-05-08 20:13:59','2021-05-08 20:13:59');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`role_id`,`role_name`,`created_at`,`created_by`,`is_deleted`) values 
(1,'superadmin','2021-04-17 21:14:01',1,0),
(2,'admin','2021-04-21 20:39:00',1,0),
(3,'approval','2021-04-21 21:25:00',1,0),
(4,'supervisor','2021-04-21 20:53:00',1,0),
(5,'controlling','2021-04-21 20:53:00',1,0);

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `schedule_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `schedules` */

insert  into `schedules`(`schedule_id`,`day`,`location_id`,`status`,`created_at`,`updated_at`) values 
(1,'2021-05-18',1,'cancel','2021-05-12 03:04:04','2021-05-12 03:05:35'),
(2,'2021-05-24',13,'open','2021-05-23 11:13:52','2021-05-23 11:13:52');

/*Table structure for table `sub_modules` */

DROP TABLE IF EXISTS `sub_modules`;

CREATE TABLE `sub_modules` (
  `sub_module_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` bigint(20) unsigned DEFAULT NULL,
  `sub_module_name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`sub_module_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `sub_modules_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `sub_modules` */

insert  into `sub_modules`(`sub_module_id`,`module_id`,`sub_module_name`,`created_at`,`created_by`,`is_deleted`) values 
(1,1,'create_permission','2021-04-17 21:27:36',1,0),
(2,1,'read_permission','2021-04-17 21:27:53',1,0),
(3,1,'update_permission','2021-04-17 21:28:08',1,0),
(4,1,'delete_permission','2021-04-17 21:28:35',1,0),
(5,2,'create_module','2021-04-17 21:30:28',1,0),
(6,2,'read_module','2021-04-17 21:30:47',1,0),
(7,2,'update_module','2021-04-17 21:31:24',1,0),
(8,2,'delete_module','2021-04-17 21:31:40',1,0),
(9,3,'create_departement','2021-04-17 21:34:20',1,0),
(10,3,'read_departement','2021-04-17 21:34:24',1,0),
(11,3,'update_departement','2021-04-17 21:34:47',1,0),
(12,3,'delete_departement','2021-04-17 21:37:09',1,0),
(13,4,'create_position','2021-04-17 21:39:39',1,0),
(14,4,'read_position','2021-04-17 21:39:42',1,0),
(15,4,'update_position','2021-04-17 21:39:44',1,0),
(16,4,'delete_position','2021-04-17 21:39:46',1,0),
(17,5,'create_sub_module','2021-04-21 15:34:45',1,0),
(18,5,'read_sub_module','2021-04-21 15:35:16',1,0),
(19,5,'update_sub_module','2021-04-21 15:35:32',1,0),
(20,5,'delete_sub_module','2021-04-21 16:49:00',1,0),
(21,6,'create_role','2021-04-21 20:33:00',1,0),
(22,6,'read_role','2021-04-21 20:33:00',1,0),
(23,6,'update_role','2021-04-21 20:33:00',1,0),
(24,6,'delete_role','2021-04-21 20:33:00',1,0);

/*Table structure for table `token_verify` */

DROP TABLE IF EXISTS `token_verify`;

CREATE TABLE `token_verify` (
  `token_verify_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`token_verify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `token_verify` */

/*Table structure for table `user_activities` */

DROP TABLE IF EXISTS `user_activities`;

CREATE TABLE `user_activities` (
  `user_activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_activities` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` bigint(20) unsigned DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `idcard` char(8) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `status` enum('actived','sign up','suspend') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`,`email`),
  KEY `position_id` (`position_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`position_id`,`role_id`,`idcard`,`username`,`email`,`name`,`password`,`status`,`created_at`,`updated_at`,`is_deleted`) values 
(1,1,1,'10000001','superadmin','huda.developer.web@gmail.com',NULL,'889a3a791b3875cfae413574b53da4bb8a90d53e','actived','2021-04-01 21:18:23',NULL,0),
(2,1,1,'20150159','bella','bella@gmail.com','Bella','$2y$10$hoV/a1PpW4GUuUNPVaU7R.N.AoWQUuqqb8DcdYLiqMZVYB.AyeRYa',NULL,'2021-05-08 19:52:43','2021-05-11 23:22:51',0),
(3,1,1,'20156582','thalia','thalia@gmail.com','thalia','$2y$10$JAd8C.rB1BNXFkp9nULxY.kCVCnJKNn.Tc12RQlD0nyL2bJsK/fM.',NULL,'2021-05-08 20:09:14','2021-05-08 20:09:14',0),
(4,1,1,'20156583','ferrin','ferrin@gmail.com','ferrin','$2y$10$rvH79mpOP/TZTetw6muLJ.QzCkpvlrtZRVMUCyECc/xEQig9XG/Hi',NULL,'2021-05-08 20:10:08','2021-05-08 20:10:08',0),
(5,1,1,'20156573','maya','maya@gmail.com','maya','$2y$10$h3ey620hFBGNF5QT.CdbV.oI/7R9n2SVNsdT3Mgssclxq0O.alv/S',NULL,'2021-05-08 20:13:13','2021-05-08 20:13:13',0),
(6,1,1,'20156571','jay','jay@gmail.com','jay','$2y$10$EEPB3DSNAaU0Iplbu5uHb.7MV5LCXc2.kcBmcWPPd1z3WLvnkoptG',NULL,'2021-05-08 20:13:59','2021-05-08 20:13:59',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
