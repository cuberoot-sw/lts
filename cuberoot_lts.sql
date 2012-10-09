-- MySQL dump 10.13  Distrib 5.5.20, for osx10.6 (i386)
--
-- Host: localhost    Database: cuberoot_lts
-- ------------------------------------------------------
-- Server version	5.5.20

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
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS "holidays";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "holidays" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT,
  "date" date DEFAULT NULL,
  "event" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES "holidays" WRITE;
/*!40000 ALTER TABLE "holidays" DISABLE KEYS */;
INSERT INTO "holidays" VALUES (1,'2012-10-02','Gandhi Jayanti','2012-09-25 05:40:12','2012-09-26 09:08:56');
/*!40000 ALTER TABLE "holidays" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS "leaves";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "leaves" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT,
  "user_id" bigint(11) NOT NULL,
  "start_date" timestamp DEFAULT NULL,
  "end_date" timestamp DEFAULT NULL,
  "no_of_days" bigint(11) DEFAULT NULL,
  "current_status" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "reason" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "approved_on" timestamp DEFAULT NULL,
  "rejection_reason" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "approved_by" bigint(11) DEFAULT NULL,
  PRIMARY KEY ("id"),
  KEY "index_leaves_on_user_id" ("user_id")
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "leaves"
--

LOCK TABLES "leaves" WRITE;
/*!40000 ALTER TABLE "leaves" DISABLE KEYS */;
INSERT INTO "leaves" VALUES (1,26,'2012-08-22 00:00:00','2012-08-22 00:00:00',1,'Pending','2012-08-22 13:17:21','2012-08-22 13:17:21','rgdfgdfg',NULL,NULL,NULL),(2,26,'2012-08-15 00:00:00','2012-08-22 00:00:00',6,'Pending','2012-08-22 13:18:15','2012-08-22 13:18:15','retdsfsd',NULL,NULL,NULL),(3,26,'2007-08-22 00:00:00','2012-08-11 00:00:00',1298,'Pending','2012-08-22 13:19:46','2012-08-22 13:19:46','dfgdfgdfgfdg',NULL,NULL,NULL),(4,34,'2012-09-07 00:00:00','2012-09-07 00:00:00',1,'Pending','2012-09-07 07:10:08','2012-09-07 07:10:08','safd',NULL,NULL,NULL),(5,34,'2011-02-04 00:00:00','2011-08-05 00:00:00',131,'Pending','2012-09-07 07:10:43','2012-09-07 07:10:43','asdfasdf',NULL,NULL,NULL),(6,34,'2011-09-07 00:00:00','2011-10-07 00:00:00',23,'Pending','2012-09-07 07:13:01','2012-09-07 07:13:01','w34rdfad',NULL,NULL,NULL),(7,34,'2012-10-07 00:00:00','2012-10-11 00:00:00',4,'Pending','2012-09-07 07:13:28','2012-09-07 07:13:28','sadfadf',NULL,NULL,NULL),(8,37,'2012-10-10 00:00:00','2012-10-11 00:00:00',2,'Rejected','2012-09-10 12:40:00','2012-09-27 10:16:18','Just like that','2012-09-27 10:15:54','',18),(9,20,'2012-09-12 00:00:00','2012-09-25 00:00:00',10,'Pending','2012-09-25 05:13:33','2012-09-25 05:13:33','Going home',NULL,NULL,NULL),(10,18,'2012-10-18 00:00:00','2012-10-20 00:00:00',2,'Pending','2012-09-25 06:20:14','2012-09-25 06:20:14','hi',NULL,NULL,NULL),(11,37,'2012-11-23 00:00:00','2012-11-27 00:00:00',3,'Rejected','2012-09-27 10:18:10','2012-09-28 11:46:34','hi','2012-09-27 10:18:39','',18),(12,18,'2012-09-27 00:00:00','2012-09-30 00:00:00',2,'Pending','2012-09-27 10:59:50','2012-09-27 10:59:50','hi',NULL,NULL,NULL),(13,18,'2012-09-27 00:00:00','2012-09-30 00:00:00',2,'Pending','2012-09-27 11:46:14','2012-09-27 11:46:14','hi',NULL,NULL,NULL),(14,37,'2012-09-28 00:00:00','2012-10-01 00:00:00',2,'Rejected','2012-09-28 12:47:45','2012-09-28 12:49:09','hi','2012-09-28 12:48:39','',18);
/*!40000 ALTER TABLE "leaves" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "schema_migrations"
--

DROP TABLE IF EXISTS "schema_migrations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "schema_migrations" (
  "version" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY "unique_schema_migrations" ("version")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "schema_migrations"
--

LOCK TABLES "schema_migrations" WRITE;
/*!40000 ALTER TABLE "schema_migrations" DISABLE KEYS */;
INSERT INTO "schema_migrations" VALUES ('20120516043453'),('20120516110755'),('20120517104231'),('20120529072913'),('20120529092312'),('20120530113529'),('20120531091809'),('20120601105248'),('20120604130038'),('20120606042718'),('20120607131640'),('20120608065438'),('20120608101009'),('20120619141616'),('20120620044749'),('20120620055748'),('20120621094630'),('20120627072523'),('20120627072753'),('20120628044020'),('20120817055131'),('20120827071830'),('20120827072001'),('20120827072038'),('20120924051732');
/*!40000 ALTER TABLE "schema_migrations" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "sessions"
--

DROP TABLE IF EXISTS "sessions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "sessions" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT,
  "session_id" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  "data" text COLLATE utf8_unicode_ci,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id"),
  KEY "index_sessions_on_session_id" ("session_id"),
  KEY "index_sessions_on_updated_at" ("updated_at")
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "sessions"
--

LOCK TABLES "sessions" WRITE;
/*!40000 ALTER TABLE "sessions" DISABLE KEYS */;
INSERT INTO "sessions" VALUES (9,'196f64b9db394d289aaf7bf0f757f91b','BAh7DkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEzamZ2S2VjNFZxNExqM1RTOXRD\nOWl2M0JYUmtFRjZLdjBpckVGdUpOZ3BVPQY7AEZJIgplbWFpbAY7AEZJIhht\nYXl1cjg4QGN1YmVyb290LmluBjsAVEkiEXBob25lX251bWJlcgY7AEZsKwj/\n4wtUAgBJIhtlbWVyZ2VuY3lfcGhvbmVfbnVtYmVyBjsARmwrCP/jC1QCAEki\nHWVtZXJnZW5jeV9jb250YWN0X3BlcnNvbgY7AEZJIgphc2RmZwY7AFRJIhth\nbHRlcm5hdGVfcGhvbmVfbnVtYmVyBjsARmwrCP/jC1QCAEkiFm9mZmljaWFs\nX2VtYWlsX2lkBjsARkkiEmFzZEBnbWFpbC5jb20GOwBUSSIXYWx0ZXJuYXRl\nX2VtYWlsX2lkBjsARkkiFWFzZGZnaEBnbWFpbC5jb20GOwBUSSISZGF0ZV9v\nZl9iaXJ0aAY7AEZVOglEYXRlWwhVOg1SYXRpb25hbFsHaQPp9EppB2kAaQMZ\nFSM=\n','2012-09-24 13:11:12','2012-09-24 13:15:59'),(37,'b0df44062dd87bf2a2fcb6853fadfb7e','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFZUWVYb3IwVmovRFhNZVRvUjV4\nMmkxSisyTkRHQXo5UEZpT2g4Tm1JdU5zPQY7AEY=\n','2012-09-25 06:22:15','2012-09-25 06:22:20'),(39,'4bb006c08e0e48f22b7b22ed58f0dc6f','BAh7DUkiEF9jc3JmX3Rva2VuBjoGRUZJIjF0R3BiVnY5d2RmUndpK3FEcFRr\ndjkxbWYvalNKdWF6eTFuMm8vVTBDOGNjPQY7AEZJIgplbWFpbAY7AEZJIhht\nYXl1cjE5QGN1YmVyb290LmluBjsAVEkiEXBob25lX251bWJlcgY7AEZsKwj/\n4wtUAgBJIhtlbWVyZ2VuY3lfcGhvbmVfbnVtYmVyBjsARmwrCP/jC1QCAEki\nHWVtZXJnZW5jeV9jb250YWN0X3BlcnNvbgY7AEZJIgphc2RmZwY7AFRJIhth\nbHRlcm5hdGVfcGhvbmVfbnVtYmVyBjsARmwrCP/jC1QCAEkiFm9mZmljaWFs\nX2VtYWlsX2lkBjsARkkiEmFzZEBnbWFpbC5jb20GOwBUSSIXYWx0ZXJuYXRl\nX2VtYWlsX2lkBjsARkkiFWFzZGZnaEBnbWFpbC5jb20GOwBU\n','2012-09-25 13:14:32','2012-09-25 13:15:01'),(73,'426bc0d3c6ee3f30badb6b1192c3d5d6','BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjE5R3pLUlhCbHExUEd5REE5bGhJ\ncFhKc1pHdzRTRGZ3WDd5UXhjcHNJbEtZPQY7AEZJIhFjdXJyZW50X3llYXIG\nOwBGSSIJMjAxMgY7AEZJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbCEki\nCVVzZXIGOwBGWwZpLkkiIiQyYSQxMCRTRTI2QmwuRjVKdmV6T0pIbUUxN3hl\nBjsAVA==\n','2012-09-26 13:26:02','2012-09-26 13:26:12'),(96,'2b51ad219ae78102472328587e5de6aa','BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHVNpZ25lZCBvdXQgc3VjY2Vzc2Z1bGx5LgY7\nAFQ6CUBub3cw\n','2012-09-27 06:33:37','2012-09-27 06:33:37'),(117,'39530b7187233c26a93fb4de35847f37','BAh7B0kiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7BjoLbm90aWNlVDoMQGNs\nb3NlZEY6DUBmbGFzaGVzewY7CkkiHVNpZ25lZCBvdXQgc3VjY2Vzc2Z1bGx5\nLgY7AFQ6CUBub3cwSSIQX2NzcmZfdG9rZW4GOwBGSSIxb29qNTNaYVN5SEdh\nQ1FzbEdWTmhpY09EUU9YZS9YTEYyYk5FM0tic2FvZz0GOwBG\n','2012-09-27 12:43:09','2012-09-27 12:43:10'),(140,'37b7b69190b06028c163c2748eb45996','BAh7CEkiEWN1cnJlbnRfeWVhcgY6BkVGSSIJMjAxMgY7AEZJIhBfY3NyZl90\nb2tlbgY7AEZJIjFTamROWEdabWQxWTB3TllHaWEyRlA4V1g3S1VyQndSbGhj\nZ2YybTJsd01rPQY7AEZJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbCEki\nCVVzZXIGOwBGWwZpF0kiIiQyYSQxMCRkdWpkU051TFViQkc3MDgxVUY0WWIu\nBjsAVA==\n','2012-09-28 13:01:07','2012-09-28 13:10:02'),(155,'92b5c88a38678a473ff4753bbad2e7d9','BAh7BkkiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7ADoMQGNsb3NlZEY6DUBm\nbGFzaGVzewY6C25vdGljZUkiHVNpZ25lZCBvdXQgc3VjY2Vzc2Z1bGx5LgY7\nAFQ6CUBub3cw\n','2012-10-01 10:00:57','2012-10-01 10:00:57'),(168,'dc2aee3ba32130b1ae1f7ba4911bb243','BAh7B0kiCmZsYXNoBjoGRUZvOiVBY3Rpb25EaXNwYXRjaDo6Rmxhc2g6OkZs\nYXNoSGFzaAk6CkB1c2VkbzoIU2V0BjoKQGhhc2h7BjoLbm90aWNlVDoMQGNs\nb3NlZEY6DUBmbGFzaGVzewY7CkkiHVNpZ25lZCBvdXQgc3VjY2Vzc2Z1bGx5\nLgY7AFQ6CUBub3cwSSIQX2NzcmZfdG9rZW4GOwBGSSIxRXFvVWpOZGRpN0ZN\nM1hmRm5MWWROK0dqaTZZVFEyUjJlM1R5SUJjZ1M4ND0GOwBG\n','2012-10-01 12:41:13','2012-10-01 12:41:13'),(187,'e7bba9876b8ac959fc732de9df460942','BAh7CUkiEF9jc3JmX3Rva2VuBjoGRUZJIjFkbzRUMm9BSFF5Ums2d1JkR0NM\nczQxdld5ZFZocHBRR0w2QWpDa0dFNzE0PQY7AEZJIhFjdXJyZW50X3llYXIG\nOwBGSSIJMjAxMgY7AEZJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbCEki\nCVVzZXIGOwBGWwZpF0kiIiQyYSQxMCRkdWpkU051TFViQkc3MDgxVUY0WWIu\nBjsAVEkiCmZsYXNoBjsARm86JUFjdGlvbkRpc3BhdGNoOjpGbGFzaDo6Rmxh\nc2hIYXNoCToKQHVzZWRvOghTZXQGOgpAaGFzaHsGOgtub3RpY2VUOgxAY2xv\nc2VkRjoNQGZsYXNoZXN7BjsKSSIcU2lnbmVkIGluIHN1Y2Nlc3NmdWxseS4G\nOwBUOglAbm93MA==\n','2012-10-03 05:37:26','2012-10-03 05:37:26'),(197,'8677e56277bc4341c2a3fa901cedf71a','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF0UU11UmN4bFZhV0M2ZElyOGZ6\nVnBlZkFrMjdRblR2QnF3N3R4bk5VUmhVPQY7AEY=\n','2012-10-03 05:47:59','2012-10-03 05:48:01'),(200,'03334c2a61845d1c71b23d483a97ec85','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjEzV0NNVDVVOFpiczZ0clVXMjFz\nWXIrNDAyZ3o1am4rMEhxTDVqMkNZVUs4PQY7AEY=\n','2012-10-03 06:10:03','2012-10-03 06:10:05');
/*!40000 ALTER TABLE "sessions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "setups"
--

DROP TABLE IF EXISTS "setups";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "setups" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT,
  "total_leaves" bigint(11) DEFAULT NULL,
  "year" bigint(11) DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "setups"
--

LOCK TABLES "setups" WRITE;
/*!40000 ALTER TABLE "setups" DISABLE KEYS */;
INSERT INTO "setups" VALUES (2,12,2012,'2012-09-25 05:42:53','2012-09-25 05:42:53');
/*!40000 ALTER TABLE "setups" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "users"
--

DROP TABLE IF EXISTS "users";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "users" (
  "id" bigint(11) NOT NULL AUTO_INCREMENT,
  "email" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "encrypted_password" varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  "reset_password_token" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "reset_password_sent_at" timestamp DEFAULT NULL,
  "remember_created_at" timestamp DEFAULT NULL,
  "sign_in_count" bigint(11) DEFAULT '0',
  "current_sign_in_at" timestamp DEFAULT NULL,
  "last_sign_in_at" timestamp DEFAULT NULL,
  "current_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "last_sign_in_ip" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "role" varchar(255) COLLATE utf8_unicode_ci DEFAULT 'employee',
  "name" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "total_leaves" real DEFAULT NULL,
  "joining_date" date DEFAULT '2012-01-01',
  "manager_id" bigint(11) DEFAULT NULL,
  "phone_number" bigint(20) DEFAULT NULL,
  "emergency_phone_number" bigint(20) DEFAULT NULL,
  "emergency_contact_person" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "alternate_phone_number" bigint(20) DEFAULT NULL,
  "blood_group" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "official_email_id" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "alternate_email_id" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "date_of_birth" date DEFAULT NULL,
  "local_address" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "permanent_address" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_users_on_email" ("email"),
  UNIQUE KEY "index_users_on_reset_password_token" ("reset_password_token")
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "users"
--

LOCK TABLES "users" WRITE;
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" VALUES (18,'mayur16@cuberoot.in','$2a$10$dujdSNuLUbBG7081UF4Yb.a1jhQEpDL4Nd.wVPknd6vEsTKP1OLWy',NULL,NULL,NULL,41,'2012-10-03 05:46:35','2012-10-03 05:38:58','127.0.0.1','127.0.0.1','2012-08-28 06:11:34','2012-10-03 05:46:35','manager',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'B+','asdg@gmail.com','asdgasdg@gmail.com','2012-02-05','aaaaaaaaa','assssssssss'),(19,'mayur17@cuberoot.in','$2a$10$fKtnTOvbchvKW3gtqQdv4.eVI05riIm68fSCmq8IEJuHNFhOvncMq',NULL,NULL,NULL,1,'2012-08-28 06:35:06','2012-08-28 06:35:06','127.0.0.1','127.0.0.1','2012-08-28 06:35:06','2012-09-26 05:57:58','manager',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2011-07-04','aaaaaaa,ccccccc','asdgasgd'),(20,'mayur@cuberoot.in','$2a$10$9QY.jFXj.xxF48NklS.PN./8LTGq7XmOWdJnWt1dmLkkXMZlCq1Fe','EpM6WoyDWzRo9sKESJmj','2012-09-28 11:23:46',NULL,37,'2012-10-03 06:08:52','2012-10-03 05:47:46','127.0.0.1','127.0.0.1','2012-08-28 10:12:52','2012-10-03 06:08:52','admin',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2011-02-22','pune,maharastra-411020','jbp,madhyapradesh-411020'),(21,'mayur1@cuberoot.in','$2a$10$9RXpozEGifbOiMJgoYfv5.ABPXcWg.J2fTSI.tBH7KabHRnBYIVem',NULL,NULL,NULL,1,'2012-08-28 10:21:23','2012-08-28 10:21:23','127.0.0.1','127.0.0.1','2012-08-28 10:21:23','2012-08-28 10:21:23','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-03-20','pune,maharastra-411020','jbp,madhyapradesh-411020'),(37,'mayur2@cuberoot.in','$2a$10$7YZGRrV1CgJ/rN.ZqK65u.yN/a.WJN7CdVlLHwFOSwyDV2wlfbG1K',NULL,NULL,NULL,8,'2012-09-28 12:47:22','2012-09-27 10:17:45','127.0.0.1','127.0.0.1','2012-09-10 12:33:00','2012-09-28 12:47:22','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'B+','asdg@gmail.com','asdgasdg@gmail.com','2011-11-14','pune,maharastra-411020','pune,madhyapradesh-411020'),(38,'mayur66@cuberoot.in','$2a$10$z/K.sdnfBPOtS3O4gKRrue5ckFsveLQFE0CFLOVuyIbrcazhZqwuG',NULL,NULL,NULL,1,'2012-09-14 10:59:13','2012-09-14 10:59:13','127.0.0.1','127.0.0.1','2012-09-14 10:59:13','2012-09-14 10:59:13','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-09','pune,maharastra-411020','pune,madhyapradesh-411020'),(39,'mayur88@cuberoot.in','$2a$10$EbFwwkkfL08di0f8GQAjT.aUEPLnrSF61m8dsP5R39SwCvYmXFcGW',NULL,NULL,NULL,1,'2012-09-17 06:37:34','2012-09-17 06:37:34','127.0.0.1','127.0.0.1','2012-09-17 06:37:34','2012-09-17 06:37:34','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-03','pune,maharastra-411020','pune,madhyapradesh-411020'),(40,'mayur87@cuberoot.in','$2a$10$WRBDK.OVYiLzCHZDmPHWZuuZxPhNbnmfnDA7vlBfOZIp9qLEmB1KO',NULL,NULL,NULL,1,'2012-09-17 11:05:41','2012-09-17 11:05:41','127.0.0.1','127.0.0.1','2012-09-17 11:05:40','2012-09-17 11:05:41','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-10','pune,maharastra-411020','pune,madhyapradesh-411020'),(41,'mayur4@cuberoot.in','$2a$10$SE26Bl.F5JvezOJHmE17xeLE5.U6uH4kPJQziROr8cLhPODFeDFDy',NULL,NULL,NULL,5,'2012-09-27 05:34:26','2012-09-27 05:34:11','127.0.0.1','127.0.0.1','2012-09-17 12:28:47','2012-09-27 05:34:26','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'B+','asdg@gmail.com','asdgasdg@gmail.com','2012-08-03','',''),(42,'mayur5@cuberoot.in','$2a$10$Mcdd/m4KPokhdhoG.ybFROFF/Pw5mDUIDFG9CdJQ7eYSJXpSOydd6',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-17 12:34:55','2012-09-17 12:34:55','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(43,'mayur6@cuberoot.in','$2a$10$XRRlvyyra1WAN/Y.p8ENYODeaSg1OaLvY0b3Du794mtfrbbaEUSxS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-17 12:39:18','2012-09-17 12:39:18','employee',NULL,12,'2012-01-01',18,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(44,'mayur3@cuberoot.in','$2a$10$72FPQ3z47LYjiL8/KsWJiuZ.niMw2Kv.c5yrrjxL1DiXWIjLvDW9e',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 05:19:13','2012-09-18 05:19:13','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(45,'mayur7@cuberoot.in','$2a$10$0idvN/BKmQjE/hJkaKqvpOAYcZBSAp62glHcctw/k42rNL5gj8FU.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 06:27:52','2012-09-18 06:27:52','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(46,'mayur8@cuberoot.in','$2a$10$xv7KFklG9AgZnMMqpYKP8Os1q/7gDBasctv4T4NcDeAnvM0LP6XIC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 06:29:35','2012-09-18 06:29:35','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(47,'mayur9@cuberoot.in','$2a$10$uFVX0V18Z0TeOJK5uesL1OWLoShqWixF4d3dTFZLJ2uu2stXvW2pS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 07:30:04','2012-09-18 07:30:04','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(48,'mayur10@cuberoot.in','$2a$10$kC.3z/oE61nZmPTJX50Ar.KCnoL6rqF3qWixx1GeGl1YL79oNq0fK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 07:32:58','2012-09-18 07:32:58','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-08-09','',''),(49,'mayur11@cuberoot.in','$2a$10$eqccjBGHoIMlQA/jN5V6guuR4hPAziMgG1j0lF8PxX7tDpKWXDAmG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-18 09:05:12','2012-09-18 09:05:12','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(50,'mayur12@cuberoot.in','$2a$10$FeKf8lG/DmJ7houGGbT6le9GE0VisIphjdR4ZOQhMUQr3OPzu/JFC',NULL,NULL,NULL,1,'2012-09-18 09:08:03','2012-09-18 09:08:03','127.0.0.1','127.0.0.1','2012-09-18 09:07:59','2012-09-18 09:08:03','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(51,'mayur13@cuberoot.in','$2a$10$yjtMRVgZrl7342Rz5ewewubcGuGq9HcBSQjMTPe0kLmLC9AIwZJVu',NULL,NULL,NULL,1,'2012-09-18 09:13:13','2012-09-18 09:13:13','127.0.0.1','127.0.0.1','2012-09-18 09:13:09','2012-09-18 09:13:13','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(52,'mayur14@cuberoot.in','$2a$10$7ge1IA7bnlxwbg183hke.uoO7oj1cC70zmEAhPFn9J1ZteFPC7Tpq',NULL,NULL,NULL,1,'2012-09-18 09:21:41','2012-09-18 09:21:41','127.0.0.1','127.0.0.1','2012-09-18 09:21:34','2012-09-18 09:21:41','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'A+','asdg@gmail.com','asdgasdg@gmail.com','2012-09-02','',''),(53,'mayur18@cuberoot.in','$2a$10$McciUGS4HYFo41fDojsyw.Oyp1SEd.tkQvagwv88mDHdaWEgJg6LG',NULL,NULL,NULL,1,'2012-09-18 10:54:42','2012-09-18 10:54:42','127.0.0.1','127.0.0.1','2012-09-18 10:54:37','2012-09-18 10:54:42','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdgasdg',9999999999,'B-','asdg@gmail.com','asdgasdg@gmail.com','2012-09-03','pune,maharastra-411020','pune,madhyapradesh-411020'),(54,'mayur19@cuberoot.in','$2a$10$D9dt75OE4.deckgvyQjNQ.n2h0GqoGiOOTAypyDLYLW17KUurdOEq',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-09-25 13:15:37','2012-09-25 13:15:37','employee',NULL,12,'2012-01-01',NULL,9999999999,9999999999,'asdfg',9999999999,'A+','asd@gmail.com','asdfgh@gmail.com','2012-09-03','pune,maharastra-411020','pune,maha-411020');
/*!40000 ALTER TABLE "users" ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-05 12:55:19
