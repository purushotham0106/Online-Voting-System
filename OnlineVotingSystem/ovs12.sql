/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - onlinevotingsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinevotingsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `onlinevotingsystem`;

/*Table structure for table `candidate` */

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `VOTERID` int(4) NOT NULL,
  `CONSTITUENCY` varchar(50) NOT NULL,
  `AGE` int(3) NOT NULL,
  `ELECTIONID` int(4) NOT NULL,
  `ELECTIONNAME` varchar(100) NOT NULL,
  `ISAPPROVED` tinyint(1) NOT NULL,
  `VOTE` int(10) DEFAULT '0',
  `PARTY_NAME` varchar(100) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `candidate` */

insert  into `candidate`(`ID`,`NAME`,`VOTERID`,`CONSTITUENCY`,`AGE`,`ELECTIONID`,`ELECTIONNAME`,`ISAPPROVED`,`VOTE`,`PARTY_NAME`) values (12,'Ravi',1,'Mysuru',23,10,'General',1,3,'Volunteer'),(13,'Kal',2,'Mysuru',24,10,'General',1,0,'Volunteer'),(14,'Jill',3,'Mysuru',23,10,'General',1,1,'Volunteer'),(15,'Ravi',7,'Mysuru',23,11,'General',1,1,'Volunteer'),(16,'Renu',5,'Mysuru',23,11,'General',1,0,'Volunteer');

/*Table structure for table `election` */

DROP TABLE IF EXISTS `election`;

CREATE TABLE `election` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `WINNER` int(4) DEFAULT '0',
  `CONSTITUENCY` varchar(100) NOT NULL,
  `DATE` varchar(25) NOT NULL,
  `ACTIVE` tinyint(1) NOT NULL,
  `NOMINATIONDATE` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `election` */

insert  into `election`(`ID`,`NAME`,`WINNER`,`CONSTITUENCY`,`DATE`,`ACTIVE`,`NOMINATIONDATE`) values (10,'General',12,'Mysuru','05/22/2020',1,'05/15/2020'),(11,'General',0,'Mysuru','06/24/2020',1,'06/17/2020'),(12,'General Elections',0,'Mysuru','08/16/2021',0,'08/13/2021');

/*Table structure for table `voter` */

DROP TABLE IF EXISTS `voter`;

CREATE TABLE `voter` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) NOT NULL,
  `AGE` int(3) NOT NULL,
  `SSN` varchar(15) NOT NULL,
  `CONSTITUENCY` varchar(35) NOT NULL,
  `VOTED` tinyint(1) NOT NULL,
  `ISCANDIDATE` tinyint(1) NOT NULL,
  `MOBILENUMBER` bigint(10) NOT NULL,
  `USERNAME` varchar(15) NOT NULL,
  `PASSWORD` varchar(15) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `voter` */

insert  into `voter`(`ID`,`NAME`,`AGE`,`SSN`,`CONSTITUENCY`,`VOTED`,`ISCANDIDATE`,`MOBILENUMBER`,`USERNAME`,`PASSWORD`,`EMAIL`) values (1,'Ravi',23,'A234567890','Mysuru',0,1,9677251702,'user','pass','gowreesh.ideonix@gmail.com'),(2,'Kal',24,'B234567890','Mysuru',0,1,9677251702,'user1','pass1','gowreesh.ideonix@gmail.com'),(3,'Jill',23,'C234567890','Mysuru',0,1,9677251702,'user2','pass2','gowreesh.ideonix@gmail.com'),(4,'John',23,'D234567890','Mysuru',0,0,9677251702,'user3','pass3','gowreesh.ideonix@gmail.com'),(5,'Renu',23,'E234567890','Mysuru',0,1,9164063545,'user4','pass4','gowreesh.ideonix@gmail.com'),(6,'Ramu',52,'sdsdv5656566565','Mysuru',0,0,9012345678,'user5','pass5','gowreesh.ideonix@gmail.com'),(7,'Ravi',23,'A98765432101','Mysuru',0,1,9876543210,'ravi123','Ravi123','gowreesh.ideonix@gmail.com'),(8,'sham',23,'A98765412312222','Mysuru',1,0,9865431201,'sham1','Sham123','gowreesh.ideonix@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
