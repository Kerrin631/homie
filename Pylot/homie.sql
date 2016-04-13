-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: homie
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `Friends`
--

DROP TABLE IF EXISTS `Friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `is_match` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Friends_Users_idx` (`user_id`),
  KEY `fk_Friends_Users1_idx` (`friend_id`),
  CONSTRAINT `fk_Friends_Users` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Friends_Users1` FOREIGN KEY (`friend_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Friends`
--

LOCK TABLES `Friends` WRITE;
/*!40000 ALTER TABLE `Friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `Friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_id` int(11) NOT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Messages_Users1_idx` (`User_id`),
  KEY `fk_Messages_Users2_idx` (`friend_id`),
  CONSTRAINT `fk_Messages_Users1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Messages_Users2` FOREIGN KEY (`friend_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL COMMENT '	',
  `gender` varchar(45) DEFAULT NULL,
  `profile_info` text,
  `latitude` decimal(15,12) DEFAULT '0.000000000000',
  `longitude` decimal(15,12) DEFAULT '0.000000000000',
  `clientID` varchar(255) DEFAULT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (25,'Kerrin','Arora','kerrin.arora@gmail.com',25,'Male','Web Developer living in houston. Looking to meet new people',29.760426700000,-95.369802800000,'10206082805299528','CAAVZArbiwZBE8BAPxtuftMSAgTDxUI9RDR8fUAuPjyDn7duZBZC4Dj8By1zwZCZCsGBMIyQ6ATuzUN6fzkmT7OkZCr2nLP3PuwOT0VwoHfoqbuEg5NH2kI3AdPmyHp69QWTjxGsPVPvxyCEn1NZBrNEpAU0fZBRiIB4IzJrJknrSzFlU6WG27PJUznJZCA3M9Wjgd0zFuV4mZBWzgZDZD'),(26,'Clifford','Wright','fordwright@gmail.com',24,'Male','Full stack developer and entrepreneur and building some cool stuff.',37.377339600000,-121.911922700000,'1231714590177451','CAAVZArbiwZBE8BACZBb7rOAdOv6LUQz42VUyi2XTiNeodaJt9s5lxHdawZCn1nqeWaUlT4RWvK11UC9YwS7tiO7vtXiyVpDzsC4ueL4IjE57tooZBPINyBX5kTbn45Szwo04DDejY7nP30rNpoj1W5n1XikRgTBIXAsNM6SxacWtwnynst0NTDdkj49mdvVP8N5HjXqy1kW9jcuDSd9Xw'),(27,'Chad','Fegley','trinitywolves557@hotmail.com',26,'Male','I like to play sports and video games. Always like to put the whoopin\' on people in any sport. Lets grab a beer and watch the game',37.377330900000,-121.912014900000,'927716353930557','CAAVZArbiwZBE8BAAoH8uaDKt2lsYl78UVN3jAwKCdSAe7NlBYxnyAjcBrQZCli6B2Y6vY7oANC2Lw47KZBh6bLrUj1FZA11QNPAmmNHmvFyjJsNIRZCYcW5krCW1QOcHW8voJ08urXTXrEWwdottpAPCLAq9FMRRwFZA3yvOkfSLtT4HTZCzi130kl1PoZA0FNkyVY6lKYqL1W9xWwKfsmaYB'),(28,'Sanjiv','Sharma','sansarus88@gmail.com',44,'Male','striving to be a dev',37.377350100000,-121.911878000000,'129005430815190','CAAVZArbiwZBE8BAD68UE3JN64fDryjjEFqtcQujItoxKChZC0UlqmIZAP2NXAoK9IVBbMsNqyXsH5LxKaYJJWoibjjuHEWJX2UOQUwOWcg35dQYUI70t2vcrBuHVJQNkDcuf3IRLLG5HrXMmCO8xvwJseJkf2scU2WYpl0KmUul1I3NtZA3NcJb6hJ5GttCH7ot4AkL6tIseHDZA154B1O'),(29,'David','Chen','islandtiki21@yahoo.com',33,'Male','I am hungry',37.377340300000,-121.911935500000,'10153521672852293','CAAVZArbiwZBE8BAGBNwcGv0Ji89p0fULfLexfc6pBZCj63LjyitWngWNFqcqjkPbAdHgGpq0NXxh9ON0RXA8E5NY9Fb2A8oZCOK992BHJIFvbhXuLMpotrFtxIZBYoZB81Glq9ZBXQf1uqjtLZAGHfTmeCTzbfJwqOiyRZAdAqtHl1xvIT7s1ybV9h3M2Iweg5FhHFU3wchfOnAZDZD'),(30,'Amrita','Kaur','amritakc@gmail.com',29,'Female','wanna be dev',37.377349600000,-121.912026800000,'10103093972820551','CAAVZArbiwZBE8BAB7Fhzs8uqj7hGpguE3yOQ8gZCUzhec8AZCx5xxvIYuZBUd9gbMwTUhquFBsPhyLZCWtUy1IYZBxmcWoiZB7oFZBR2x3V4CU0X8MD7MHHmaEpE5B6tBkQBmBLvjzh1byuCEi8LZBK4dPswYtuOqZB6GPAS0Brxv2nwxLrP3ZA4HfSG5yPbc7IXK6EQjD9HNLYkzYHsEdCeQ6ty'),(31,'Matthew','Nguyen','madd1778@yahoo.com',25,'Male','Passion never fails and you dont need a 100 person company to develop that idea. Go dubbs... not that i ever watch when Kerrin asks',37.377310000000,-121.911895800000,'10153506079127872','CAAVZArbiwZBE8BANg5ZA5z623os4rkvRKqYgQDaENZBObMJStgoJUs7XGVojYXKZCZBkQNQOBs2zwSV5CG4rxqvIdnkWDJBjW2ZAHhes5X3v0ZCGNoAQRsmeFezKRZCxst7kwVQQvVKTUBaKu7FcuU8cW0cwmxdGjOqaYeVTMpJFjxWySCokaydfeNtZBhpBwflnNg47zqrwRNyQZDZD'),(32,'Luke','Skywalker','luke_btfhyst_skywalker@tfbnw.net',60,'Male','I love staring at the ocean and skipping rocks. I turn around every 20 minutes hoping someone will be there. I think I\'ll do that for the next 20 years. Also my nephew is a douche so lets not talk about that.',0.000000000000,0.000000000000,'109663252752197','CAAVZArbiwZBE8BAKHE0S70NQVkMPZBUmMKRTSrIcoSrPrSXt6WXWRjnlmfubreTwRasNAXEfquNwZApYtLZCseZAtby0mtZCTvUO135Y5uvzyKZBO2coP9qFK6lrMggtFUFuMhoX8W5a6w6yPNOe4mHLdG3DZALRTm3bkV11ZAYfLDxtZBZBcndx0QmtJqRSYnrw3d6wZBnspLaHapwZDZD'),(33,'Dora','Explorer','dora_kbdpznf_explorer@tfbnw.net',8,'Female','BIENVENIDOS!! My name is dora and I like to explora. My best friend is named \"Boots\". I am new to the area and I dont know my way back because my best friend \"Maps\" doesnt know.',0.000000000000,0.000000000000,'102841023435453','CAAVZArbiwZBE8BALsmXV8GTDcgnLEIf1vQDIh07a7fQlxaTBM3li2vihhk6J0STvX5HTMLspxDp8ir32I50Gt8wdTCA5mIDN8ZB2KJ1bdnrbZAYZBDKD3dpD84eFRlA85QZC8DudVZAUnyHc0WiqZBjTZBZBYJLZANKaEPik74vaYKlDYFFoJk2VZBjtvTq2jvflqvLc6V2FtMG70wZDZD'),(34,'Kylo','Ren','kylo_ilybxnk_ren@tfbnw.net',30,'Male','Leader of the Order of Ren. I enjoy long walks on the beach thinking about my dead grandfather. My dad and I don\'t get along but its okay... I wont be seeing much of him anymore. If you want to meet someone to write Darth Vader fan fiction with then click yes!',0.000000000000,0.000000000000,'114671108917296','CAAVZArbiwZBE8BAEjmXmE2mZCw3VteHPpGgEZBbZCF7IRBp388G611WJHgZCOs1oCdZCAYdziLBHhiyEQjKBCiXj3Tyz5VWJFYuDZAsZBh8kZCEo6yF2mrIAOq7AKdW7FNCPki22n2Rrb2bWEc8GK8ZBe0ArfBjZBW5lSncDkeRx4ph1MBQznLJskXRi72wphNNNMPXkldqo6ZAgHmQZDZD'),(36,'Kwadwo','Danso','ezzzy703@yahoo.com',20,'Male','I am chillin wit da homies!',37.377326900000,-121.911876100000,'10204145568359518','CAAVZArbiwZBE8BANKEfOEpLxUFgVnPZAR9QQhGjl2NwqZBjddfdkqrsdaTEuz3C6PCatlaeksr6AdtiOjjdaQ3tp5MaNBJ4hFZAXRuhMZCknmUIkJT9iJkkF2x6p8bgdWEbOkCEXkYorE9RRytZAsZB8WZBqo4rNG7lV6CuHtW8OVWRyc4Mjo140mlbHIm1VjBJZBclRBOQSzLxypGus9LHSgT');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-13 15:53:15
