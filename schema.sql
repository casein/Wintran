-- MySQL dump 10.9
--
-- Host: localhost    Database: development
-- ------------------------------------------------------
-- Server version	4.1.22-standard

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
CREATE TABLE `points` (
  `transect_id` varchar(50) NOT NULL default '',
  `route_stop_id` varchar(50) NOT NULL default '',
  `id` varchar(50) NOT NULL default '',
  `pointPosition` int(11) NOT NULL default '0',
  `pointActive` int(11) NOT NULL default '0',
  `pointLocDesc` varchar(120) default NULL,
  `pointXCoord` varchar(50) default NULL,
  `pointYCoord` varchar(50) default NULL,
  `pointZCoord` varchar(50) default NULL,
  `pointSoilSymbol` varchar(50) default NULL,
  `pointSoilName` varchar(50) default NULL,
  `pointSlope` float default NULL,
  `pointSlopeLength` float default NULL,
  `pointTFactor` float default NULL,
  `pointKFactor` float default NULL,
  `pointWatershedNum` varchar(50) default NULL,
  `pointWatershedHUCCode` varchar(50) default NULL,
  `pointWatershedName` varchar(100) default NULL,
  `pointFieldSize` float default NULL,
  KEY `point_slope` (`pointSlope`),
  KEY `point_active` (`pointActive`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `route_stops`
--

DROP TABLE IF EXISTS `route_stops`;
CREATE TABLE `route_stops` (
  `transect_id` varchar(50) NOT NULL default '',
  `id` varchar(50) NOT NULL default '',
  `routestopNumber` varchar(50) NOT NULL default '',
  `routestopValue` float default NULL,
  `routestopXCoord` varchar(50) default NULL,
  `routestopYCoord` varchar(50) default NULL,
  `routestopZCoord` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL default '',
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
CREATE TABLE `seasons` (
  `transect_id` varchar(50) NOT NULL default '',
  `route_stop_id` varchar(50) NOT NULL default '',
  `point_id` varchar(50) NOT NULL default '',
  `seasonYear` int(11) NOT NULL default '0',
  `seasonCrop` varchar(120) default NULL,
  `seasonTillage` varchar(120) default NULL,
  `seasonContouring` int(11) default NULL,
  `seasonFilterstrip` int(11) default NULL,
  `seasonEphemErosion` int(11) default NULL,
  `seasonResidue` float default NULL,
  `seasonPFactor` int(11) default NULL,
  `seasonR2SingleYearSoilLoss` float default NULL,
  `seasonR2MultiYearSoilLoss` float default NULL,
  PRIMARY KEY  (`point_id`,`seasonYear`),
  KEY `season_year` (`seasonYear`),
  KEY `season_crop` (`seasonCrop`),
  KEY `season_tillage` (`seasonTillage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `transects`
--

DROP TABLE IF EXISTS `transects`;
CREATE TABLE `transects` (
  `id` varchar(50) NOT NULL default '',
  `transectRouteName` varchar(50) default NULL,
  `transectStateNum` int(11) default NULL,
  `transectStateName` varchar(50) default NULL,
  `transectCountyNum` int(11) default NULL,
  `transectCountyName` varchar(50) default NULL,
  `transectCountyAcreage` int(11) default NULL,
  `transectGPSUnits` varchar(50) default NULL,
  `transectGPSCoords` varchar(50) default NULL,
  `transectNotes` varchar(250) default NULL,
  `transectYearsInAveR2` int(11) default NULL,
  `transectStartYearAveR2` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `persistence_token` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

