-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ttcsc317db
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` varchar(45) NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post to users_idx` (`fk_userid`),
  CONSTRAINT `post to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test title10','test test test10 test','image/test10.png','images/thumbnails/test10',0,'2020-12-21 18:17:39',1),(2,'test','traffic cone','public\\images\\uploads\\3015c13cb1a7df3067864fd7139dfe425d90a61cc671.jpeg','public/images/uploads/thumbnail-3015c13cb1a7df3067864fd7139dfe425d90a61cc671.jpeg',0,'2020-12-21 18:21:41',2),(3,'test','traffic cone','public\\images\\uploads\\6a83aee612f3ad49ca377330c97bf26929c9313d9d53.jpeg','public/images/uploads/thumbnail-6a83aee612f3ad49ca377330c97bf26929c9313d9d53.jpeg',0,'2020-12-21 18:21:41',2),(4,'hi ','IDK','public\\images\\uploads\\09880db60e70674a483988523ecc915437ee5c9839cd.png','public/images/uploads/thumbnail-09880db60e70674a483988523ecc915437ee5c9839cd.png',0,'2020-12-21 18:22:32',2),(5,'Red Sun','Closeup view of the sun','public\\images\\uploads\\e669d736975156f248184c14b6844c1edaebb07f06cc.jpeg','public/images/uploads/thumbnail-e669d736975156f248184c14b6844c1edaebb07f06cc.jpeg',0,'2020-12-22 15:57:48',2),(6,'Sunset','nice view','public\\images\\uploads\\70821917fe2161776a6de625ed7840285b60620e27b8.jpeg','public/images/uploads/thumbnail-70821917fe2161776a6de625ed7840285b60620e27b8.jpeg',0,'2020-12-22 15:58:33',2),(7,'Birds Lost at Sea','Depicting bird pirates','public\\images\\uploads\\254280bd6f6078b1ce6793882e6321ae30ab40dd9e47.jpeg','public/images/uploads/thumbnail-254280bd6f6078b1ce6793882e6321ae30ab40dd9e47.jpeg',0,'2020-12-22 17:20:01',3),(8,'Desert','Picture of the desert','public\\images\\uploads\\a48d56aabb32bc56b75ebef888f704c27ff93b5a5b79.jpeg','public/images/uploads/thumbnail-a48d56aabb32bc56b75ebef888f704c27ff93b5a5b79.jpeg',0,'2020-12-22 18:05:36',3),(9,'Heart','Picture of a heart','public\\images\\uploads\\dbebf7655cde7810c7559f2886837cd3f0b155d62a26.jpeg','public/images/uploads/thumbnail-dbebf7655cde7810c7559f2886837cd3f0b155d62a26.jpeg',0,'2020-12-22 18:06:07',3),(10,'Real Heart','Picture of a heart','public\\images\\uploads\\f7963c7782cb5ae9d2f61c45bd33c287c1b48ca33fa4.jpeg','public/images/uploads/thumbnail-f7963c7782cb5ae9d2f61c45bd33c287c1b48ca33fa4.jpeg',0,'2020-12-22 18:06:41',3),(11,'Landscape','Beautiful landscapes','public\\images\\uploads\\d68cdade1106d0335efc08e16e3d227ca4eb0384e8d5.jpeg','public/images/uploads/thumbnail-d68cdade1106d0335efc08e16e3d227ca4eb0384e8d5.jpeg',0,'2020-12-22 18:07:13',3),(12,'Panda','panda','public\\images\\uploads\\011be4a6f8c3d032f755a94ba63cc215b0697408b9dd.jpeg','public/images/uploads/thumbnail-011be4a6f8c3d032f755a94ba63cc215b0697408b9dd.jpeg',0,'2020-12-22 23:30:17',3);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 23:43:42
