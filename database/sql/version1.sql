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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `locations` */

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
('09f188a4ca7b210d83ae7c7e9eb0fb702bfd2029d8a5ede53c4eda5fb5fdf86beb8a60c179718089',2,3,'nApp','[]',0,'2021-05-08 19:52:43','2021-05-08 19:52:43','2022-05-08 19:52:43'),
('cb7d816d83f62fbd1c682289401a6097acf0fa8a8c8195c39adb8167dac4dc4451a45e7dbc5f21ce',2,3,'nApp','[]',0,'2021-05-08 20:01:04','2021-05-08 20:01:04','2022-05-08 20:01:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'baseapps Personal Access Client','f669s8Vd3fqpJ3nv48fN8y0vZYg5gHNtxyTgFKnc',NULL,'http://localhost',1,0,0,'2021-05-08 19:52:04','2021-05-08 19:52:04'),
(2,NULL,'baseapps Password Grant Client','uTXKLrrjXkUJibPDMXKVzPlEhJR3Ov9P8iS8G0PX','users','http://localhost',0,1,0,'2021-05-08 19:52:04','2021-05-08 19:52:04'),
(3,NULL,'baseapps Personal Access Client','6mh1eJkf7skNHPUXqM57fbY75xGx7OO6gzY1GZAr',NULL,'http://localhost',1,0,0,'2021-05-08 19:52:15','2021-05-08 19:52:15'),
(4,NULL,'baseapps Password Grant Client','EnCtvWarh8XEPYxp1mbhGrQh28WBBzP00SFO1XZb','users','http://localhost',0,1,0,'2021-05-08 19:52:15','2021-05-08 19:52:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `profiles` */

insert  into `profiles`(`profile_id`,`user_id`,`date_of_birth`,`gender`,`address`,`phone`,`created_at`,`updated_at`) values 
(1,1,'2021-04-17','male','bekasi','081911566664','2021-04-17 21:19:33',NULL),
(2,2,NULL,NULL,NULL,NULL,'2021-05-08 19:52:43','2021-05-08 19:52:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`position_id`,`role_id`,`idcard`,`username`,`email`,`name`,`password`,`status`,`created_at`,`updated_at`,`is_deleted`) values 
(1,1,1,'10000001','superadmin','huda.developer.web@gmail.com',NULL,'889a3a791b3875cfae413574b53da4bb8a90d53e','actived','2021-04-01 21:18:23',NULL,0),
(2,1,1,'20156588','bella','bella@gmail.com','bella','$2y$10$hoV/a1PpW4GUuUNPVaU7R.N.AoWQUuqqb8DcdYLiqMZVYB.AyeRYa',NULL,'2021-05-08 19:52:43','2021-05-08 19:52:43',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
