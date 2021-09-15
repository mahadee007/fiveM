information_schemainformation_schemaessentialmode-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `essentialmode`;

-- Dumping structure for table essentialmode.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.addon_account: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'caution', 0),
	('property_black_money', 'Money Sale Property', 0),
	('society_ambulance', 'หน่วยแพทย์', 1),
	('society_cardealer', 'พนักงานขายรถ', 1),
	('society_mecano', 'ช่างซ่อมในตำนาน', 1),
	('society_police', 'เจ้าหน้าที่ตำรวจ', 1),
	('society_sealz', 'หน่วย SEAL', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.addon_account_data: ~36 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_cardealer', 0, NULL),
	(3, 'society_mechanic', 0, NULL),
	(4, 'society_police', 8800, NULL),
	(206, 'society_taxi', 0, NULL),
	(554, 'society_mecano', 0, NULL),
	(555, 'society_sealz', 0, NULL),
	(556, 'property_black_money', 0, 'steam:11000011b44055b'),
	(557, 'caution', 0, 'steam:11000011b44055b'),
	(558, 'property_black_money', 0, 'steam:11000013d499d1e'),
	(559, 'caution', 2000, 'steam:11000013d499d1e'),
	(560, 'caution', 0, 'steam:110000116e3c6b0'),
	(561, 'property_black_money', 0, 'steam:110000116e3c6b0'),
	(562, 'property_black_money', 0, 'steam:1100001377ac69a'),
	(563, 'caution', 0, 'steam:1100001377ac69a'),
	(564, 'property_black_money', 0, 'steam:11000010e4093d5'),
	(565, 'caution', 0, 'steam:11000010e4093d5'),
	(566, 'property_black_money', 0, 'steam:1100001352d04d1'),
	(567, 'caution', 0, 'steam:1100001352d04d1'),
	(568, 'caution', 0, 'steam:11000010480fe75'),
	(569, 'property_black_money', 0, 'steam:11000010480fe75'),
	(570, 'caution', 0, 'steam:11000010b3f3065'),
	(571, 'property_black_money', 0, 'steam:11000010b3f3065'),
	(572, 'caution', 0, 'steam:11000011084faec'),
	(573, 'property_black_money', 0, 'steam:11000011084faec'),
	(574, 'caution', 0, 'steam:11000010ec17c2f'),
	(575, 'property_black_money', 0, 'steam:11000010ec17c2f'),
	(576, 'property_black_money', 0, 'steam:110000116dfb3f6'),
	(577, 'caution', 0, 'steam:110000116dfb3f6'),
	(578, 'property_black_money', 0, 'steam:1100001349a49e9'),
	(579, 'caution', 0, 'steam:1100001349a49e9'),
	(580, 'caution', 0, 'steam:1100001074479bd'),
	(581, 'property_black_money', 0, 'steam:1100001074479bd'),
	(582, 'property_black_money', 0, 'steam:11000013cd0f06b'),
	(583, 'caution', 0, 'steam:11000013cd0f06b'),
	(584, 'caution', 0, 'steam:11000013bd3ffa9'),
	(585, 'property_black_money', 0, 'steam:11000013bd3ffa9'),
	(586, 'property_black_money', 0, 'steam:110000110da5ab4'),
	(587, 'caution', 0, 'steam:110000110da5ab4'),
	(588, 'caution', 0, 'steam:11000010dc8e7fd'),
	(589, 'property_black_money', 0, 'steam:11000010dc8e7fd'),
	(590, 'caution', 0, 'steam:11000013dfc8aed'),
	(591, 'property_black_money', 0, 'steam:11000013dfc8aed'),
	(592, 'caution', 0, 'steam:110000114ec25fb'),
	(593, 'property_black_money', 0, 'steam:110000114ec25fb');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.addon_inventory: ~7 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'หน่วยแพทย์', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_mecano', 'ช่างซ่อมในตำนาน', 1),
	('society_police', 'เจ้าหน้าที่ตำรวจ', 1),
	('society_sealz', 'หน่วย SEAL', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.addon_inventory_items: ~1 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
	(33, 'property', 'leather', 0, 'steam:11000013dfc8aed');
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.billing: ~1 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES
	(906, 'steam:11000013dfc8aed', 'steam:11000013dfc8aed', 'society', 'society_police', 'Speedcamera (120KM/H)', 300);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table essentialmode.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.characters: ~22 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`) VALUES
	(299, 'steam:11000011b44055b', 'เสือใบ', 'สะอาดดี', '1990-08-22', 'M', '180', '8728'),
	(300, 'steam:110000116e3c6b0', 'Jhan', 'Jui', '1989-01-13', 'M', '200', '3114'),
	(301, 'steam:11000010e4093d5', 'Root', 'Admin', '1990-01-01', 'M', '200', '2654'),
	(302, 'steam:1100001352d04d1', 'เสี่ยฮอล', 'Gbg', '1996-10-01', 'M', '180', '8723'),
	(303, 'steam:11000010480fe75', 'XaaK', 'Jonsson', '1996-11-05', 'M', '180', '2126'),
	(304, 'steam:11000010b3f3065', 'Leon', 'Kenoby', '1985-03-14', 'M', '174', '7223'),
	(305, 'steam:11000011084faec', 'Copter', 'Ratwong', '1990-01-01', 'M', '178', '9988'),
	(306, 'steam:11000010ec17c2f', 'dasasd', 'sdd', '1990-01-10', 'M', '165', '3866'),
	(307, 'steam:11000010ec17c2f', 'dasasd', 'sdd', '1990-01-10', 'M', '165', '3857'),
	(308, 'steam:110000116dfb3f6', 'Sunsun', 'Bery', '1990-01-09', 'F', '171', '8473'),
	(309, 'steam:11000013d499d1e', 'THE', 'TOYS', '1990-01-12', 'F', '180', '3114'),
	(310, 'steam:1100001074479bd', 'บักเอ็ม', 'หำใหย่', '1994-06-03', 'M', '190', '1456'),
	(311, 'steam:11000013cd0f06b', 'Charukit', 'Thongsukdi', '1996-08-28', 'M', '163', '5666'),
	(312, 'steam:11000013d499d1e', 'เสือใบ', 'สะอาดดี', '1990-09-12', 'M', '190', '1688'),
	(313, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2004-08-08', 'M', '168', '7164'),
	(314, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '7664'),
	(315, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '2348'),
	(316, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '5974'),
	(317, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '2651'),
	(318, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '7529'),
	(319, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '2973'),
	(320, 'steam:11000013bd3ffa9', 'Big', 'Jukku', '2000-08-08', 'M', '168', '4197'),
	(321, 'steam:110000110da5ab4', 'Jason', 'Sim', '1996-02-13', 'M', '180', '2295'),
	(322, 'steam:11000010dc8e7fd', 'Samoy', 'Waduhek', '2002-06-23', 'M', '185', '2875'),
	(323, 'steam:110000114ec25fb', 'Yhithaway', 'Phothong', '2005-06-18', 'M', '15', '9521'),
	(324, 'steam:11000013d499d1e', 'เจ๊ศรี', 'หมีเหม็น', '1990-01-25', 'F', '190', '6626');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.datastore: ~7 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'หน่วยแพทย์', 1),
	('society_police', 'เจ้าหน้าที่ตำรวจ', 1),
	('society_sealz', 'sealz', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  KEY `index_datastore_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1454 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.datastore_data: ~98 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(502, 'society_ambulance', NULL, '{}'),
	(503, 'society_police', NULL, '{"weapons":[{"name":"WEAPON_NIGHTSTICK","count":2},{"name":"WEAPON_COMBATPISTOL","count":0},{"name":"WEAPON_PUMPSHOTGUN","count":1},{"name":"WEAPON_CARBINERIFLE","count":1},{"name":"WEAPON_ADVANCEDRIFLE","count":1},{"name":"WEAPON_STUNGUN","count":1},{"name":"WEAPON_PISTOL","count":1},{"name":"WEAPON_PISTOL50","count":1},{"name":"WEAPON_FLASHLIGHT","count":1}]}'),
	(1358, 'society_sealz', NULL, '{}'),
	(1359, 'user_glasses', 'steam:11000011b44055b', '{}'),
	(1360, 'property', 'steam:11000011b44055b', '{}'),
	(1361, 'user_mask', 'steam:11000011b44055b', '{"hasMask":true,"skin":{"mask_2":1,"mask_1":7}}'),
	(1362, 'user_helmet', 'steam:11000011b44055b', '{}'),
	(1363, 'user_ears', 'steam:11000011b44055b', '{}'),
	(1364, 'property', 'steam:11000013d499d1e', '{}'),
	(1365, 'user_glasses', 'steam:11000013d499d1e', '{}'),
	(1366, 'user_mask', 'steam:11000013d499d1e', '{}'),
	(1367, 'user_helmet', 'steam:11000013d499d1e', '{}'),
	(1368, 'user_ears', 'steam:11000013d499d1e', '{}'),
	(1369, 'user_helmet', 'steam:110000116e3c6b0', '{}'),
	(1370, 'user_mask', 'steam:110000116e3c6b0', '{}'),
	(1371, 'property', 'steam:110000116e3c6b0', '{}'),
	(1372, 'user_glasses', 'steam:110000116e3c6b0', '{}'),
	(1373, 'user_ears', 'steam:110000116e3c6b0', '{}'),
	(1374, 'user_ears', 'steam:1100001377ac69a', '{}'),
	(1375, 'user_glasses', 'steam:1100001377ac69a', '{}'),
	(1376, 'user_helmet', 'steam:1100001377ac69a', '{}'),
	(1377, 'user_mask', 'steam:1100001377ac69a', '{}'),
	(1378, 'property', 'steam:1100001377ac69a', '{}'),
	(1379, 'user_glasses', 'steam:11000010e4093d5', '{}'),
	(1380, 'user_mask', 'steam:11000010e4093d5', '{}'),
	(1381, 'property', 'steam:11000010e4093d5', '{}'),
	(1382, 'user_ears', 'steam:11000010e4093d5', '{}'),
	(1383, 'user_helmet', 'steam:11000010e4093d5', '{}'),
	(1384, 'user_glasses', 'steam:1100001352d04d1', '{}'),
	(1385, 'user_helmet', 'steam:1100001352d04d1', '{}'),
	(1386, 'user_mask', 'steam:1100001352d04d1', '{}'),
	(1387, 'user_ears', 'steam:1100001352d04d1', '{}'),
	(1388, 'property', 'steam:1100001352d04d1', '{}'),
	(1389, 'user_ears', 'steam:11000010480fe75', '{}'),
	(1390, 'user_glasses', 'steam:11000010480fe75', '{}'),
	(1391, 'property', 'steam:11000010480fe75', '{}'),
	(1392, 'user_mask', 'steam:11000010480fe75', '{}'),
	(1393, 'user_helmet', 'steam:11000010480fe75', '{}'),
	(1394, 'user_ears', 'steam:11000010b3f3065', '{}'),
	(1395, 'user_helmet', 'steam:11000010b3f3065', '{}'),
	(1396, 'user_glasses', 'steam:11000010b3f3065', '{}'),
	(1397, 'user_mask', 'steam:11000010b3f3065', '{}'),
	(1398, 'property', 'steam:11000010b3f3065', '{}'),
	(1399, 'property', 'steam:11000011084faec', '{}'),
	(1400, 'user_ears', 'steam:11000011084faec', '{}'),
	(1401, 'user_helmet', 'steam:11000011084faec', '{}'),
	(1402, 'user_mask', 'steam:11000011084faec', '{}'),
	(1403, 'user_glasses', 'steam:11000011084faec', '{}'),
	(1404, 'user_ears', 'steam:11000010ec17c2f', '{}'),
	(1405, 'property', 'steam:11000010ec17c2f', '{}'),
	(1406, 'user_glasses', 'steam:11000010ec17c2f', '{}'),
	(1407, 'user_helmet', 'steam:11000010ec17c2f', '{}'),
	(1408, 'user_mask', 'steam:11000010ec17c2f', '{}'),
	(1409, 'property', 'steam:110000116dfb3f6', '{}'),
	(1410, 'user_glasses', 'steam:110000116dfb3f6', '{}'),
	(1411, 'user_helmet', 'steam:110000116dfb3f6', '{}'),
	(1412, 'user_mask', 'steam:110000116dfb3f6', '{}'),
	(1413, 'user_ears', 'steam:110000116dfb3f6', '{}'),
	(1414, 'user_ears', 'steam:1100001349a49e9', '{}'),
	(1415, 'property', 'steam:1100001349a49e9', '{}'),
	(1416, 'user_glasses', 'steam:1100001349a49e9', '{}'),
	(1417, 'user_mask', 'steam:1100001349a49e9', '{}'),
	(1418, 'user_helmet', 'steam:1100001349a49e9', '{}'),
	(1419, 'user_glasses', 'steam:1100001074479bd', '{}'),
	(1420, 'user_ears', 'steam:1100001074479bd', '{}'),
	(1421, 'user_helmet', 'steam:1100001074479bd', '{}'),
	(1422, 'property', 'steam:1100001074479bd', '{}'),
	(1423, 'user_mask', 'steam:1100001074479bd', '{}'),
	(1424, 'user_glasses', 'steam:11000013cd0f06b', '{}'),
	(1425, 'user_helmet', 'steam:11000013cd0f06b', '{}'),
	(1426, 'property', 'steam:11000013cd0f06b', '{}'),
	(1427, 'user_mask', 'steam:11000013cd0f06b', '{}'),
	(1428, 'user_ears', 'steam:11000013cd0f06b', '{}'),
	(1429, 'user_glasses', 'steam:11000013bd3ffa9', '{}'),
	(1430, 'user_helmet', 'steam:11000013bd3ffa9', '{}'),
	(1431, 'user_mask', 'steam:11000013bd3ffa9', '{}'),
	(1432, 'property', 'steam:11000013bd3ffa9', '{}'),
	(1433, 'user_ears', 'steam:11000013bd3ffa9', '{}'),
	(1434, 'property', 'steam:110000110da5ab4', '{}'),
	(1435, 'user_mask', 'steam:110000110da5ab4', '{}'),
	(1436, 'user_helmet', 'steam:110000110da5ab4', '{}'),
	(1437, 'user_ears', 'steam:110000110da5ab4', '{}'),
	(1438, 'user_glasses', 'steam:110000110da5ab4', '{}'),
	(1439, 'user_mask', 'steam:11000010dc8e7fd', '{}'),
	(1440, 'user_helmet', 'steam:11000010dc8e7fd', '{}'),
	(1441, 'user_ears', 'steam:11000010dc8e7fd', '{}'),
	(1442, 'user_glasses', 'steam:11000010dc8e7fd', '{}'),
	(1443, 'property', 'steam:11000010dc8e7fd', '{}'),
	(1444, 'user_helmet', 'steam:11000013dfc8aed', '{}'),
	(1445, 'property', 'steam:11000013dfc8aed', '{}'),
	(1446, 'user_glasses', 'steam:11000013dfc8aed', '{}'),
	(1447, 'user_ears', 'steam:11000013dfc8aed', '{}'),
	(1448, 'user_mask', 'steam:11000013dfc8aed', '{}'),
	(1449, 'user_ears', 'steam:110000114ec25fb', '{}'),
	(1450, 'user_glasses', 'steam:110000114ec25fb', '{}'),
	(1451, 'user_helmet', 'steam:110000114ec25fb', '{}'),
	(1452, 'property', 'steam:110000114ec25fb', '{}'),
	(1453, 'user_mask', 'steam:110000114ec25fb', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.economy
CREATE TABLE IF NOT EXISTS `economy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.economy: ~8 rows (approximately)
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
INSERT INTO `economy` (`ID`, `item`, `label`, `count`, `price`) VALUES
	(1, 'cockles', 'หอยแครงลวก', 0, 80),
	(2, 'cowpackage', 'เนื้อวัวแพ็ค', 0, 148),
	(3, 'meat_w', 'เนื้อวาฬ', 0, 103),
	(4, 'rice_pro', '🌿ข้าวเปลือก', 0, 177),
	(5, 'honey_b', '🍯 น้ำผึ้งเดือนห้า', 0, 150),
	(6, 'crabPack', 'ก้ามปู', 0, 138),
	(7, 'fish', '🐟 ปลา', 0, 122),
	(8, 'pro_wood', '🎋ไม้แปรรูป', 0, 188);
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.fine_types: ~64 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(127, 'ความเร็วเกิน 80km/h', 300, 0),
	(128, 'ความเร็วเกิน 120km/h', 500, 0),
	(129, 'ความเร็วเกิน 180km/h', 800, 0),
	(130, 'ขับรถโดยประมาท', 1000, 0),
	(132, 'ฝ่าฝืนกฏจราจร ผ่าไฟแดง', 500, 0),
	(133, 'จอดรถผิดที่', 300, 0),
	(134, 'ขับรถโดยไม่มีใบขับขี่', 1500, 0),
	(135, 'ขับรถสภาพไม่เต็ม100%', 200, 0),
	(136, 'เมาแล้วขับ', 5000, 0),
	(137, 'การแข่งรถโดยไม่ได้รับอนุญาติ', 3000, 0),
	(139, 'รบกวนโดยใช้เสียง', 500, 1),
	(140, 'ล่วงละเมิด ทางร่างกาย', 1000, 1),
	(142, 'ปฐิเสธการจับกุม', 3000, 1),
	(143, 'เมาในที่สาธารณะ', 500, 1),
	(144, 'ขัดขวางการทำงานของเจ้าหน้าที่รัฐ', 2000, 1),
	(148, 'การละเมิดทางอาญา', 1000, 1),
	(149, 'ทำลายทรัพย์สิน', 1000, 1),
	(151, 'การพยายามปล้นสิ่งของ', 2000, 1),
	(152, 'มีสิ่งผิดกฏหมายในครอบครอง', 5000, 1),
	(153, 'มีสิ่งผิดกฏหมายในครอบครอง จำนวนมาก', 10000, 1),
	(155, 'การปล้นสิ่งของที่มีมูลมากกว่า $950', 1000, 2),
	(157, 'แจ้งข้อมูลเท็จ , พยานเท็จ', 5000, 2),
	(158, 'หลบหนีและมีความผิดทางอาญา', 15000, 2),
	(160, 'ปลอมแปลงหลักฐาน', 15000, 2),
	(161, 'มีเงินผิดกฏหมายในครอบครอง', 10000, 2),
	(162, 'กระทำให้ผู้อื่น รู้สึกถึงอันตราย', 2000, 2),
	(163, 'ชนแล้วหนี', 5000, 0),
	(164, 'ทำร้ายโดยไม่เจตนา', 1000, 2),
	(165, 'ทำร้ายผู้อื่นโดยเจตนา', 4000, 2),
	(166, 'ทำร้ายเจ้าพนักงาน', 15000, 2),
	(167, 'ปล้นรถยนต์', 3000, 2),
	(168, 'การปล้นปืน', 5000, 2),
	(173, 'แอบซุกซ่อนสิ่งเสพติดไว้ในพาหนะ', 8000, 2),
	(174, 'ครอบครอง สิ่งของสำหรับลักพาตัว', 3000, 2),
	(177, 'หลบหนี', 10000, 2),
	(179, 'หลบหนีขณะติดอาวุธ', 15000, 3),
	(180, 'ครอบครองอาวุธปืน แล้วทำผิดทางอาญา', 80000, 3),
	(182, 'พกปืนโดยไม่มีใบอนุญาติ', 50000, 3),
	(183, 'ก่อเหตุจลาจล', 10000, 3),
	(184, 'ทำร้ายร่างกาย', 2000, 3),
	(185, 'ปล้นธนาคารโดยใช้อาวุธ', 10000, 3),
	(186, 'ปล้นใช้อาวุธ', 8000, 3),
	(187, 'ขู่กรรโชก', 5000, 3),
	(189, 'ติดสินบนเจ้าพนักงาน', 5000, 3),
	(190, 'ฆาตกรรมเจ้าหน้าที่รัฐ', 35000, 3),
	(191, 'สมรู้ร่วมคิดในการฆาตกรรมเจ้าหน้าที่รัฐ', 35000, 3),
	(193, 'สมรู้ร่วมคิดในการฆาตกรรม', 10000, 3),
	(194, 'ช่วยเหลือผู้กระทำผิด', 10000, 3),
	(195, 'ฆ่าโดยไม่ไตร่ตรอง', 30000, 3),
	(196, 'ฆ่าคนตายโดยประมาท', 15000, 3),
	(199, 'กักขังหน่วงเหนี่ยว', 5000, 3),
	(200, 'ลักพาตัว', 5000, 3),
	(201, 'ขโมยสิ่งของเจ้าหน้าที่รัฐ', 20000, 3),
	(204, 'ปลอมตัวเป็นเจ้าหน้าที่รัฐ ', 50000, 2),
	(206, 'ถืออาวุธในสถานที่สาธาราณะ', 10000, 3),
	(207, ' ถืออาวุธในสถานที่ราชการ', 15000, 3),
	(208, 'ขโมยรถเจ้าหน้าที่รัฐ', 10000, 2),
	(209, 'ขับขี่บนถนนผิดเลน', 1500, 0),
	(210, 'ชนแล้วหนีทำให้ผู้อื่นเสียชีวิต', 20000, 0),
	(211, 'พกอาวุธระยะประชิต', 3000, 3),
	(216, 'ลักพาตัวเจ้าพนักงานรัฐ', 2000, 3);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table essentialmode.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.items: ~190 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('9mm_rounds', 'กระสุน 9 ม.ม', 50, 0, 1),
	('AED', 'เครื่องปั้มหัวใจ', 1, 0, 1),
	('Gears', 'อะไหล่รถ', 21, 0, 1),
	('Scrap_a', 'เหล็ก', 40, 0, 1),
	('SteelScrap', 'เศษเหล็ก', 40, 0, 1),
	('WEAPON_BAT', 'ไม้เบสบอล', 1, 0, 1),
	('a_clar', 'ฟืน', 20, 0, 1),
	('acabbage', 'กะหล่ำปลี', 20, 0, 1),
	('alive_chick', 'ไก่', 50, 0, 1),
	('alive_chicken', 'ไก่สด', 20, 0, 1),
	('aluminium', 'อลูมิเนี่ยม', 30, 0, 1),
	('ammo_pistol', 'Ammo Pistol x24', 50, 0, 1),
	('ammo_pistol50', 'Ammo Pistol .50 x18', 50, 0, 1),
	('anesthetic1', 'ยาสลบ', 5, 0, 1),
	('anesthetic2', 'น้ำเกลือ', 5, 0, 1),
	('armor', 'เกราะกันกระสุน', 1, 0, 1),
	('b_clar', 'ถ่านหิน', 20, 0, 1),
	('bag', 'กระเป๋า', 1, 0, 1),
	('bait', 'ใส้เดือน', 20, 0, 1),
	('bandage', 'ผ้าพันเเผล', 20, 0, 1),
	('battery', 'แบตเตอร์รี่', 10, 0, 1),
	('bcabbage', 'กะหล่ำปลี', 20, 0, 1),
	('beer', 'เบียร์', 15, 0, 1),
	('bikersuit', 'Gucci Belt', 20, 0, 1),
	('binoculars', 'กล้องส่องทางไกล', 1, 0, 1),
	('black_money', 'Dirty Money', -1, 0, 1),
	('blindfold', 'ผ้าปิดตา', 1, 0, 1),
	('blowpipe', 'พ่น', 10, 0, 1),
	('bolchips', 'เลย์', 5, 0, 1),
	('bong', 'Smook Bong', 1, 0, 1),
	('bottle', 'ขวดเปล่า', -1, 0, 1),
	('bread', 'ขนมปัง', 15, 0, 1),
	('broken_gun', 'ซากปืนที่แตกหัก ', 10, 0, 1),
	('burrito', 'Burrito', 10, 0, 1),
	('c4_bank', 'ระเบิด C4', 5, 0, 1),
	('candy', 'candy', 10, 0, 1),
	('cannabis', 'ใบกัญชา', 20, 0, 1),
	('car_keys', 'กุญแจรถ', -1, 0, 1),
	('carokit', 'ชุดร่างกาย', 3, 0, 1),
	('carotool', 'เครื่องมือ', 2, 0, 1),
	('cashew', 'Cashew', 15, 0, 1),
	('catfish', 'ปลาดุก', 50, 0, 1),
	('catfishfood', 'ยำปลาดุฟู', 20, 0, 1),
	('cheesebows', 'เทสโต', 15, 0, 1),
	('chest_a', 'เหรียญทอง', 100, 0, 1),
	('chips', 'เลย์', 15, 0, 1),
	('chocolate', 'ช็อคโกแลต', 15, 0, 1),
	('cigarett', 'บุหรี่', 15, 0, 1),
	('clip', 'กระสุนปืน', 50, 0, 1),
	('clothe', 'เสื้อ', 20, 0, 1),
	('cocaine', 'Cocain', 20, 0, 1),
	('cockles', 'หอยแครงลวก', 20, 0, 1),
	('coffe', 'กาแฟ', 10, 0, 1),
	('coke', 'Coke', 20, 0, 1),
	('coke_pooch', 'Coke Pooch', 20, 0, 1),
	('copper', 'แร่ทองแดง', 50, 0, 1),
	('copper_bar', 'Copper Gun', 50, 0, 1),
	('cow', 'เนื้อวัว', 30, 0, 1),
	('cowpackage', 'เนื้อวัวแพ็ค', 15, 0, 1),
	('crab', 'ปูทะเล', 60, 0, 1),
	('crab_a', 'กระดองปู', 20, 0, 1),
	('crab_pro', 'ปูแพ็ค', 21, 0, 1),
	('crabpack', 'ปูแพ็ค', 21, 0, 1),
	('croquettes', 'อาหารสุนัข', 20, 0, 1),
	('cupcake', 'Cup cake', 15, 0, 1),
	('cutted_wood', 'ท่อนไม้', 20, 0, 1),
	('deer', 'เนื้อกวาง', 20, 0, 1),
	('diamond', 'เพชร', 20, 0, 1),
	('donut1', 'โดนัท', 5, 0, 1),
	('donut2', 'โดนัท ช็อกโกแลต', 5, 0, 1),
	('drills', 'เครื่องขุดเจาะ', 1, 0, 1),
	('essence', 'เเก็ส', 14, 0, 1),
	('fabric', ' ผ้า', 40, 0, 1),
	('fish', 'ปลา', 100, 0, 1),
	('fishbait', 'เหยื่อปลา', 30, 0, 1),
	('fishingrod', 'เบ็ดตกปลา', 5, 0, 1),
	('fixkit', 'ชุดซ่อม', 5, 0, 1),
	('fixtool', 'ชุดซ่อม', 5, 0, 1),
	('function', 'เชือก', 1, 0, 1),
	('gazbottle', 'ขวดแก๊ส', 10, 0, 1),
	('glass', 'กระจก', 15, 0, 1),
	('gold', 'ทอง', 20, 0, 1),
	('gold_o', 'แร่ทองคำ', 40, 0, 1),
	('gold_t', 'ทองคำแท่ง', 20, 0, 1),
	('grill', 'เตาย่าง', 1, 0, 1),
	('gun_barrel', 'Gun Barrel', 5, 0, 1),
	('gunpowder', 'ผงดินปืน', 10, 0, 1),
	('gym_membership', 'Gym Membership', 1, 0, 1),
	('hamajifish', 'ปลาฮามาจิ', 30, 0, 1),
	('hamburger', 'เเฮมเบอเกอร์', 15, 0, 1),
	('handcuffs', 'กุญแจมือ', 1, 0, 1),
	('handcuffs_key', 'Handcuffs Key', 1, 0, 1),
	('hatchet', 'Hatchet', 1, 0, 1),
	('hatchet_lj', 'ขวานตัดไม้', 1, 0, 1),
	('honey_a', 'รังผึ้ง', 42, 0, 1),
	('honey_b', 'น้ำผึ้งเดือนห้า', 14, 0, 1),
	('icetea', 'ชาเย็น', 15, 0, 1),
	('iron', 'IRON', 40, 0, 1),
	('iron_gun', 'เหล็กทำปืน', 50, 0, 1),
	('keyhouse', 'กุญแจบ้าน', 1, 0, 1),
	('knife', 'มีดพับ', 1, 0, 1),
	('knife_handel', 'ปลอกมีด', 1, 0, 1),
	('lay_b', 'เลย์', 10, 0, 1),
	('leather', 'Leather', 20, 0, 1),
	('leather_gun', 'ด้ามปืนหนังวัว', 5, 0, 1),
	('ledeer', 'หนังกวาง', 70, 0, 1),
	('lemonkey', 'หนังลิง', 20, 0, 1),
	('lighter', 'ไฟเเช็ก', 1, 0, 1),
	('lockpick', 'Lock pick', 1, 0, 1),
	('magazine', 'แม็กกาซีน', 10, 0, 1),
	('marijuana_cigarette', 'บุหรี่กัญชา', 15, 0, 1),
	('meat', 'เนื้อหมู', 30, 0, 1),
	('meat_w', 'เนื้อวาฬ', 50, 0, 1),
	('meatfood', 'Meat Food', 10, 0, 1),
	('medikit', 'ชุดปฐมพยาบาล', 10, 0, 1),
	('metal_scrap', 'Metal Scrap', 300, 0, 1),
	('meth', 'Meth', 20, 0, 1),
	('meth_pooch', 'Meth Pooch', 20, 0, 1),
	('milk', 'นม', 50, 0, 1),
	('milk_engine', 'เครื่องรีดนมวัว', 1, 0, 1),
	('milk_package', 'นมกล่อง', 5, 0, 1),
	('monkey', 'เนื้อลิง', 20, 0, 1),
	('mushroom', 'Mushroom', 60, 0, 1),
	('mushroom_d', 'Dirty Mushroom', -1, 0, 1),
	('mushroom_p', 'Mushroom Pack', 20, 0, 1),
	('news_bmic', 'ไมค์ยาว', 1, 0, 1),
	('news_cam', 'กล้องนักข่าว', 1, 0, 1),
	('news_mic', 'ไมค์', 1, 0, 1),
	('nots', 'น็อต', 20, 0, 1),
	('orange_a', 'ส้ม', 40, 0, 1),
	('orangewater_b', 'น้ำส้มคั้น', 40, 0, 1),
	('org_a', 'ส้ม', 98, 0, 1),
	('oxygen_mask', 'หน้ากากออกซิเจน', 1, 0, 1),
	('packaged_chicken', 'ไก่แพ็ค', 50, 0, 1),
	('packaged_plank', 'ไม้แปรรูป', 10, 0, 1),
	('paper_bag', 'ถุงกระดาษ', 5, 0, 1),
	('petrol', 'น้ำมัน', 25, 0, 1),
	('petrol_raffin', 'น้ำมันแปรรูป', 25, 0, 1),
	('phone', 'iPhone 11 Pro', 1, 0, 1),
	('plongee1', 'Diving Suit', -1, 0, 1),
	('poolreceipt', 'Receipt', 15, 0, 1),
	('poteto', 'มันฝรั่ง', 100, 0, 1),
	('powerade', 'Powerade', 20, 0, 1),
	('prawn', 'กุ้ง', 30, 0, 1),
	('prawnbait', 'เหยื่อกุ้ง', 30, 0, 1),
	('pro_wood', 'ไม้แปรรูป', 21, 0, 1),
	('protein_shake', 'Protein Shake', 20, 0, 1),
	('pumkin', 'ฟักทอง', 15, 0, 1),
	('pumkin_pro', 'ฟักทองแปรรูป', 40, 0, 1),
	('radio', 'Police Radio', 1, 0, 1),
	('rice', 'ต้นข้าว', 80, 0, 1),
	('rice_pro', 'ข้าวเปลือก', 20, 0, 1),
	('rope', 'เชือก', 1, 0, 1),
	('saltpeter', 'ขี้เกลือ', 20, 0, 1),
	('sand', 'ทราย', 30, 0, 1),
	('sandwich', 'เเซนวิส', 15, 0, 1),
	('shark', 'ปลาฉลาม', 1, 0, 1),
	('shell', 'หอยแครง', 40, 0, 1),
	('shovel', 'พลั่ว', 1, 0, 1),
	('sickle', 'เคียวเกี่ยวข้าว', 1, 0, 1),
	('sicklecrab', 'พลั่วขุดปู', 1, 0, 1),
	('slaughtered_chicken', 'เนื้อไก่', 20, 0, 1),
	('sportlunch', 'Sportlunch', 20, 0, 1),
	('spring', 'สปริง', 5, 0, 1),
	('squid', 'ปลาหมึก', 50, 0, 1),
	('squidbait', 'เหยื่อปลาหมึก', 30, 0, 1),
	('steel_b', 'เหล็กแท้', 40, 0, 1),
	('steel_bar', 'Steel Bar', 20, 0, 1),
	('stone', 'หิน', -1, 0, 1),
	('table_saw', 'โต๊ะเลื่อย', 1, 0, 1),
	('tequila', 'เตกีล่า', 15, 0, 1),
	('turtle', 'เต่าทะเล', 20, 0, 1),
	('turtlebait', 'เหยื่อเต่า', 10, 0, 1),
	('vodka', 'วอดก้า', 15, 0, 1),
	('wale', 'ปลาวาฬ', 1, 0, 1),
	('washed_stone', 'หินล้าง', 10, 0, 1),
	('water', 'น้ำเปล่า', 20, 0, 1),
	('weaponflashlight', 'ไฟฉาย', 1, 0, 1),
	('weapongrip', 'ด้ามจับ', 1, 0, 1),
	('weaponskin', 'สกินปืน', 1, 0, 1),
	('weed_pooch', 'กัญชาขวด', 20, 0, 1),
	('welding_gun', 'ปืนตัดเหล็ก', 1, 0, 1),
	('whale', 'ปลาวาฬ', 1, 0, 1),
	('whisky', 'วิสกี้', 15, 0, 1),
	('wine', 'ไวน์', 15, 0, 1),
	('wire', 'สายไฟ', 10, 0, 1),
	('wood', 'ไม้', 40, 0, 1),
	('wool', 'ขนสัตว์', 40, 0, 1),
	('worm', 'หนอน', 20, 0, 1),
	('zap_oil', 'น้ำมันสน', 5, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jobs: ~16 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'หน่วยแพทย์', 1),
	('cardealer', 'พนักงานขายรถ', 1),
	('fisherman', 'ชาวประมง', 0),
	('fueler', '⛽ ธุรกิจน้ำมัน', 0),
	('lumberjack', 'คนตัดไม้', 1),
	('mecano', 'ช่าง', 1),
	('miner', 'คนขุดเหมือง', 0),
	('offambulance', 'แพทย์ออกเวร', 1),
	('offmecano', 'ช่างออกเวร', 1),
	('offpolice', 'ตำรวจออกเวร', 1),
	('police', 'ตำรวจ', 1),
	('reporter', 'นักข่าว', 1),
	('slaughterer', 'พนักงานโรงงานไก่', 0),
	('tailor', 'ช่างเย็บผ้า', 0),
	('taxi', 'Thai Taxi', 0),
	('unemployed', 'ว่างงาน', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table essentialmode.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.job_grades: ~58 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'ว่างงาน', 0, '{}', '{}'),
	(2, 'lumberjack', 0, 'employee', 'ระดับตำนาน', 0, '{}', '{}'),
	(3, 'fisherman', 0, 'employee', 'ระดับตำนาน', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":188,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":2,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":2,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":63,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":9,"helmet_1":5,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":188,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":2,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":2,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":63,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":9,"helmet_1":5,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(4, 'fueler', 0, 'employee', 'ระดับตำนาน', 0, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(5, 'reporter', 0, 'employee', 'นักข่าว ', 100, '{}', '{}'),
	(6, 'tailor', 0, 'employee', 'ระดับตำนาน', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(7, 'miner', 0, 'employee', 'ระดับตำนาน', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(8, 'slaughterer', 0, 'employee', 'ระดับตำนาน', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(10, 'ambulance', 0, 'ambulance', 'นักศึกษาเเพทย์', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(11, 'ambulance', 1, 'doctor', 'เเพทย์ชำนาญ', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(12, 'ambulance', 2, 'chief_doctor', 'หัวหน้าแผนกแพทย์ ', 100, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(13, 'police', 0, 'recruit', 'นักเรียนตำรวจ', 20, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(14, 'police', 1, 'officer', 'จ่า', 40, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(15, 'police', 2, 'sergeant', 'หมวด', 60, '{}', '{}'),
	(16, 'police', 3, 'lieutenant', 'สารวัตร', 85, '{}', '{}'),
	(17, 'police', 4, 'boss', 'ผู้บัญชาการตำรวจแห่งชาติ', 100, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":2,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"glasses":0,"decals_1":8,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"torso_2":0,"arms":41,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"hair_2":3,"decals_2":2,"hair_color_2":0,"hair_color_1":10,"helmet_2":0,"face":21,"shoes":24,"torso_2":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"decals_1":7,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(18, 'cardealer', 0, 'recruit', 'เด็กฝึกงาน', 50, '{}', '{}'),
	(19, 'cardealer', 1, 'novice', 'พนักงานขาย', 50, '{}', '{}'),
	(20, 'cardealer', 2, 'experienced', 'ผู้ช่วยเถ่าเเก่', 50, '{}', '{}'),
	(21, 'cardealer', 3, 'boss', 'CEO', 200, '{}', '{}'),
	(50, 'ambulance', 3, 'chief_doctor1', 'รองหัวหน้าเเพทย์', 250, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(51, 'police', 6, 'lieutenant1', 'ผู้บัญชาการตำรวจแห่งชาติ', 200, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":2,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"glasses":0,"decals_1":8,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"torso_2":0,"arms":41,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"hair_2":3,"decals_2":2,"hair_color_2":0,"hair_color_1":10,"helmet_2":0,"face":21,"shoes":24,"torso_2":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"decals_1":7,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(52, 'police', 5, 'lieutenant2', 'ผู้บังคับการ', 150, '', ''),
	(53, 'ambulance', 4, 'boss', 'ผู้อำนวยการเเพทย์', 200, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(54, 'taxi', 0, 'recrue', 'มือใหม่', 50, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(55, 'taxi', 1, 'novice', 'มืออาชีพ', 100, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(56, 'taxi', 2, 'experimente', 'รองหัวประธาน', 140, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(57, 'taxi', 3, 'uber', 'อูเบอร์', 180, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(58, 'taxi', 4, 'boss', 'ประธานแท๊กซี่', 230, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(59, 'mecano', 0, 'recrue', 'นักเรียนช่าง', 100, '{"mask_1":0,"arms":15,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":28,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":238,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":53,"tshirt_2":0,"beard_3":0,"hair_1":68,"hair_color_1":0,"pants_1":83,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":15,"glasses_1":1,"hair_color_2":4,"makeup_1":0,"face":31,"glasses":0,"mask_2":0,"makeup_3":0,"skin":0,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":105,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":15,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":0,"beard_2":0,"ears_2":0,"hair_2":0,"shoes_1":8,"tshirt_2":0,"beard_3":0,"hair_1":17,"hair_color_1":0,"pants_1":62,"helmet_1":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":0,"shoes":8,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(60, 'mecano', 1, 'novice', 'ช่าง', 100, '{"mask_1":0,"arms":15,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":28,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":238,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":53,"tshirt_2":0,"beard_3":0,"hair_1":68,"hair_color_1":0,"pants_1":83,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":15,"glasses_1":1,"hair_color_2":4,"makeup_1":0,"face":31,"glasses":0,"mask_2":0,"makeup_3":0,"skin":0,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":105,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":15,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":0,"beard_2":0,"ears_2":0,"hair_2":0,"shoes_1":8,"tshirt_2":0,"beard_3":0,"hair_1":17,"hair_color_1":0,"pants_1":62,"helmet_1":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":0,"shoes":8,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(61, 'mecano', 2, 'experimente', 'มืออาชีพ', 100, '{"mask_1":0,"arms":15,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":28,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":238,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":53,"tshirt_2":0,"beard_3":0,"hair_1":68,"hair_color_1":0,"pants_1":83,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":15,"glasses_1":1,"hair_color_2":4,"makeup_1":0,"face":31,"glasses":0,"mask_2":0,"makeup_3":0,"skin":0,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":105,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":15,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":0,"beard_2":0,"ears_2":0,"hair_2":0,"shoes_1":8,"tshirt_2":0,"beard_3":0,"hair_1":17,"hair_color_1":0,"pants_1":62,"helmet_1":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":0,"shoes":8,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(62, 'mecano', 3, 'chief', 'ชำนาญการ', 150, '{"mask_1":0,"arms":15,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":28,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":238,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":53,"tshirt_2":0,"beard_3":0,"hair_1":68,"hair_color_1":0,"pants_1":83,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":15,"glasses_1":1,"hair_color_2":4,"makeup_1":0,"face":31,"glasses":0,"mask_2":0,"makeup_3":0,"skin":0,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":105,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":15,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":0,"beard_2":0,"ears_2":0,"hair_2":0,"shoes_1":8,"tshirt_2":0,"beard_3":0,"hair_1":17,"hair_color_1":0,"pants_1":62,"helmet_1":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":0,"shoes":8,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(63, 'mecano', 4, 'boss', 'หัวหน้าช่าง', 200, '{"mask_1":0,"arms":15,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":28,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":238,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":53,"tshirt_2":0,"beard_3":0,"hair_1":68,"hair_color_1":0,"pants_1":83,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":15,"glasses_1":1,"hair_color_2":4,"makeup_1":0,"face":31,"glasses":0,"mask_2":0,"makeup_3":0,"skin":0,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":105,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":15,"eyebrows_3":0,"pants_2":1,"beard_4":0,"torso_2":0,"beard_2":0,"ears_2":0,"hair_2":0,"shoes_1":8,"tshirt_2":0,"beard_3":0,"hair_1":17,"hair_color_1":0,"pants_1":62,"helmet_1":0,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":0,"shoes":8,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(64, 'ambulance', 5, 'chief_doctor2', 'รองหัวหน้าแผนกแพทย์ ', 150, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(65, 'offpolice', 0, 'recruit', 'นักเรียนตำรวจ', 12, '{}', '{}'),
	(66, 'offpolice', 1, 'officer', 'จ่า', 24, '{}', '{}'),
	(67, 'offpolice', 2, 'sergeant', 'หมวด', 36, '{}', '{}'),
	(68, 'offpolice', 3, 'lieutenant', 'สารวัตร', 48, '{}', '{}'),
	(69, 'offpolice', 4, 'boss', 'ผู้บังคับการ', 58, '{}', '{}'),
	(70, 'offpolice', 5, 'lieutenant1', 'ผู้กำกับ', 0, '{}', '{}'),
	(71, 'offpolice', 6, 'lieutenant2', 'รองผู้กำกับ', 0, '{}', '{}'),
	(72, 'offambulance', 0, 'ambulance', 'นักศึกษาเเพทย์', 12, '{}', '{}'),
	(73, 'offambulance', 1, 'doctor', 'เเพทย์ชำนาญ', 24, '{}', '{}'),
	(74, 'offambulance', 2, 'chief_doctor', 'หัวหน้าแผนกแพทย์ ', 36, '{}', '{}'),
	(75, 'offambulance', 3, 'chief_doctor1', 'รองหัวหน้าเเพทย์', 48, '{}', '{}'),
	(76, 'offambulance', 4, 'boss', 'ผู้อำนวยการเเพทย์', 58, '{}', '{}'),
	(77, 'offambulance', 5, 'chief_doctor2', 'รองหัวหน้าแผนกแพทย์ ', 0, '{}', '{}'),
	(78, 'offmecano', 0, 'recrue', 'นักเรียนช่าง', 12, '{}', '{}'),
	(79, 'offmecano', 1, 'novice', 'ช่าง', 22, '{}', '{}'),
	(80, 'offmecano', 2, 'experimente', 'มืออาชีพ ', 32, '{}', '{}'),
	(81, 'offmecano', 3, 'chief', 'ชำนาญการ', 42, '{}', '{}'),
	(82, 'offmecano', 4, 'boss', 'หัวหน้าช่าง', 52, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_cardetails
CREATE TABLE IF NOT EXISTS `jsfour_cardetails` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `incident` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `inspected` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_cardetails: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_cardetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_cardetails` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_criminalrecord
CREATE TABLE IF NOT EXISTS `jsfour_criminalrecord` (
  `offense` varchar(160) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `charge` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `term` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classified` int(2) NOT NULL DEFAULT 0,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `warden` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`offense`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_criminalrecord: ~1 rows (approximately)
/*!40000 ALTER TABLE `jsfour_criminalrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_criminalrecord` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_criminaluserinfo
CREATE TABLE IF NOT EXISTS `jsfour_criminaluserinfo` (
  `identifier` varchar(160) COLLATE utf8mb4_bin NOT NULL,
  `aliases` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `recordid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `eyecolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `haircolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_criminaluserinfo: ~1 rows (approximately)
/*!40000 ALTER TABLE `jsfour_criminaluserinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_criminaluserinfo` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_dna
CREATE TABLE IF NOT EXISTS `jsfour_dna` (
  `pk` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `killer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dead` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `weapon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT 'murder',
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uploader` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `datum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_dna: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_dna` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_dna` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_efterlysningar
CREATE TABLE IF NOT EXISTS `jsfour_efterlysningar` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `wanted` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `crime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uploader` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `incident` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_efterlysningar: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_efterlysningar` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_efterlysningar` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_incidents
CREATE TABLE IF NOT EXISTS `jsfour_incidents` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `text` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uploader` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_incidents: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_incidents` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jsfour_logs
CREATE TABLE IF NOT EXISTS `jsfour_logs` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `remover` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `wanted` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.jsfour_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `jsfour_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jsfour_logs` ENABLE KEYS */;

-- Dumping structure for table essentialmode.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.licenses: ~12 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('cabbage_processing', 'Cabbage Processing License'),
	('coke_processing', 'Coke Processing License'),
	('dig_processing', 'dig Processing License'),
	('dmv', 'Code de la route'),
	('drive', 'ใบอณุญาติขับขี่รถยนต์'),
	('drive_bike', 'ใบอณุญาติขับขี่มอเตอร์ไซค์'),
	('drive_truck', 'ใบอณุญาติขับรถบรรทุก'),
	('gold_processing', 'Gold Processing License'),
	('mushroom_processing', 'Mushroom Processing License'),
	('org_processing', 'Orange Processing License'),
	('weapon', 'ใบอณุญาติพกอาวุธ'),
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_bags
CREATE TABLE IF NOT EXISTS `owned_bags` (
  `identifier` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `itemcount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.owned_bags: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_bags` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_bags` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_bag_inventory
CREATE TABLE IF NOT EXISTS `owned_bag_inventory` (
  `id` int(11) DEFAULT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.owned_bag_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_bag_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_bag_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.owned_vehicles: ~9 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
	('steam:11000013dfc8aed', 'DMU 959', '{"modRearBumper":-1,"plateIndex":0,"windowTint":0,"modStruts":-1,"modOrnaments":-1,"modExhaust":-1,"wheelColor":5,"modAirFilter":-1,"plate":"DMU 959","extras":{"3":false,"1":false},"modGrille":-1,"modBrakes":-1,"modSteeringWheel":-1,"modEngine":-1,"modSideSkirt":-1,"modDial":-1,"modVanityPlate":-1,"modDashboard":-1,"modTrimB":-1,"modAPlate":-1,"modTurbo":false,"color2":3,"neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"wheels":7,"modSeats":-1,"modEngineBlock":-1,"modShifterLeavers":-1,"modWindows":-1,"modRightFender":-1,"modDoorSpeaker":-1,"modArmor":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"modLivery":-1,"modHorns":-1,"modRoof":-1,"modArchCover":-1,"modAerials":-1,"color1":2,"modFrame":-1,"modPlateHolder":-1,"modFender":-1,"modSpeakers":-1,"modTrimA":-1,"modXenon":false,"modSuspension":-1,"model":1165853178,"modBackWheels":-1,"modTransmission":-1,"modHood":-1,"modFrontBumper":-1,"modSmokeEnabled":1,"health":1000,"modHydrolic":-1,"modTrunk":-1,"dirtLevel":1.1665700674057,"modFrontWheels":-1,"modTank":-1,"pearlescentColor":156}', 'car', '', 1),
	('steam:11000013dfc8aed', 'ELS 936', '{"modPlateHolder":-1,"modHorns":-1,"modFrontWheels":-1,"modArchCover":-1,"modEngine":3,"modXenon":1,"modSmokeEnabled":1,"modTrimB":-1,"modOrnaments":-1,"neonColor":[255,102,255],"windowTint":4,"modArmor":-1,"model":836213613,"modSeats":-1,"modRearBumper":-1,"modSuspension":3,"modRightFender":-1,"modAirFilter":-1,"modSpeakers":-1,"modBrakes":2,"modExhaust":-1,"color2":27,"modFrame":-1,"health":1000,"modWindows":-1,"modSteeringWheel":-1,"modTurbo":1,"wheelColor":156,"modShifterLeavers":-1,"tyreSmokeColor":[255,102,178],"modTrimA":-1,"plateIndex":2,"modGrille":-1,"modSideSkirt":-1,"modDial":-1,"modVanityPlate":-1,"pearlescentColor":27,"modSpoilers":-1,"modHood":-1,"modDoorSpeaker":-1,"modLivery":-1,"extras":[],"modFender":-1,"dirtLevel":0.20228643715382,"color1":92,"wheels":7,"modAerials":-1,"modTransmission":2,"modRoof":-1,"modTrunk":-1,"modBackWheels":-1,"modEngineBlock":-1,"modStruts":-1,"modHydrolic":-1,"modFrontBumper":-1,"neonEnabled":[1,1,1,1],"modDashboard":-1,"plate":"ELS 936","modAPlate":-1,"modTank":-1}', 'car', '', 0),
	('steam:11000013d499d1e', 'HIO 577', '{"dirtLevel":3.0000011920929,"health":1000,"modDoorSpeaker":-1,"modTrimA":-1,"modAerials":-1,"modOrnaments":-1,"modTrimB":-1,"modAirFilter":-1,"modPlateHolder":-1,"modEngineBlock":-1,"modTank":-1,"modGrille":-1,"pearlescentColor":15,"wheels":7,"modRoof":-1,"modTurbo":false,"modLivery":-1,"modTrunk":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modSpoilers":-1,"modFender":-1,"modFrontBumper":-1,"plate":"HIO 577","modSmokeEnabled":false,"modBrakes":-1,"color1":15,"modExhaust":-1,"modShifterLeavers":-1,"modHorns":-1,"model":934775262,"modSteeringWheel":-1,"modWindows":-1,"modDial":-1,"modSeats":-1,"wheelColor":156,"modRearBumper":-1,"extras":{"4":false,"1":false,"2":true,"3":false},"modArchCover":-1,"modFrame":-1,"modHood":-1,"modTransmission":-1,"modBackWheels":-1,"modXenon":false,"plateIndex":0,"modDashboard":-1,"modSuspension":-1,"modAPlate":-1,"modFrontWheels":-1,"color2":107,"modArmor":-1,"neonEnabled":[false,false,false,false],"modSpeakers":-1,"modRightFender":-1,"modStruts":-1,"modVanityPlate":-1,"modEngine":-1,"modSideSkirt":-1,"windowTint":-1,"tyreSmokeColor":[255,255,255]}', 'car', '', 1),
	('steam:11000013dfc8aed', 'HPF 603', '{"modFrame":-1,"modTrimA":-1,"neonColor":[0,0,255],"modTrunk":-1,"wheelColor":28,"modLivery":-1,"modVanityPlate":-1,"modHydrolic":-1,"modSteeringWheel":-1,"color1":147,"plate":"HPF 603","modDial":-1,"modFrontWheels":8,"modTrimB":-1,"modHood":-1,"color2":27,"modStruts":-1,"modPlateHolder":-1,"modTransmission":2,"wheels":7,"modTank":-1,"modWindows":-1,"modAPlate":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"modGrille":-1,"modHorns":-1,"modEngine":3,"modRightFender":-1,"modSideSkirt":-1,"modBackWheels":-1,"modSmokeEnabled":1,"modSuspension":3,"health":1000,"modOrnaments":-1,"modSpeakers":-1,"modArmor":-1,"extras":[],"modFrontBumper":-1,"pearlescentColor":1,"modSeats":-1,"neonEnabled":[1,1,1,1],"modEngineBlock":-1,"modFender":-1,"model":-2123405935,"modAirFilter":-1,"modBrakes":2,"windowTint":0,"modAerials":-1,"modSpoilers":-1,"modExhaust":-1,"plateIndex":2,"dirtLevel":3.9202818870544,"modArchCover":-1,"modXenon":false,"modDoorSpeaker":-1,"modTurbo":1,"modDashboard":-1,"modShifterLeavers":-1,"modRoof":-1}', 'car', '', 1),
	('steam:11000013d499d1e', 'IVY 982', '{"modLivery":-1,"modAerials":-1,"modStruts":-1,"modSteeringWheel":-1,"modXenon":false,"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1,"windowTint":-1,"plateIndex":4,"neonColor":[255,0,255],"modDial":-1,"modHood":-1,"modEngineBlock":-1,"modArchCover":-1,"pearlescentColor":38,"modFrontBumper":-1,"modTurbo":false,"neonEnabled":[false,false,false,false],"modRoof":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modFrontWheels":-1,"modOrnaments":-1,"extras":{"1":true},"modRightFender":-1,"wheelColor":1,"modVanityPlate":-1,"modBackWheels":-1,"modDashboard":-1,"wheels":0,"modHorns":-1,"modSuspension":-1,"modSideSkirt":-1,"modRearBumper":-1,"modAPlate":-1,"modSpoilers":-1,"dirtLevel":8.1818399429321,"modShifterLeavers":-1,"modSeats":-1,"color1":38,"modEngine":-1,"model":-747269546,"modFender":-1,"modArmor":-1,"modTrimB":-1,"modBrakes":-1,"modSpeakers":-1,"modSmokeEnabled":false,"health":999,"modHydrolic":-1,"modFrame":-1,"modTrimA":-1,"modTank":-1,"modGrille":-1,"modExhaust":-1,"modTrunk":-1,"plate":"IVY 982","modAirFilter":-1,"color2":1}', 'car', '', 1),
	('steam:11000013dfc8aed', 'LGZ 985', '{"modOrnaments":-1,"modSpeakers":-1,"modExhaust":1,"plateIndex":1,"modFrontWheels":8,"modPlateHolder":-1,"tyreSmokeColor":[255,10,10],"modGrille":-1,"health":992,"pearlescentColor":7,"modFrame":0,"modRightFender":-1,"modDial":-1,"modSeats":-1,"wheelColor":28,"modHood":-1,"modDoorSpeaker":-1,"modBackWheels":-1,"neonEnabled":[1,1,1,1],"modSteeringWheel":-1,"windowTint":1,"modEngine":3,"modFrontBumper":2,"modRearBumper":-1,"modDashboard":-1,"modShifterLeavers":-1,"modTurbo":1,"dirtLevel":1.8183583021164,"modLivery":-1,"modAirFilter":-1,"extras":[],"color1":5,"modFender":-1,"wheels":7,"modSuspension":3,"modAPlate":-1,"modBrakes":2,"plate":"LGZ 985","modStruts":-1,"modAerials":-1,"modSmokeEnabled":1,"model":-1372848492,"modVanityPlate":-1,"modTrimB":-1,"modHorns":-1,"modArchCover":-1,"modArmor":-1,"modTransmission":2,"modTank":-1,"modWindows":-1,"modRoof":-1,"modSpoilers":3,"modHydrolic":-1,"neonColor":[255,255,255],"modTrimA":-1,"modXenon":1,"modEngineBlock":-1,"modSideSkirt":2,"modTrunk":-1,"color2":2}', 'car', '', 1),
	('steam:110000110da5ab4', 'PMU 603', '{"modTrimA":-1,"wheelColor":111,"modHydrolic":-1,"modTransmission":-1,"modRightFender":-1,"health":1000,"modRearBumper":-1,"modLivery":-1,"modTank":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modOrnaments":-1,"modBackWheels":-1,"neonEnabled":[false,false,false,false],"windowTint":-1,"modDoorSpeaker":-1,"modAerials":-1,"modHorns":-1,"color2":38,"modArchCover":-1,"modAPlate":-1,"modArmor":-1,"color1":5,"plateIndex":0,"modTurbo":false,"modHood":-1,"modStruts":-1,"extras":[],"modEngine":-1,"modSuspension":-1,"model":-674927303,"modPlateHolder":-1,"modRoof":-1,"dirtLevel":3.0846853256226,"modSpeakers":-1,"modWindows":-1,"modDial":-1,"modDashboard":-1,"modFrontBumper":-1,"modSmokeEnabled":1,"modFender":-1,"modSeats":-1,"modFrontWheels":-1,"modSpoilers":-1,"neonColor":[255,0,255],"modExhaust":-1,"modTrimB":-1,"pearlescentColor":38,"modAirFilter":-1,"modFrame":-1,"modBrakes":-1,"modEngineBlock":-1,"modVanityPlate":-1,"modSideSkirt":-1,"modXenon":false,"plate":"PMU 603","modShifterLeavers":-1,"modTrunk":-1,"modGrille":-1,"wheels":7}', 'car', '', 1),
	('steam:11000013d499d1e', 'PZP 951', '{"modOrnaments":-1,"modFrontBumper":-1,"modHorns":-1,"modWindows":-1,"modArmor":-1,"neonEnabled":[false,false,false,false],"tyreSmokeColor":[255,255,255],"modShifterLeavers":-1,"modTrunk":-1,"modXenon":false,"modVanityPlate":-1,"modSeats":-1,"modSmokeEnabled":1,"modRearBumper":-1,"modRightFender":-1,"modLivery":-1,"modSpoilers":-1,"dirtLevel":5.671359539032,"pearlescentColor":7,"modDashboard":-1,"modBackWheels":-1,"modSuspension":-1,"modDial":-1,"wheelColor":156,"modSideSkirt":-1,"modSteeringWheel":-1,"modTrimB":-1,"modAerials":-1,"plateIndex":3,"modFrame":-1,"modAPlate":-1,"modEngine":-1,"modRoof":-1,"extras":[],"wheels":0,"plate":"PZP 951","modFrontWheels":-1,"modFender":-1,"modExhaust":-1,"modDoorSpeaker":-1,"modBrakes":-1,"color2":2,"modTank":-1,"modArchCover":-1,"windowTint":-1,"color1":2,"modStruts":-1,"modPlateHolder":-1,"modTurbo":false,"neonColor":[255,0,255],"modTransmission":-1,"modEngineBlock":-1,"modTrimA":-1,"model":-1372848492,"modSpeakers":-1,"health":960,"modHydrolic":-1,"modGrille":-1,"modHood":-1,"modAirFilter":-1}', 'car', '', 1),
	('steam:11000013dfc8aed', 'QJY 511', '{"modFrontWheels":-1,"wheelColor":0,"modFender":-1,"modArmor":-1,"modHorns":-1,"modAerials":-1,"modTrimA":-1,"modSpoilers":-1,"dirtLevel":0.0,"modWindows":-1,"modSmokeEnabled":false,"color1":134,"modOrnaments":-1,"modSeats":-1,"extras":{"1":false},"modStruts":-1,"modEngineBlock":-1,"neonColor":[255,0,255],"modAPlate":-1,"modRearBumper":-1,"modAirFilter":-1,"modFrontBumper":-1,"color2":134,"wheels":0,"modGrille":-1,"modHydrolic":-1,"modTransmission":-1,"modTrimB":-1,"modDashboard":-1,"modLivery":-1,"modExhaust":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"modSuspension":-1,"modVanityPlate":-1,"modHood":-1,"modDial":-1,"pearlescentColor":0,"modShifterLeavers":-1,"modRoof":-1,"modRightFender":-1,"windowTint":-1,"modSteeringWheel":-1,"modTank":-1,"modTrunk":-1,"modXenon":false,"plate":"QJY 511","plateIndex":4,"modSpeakers":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"modDoorSpeaker":-1,"modSideSkirt":-1,"modBackWheels":-1,"modArchCover":-1,"modPlateHolder":-1,"model":180121638,"health":1000,"modBrakes":-1,"modTurbo":false}', 'car', 'police', 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=863 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2842 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_messages: 3 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
	(2841, 'police', '256-8589', 'De #256-8589 :  Someone passed the speed camera, above 120 KMH 2856.9990234375, 3528.3386230469', '2019-11-14 19:45:00', 1, 0),
	(2839, 'police', '256-8589', 'De #256-8589 :  Someone passed the speed camera, above 120 KMH 2861.1264648438, 3523.7158203125', '2019-11-12 03:05:54', 1, 0),
	(2840, 'police', '256-8589', 'De #256-8589 :  Someone passed the speed camera, above 120 KMH 1566.0676269531, -998.94488525391', '2019-11-14 19:42:22', 1, 0);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.policeshop
CREATE TABLE IF NOT EXISTS `policeshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8_bin NOT NULL,
  `item` varchar(100) COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table essentialmode.policeshop: ~3 rows (approximately)
/*!40000 ALTER TABLE `policeshop` DISABLE KEYS */;
INSERT INTO `policeshop` (`id`, `store`, `item`, `price`) VALUES
	(1, 'Police', 'bread', 30),
	(2, 'Police', 'water', 15),
	(3, 'Police', 'fixkit', 3000);
/*!40000 ALTER TABLE `policeshop` ENABLE KEYS */;

-- Dumping structure for table essentialmode.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.properties: ~42 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Basic apartment', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 1562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 3000000),
	(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 2000000),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 1700000),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.properties_inventory
CREATE TABLE IF NOT EXISTS `properties_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertie_id` int(11) DEFAULT NULL,
  `item` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `isweapon` int(255) NOT NULL DEFAULT 0,
  `owner` varchar(255) DEFAULT NULL,
  `label_weapon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table essentialmode.properties_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `properties_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.shops: ~110 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 20),
	(2, 'TwentyFourSeven', 'water', 15),
	(3, 'RobsLiquor', 'bread', 20),
	(4, 'RobsLiquor', 'water', 15),
	(5, 'LTDgasoline', 'bread', 20),
	(6, 'LTDgasoline', 'water', 15),
	(7, 'TwentyFourSeven', 'chocolate', 25),
	(8, 'RobsLiquor', 'chocolate', 25),
	(9, 'LTDgasoline', 'chocolate', 25),
	(10, 'TwentyFourSeven', 'sandwich', 30),
	(11, 'RobsLiquor', 'sandwich', 30),
	(12, 'LTDgasoline', 'sandwich', 30),
	(13, 'TwentyFourSeven', 'hamburger', 45),
	(14, 'RobsLiquor', 'hamburger', 45),
	(15, 'LTDgasoline', 'hamburger', 45),
	(16, 'TwentyFourSeven', 'cupcake', 30),
	(17, 'RobsLiquor', 'cupcake', 30),
	(18, 'LTDgasoline', 'cupcake', 30),
	(22, 'TwentyFourSeven', 'icetea', 25),
	(23, 'RobsLiquor', 'icetea', 25),
	(24, 'LTDgasoline', 'icetea', 25),
	(25, 'TwentyFourSeven', 'coffe', 20),
	(26, 'RobsLiquor', 'coffe', 20),
	(27, 'LTDgasoline', 'coffe', 20),
	(28, 'TwentyFourSeven', 'milk', 18),
	(29, 'RobsLiquor', 'milk', 18),
	(30, 'LTDgasoline', 'milk', 18),
	(31, 'RobsLiquor', 'cigarett', 10),
	(32, 'RobsLiquor', 'lighter', 25),
	(33, 'LTDgasoline', 'cigarett', 10),
	(34, 'LTDgasoline', 'lighter', 25),
	(35, 'TwentyFourSeven', 'cigarett', 10),
	(36, 'TwentyFourSeven', 'lighter', 25),
	(37, 'Bar', 'beer', 80),
	(38, 'Bar', 'wine', 140),
	(39, 'Bar', 'vodka', 160),
	(40, 'Bar', 'tequila', 150),
	(41, 'Bar', 'whisky', 140),
	(42, 'Bar', 'cigarett', 15),
	(43, 'Bar', 'lighter', 25),
	(44, 'Disco', 'beer', 80),
	(45, 'Disco', 'wine', 140),
	(46, 'Disco', 'vodka', 160),
	(47, 'Disco', 'tequila', 150),
	(48, 'Disco', 'whisky', 140),
	(49, 'Disco', 'cigarett', 15),
	(50, 'Disco', 'lighter', 25),
	(51, 'fishing_shop', 'fishingrod', 250),
	(52, 'fishing_shop', 'worm', 5),
	(53, 'fishing_shop', 'squidbait', 10),
	(54, 'fishing_shop', 'prawnbait', 10),
	(59, 'TwentyFourSeven', 'croquettes', 25),
	(60, 'weaponeacc', 'weaponflashlight', 700),
	(61, 'weaponeacc', 'weapongrip', 700),
	(62, 'weaponeacc', 'fixkit', 500),
	(63, 'pillbox', 'bread', 20),
	(64, 'TwentyFourSeven', 'fixkit', 500),
	(65, 'LTDgasoline', 'fixkit', 500),
	(67, 'RobsLiquor', 'fixkit', 500),
	(68, 'LTDgasoline', 'sickle', 500),
	(69, 'RobsLiquor', 'sickle', 500),
	(70, 'TwentyFourSeven', 'sickle', 500),
	(72, 'TwentyFourSeven', 'phone', 3500),
	(73, 'RobsLiquor', 'phone', 3500),
	(74, 'LTDgasoline', 'phone', 3500),
	(75, 'TwentyFourSeven', 'croquettes', 25),
	(83, 'LTDgasoline', 'hatchet_lj', 500),
	(84, 'RobsLiquor', 'hatchet_lj', 500),
	(85, 'TwentyFourSeven', 'hatchet_lj', 500),
	(86, 'fishing_shop', 'turtlebait', 50),
	(87, 'fishing_shop', 'fishbait', 5),
	(94, 'TwentyFourSeven', 'sicklecrab', 500),
	(95, 'RobsLiquor', 'sicklecrab', 500),
	(96, 'LTDgasoline', 'sicklecrab', 500),
	(100, 'TwentyFourSeven', 'shovel', 500),
	(101, 'RobsLiquor', 'shovel', 500),
	(102, 'LTDgasoline', 'shovel', 500),
	(103, 'TwentyFourSeven', 'binoculars', 1500),
	(104, 'RobsLiquor', 'binoculars', 1500),
	(105, 'LTDgasoline', 'binoculars', 1500),
	(109, 'TwentyFourSeven', 'oxygen_mask', 3000),
	(110, 'RobsLiquor', 'oxygen_mask', 3000),
	(111, 'LTDgasoline', 'oxygen_mask', 3000),
	(115, 'WeedZone', 'beer', 60),
	(118, 'TwentyFourSeven', 'drills', 500),
	(119, 'RobsLiquor', 'drills', 500),
	(120, 'LTDgasoline', 'drills', 500),
	(121, 'TwentyFourSeven', 'welding_gun', 1500),
	(124, 'RobsLiquor', 'welding_gun', 1500),
	(125, 'LTDgasoline', 'welding_gun', 1500),
	(129, 'LTDgasoline', 'croquettes', 25),
	(130, 'RobsLiquor', 'croquettes', 25),
	(131, 'TwentyFourSeven', 'radio', 20000),
	(132, 'RobsLiquor', 'radio', 20000),
	(133, 'LTDgasoline', 'radio', 20000),
	(136, 'WeedZone', 'bong', 450),
	(137, 'HandCuffs', 'handcuffs', 40000),
	(138, 'HandCuffs', 'handcuffs_key', 5000),
	(139, 'HandCuffs', 'paper_bag', 4000),
	(140, 'reporterShop', 'news_cam', 1000),
	(141, 'reporterShop', 'news_mic', 1000),
	(142, 'reporterShop', 'news_bmic', 1000),
	(143, 'WeedZone', 'marijuana_cigarette', 50),
	(144, 'WeedZone', 'lighter', 25),
	(148, 'pillbox', 'water', 15),
	(149, 'pillbox', 'sandwich', 30),
	(150, 'pillbox', 'icetea', 25),
	(152, 'ScubaDive', 'plongee1', 100);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table essentialmode.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.trunk_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.twitter_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.twitter_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table essentialmode.twitter_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table essentialmode.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `jail` int(11) NOT NULL DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pet` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.users: ~19 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `status`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `tattoos`, `phone_number`, `is_dead`, `jail`, `last_property`, `pet`) VALUES
	('steam:11000010480fe75', 'license:854fa13b0ba1b706b88e61b270240e89689e1820', 20000, 'XaaK', '{"complexion_2":0,"mask_1":0,"makeup_1":0,"sun_1":0,"bodyb_2":0,"bodyb_1":0,"moles_2":0,"ears_1":15,"eye_color":0,"beard_4":6,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":0,"shoes_2":2,"chest_3":0,"complexion_1":0,"chest_2":0,"makeup_2":0,"sex":0,"blush_1":0,"eyebrows_2":0,"bags_2":0,"sun_2":0,"helmet_2":0,"helmet_1":-1,"glasses_2":0,"eyebrows_4":0,"skin":0,"watches_1":3,"glasses_1":0,"bproof_2":0,"eyebrows_3":0,"ears_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"lipstick_3":0,"pants_2":2,"lipstick_1":0,"arms_2":0,"pants_1":79,"chest_1":0,"bproof_1":0,"age_1":0,"lipstick_4":0,"mask_2":0,"bags_1":45,"chain_1":0,"bracelets_2":0,"decals_1":0,"eyebrows_1":0,"tshirt_2":0,"blush_3":0,"bracelets_1":-1,"torso_1":205,"age_2":0,"beard_2":10,"shoes_1":42,"face":0,"makeup_3":0,"torso_2":0,"watches_2":0,"blemishes_2":0,"beard_3":0,"arms":5,"hair_1":19,"beard_1":11,"hair_color_1":29,"tshirt_1":15,"blush_2":0,"decals_2":0}', 'unemployed', 0, '[]', '{"y":-1711.0,"x":-1162.1,"z":4.6}', 300, 0, 'user', '[{"name":"hunger","val":272100,"percent":27.21},{"name":"thirst","val":329075,"percent":32.9075},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'XaaK', 'Jonsson', '1996-11-05', 'M', '180', '2126', NULL, '737-6171', 0, 0, NULL, ''),
	('steam:1100001074479bd', 'license:93b935973d1980ba539453c01b1930a5e4a7b3dc', 20000, 'MarshMello™', '{"age_2":0,"lipstick_4":0,"bracelets_2":0,"makeup_1":31,"blemishes_1":0,"sun_1":0,"mask_2":0,"skin":0,"lipstick_2":0,"chest_2":0,"eyebrows_1":0,"shoes_2":1,"lipstick_1":9,"pants_1":24,"tshirt_1":32,"hair_1":19,"moles_2":0,"eyebrows_4":0,"watches_2":0,"makeup_4":19,"arms_2":0,"sun_2":0,"bracelets_1":-1,"blush_2":0,"eyebrows_2":0,"tshirt_2":0,"glasses_2":6,"eyebrows_3":0,"hair_color_2":0,"decals_2":0,"complexion_1":0,"makeup_2":9,"age_1":0,"glasses_1":5,"pants_2":5,"sex":0,"bproof_2":0,"torso_1":32,"helmet_2":0,"eye_color":0,"bodyb_2":0,"ears_1":-1,"complexion_2":0,"blemishes_2":0,"chain_1":18,"blush_1":0,"face":0,"beard_3":0,"lipstick_3":0,"bags_2":0,"watches_1":-1,"bproof_1":0,"ears_2":0,"arms":1,"helmet_1":-1,"hair_2":0,"bags_1":0,"chest_1":0,"beard_4":0,"torso_2":5,"chest_3":0,"beard_1":0,"bodyb_1":0,"shoes_1":5,"beard_2":0,"blush_3":0,"moles_1":0,"chain_2":0,"mask_1":0,"decals_1":0,"makeup_3":18,"hair_color_1":39}', 'fueler', 0, '[]', '{"y":3500.5,"z":13.9,"x":-2541.7}', 200, 0, 'user', '[{"val":823600,"percent":82.36,"name":"hunger"},{"val":892700,"percent":89.27,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"},{"val":0,"percent":0.0,"name":"drunk"}]', 'บักเอ็ม', 'หำใหย่', '1994-06-03', 'M', '190', '1456', NULL, '207-0046', 0, 0, NULL, ''),
	('steam:11000010b3f3065', 'license:76505f80647bccbc8930834b78196a7c4cebe9b9', 20000, 'Leon Kenoby', '{"complexion_2":0,"mask_1":0,"makeup_1":0,"chain_1":0,"bodyb_2":0,"bodyb_1":0,"moles_2":0,"ears_1":-1,"eye_color":0,"decals_1":0,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":0,"shoes_2":0,"chest_3":0,"makeup_3":0,"chest_2":0,"makeup_2":0,"sex":0,"blush_1":0,"eyebrows_2":0,"bags_2":0,"sun_2":0,"helmet_2":0,"helmet_1":-1,"glasses_2":9,"eyebrows_4":0,"skin":13,"watches_1":1,"glasses_1":9,"bproof_2":0,"eyebrows_3":0,"ears_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"lipstick_3":0,"pants_2":4,"lipstick_1":0,"arms_2":0,"pants_1":4,"bracelets_2":0,"beard_4":15,"age_1":0,"bproof_1":0,"sun_1":0,"bags_1":0,"beard_1":5,"hair_color_1":0,"blush_2":0,"hair_1":49,"tshirt_2":0,"blush_3":0,"tshirt_1":15,"torso_1":13,"age_2":0,"beard_2":9,"shoes_1":1,"face":0,"torso_2":3,"lipstick_4":0,"watches_2":0,"complexion_1":0,"chest_1":0,"blemishes_2":0,"eyebrows_1":0,"bracelets_1":-1,"arms":11,"mask_2":0,"beard_3":0,"decals_2":0}', 'unemployed', 0, '[]', '{"y":-1712.0,"x":-1163.3,"z":4.2}', 100, 0, 'user', '[{"name":"hunger","val":632100,"percent":63.21},{"name":"thirst","val":724900,"percent":72.49},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'Leon', 'Kenoby', '1985-03-14', 'M', '174', '7223', NULL, '770-7363', 0, 0, NULL, ''),
	('steam:11000010dc8e7fd', 'license:f8d98350a8e4d3816a5b2f66586a59a6992b6937', 1381, 'WaDuHek', '{"sun_1":0,"lipstick_2":0,"blush_2":0,"bags_1":0,"bracelets_1":-1,"shoes_1":0,"makeup_1":0,"pants_2":0,"hair_color_2":0,"mask_1":0,"mask_2":0,"age_1":0,"lipstick_3":0,"ears_1":-1,"moles_1":0,"makeup_2":0,"blemishes_1":0,"watches_2":0,"eyebrows_3":0,"blemishes_2":0,"chest_2":0,"bodyb_2":0,"blush_3":0,"tshirt_2":0,"beard_2":0,"watches_1":-1,"sex":0,"glasses_2":0,"hair_1":1,"pants_1":0,"skin":4,"complexion_1":0,"chain_1":0,"makeup_4":0,"bproof_1":0,"chest_1":0,"blush_1":0,"beard_3":0,"lipstick_1":0,"arms":0,"ears_2":0,"hair_2":0,"decals_1":0,"eyebrows_2":0,"helmet_2":0,"bodyb_1":0,"lipstick_4":0,"eyebrows_4":0,"complexion_2":0,"decals_2":0,"face":0,"glasses_1":0,"moles_2":0,"arms_2":0,"bproof_2":0,"eyebrows_1":0,"beard_4":0,"bags_2":0,"eye_color":0,"helmet_1":-1,"chain_2":0,"bracelets_2":0,"sun_2":0,"torso_2":0,"age_2":0,"torso_1":13,"makeup_3":0,"beard_1":0,"chest_3":0,"hair_color_1":0,"shoes_2":0,"tshirt_1":62}', 'miner', 0, '[]', '{"z":101.7,"y":226.5,"x":252.8}', 10000, 0, 'user', '[{"val":981100,"name":"hunger","percent":98.11},{"val":985975,"name":"thirst","percent":98.5975},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drunk","percent":0.0}]', 'Samoy', 'Waduhek', '2002-06-23', 'M', '185', '2875', NULL, '840-7465', 0, 0, NULL, ''),
	('steam:11000010e4093d5', 'license:1b32b905438760a1ec3e9cd0ca37608867b41af1', 20000, 'I am J', '{"eyebrows_4":0,"ears_1":-1,"chain_2":0,"makeup_2":0,"bags_2":0,"tshirt_2":0,"bproof_1":0,"moles_1":0,"eye_color":0,"skin":0,"chain_1":0,"decals_2":0,"makeup_4":0,"age_1":0,"bags_1":0,"tshirt_1":0,"bracelets_2":0,"helmet_1":-1,"mask_1":0,"lipstick_2":0,"moles_2":0,"sun_2":0,"age_2":0,"shoes_1":0,"glasses_2":0,"ears_2":0,"watches_1":-1,"bproof_2":0,"beard_2":0,"makeup_3":0,"lipstick_3":0,"complexion_1":0,"lipstick_1":0,"pants_1":0,"pants_2":0,"beard_1":0,"torso_1":0,"blemishes_2":0,"chest_3":0,"makeup_1":0,"blush_1":0,"eyebrows_1":0,"eyebrows_3":0,"sun_1":0,"eyebrows_2":0,"beard_3":0,"blemishes_1":0,"mask_2":0,"hair_2":0,"bodyb_2":0,"hair_color_1":0,"hair_1":0,"bodyb_1":0,"glasses_1":0,"decals_1":0,"torso_2":0,"complexion_2":0,"beard_4":0,"blush_3":0,"bracelets_1":-1,"hair_color_2":0,"face":0,"arms_2":0,"blush_2":0,"arms":0,"sex":0,"shoes_2":0,"chest_2":0,"watches_2":0,"lipstick_4":0,"helmet_2":0,"chest_1":0}', 'unemployed', 0, '[]', '{"x":-1162.9,"y":-1712.0,"z":4.1}', 300, 0, 'user', '[{"percent":26.86,"val":268600,"name":"hunger"},{"percent":32.645,"val":326450,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"},{"percent":0.0,"val":0,"name":"drunk"}]', 'Root', 'Admin', '1990-01-01', 'M', '200', '2654', NULL, '989-4456', 0, 0, NULL, ''),
	('steam:11000010ec17c2f', 'license:c59d995f1ce82ce76a5ba5c6eee1249633ee265e', 20000, 'derkthelofd', '{"complexion_2":0,"mask_1":0,"makeup_1":0,"chain_1":0,"bodyb_2":0,"bodyb_1":0,"moles_2":0,"ears_1":-1,"eye_color":0,"decals_1":0,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":0,"shoes_2":0,"chest_3":0,"complexion_1":0,"chest_2":0,"makeup_2":0,"sex":0,"blush_1":0,"eyebrows_2":0,"bags_2":0,"beard_3":0,"helmet_2":0,"helmet_1":-1,"glasses_2":0,"eyebrows_4":0,"skin":0,"watches_1":-1,"glasses_1":0,"bproof_2":0,"eyebrows_3":0,"bracelets_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"eyebrows_1":0,"pants_2":0,"lipstick_1":0,"lipstick_4":0,"pants_1":0,"beard_1":0,"torso_2":0,"age_1":0,"bproof_1":0,"blush_2":0,"bags_1":0,"hair_1":0,"blemishes_2":0,"ears_2":0,"sun_2":0,"tshirt_2":0,"blush_3":0,"arms_2":0,"torso_1":0,"age_2":0,"beard_2":0,"shoes_1":0,"face":0,"lipstick_3":0,"beard_4":0,"watches_2":0,"chest_1":0,"hair_color_1":0,"sun_1":0,"makeup_3":0,"bracelets_1":-1,"arms":0,"tshirt_1":0,"mask_2":0,"decals_2":0}', 'unemployed', 0, '[]', '{"y":-329.5,"x":-294.5,"z":18.3}', 0, 0, 'user', '[{"name":"hunger","val":494100,"percent":49.41},{"name":"thirst","val":495575,"percent":49.5575},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'dasasd', 'sdd', '1990-01-10', 'M', '165', '3857', NULL, '550-7063', 0, 0, NULL, ''),
	('steam:11000011084faec', 'license:82428e0e314e941d95b43879466b31a53d76025e', 20000, 'vcopterwong', '{"complexion_2":0,"mask_1":0,"makeup_1":58,"chain_1":0,"bodyb_2":0,"bodyb_1":0,"moles_2":0,"ears_1":25,"eye_color":8,"beard_4":0,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":10,"shoes_2":0,"chest_3":0,"makeup_3":0,"chest_2":0,"makeup_2":7,"sex":0,"blush_1":0,"eyebrows_2":10,"bags_2":0,"sun_2":0,"helmet_2":0,"helmet_1":-1,"glasses_2":0,"eyebrows_4":0,"skin":0,"watches_1":-1,"glasses_1":5,"bproof_2":0,"eyebrows_3":28,"bracelets_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"eyebrows_1":2,"pants_2":0,"lipstick_1":1,"chest_1":0,"torso_2":11,"pants_1":24,"beard_3":0,"age_1":0,"tshirt_1":75,"ears_2":1,"bags_1":0,"sun_1":0,"bproof_1":0,"hair_1":73,"hair_color_1":29,"tshirt_2":3,"blush_3":0,"beard_1":0,"torso_1":192,"age_2":0,"beard_2":0,"shoes_1":21,"face":44,"blush_2":0,"blemishes_2":0,"watches_2":0,"lipstick_4":0,"decals_1":0,"arms_2":0,"lipstick_3":8,"bracelets_1":-1,"arms":18,"mask_2":0,"complexion_1":0,"decals_2":0}', 'unemployed', 0, '[{"label":"Knife","components":[],"name":"WEAPON_KNIFE","ammo":0},{"label":"Micro SMG","components":["clip_default"],"name":"WEAPON_MICROSMG","ammo":234},{"label":"Pump shotgun","components":["flashlight"],"name":"WEAPON_PUMPSHOTGUN","ammo":231},{"label":"Assault shotgun","components":["clip_extended","flashlight","grip"],"name":"WEAPON_ASSAULTSHOTGUN","ammo":231},{"label":"Carbine rifle","components":["clip_default","flashlight","scope","grip"],"name":"WEAPON_CARBINERIFLE","ammo":232},{"label":"Advanced rifle","components":["clip_default"],"name":"WEAPON_ADVANCEDRIFLE","ammo":232},{"label":"Special carbine","components":["clip_drum","flashlight","scope","grip"],"name":"WEAPON_SPECIALCARBINE","ammo":232},{"label":"Sniper rifle","components":["scope"],"name":"WEAPON_SNIPERRIFLE","ammo":245},{"label":"Flashlight","components":[],"name":"WEAPON_FLASHLIGHT","ammo":0},{"label":"Flare gun","components":[],"name":"WEAPON_FLARE","ammo":25}]', '{"y":-885.2,"x":-318.2,"z":31.1}', 150, 0, 'user', '[{"name":"hunger","val":388300,"percent":38.83},{"name":"thirst","val":416225,"percent":41.6225},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'Copter', 'Ratwong', '1990-01-01', 'M', '178', '9988', NULL, '570-7306', 0, 0, NULL, ''),
	('steam:110000110da5ab4', 'license:b06d1e41db32c30fbf06b2d30cd81b05760b8143', 21, 'Teen', '{"arms":6,"watches_2":0,"mask_2":0,"makeup_3":0,"blemishes_1":0,"eyebrows_1":0,"decals_2":0,"makeup_2":0,"bodyb_1":0,"chain_2":0,"helmet_1":-1,"skin":0,"bproof_1":0,"eyebrows_4":0,"torso_2":4,"arms_2":0,"chain_1":0,"beard_1":0,"sex":0,"beard_4":0,"mask_1":9,"sun_1":0,"bracelets_2":0,"tshirt_1":15,"chest_2":0,"hair_1":7,"ears_1":-1,"shoes_2":5,"hair_2":6,"bags_1":44,"bproof_2":0,"beard_3":0,"bags_2":0,"torso_1":86,"hair_color_1":23,"blush_1":0,"glasses_2":0,"makeup_4":0,"tshirt_2":0,"bracelets_1":-1,"age_1":0,"pants_2":0,"glasses_1":0,"hair_color_2":12,"watches_1":-1,"decals_1":0,"chest_3":0,"blush_2":0,"complexion_2":0,"eyebrows_3":0,"chest_1":0,"lipstick_3":0,"moles_2":0,"complexion_1":0,"eye_color":0,"lipstick_1":0,"face":2,"blemishes_2":0,"sun_2":0,"makeup_1":0,"pants_1":21,"age_2":0,"shoes_1":16,"moles_1":0,"lipstick_2":0,"beard_2":0,"helmet_2":0,"ears_2":0,"eyebrows_2":0,"lipstick_4":0,"blush_3":0,"bodyb_2":0}', 'unemployed', 0, '[]', '{"z":34.2,"y":3713.6,"x":1723.6}', 250, 0, 'user', '[{"name":"hunger","percent":87.48,"val":874800},{"name":"thirst","percent":90.625,"val":906250},{"name":"drunk","percent":0.0,"val":0},{"name":"drunk","percent":0.0,"val":0}]', 'Jason', 'Sim', '1996-02-13', 'M', '180', '2295', NULL, '182-3644', 0, 0, NULL, ''),
	('steam:110000114ec25fb', 'license:d04478f8e52cc5918f674d66b80a06d07f114fff', 5000, ':emoji2:Thithawat:emoji2:', '{"bags_2":0,"moles_2":0,"arms_2":0,"chain_2":0,"helmet_2":0,"beard_4":0,"bproof_1":0,"blush_3":0,"hair_2":2,"makeup_1":0,"age_1":0,"watches_1":-1,"bproof_2":0,"shoes_2":0,"bracelets_2":0,"tshirt_1":15,"pants_1":24,"lipstick_4":0,"chest_2":0,"beard_2":0,"sun_1":0,"eyebrows_1":0,"mask_2":0,"decals_1":13,"chain_1":0,"tshirt_2":0,"bags_1":0,"chest_1":0,"eye_color":0,"lipstick_3":0,"bodyb_2":0,"complexion_1":0,"shoes_1":6,"blush_1":0,"face":5,"arms":18,"decals_2":0,"hair_color_2":26,"bodyb_1":0,"makeup_4":0,"bracelets_1":-1,"blush_2":0,"hair_1":18,"eyebrows_4":0,"skin":0,"torso_2":0,"helmet_1":-1,"age_2":0,"beard_1":0,"watches_2":0,"mask_1":0,"sun_2":0,"pants_2":0,"blemishes_1":0,"blemishes_2":0,"ears_2":0,"glasses_2":0,"complexion_2":0,"glasses_1":0,"sex":0,"makeup_2":0,"torso_1":50,"eyebrows_3":0,"lipstick_2":0,"ears_1":-1,"hair_color_1":39,"chest_3":0,"eyebrows_2":0,"lipstick_1":0,"makeup_3":0,"moles_1":0,"beard_3":0}', 'unemployed', 0, '[]', '{"z":37.5,"y":-1187.3,"x":273.1}', 10000, 0, 'user', '[{"percent":44.99,"val":449900,"name":"hunger"},{"percent":46.2425,"val":462425,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"},{"percent":0.0,"val":0,"name":"drunk"}]', 'Yhithaway', 'Phothong', '2005-06-18', 'M', '15', '9521', NULL, '232-1658', 1, 0, NULL, ''),
	('steam:110000116dfb3f6', 'license:375d6ec791eb590b7ceb479f7b41f71f23d9bcf9', 20000, 'AoNSlaz', '{"complexion_2":0,"mask_1":0,"makeup_1":1,"chain_1":2,"bodyb_2":0,"bodyb_1":0,"moles_2":0,"ears_1":2,"eye_color":2,"decals_1":1,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":1,"shoes_2":1,"chest_3":0,"makeup_3":0,"chest_2":0,"makeup_2":0,"sex":1,"blush_1":0,"eyebrows_2":0,"bags_2":0,"blemishes_2":0,"helmet_2":0,"helmet_1":-1,"glasses_2":0,"eyebrows_4":0,"bproof_1":0,"blush_2":0,"glasses_1":6,"bproof_2":0,"eyebrows_3":0,"ears_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"lipstick_3":1,"pants_2":4,"lipstick_1":4,"arms_2":0,"torso_2":0,"beard_1":0,"sun_1":0,"age_1":0,"skin":0,"arms":0,"bags_1":0,"bracelets_2":0,"lipstick_4":1,"chest_1":0,"watches_1":0,"tshirt_2":10,"blush_3":0,"hair_1":3,"torso_1":64,"age_2":0,"beard_2":0,"shoes_1":19,"face":0,"beard_4":0,"beard_3":0,"watches_2":0,"eyebrows_1":0,"pants_1":8,"sun_2":0,"complexion_1":0,"bracelets_1":-1,"hair_color_1":20,"mask_2":0,"tshirt_1":0,"decals_2":0}', 'fisherman', 0, '[]', '{"y":-1302.6,"x":118.9,"z":28.9}', 0, 0, 'user', '[{"name":"hunger","val":359400,"percent":35.94},{"name":"thirst","val":394550,"percent":39.455},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'Sunsun', 'Bery', '1990-01-09', 'F', '171', '8473', NULL, '109-9742', 0, 0, NULL, ''),
	('steam:110000116e3c6b0', 'license:09502bf469570b43f123cf7890fbd407ae7bf681', 20000, 'Jhan Jui', '{"beard_4":0,"lipstick_3":0,"chain_1":0,"complexion_1":0,"bags_1":0,"lipstick_2":0,"shoes_1":32,"helmet_2":0,"beard_3":0,"age_2":0,"bracelets_1":-1,"sun_2":0,"chest_3":63,"pants_2":7,"lipstick_1":0,"blemishes_1":0,"helmet_1":-1,"blush_1":0,"beard_2":0,"blemishes_2":0,"moles_1":0,"face":0,"arms_2":10,"eyebrows_1":31,"glasses_1":0,"glasses_2":0,"bodyb_1":11,"makeup_2":0,"watches_2":0,"complexion_2":0,"hair_1":55,"age_1":0,"torso_2":22,"torso_1":247,"bproof_2":0,"tshirt_1":15,"mask_2":0,"moles_2":0,"eyebrows_3":9,"chest_2":10,"bodyb_2":0,"hair_2":0,"bproof_1":0,"makeup_3":0,"mask_1":99,"bracelets_2":0,"pants_1":9,"ears_2":0,"blush_2":0,"decals_1":0,"decals_2":0,"sun_1":0,"ears_1":-1,"blush_3":0,"shoes_2":7,"makeup_1":0,"tshirt_2":0,"eye_color":28,"lipstick_4":0,"skin":45,"hair_color_2":14,"bags_2":0,"beard_1":0,"eyebrows_2":10,"chest_1":16,"sex":0,"hair_color_1":59,"arms":149,"eyebrows_4":0,"makeup_4":0,"watches_1":18,"chain_2":0}', 'slaughterer', 0, '[]', '{"y":-760.8,"z":30.8,"x":223.5}', 600, 0, 'user', '[{"name":"hunger","val":903600,"percent":90.36},{"name":"thirst","val":863275,"percent":86.3275},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'Jhan', 'Jui', '1989-01-13', 'M', '200', '3114', NULL, '739-5135', 0, 0, NULL, ''),
	('steam:11000011b44055b', 'license:dc71bb375b91c5bd122c5b4ed66d73428e513420', 20000, 'เสือใบ', '{"eyebrows_3":0,"makeup_2":0,"sun_2":0,"face":0,"shoes_2":19,"chain_2":0,"helmet_2":0,"eye_color":6,"chest_3":0,"beard_4":6,"beard_3":0,"sex":0,"chest_2":0,"tshirt_1":15,"makeup_1":0,"bracelets_1":-1,"decals_1":0,"bodyb_2":0,"arms_2":0,"beard_1":9,"pants_1":77,"makeup_4":0,"lipstick_3":0,"ears_1":-1,"mask_1":0,"hair_color_1":39,"complexion_2":0,"decals_2":0,"mask_2":0,"helmet_1":-1,"hair_1":19,"hair_color_2":0,"blush_2":0,"blemishes_1":0,"shoes_1":75,"torso_2":0,"moles_2":0,"skin":0,"sun_1":0,"arms":15,"chain_1":43,"chest_1":0,"bodyb_1":0,"age_2":0,"hair_2":0,"lipstick_1":0,"blush_3":0,"pants_2":10,"bracelets_2":0,"makeup_3":0,"blemishes_2":0,"bags_2":0,"eyebrows_4":0,"watches_2":0,"bags_1":0,"moles_1":0,"age_1":0,"glasses_1":0,"complexion_1":0,"eyebrows_2":10,"bproof_1":0,"ears_2":0,"blush_1":0,"glasses_2":0,"eyebrows_1":4,"lipstick_2":2,"bproof_2":0,"torso_1":15,"watches_1":-1,"tshirt_2":0,"beard_2":7,"lipstick_4":0}', 'unemployed', 0, '[{"components":[],"ammo":0,"label":"Knife","name":"WEAPON_KNIFE"},{"components":[],"ammo":0,"label":"Pump shotgun","name":"WEAPON_PUMPSHOTGUN"},{"components":[],"ammo":0,"label":"Hatchet","name":"WEAPON_HATCHET"}]', '{"x":726.6,"y":550.5,"z":126.5}', 31900, 200, 'Superadmin', '[{"percent":39.97,"val":399700,"name":"hunger"},{"percent":42.4775,"val":424775,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"},{"percent":0.0,"val":0,"name":"drunk"}]', 'เสือใบ', 'สะอาดดี', '1990-08-22', 'M', '180', '8728', NULL, '415-8959', 1, 0, NULL, ''),
	('steam:1100001349a49e9', 'license:177322943a949e3a329180ebc0138e89a677d0b0', 20000, 'PeakyKw', NULL, 'unemployed', 0, '[]', '{"y":-355.6,"x":-291.0,"z":10.1}', 50, 0, 'user', '[{"name":"hunger","val":446500,"percent":44.65},{"name":"thirst","val":459875,"percent":45.9875},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', '', '', '', '', '', NULL, NULL, '331-1698', 0, 0, NULL, ''),
	('steam:1100001352d04d1', 'license:253456390ec940b0a526715cef3bd63664d41845', 20000, 'Thaison_96', '{"complexion_2":0,"mask_1":0,"makeup_1":0,"sun_1":0,"hair_1":14,"bodyb_1":0,"moles_2":0,"ears_1":17,"eye_color":12,"decals_1":0,"moles_1":0,"makeup_4":0,"blemishes_1":0,"lipstick_2":0,"shoes_2":2,"chest_3":0,"makeup_3":0,"chest_2":0,"makeup_2":0,"sex":0,"blush_1":0,"eyebrows_2":10,"bags_2":0,"sun_2":0,"helmet_2":9,"helmet_1":77,"glasses_2":0,"eyebrows_4":41,"skin":23,"blush_2":0,"glasses_1":19,"bproof_2":0,"eyebrows_3":0,"bracelets_2":0,"hair_color_2":0,"chain_2":0,"hair_2":0,"lipstick_3":0,"pants_2":4,"lipstick_1":0,"chest_1":0,"torso_2":0,"chain_1":0,"lipstick_4":0,"age_1":0,"beard_4":27,"arms_2":0,"bags_1":0,"bproof_1":0,"watches_1":14,"bodyb_2":0,"eyebrows_1":1,"tshirt_2":0,"blush_3":0,"hair_color_1":21,"torso_1":0,"age_2":0,"beard_2":10,"shoes_1":42,"face":4,"ears_2":4,"pants_1":4,"watches_2":2,"complexion_1":0,"blemishes_2":0,"tshirt_1":0,"beard_3":0,"beard_1":3,"arms":0,"mask_2":0,"bracelets_1":-1,"decals_2":0}', 'unemployed', 0, '[]', '{"y":-1712.0,"x":-1163.3,"z":4.0}', 250, 0, 'user', '[{"name":"hunger","val":300700,"percent":30.07},{"name":"thirst","val":350525,"percent":35.0525},{"name":"drunk","val":0,"percent":0.0},{"name":"drunk","val":0,"percent":0.0}]', 'เสี่ยฮอล', 'Gbg', '1996-10-01', 'M', '180', '8723', NULL, '197-8690', 0, 0, NULL, ''),
	('steam:1100001377ac69a', 'license:d772ef2fda893037e0e351f669adfd98ded01490', 20000, 'pilakunpiya', NULL, 'unemployed', 0, NULL, NULL, 0, 0, 'user', NULL, '', '', '', '', '', NULL, NULL, '373-0149', 0, 0, NULL, ''),
	('steam:11000013bd3ffa9', 'license:3548c142ed93c5fc8965cec42479d82544e76151', 20000, 'Big', '{"bags_2":0,"bags_1":0,"blemishes_1":0,"ears_2":0,"helmet_2":0,"makeup_2":0,"face":0,"chest_2":0,"makeup_1":0,"sun_2":0,"blush_2":0,"bracelets_1":-1,"mask_1":0,"watches_1":-1,"glasses_2":0,"lipstick_1":0,"hair_color_1":0,"eyebrows_2":0,"makeup_3":0,"bproof_1":0,"lipstick_3":0,"makeup_4":0,"beard_2":0,"complexion_1":0,"helmet_1":-1,"hair_color_2":0,"watches_2":0,"tshirt_2":0,"age_1":0,"chain_1":0,"blush_1":0,"eyebrows_3":0,"torso_2":0,"moles_1":0,"sun_1":0,"age_2":0,"tshirt_1":0,"eye_color":0,"shoes_2":0,"decals_2":0,"arms_2":0,"decals_1":0,"shoes_1":0,"eyebrows_4":0,"pants_1":0,"sex":0,"beard_3":0,"chest_3":0,"blush_3":0,"hair_1":0,"lipstick_2":0,"chain_2":0,"hair_2":0,"lipstick_4":0,"skin":0,"glasses_1":0,"chest_1":0,"pants_2":0,"bracelets_2":0,"beard_1":0,"torso_1":0,"arms":0,"bodyb_1":0,"eyebrows_1":0,"moles_2":0,"complexion_2":0,"beard_4":0,"mask_2":0,"bodyb_2":0,"ears_1":-1,"bproof_2":0,"blemishes_2":0}', 'unemployed', 0, '[]', '{"x":-291.2,"y":-355.8,"z":10.1}', 50, 0, 'user', '[{"val":496000,"percent":49.6,"name":"hunger"},{"val":497000,"percent":49.7,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"},{"val":0,"percent":0.0,"name":"drunk"}]', 'Big', 'Jukku', '2000-08-08', 'M', '168', '4197', NULL, '769-4684', 0, 0, NULL, ''),
	('steam:11000013cd0f06b', 'license:79d5ade9512381b63ef9a7281f35cf7983c12cdb', 20000, '✪SoMChaI', '{"chain_2":0,"lipstick_2":0,"age_1":0,"arms":22,"mask_2":0,"age_2":0,"bproof_2":0,"face":0,"lipstick_4":0,"hair_2":0,"decals_2":0,"sun_1":0,"makeup_2":0,"lipstick_3":0,"bodyb_1":0,"pants_2":0,"bodyb_2":0,"chest_2":0,"chest_1":0,"hair_color_2":0,"glasses_1":0,"eyebrows_2":0,"moles_1":0,"eyebrows_1":0,"watches_2":0,"skin":0,"lipstick_1":0,"complexion_1":0,"sun_2":0,"blush_2":0,"beard_4":0,"tshirt_1":74,"chain_1":0,"tshirt_2":0,"blemishes_2":0,"complexion_2":0,"ears_2":0,"shoes_1":63,"mask_1":0,"moles_2":0,"bracelets_1":-1,"torso_1":104,"makeup_4":0,"bracelets_2":0,"watches_1":-1,"eyebrows_3":0,"beard_2":0,"pants_1":53,"blemishes_1":0,"bproof_1":0,"helmet_2":0,"eye_color":0,"torso_2":0,"blush_1":0,"ears_1":-1,"hair_color_1":29,"bags_2":0,"makeup_3":0,"blush_3":0,"sex":0,"makeup_1":0,"beard_3":0,"shoes_2":0,"glasses_2":0,"helmet_1":-1,"arms_2":0,"chest_3":0,"beard_1":0,"eyebrows_4":0,"hair_1":14,"bags_1":0,"decals_1":0}', 'offpolice', 4, '[{"components":[],"ammo":0,"label":"Nightstick","name":"WEAPON_NIGHTSTICK"},{"components":["clip_default"],"ammo":75,"label":"Combat pistol","name":"WEAPON_COMBATPISTOL"},{"components":["clip_default"],"ammo":91,"label":"Carbine rifle","name":"WEAPON_CARBINERIFLE"},{"components":[],"ammo":100,"label":"Taser","name":"WEAPON_STUNGUN"},{"components":[],"ammo":0,"label":"Hatchet","name":"WEAPON_HATCHET"},{"components":[],"ammo":0,"label":"Flashlight","name":"WEAPON_FLASHLIGHT"}]', '{"z":46.2,"x":2467.5,"y":5118.0}', 72150, 0, 'user', '[{"percent":32.24,"val":322400,"name":"hunger"},{"percent":31.68,"val":316800,"name":"thirst"},{"percent":0.0,"val":0,"name":"drunk"},{"percent":0.0,"val":0,"name":"drunk"}]', 'Charukit', 'Thongsukdi', '1996-08-28', 'M', '163', '5666', NULL, '108-3778', 0, 0, NULL, ''),
	('steam:11000013d499d1e', 'license:dc71bb375b91c5bd122c5b4ed66d73428e513420', 1999685, 'เจ๊ศรี', '{"age_1":0,"pants_2":0,"pants_1":10,"skin":0,"blush_1":0,"hair_color_1":20,"bracelets_1":-1,"bproof_1":0,"bags_2":0,"mask_1":0,"torso_2":2,"bproof_2":0,"eyebrows_2":0,"hair_color_2":0,"complexion_1":0,"torso_1":8,"mask_2":0,"lipstick_2":0,"chest_3":0,"shoes_1":43,"beard_3":0,"moles_2":0,"eyebrows_1":0,"helmet_2":0,"sun_2":0,"ears_2":0,"hair_2":0,"bodyb_2":0,"watches_1":-1,"sex":1,"chain_1":0,"shoes_2":0,"lipstick_3":0,"decals_2":0,"age_2":0,"bags_1":0,"face":0,"glasses_1":0,"eyebrows_3":0,"moles_1":0,"bracelets_2":0,"chain_2":0,"lipstick_4":0,"watches_2":0,"bodyb_1":0,"sun_1":0,"makeup_3":0,"blemishes_2":0,"beard_1":0,"beard_4":0,"chest_2":0,"makeup_2":0,"tshirt_2":0,"arms_2":0,"helmet_1":-1,"ears_1":-1,"hair_1":3,"complexion_2":0,"blush_2":0,"glasses_2":0,"eyebrows_4":0,"makeup_4":0,"blemishes_1":0,"decals_1":0,"arms":0,"eye_color":0,"lipstick_1":0,"makeup_1":0,"chest_1":0,"tshirt_1":23,"blush_3":0,"beard_2":0}', 'police', 4, '[{"name":"WEAPON_PISTOL","components":["clip_default"],"label":"Pistol","ammo":0}]', '{"z":30.8,"y":-795.3,"x":218.6}', 99999999, 200, 'Superadmin', '[{"val":500000,"percent":50.0,"name":"hunger"},{"val":500000,"percent":50.0,"name":"thirst"},{"val":0,"percent":0.0,"name":"drunk"},{"val":0,"percent":0.0,"name":"drunk"}]', 'เจ๊ศรี', 'หมีเหม็น', '1990-01-25', 'F', '190', '6626', NULL, '578-5711', 0, 0, NULL, ''),
	('steam:11000013dfc8aed', 'license:dc71bb375b91c5bd122c5b4ed66d73428e513420', 488299, 'ROG_Sofiero', '{"chain_2":0,"glasses_2":0,"complexion_1":0,"lipstick_2":0,"eyebrows_3":0,"moles_2":0,"blush_2":0,"skin":0,"glasses_1":0,"beard_2":6,"pants_1":52,"makeup_1":0,"makeup_2":0,"eye_color":0,"lipstick_1":0,"pants_2":0,"bags_2":0,"watches_2":0,"sun_2":0,"bproof_1":0,"chest_1":0,"makeup_3":0,"blemishes_2":0,"chest_2":0,"chain_1":50,"age_2":0,"chest_3":0,"hair_2":0,"sex":0,"sun_1":0,"moles_1":0,"beard_4":0,"blush_1":0,"bodyb_2":0,"mask_2":0,"face":0,"blush_3":0,"torso_1":83,"watches_1":-1,"helmet_1":-1,"beard_1":10,"beard_3":0,"arms_2":0,"hair_color_1":32,"helmet_2":0,"eyebrows_2":0,"decals_2":0,"blemishes_1":0,"hair_1":11,"mask_1":0,"lipstick_3":0,"hair_color_2":0,"bracelets_1":-1,"bproof_2":0,"makeup_4":0,"bags_1":0,"eyebrows_1":0,"age_1":0,"tshirt_1":15,"ears_2":0,"bracelets_2":0,"arms":0,"decals_1":0,"tshirt_2":0,"lipstick_4":0,"bodyb_1":0,"torso_2":0,"ears_1":-1,"shoes_1":12,"shoes_2":0,"eyebrows_4":0,"complexion_2":0}', 'police', 4, '[{"ammo":0,"name":"WEAPON_KNIFE","components":[],"label":"Knife"}]', '{"y":-1017.9,"z":28.5,"x":449.6}', 88900499, 200, 'Superadmin', '[{"percent":11.81,"name":"hunger","val":118100},{"percent":41.3525,"name":"thirst","val":413525},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drunk","val":0}]', 'สำลี', 'สีไม่ยั้ง', '1990-09-12', 'M', '190', NULL, NULL, '256-8589', 0, 0, NULL, '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_accounts: ~15 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(272, 'steam:11000011b44055b', 'black_money', 0),
	(273, 'steam:11000013d499d1e', 'black_money', 200000),
	(274, 'steam:110000116e3c6b0', 'black_money', 0),
	(275, 'steam:1100001377ac69a', 'black_money', 0),
	(276, 'steam:11000010e4093d5', 'black_money', 0),
	(277, 'steam:1100001352d04d1', 'black_money', 0),
	(278, 'steam:11000010480fe75', 'black_money', 0),
	(279, 'steam:11000010b3f3065', 'black_money', 0),
	(280, 'steam:11000011084faec', 'black_money', 0),
	(281, 'steam:11000010ec17c2f', 'black_money', 0),
	(282, 'steam:110000116dfb3f6', 'black_money', 0),
	(283, 'steam:1100001349a49e9', 'black_money', 0),
	(284, 'steam:1100001074479bd', 'black_money', 0),
	(285, 'steam:11000013cd0f06b', 'black_money', 0),
	(286, 'steam:11000013bd3ffa9', 'black_money', 0),
	(287, 'steam:110000110da5ab4', 'black_money', 0),
	(288, 'steam:11000010dc8e7fd', 'black_money', 0),
	(289, 'steam:11000013dfc8aed', 'black_money', 0),
	(290, 'steam:110000114ec25fb', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_car_keys
CREATE TABLE IF NOT EXISTS `user_car_keys` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`,`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_car_keys: ~9 rows (approximately)
/*!40000 ALTER TABLE `user_car_keys` DISABLE KEYS */;
INSERT INTO `user_car_keys` (`identifier`, `plate`) VALUES
	('steam:110000110da5ab4', 'PMU 603 '),
	('steam:11000013d499d1e', 'FAD 081 '),
	('steam:11000013d499d1e', 'IVY 982 '),
	('steam:11000013d499d1e', 'PZP 951 '),
	('steam:11000013d499d1e', 'RXO 672 '),
	('steam:11000013dfc8aed', 'ELS 936 '),
	('steam:11000013dfc8aed', 'HPF 603 '),
	('steam:11000013dfc8aed', 'LGZ 985 '),
	('steam:11000013dfc8aed', 'QJY 511 ');
/*!40000 ALTER TABLE `user_car_keys` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_inventory: ~799 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(20507, 'steam:11000013d499d1e', 'meth', 0),
	(20508, 'steam:11000013d499d1e', 'leather', 0),
	(20509, 'steam:11000013d499d1e', 'knife', 0),
	(20510, 'steam:11000013d499d1e', 'car_keys', 0),
	(20511, 'steam:11000013d499d1e', 'honey_a', 0),
	(20512, 'steam:11000013d499d1e', 'prawn', 0),
	(20513, 'steam:11000013d499d1e', 'alive_chicken', 0),
	(20514, 'steam:11000013d499d1e', 'milk', 0),
	(20515, 'steam:11000013d499d1e', 'chocolate', 0),
	(20516, 'steam:11000013d499d1e', 'shell', 0),
	(20517, 'steam:11000013d499d1e', 'chips', 0),
	(20518, 'steam:11000013d499d1e', 'diamond', 0),
	(20519, 'steam:11000013d499d1e', 'whisky', 0),
	(20520, 'steam:11000013d499d1e', 'cutted_wood', 0),
	(20521, 'steam:11000013d499d1e', 'sand', 0),
	(20522, 'steam:11000013d499d1e', 'coffe', 0),
	(20523, 'steam:11000013d499d1e', 'protein_shake', 0),
	(20524, 'steam:11000013d499d1e', 'pro_wood', 0),
	(20525, 'steam:11000013d499d1e', 'lockpick', 0),
	(20526, 'steam:11000013d499d1e', 'cheesebows', 0),
	(20527, 'steam:11000013d499d1e', 'essence', 0),
	(20528, 'steam:11000013d499d1e', 'copper', 0),
	(20529, 'steam:11000013d499d1e', 'poolreceipt', 0),
	(20530, 'steam:11000013d499d1e', 'bcabbage', 0),
	(20531, 'steam:11000013d499d1e', 'lemonkey', 0),
	(20532, 'steam:11000013d499d1e', 'coke_pooch', 0),
	(20533, 'steam:11000013d499d1e', 'coke', 0),
	(20534, 'steam:11000013d499d1e', 'bong', 0),
	(20535, 'steam:11000013d499d1e', 'fixtool', 0),
	(20536, 'steam:11000013d499d1e', 'cowpackage', 0),
	(20537, 'steam:11000013d499d1e', 'handcuffs', 0),
	(20538, 'steam:11000013d499d1e', 'Scrap_a', 0),
	(20539, 'steam:11000013d499d1e', 'rope', 0),
	(20540, 'steam:11000013d499d1e', 'tequila', 0),
	(20541, 'steam:11000013d499d1e', 'hatchet_lj', 0),
	(20542, 'steam:11000013d499d1e', 'honey_b', 0),
	(20543, 'steam:11000013d499d1e', 'gold', 0),
	(20544, 'steam:11000013d499d1e', 'weaponskin', 0),
	(20545, 'steam:11000013d499d1e', 'sportlunch', 0),
	(20546, 'steam:11000013d499d1e', 'function', 0),
	(20547, 'steam:11000013d499d1e', 'icetea', 0),
	(20548, 'steam:11000013d499d1e', 'phone', 1),
	(20549, 'steam:11000013d499d1e', 'bandage', 0),
	(20550, 'steam:11000013d499d1e', 'powerade', 0),
	(20551, 'steam:11000013d499d1e', 'beer', 0),
	(20552, 'steam:11000013d499d1e', 'sicklecrab', 0),
	(20553, 'steam:11000013d499d1e', 'cigarett', 0),
	(20554, 'steam:11000013d499d1e', 'medikit', 0),
	(20555, 'steam:11000013d499d1e', 'sickle', 0),
	(20556, 'steam:11000013d499d1e', 'petrol_raffin', 0),
	(20557, 'steam:11000013d499d1e', 'monkey', 0),
	(20558, 'steam:11000013d499d1e', 'cashew', 0),
	(20559, 'steam:11000013d499d1e', 'battery', 0),
	(20560, 'steam:11000013d499d1e', 'fixkit', 4),
	(20561, 'steam:11000013d499d1e', 'bait', 0),
	(20562, 'steam:11000013d499d1e', 'vodka', 0),
	(20563, 'steam:11000013d499d1e', 'hatchet', 0),
	(20564, 'steam:11000013d499d1e', 'water', 4),
	(20565, 'steam:11000013d499d1e', 'prawnbait', 0),
	(20566, 'steam:11000013d499d1e', 'Gears', 0),
	(20567, 'steam:11000013d499d1e', 'weapongrip', 0),
	(20568, 'steam:11000013d499d1e', 'bolchips', 0),
	(20569, 'steam:11000013d499d1e', 'shark', 0),
	(20570, 'steam:11000013d499d1e', 'hamajifish', 0),
	(20571, 'steam:11000013d499d1e', 'cupcake', 0),
	(20572, 'steam:11000013d499d1e', 'cow', 0),
	(20573, 'steam:11000013d499d1e', 'clothe', 0),
	(20574, 'steam:11000013d499d1e', 'shovel', 0),
	(20575, 'steam:11000013d499d1e', 'fabric', 0),
	(20576, 'steam:11000013d499d1e', 'bag', 0),
	(20577, 'steam:11000013d499d1e', 'packaged_chicken', 0),
	(20578, 'steam:11000013d499d1e', 'blowpipe', 0),
	(20579, 'steam:11000013d499d1e', 'orangewater_b', 0),
	(20580, 'steam:11000013d499d1e', 'packaged_plank', 0),
	(20581, 'steam:11000013d499d1e', 'oxygen_mask', 0),
	(20582, 'steam:11000013d499d1e', 'carokit', 0),
	(20583, 'steam:11000013d499d1e', 'meat_w', 0),
	(20584, 'steam:11000013d499d1e', 'steel_b', 0),
	(20585, 'steam:11000013d499d1e', 'alive_chick', 0),
	(20586, 'steam:11000013d499d1e', 'chest_a', 0),
	(20587, 'steam:11000013d499d1e', 'weed_pooch', 0),
	(20588, 'steam:11000013d499d1e', 'cockles', 0),
	(20589, 'steam:11000013d499d1e', 'carotool', 0),
	(20590, 'steam:11000013d499d1e', 'lighter', 1),
	(20591, 'steam:11000013d499d1e', 'wool', 0),
	(20592, 'steam:11000013d499d1e', 'wood', 0),
	(20593, 'steam:11000013d499d1e', 'wine', 0),
	(20594, 'steam:11000013d499d1e', 'worm', 0),
	(20595, 'steam:11000013d499d1e', 'welding_gun', 0),
	(20596, 'steam:11000013d499d1e', 'deer', 0),
	(20597, 'steam:11000013d499d1e', 'crab_pro', 0),
	(20598, 'steam:11000013d499d1e', 'fish', 0),
	(20599, 'steam:11000013d499d1e', 'crab', 0),
	(20600, 'steam:11000013d499d1e', 'meth_pooch', 0),
	(20601, 'steam:11000013d499d1e', 'gazbottle', 0),
	(20602, 'steam:11000013d499d1e', 'clip', 0),
	(20603, 'steam:11000013d499d1e', 'turtle', 0),
	(20604, 'steam:11000013d499d1e', 'slaughtered_chicken', 0),
	(20605, 'steam:11000013d499d1e', 'washed_stone', 0),
	(20606, 'steam:11000013d499d1e', 'pumkin_pro', 0),
	(20607, 'steam:11000013d499d1e', 'glass', 0),
	(20608, 'steam:11000013d499d1e', '9mm_rounds', 0),
	(20609, 'steam:11000013d499d1e', 'turtlebait', 0),
	(20610, 'steam:11000013d499d1e', 'squidbait', 0),
	(20611, 'steam:11000013d499d1e', 'acabbage', 0),
	(20612, 'steam:11000013d499d1e', 'hamburger', 0),
	(20613, 'steam:11000013d499d1e', 'squid', 0),
	(20614, 'steam:11000013d499d1e', 'ledeer', 0),
	(20615, 'steam:11000013d499d1e', 'crab_a', 0),
	(20616, 'steam:11000013d499d1e', 'crabpack', 0),
	(20617, 'steam:11000013d499d1e', 'iron', 0),
	(20618, 'steam:11000013d499d1e', 'bottle', 0),
	(20619, 'steam:11000013d499d1e', 'gym_membership', 0),
	(20620, 'steam:11000013d499d1e', 'sandwich', 0),
	(20621, 'steam:11000013d499d1e', 'drills', 0),
	(20622, 'steam:11000013d499d1e', 'petrol', 0),
	(20623, 'steam:11000013d499d1e', 'marijuana_cigarette', 0),
	(20624, 'steam:11000013d499d1e', 'rice', 0),
	(20625, 'steam:11000013d499d1e', 'rice_pro', 0),
	(20626, 'steam:11000013d499d1e', 'weaponflashlight', 0),
	(20627, 'steam:11000013d499d1e', 'blindfold', 0),
	(20628, 'steam:11000013d499d1e', 'cannabis', 0),
	(20629, 'steam:11000013d499d1e', 'stone', 0),
	(20630, 'steam:11000013d499d1e', 'pumkin', 0),
	(20631, 'steam:11000013d499d1e', 'poteto', 0),
	(20632, 'steam:11000013d499d1e', 'cocaine', 0),
	(20633, 'steam:11000013d499d1e', 'lay_b', 0),
	(20634, 'steam:11000013d499d1e', 'binoculars', 0),
	(20635, 'steam:11000013d499d1e', 'AED', 0),
	(20636, 'steam:11000013d499d1e', 'orange_a', 0),
	(20637, 'steam:11000013d499d1e', 'meat', 0),
	(20638, 'steam:11000013d499d1e', 'fishbait', 0),
	(20639, 'steam:11000013d499d1e', 'SteelScrap', 0),
	(20640, 'steam:11000013d499d1e', 'whale', 0),
	(20641, 'steam:11000013d499d1e', 'croquettes', 0),
	(20642, 'steam:11000013d499d1e', 'bread', 3),
	(20643, 'steam:11000013d499d1e', 'fishingrod', 0),
	(20645, 'steam:11000013d499d1e', 'black_money', 0),
	(20646, 'steam:110000110da5ab4', 'knife', 0),
	(20647, 'steam:110000110da5ab4', 'clothe', 0),
	(20648, 'steam:110000110da5ab4', 'slaughtered_chicken', 0),
	(20649, 'steam:110000110da5ab4', 'orange_a', 0),
	(20650, 'steam:110000110da5ab4', 'sportlunch', 0),
	(20651, 'steam:110000110da5ab4', 'fish', 0),
	(20652, 'steam:110000110da5ab4', 'iron', 0),
	(20653, 'steam:110000110da5ab4', 'sickle', 0),
	(20654, 'steam:110000110da5ab4', 'marijuana_cigarette', 0),
	(20655, 'steam:110000110da5ab4', 'binoculars', 0),
	(20656, 'steam:110000110da5ab4', 'petrol_raffin', 0),
	(20657, 'steam:110000110da5ab4', 'fishingrod', 0),
	(20658, 'steam:110000110da5ab4', 'black_money', 0),
	(20659, 'steam:110000110da5ab4', 'essence', 0),
	(20660, 'steam:110000110da5ab4', 'shark', 0),
	(20661, 'steam:110000110da5ab4', 'cutted_wood', 0),
	(20662, 'steam:110000110da5ab4', 'icetea', 0),
	(20663, 'steam:110000110da5ab4', 'carotool', 0),
	(20664, 'steam:110000110da5ab4', 'Gears', 0),
	(20665, 'steam:110000110da5ab4', 'coffe', 0),
	(20666, 'steam:110000110da5ab4', 'bag', 0),
	(20667, 'steam:110000110da5ab4', 'powerade', 0),
	(20668, 'steam:110000110da5ab4', 'gazbottle', 0),
	(20669, 'steam:110000110da5ab4', 'turtle', 0),
	(20670, 'steam:110000110da5ab4', 'blowpipe', 0),
	(20671, 'steam:110000110da5ab4', 'lighter', 0),
	(20672, 'steam:110000110da5ab4', 'sandwich', 0),
	(20673, 'steam:110000110da5ab4', 'deer', 0),
	(20674, 'steam:110000110da5ab4', 'weaponskin', 0),
	(20675, 'steam:110000110da5ab4', 'beer', 0),
	(20676, 'steam:110000110da5ab4', 'whale', 0),
	(20677, 'steam:110000110da5ab4', 'meth_pooch', 0),
	(20678, 'steam:110000110da5ab4', 'fishbait', 0),
	(20679, 'steam:110000110da5ab4', 'blindfold', 0),
	(20680, 'steam:110000110da5ab4', 'honey_a', 0),
	(20681, 'steam:110000110da5ab4', 'honey_b', 0),
	(20682, 'steam:110000110da5ab4', 'diamond', 0),
	(20683, 'steam:110000110da5ab4', 'hamburger', 0),
	(20684, 'steam:110000110da5ab4', 'AED', 0),
	(20685, 'steam:110000110da5ab4', 'croquettes', 0),
	(20686, 'steam:110000110da5ab4', 'cannabis', 0),
	(20687, 'steam:110000110da5ab4', 'medikit', 0),
	(20688, 'steam:110000110da5ab4', 'cockles', 0),
	(20689, 'steam:110000110da5ab4', 'water', 0),
	(20690, 'steam:110000110da5ab4', 'gym_membership', 0),
	(20691, 'steam:110000110da5ab4', 'steel_b', 0),
	(20692, 'steam:110000110da5ab4', 'worm', 0),
	(20693, 'steam:110000110da5ab4', 'Scrap_a', 0),
	(20694, 'steam:110000110da5ab4', 'bread', 0),
	(20695, 'steam:110000110da5ab4', 'hatchet', 0),
	(20696, 'steam:110000110da5ab4', '9mm_rounds', 0),
	(20697, 'steam:110000110da5ab4', 'crab_pro', 0),
	(20698, 'steam:110000110da5ab4', 'cow', 0),
	(20699, 'steam:110000110da5ab4', 'packaged_plank', 0),
	(20700, 'steam:110000110da5ab4', 'SteelScrap', 0),
	(20701, 'steam:110000110da5ab4', 'poolreceipt', 0),
	(20702, 'steam:110000110da5ab4', 'rice_pro', 0),
	(20703, 'steam:110000110da5ab4', 'bottle', 0),
	(20704, 'steam:110000110da5ab4', 'protein_shake', 0),
	(20705, 'steam:110000110da5ab4', 'coke_pooch', 0),
	(20706, 'steam:110000110da5ab4', 'chips', 0),
	(20707, 'steam:110000110da5ab4', 'pumkin', 0),
	(20708, 'steam:110000110da5ab4', 'chocolate', 0),
	(20709, 'steam:110000110da5ab4', 'poteto', 0),
	(20710, 'steam:110000110da5ab4', 'meth', 0),
	(20711, 'steam:110000110da5ab4', 'carokit', 0),
	(20712, 'steam:110000110da5ab4', 'pumkin_pro', 0),
	(20713, 'steam:110000110da5ab4', 'bong', 0),
	(20714, 'steam:110000110da5ab4', 'hatchet_lj', 0),
	(20715, 'steam:110000110da5ab4', 'lemonkey', 0),
	(20716, 'steam:110000110da5ab4', 'cashew', 0),
	(20717, 'steam:110000110da5ab4', 'petrol', 0),
	(20718, 'steam:110000110da5ab4', 'function', 0),
	(20719, 'steam:110000110da5ab4', 'fixkit', 0),
	(20720, 'steam:110000110da5ab4', 'tequila', 0),
	(20721, 'steam:110000110da5ab4', 'rice', 0),
	(20722, 'steam:110000110da5ab4', 'wine', 0),
	(20723, 'steam:110000110da5ab4', 'milk', 0),
	(20724, 'steam:110000110da5ab4', 'bolchips', 0),
	(20725, 'steam:110000110da5ab4', 'lockpick', 0),
	(20726, 'steam:110000110da5ab4', 'sicklecrab', 0),
	(20727, 'steam:110000110da5ab4', 'bait', 0),
	(20728, 'steam:110000110da5ab4', 'crab', 0),
	(20729, 'steam:110000110da5ab4', 'cowpackage', 0),
	(20730, 'steam:110000110da5ab4', 'fixtool', 0),
	(20731, 'steam:110000110da5ab4', 'orangewater_b', 0),
	(20732, 'steam:110000110da5ab4', 'clip', 0),
	(20733, 'steam:110000110da5ab4', 'sand', 0),
	(20734, 'steam:110000110da5ab4', 'rope', 0),
	(20735, 'steam:110000110da5ab4', 'leather', 0),
	(20736, 'steam:110000110da5ab4', 'oxygen_mask', 0),
	(20737, 'steam:110000110da5ab4', 'prawnbait', 0),
	(20738, 'steam:110000110da5ab4', 'acabbage', 0),
	(20739, 'steam:110000110da5ab4', 'washed_stone', 0),
	(20740, 'steam:110000110da5ab4', 'cupcake', 0),
	(20741, 'steam:110000110da5ab4', 'wood', 0),
	(20742, 'steam:110000110da5ab4', 'battery', 0),
	(20743, 'steam:110000110da5ab4', 'whisky', 0),
	(20744, 'steam:110000110da5ab4', 'wool', 0),
	(20745, 'steam:110000110da5ab4', 'ledeer', 0),
	(20746, 'steam:110000110da5ab4', 'weed_pooch', 0),
	(20747, 'steam:110000110da5ab4', 'turtlebait', 0),
	(20748, 'steam:110000110da5ab4', 'crab_a', 0),
	(20749, 'steam:110000110da5ab4', 'drills', 0),
	(20750, 'steam:110000110da5ab4', 'welding_gun', 0),
	(20751, 'steam:110000110da5ab4', 'weaponflashlight', 0),
	(20752, 'steam:110000110da5ab4', 'meat_w', 0),
	(20753, 'steam:110000110da5ab4', 'glass', 0),
	(20754, 'steam:110000110da5ab4', 'fabric', 0),
	(20755, 'steam:110000110da5ab4', 'weapongrip', 0),
	(20756, 'steam:110000110da5ab4', 'phone', 1),
	(20757, 'steam:110000110da5ab4', 'cigarett', 0),
	(20758, 'steam:110000110da5ab4', 'packaged_chicken', 0),
	(20759, 'steam:110000110da5ab4', 'chest_a', 0),
	(20760, 'steam:110000110da5ab4', 'vodka', 0),
	(20761, 'steam:110000110da5ab4', 'gold', 0),
	(20762, 'steam:110000110da5ab4', 'hamajifish', 0),
	(20763, 'steam:110000110da5ab4', 'squidbait', 0),
	(20764, 'steam:110000110da5ab4', 'stone', 0),
	(20765, 'steam:110000110da5ab4', 'lay_b', 0),
	(20766, 'steam:110000110da5ab4', 'squid', 0),
	(20767, 'steam:110000110da5ab4', 'handcuffs', 0),
	(20768, 'steam:110000110da5ab4', 'shovel', 0),
	(20769, 'steam:110000110da5ab4', 'pro_wood', 0),
	(20770, 'steam:110000110da5ab4', 'shell', 0),
	(20771, 'steam:110000110da5ab4', 'car_keys', 0),
	(20772, 'steam:110000110da5ab4', 'cheesebows', 0),
	(20773, 'steam:110000110da5ab4', 'alive_chick', 0),
	(20774, 'steam:110000110da5ab4', 'prawn', 0),
	(20775, 'steam:110000110da5ab4', 'crabpack', 0),
	(20776, 'steam:110000110da5ab4', 'monkey', 0),
	(20777, 'steam:110000110da5ab4', 'cocaine', 0),
	(20778, 'steam:110000110da5ab4', 'alive_chicken', 0),
	(20779, 'steam:110000110da5ab4', 'copper', 0),
	(20780, 'steam:110000110da5ab4', 'bandage', 0),
	(20781, 'steam:110000110da5ab4', 'meat', 0),
	(20782, 'steam:110000110da5ab4', 'bcabbage', 0),
	(20783, 'steam:110000110da5ab4', 'coke', 0),
	(20784, 'steam:11000010dc8e7fd', 'bcabbage', 0),
	(20785, 'steam:11000010dc8e7fd', 'packaged_chicken', 0),
	(20786, 'steam:11000010dc8e7fd', 'crab_pro', 0),
	(20787, 'steam:11000010dc8e7fd', 'cowpackage', 0),
	(20788, 'steam:11000010dc8e7fd', 'worm', 0),
	(20789, 'steam:11000010dc8e7fd', 'turtlebait', 0),
	(20790, 'steam:11000010dc8e7fd', 'clothe', 0),
	(20791, 'steam:11000010dc8e7fd', 'milk', 3),
	(20792, 'steam:11000010dc8e7fd', 'protein_shake', 0),
	(20793, 'steam:11000010dc8e7fd', 'acabbage', 0),
	(20794, 'steam:11000010dc8e7fd', 'pumkin', 0),
	(20795, 'steam:11000010dc8e7fd', 'fishingrod', 0),
	(20796, 'steam:11000010dc8e7fd', 'squidbait', 0),
	(20797, 'steam:11000010dc8e7fd', 'shark', 0),
	(20798, 'steam:11000010dc8e7fd', 'cocaine', 0),
	(20799, 'steam:11000010dc8e7fd', 'sportlunch', 0),
	(20800, 'steam:11000010dc8e7fd', 'sand', 0),
	(20801, 'steam:11000010dc8e7fd', 'turtle', 0),
	(20802, 'steam:11000010dc8e7fd', 'icetea', 0),
	(20803, 'steam:11000010dc8e7fd', 'Scrap_a', 0),
	(20804, 'steam:11000010dc8e7fd', 'prawn', 0),
	(20805, 'steam:11000010dc8e7fd', 'tequila', 0),
	(20806, 'steam:11000010dc8e7fd', 'coffe', 0),
	(20807, 'steam:11000010dc8e7fd', 'gold', 0),
	(20808, 'steam:11000010dc8e7fd', 'hatchet_lj', 0),
	(20809, 'steam:11000010dc8e7fd', 'honey_b', 0),
	(20810, 'steam:11000010dc8e7fd', 'bait', 0),
	(20811, 'steam:11000010dc8e7fd', 'fixtool', 0),
	(20812, 'steam:11000010dc8e7fd', 'chest_a', 0),
	(20813, 'steam:11000010dc8e7fd', 'fish', 0),
	(20814, 'steam:11000010dc8e7fd', 'blindfold', 0),
	(20815, 'steam:11000010dc8e7fd', 'drills', 0),
	(20816, 'steam:11000010dc8e7fd', 'fixkit', 0),
	(20817, 'steam:11000010dc8e7fd', 'cockles', 0),
	(20818, 'steam:11000010dc8e7fd', 'wood', 0),
	(20819, 'steam:11000010dc8e7fd', 'meth_pooch', 0),
	(20820, 'steam:11000010dc8e7fd', 'carokit', 0),
	(20821, 'steam:11000010dc8e7fd', 'orange_a', 0),
	(20822, 'steam:11000010dc8e7fd', 'sickle', 0),
	(20823, 'steam:11000010dc8e7fd', 'lay_b', 0),
	(20824, 'steam:11000010dc8e7fd', 'copper', 0),
	(20825, 'steam:11000010dc8e7fd', 'function', 0),
	(20826, 'steam:11000010dc8e7fd', 'cupcake', 0),
	(20827, 'steam:11000010dc8e7fd', 'coke_pooch', 0),
	(20828, 'steam:11000010dc8e7fd', 'knife', 0),
	(20829, 'steam:11000010dc8e7fd', 'wool', 0),
	(20830, 'steam:11000010dc8e7fd', 'blowpipe', 0),
	(20831, 'steam:11000010dc8e7fd', 'steel_b', 0),
	(20832, 'steam:11000010dc8e7fd', 'iron', 0),
	(20833, 'steam:11000010dc8e7fd', 'packaged_plank', 0),
	(20834, 'steam:11000010dc8e7fd', 'rope', 0),
	(20835, 'steam:11000010dc8e7fd', 'hamajifish', 0),
	(20836, 'steam:11000010dc8e7fd', 'essence', 0),
	(20837, 'steam:11000010dc8e7fd', 'gym_membership', 0),
	(20838, 'steam:11000010dc8e7fd', 'beer', 0),
	(20839, 'steam:11000010dc8e7fd', 'battery', 0),
	(20840, 'steam:11000010dc8e7fd', 'washed_stone', 0),
	(20841, 'steam:11000010dc8e7fd', 'meat_w', 0),
	(20842, 'steam:11000010dc8e7fd', 'pumkin_pro', 0),
	(20843, 'steam:11000010dc8e7fd', 'orangewater_b', 0),
	(20844, 'steam:11000010dc8e7fd', 'hamburger', 7),
	(20845, 'steam:11000010dc8e7fd', 'bottle', 0),
	(20846, 'steam:11000010dc8e7fd', 'squid', 0),
	(20847, 'steam:11000010dc8e7fd', 'sicklecrab', 0),
	(20848, 'steam:11000010dc8e7fd', 'bong', 0),
	(20849, 'steam:11000010dc8e7fd', 'lemonkey', 0),
	(20850, 'steam:11000010dc8e7fd', 'poteto', 0),
	(20851, 'steam:11000010dc8e7fd', 'powerade', 0),
	(20852, 'steam:11000010dc8e7fd', 'cigarett', 0),
	(20853, 'steam:11000010dc8e7fd', 'oxygen_mask', 0),
	(20854, 'steam:11000010dc8e7fd', 'meth', 0),
	(20855, 'steam:11000010dc8e7fd', 'water', 8),
	(20856, 'steam:11000010dc8e7fd', 'pro_wood', 0),
	(20857, 'steam:11000010dc8e7fd', 'leather', 0),
	(20858, 'steam:11000010dc8e7fd', 'cannabis', 0),
	(20859, 'steam:11000010dc8e7fd', 'alive_chick', 0),
	(20860, 'steam:11000010dc8e7fd', 'fabric', 0),
	(20861, 'steam:11000010dc8e7fd', 'vodka', 0),
	(20862, 'steam:11000010dc8e7fd', 'black_money', 0),
	(20863, 'steam:11000010dc8e7fd', 'lighter', 0),
	(20864, 'steam:11000010dc8e7fd', 'phone', 1),
	(20865, 'steam:11000010dc8e7fd', 'cheesebows', 0),
	(20866, 'steam:11000010dc8e7fd', 'shovel', 0),
	(20867, 'steam:11000010dc8e7fd', 'gazbottle', 0),
	(20868, 'steam:11000010dc8e7fd', 'croquettes', 0),
	(20869, 'steam:11000010dc8e7fd', 'wine', 0),
	(20870, 'steam:11000010dc8e7fd', 'marijuana_cigarette', 0),
	(20871, 'steam:11000010dc8e7fd', 'crab_a', 0),
	(20872, 'steam:11000010dc8e7fd', 'whisky', 0),
	(20873, 'steam:11000010dc8e7fd', 'welding_gun', 0),
	(20874, 'steam:11000010dc8e7fd', 'prawnbait', 0),
	(20875, 'steam:11000010dc8e7fd', 'hatchet', 0),
	(20876, 'steam:11000010dc8e7fd', 'weed_pooch', 0),
	(20877, 'steam:11000010dc8e7fd', 'AED', 0),
	(20878, 'steam:11000010dc8e7fd', 'bread', 0),
	(20879, 'steam:11000010dc8e7fd', 'diamond', 0),
	(20880, 'steam:11000010dc8e7fd', 'weaponskin', 0),
	(20881, 'steam:11000010dc8e7fd', 'chocolate', 0),
	(20882, 'steam:11000010dc8e7fd', 'weaponflashlight', 0),
	(20883, 'steam:11000010dc8e7fd', '9mm_rounds', 0),
	(20884, 'steam:11000010dc8e7fd', 'bolchips', 0),
	(20885, 'steam:11000010dc8e7fd', 'petrol_raffin', 0),
	(20886, 'steam:11000010dc8e7fd', 'poolreceipt', 0),
	(20887, 'steam:11000010dc8e7fd', 'deer', 0),
	(20888, 'steam:11000010dc8e7fd', 'sandwich', 0),
	(20889, 'steam:11000010dc8e7fd', 'stone', 0),
	(20890, 'steam:11000010dc8e7fd', 'Gears', 0),
	(20891, 'steam:11000010dc8e7fd', 'lockpick', 0),
	(20892, 'steam:11000010dc8e7fd', 'honey_a', 0),
	(20893, 'steam:11000010dc8e7fd', 'slaughtered_chicken', 0),
	(20894, 'steam:11000010dc8e7fd', 'crab', 0),
	(20895, 'steam:11000010dc8e7fd', 'rice', 0),
	(20896, 'steam:11000010dc8e7fd', 'fishbait', 0),
	(20897, 'steam:11000010dc8e7fd', 'handcuffs', 0),
	(20898, 'steam:11000010dc8e7fd', 'car_keys', 0),
	(20899, 'steam:11000010dc8e7fd', 'alive_chicken', 0),
	(20900, 'steam:11000010dc8e7fd', 'coke', 0),
	(20901, 'steam:11000010dc8e7fd', 'bandage', 0),
	(20902, 'steam:11000010dc8e7fd', 'shell', 0),
	(20903, 'steam:11000010dc8e7fd', 'rice_pro', 0),
	(20904, 'steam:11000010dc8e7fd', 'monkey', 0),
	(20905, 'steam:11000010dc8e7fd', 'glass', 0),
	(20906, 'steam:11000010dc8e7fd', 'bag', 0),
	(20907, 'steam:11000010dc8e7fd', 'cashew', 0),
	(20908, 'steam:11000010dc8e7fd', 'cutted_wood', 0),
	(20909, 'steam:11000010dc8e7fd', 'ledeer', 0),
	(20910, 'steam:11000010dc8e7fd', 'clip', 0),
	(20911, 'steam:11000010dc8e7fd', 'carotool', 0),
	(20912, 'steam:11000010dc8e7fd', 'petrol', 0),
	(20913, 'steam:11000010dc8e7fd', 'SteelScrap', 0),
	(20914, 'steam:11000010dc8e7fd', 'crabpack', 0),
	(20915, 'steam:11000010dc8e7fd', 'meat', 0),
	(20916, 'steam:11000010dc8e7fd', 'binoculars', 0),
	(20917, 'steam:11000010dc8e7fd', 'weapongrip', 0),
	(20918, 'steam:11000010dc8e7fd', 'whale', 0),
	(20919, 'steam:11000010dc8e7fd', 'cow', 0),
	(20920, 'steam:11000010dc8e7fd', 'chips', 0),
	(20921, 'steam:11000010dc8e7fd', 'medikit', 0),
	(20922, 'steam:11000013dfc8aed', 'crab_pro', 0),
	(20923, 'steam:11000013dfc8aed', 'rope', 0),
	(20924, 'steam:11000013dfc8aed', 'packaged_plank', 0),
	(20925, 'steam:11000013dfc8aed', 'medikit', 0),
	(20926, 'steam:11000013dfc8aed', 'car_keys', 0),
	(20927, 'steam:11000013dfc8aed', 'leather', 5),
	(20928, 'steam:11000013dfc8aed', 'alive_chick', 0),
	(20929, 'steam:11000013dfc8aed', 'meth_pooch', 0),
	(20930, 'steam:11000013dfc8aed', 'drills', 1),
	(20931, 'steam:11000013dfc8aed', 'tequila', 0),
	(20932, 'steam:11000013dfc8aed', 'gazbottle', 0),
	(20933, 'steam:11000013dfc8aed', 'sand', 0),
	(20934, 'steam:11000013dfc8aed', 'lemonkey', 1),
	(20935, 'steam:11000013dfc8aed', 'crab', 48),
	(20936, 'steam:11000013dfc8aed', 'sickle', 1),
	(20937, 'steam:11000013dfc8aed', 'chocolate', 0),
	(20938, 'steam:11000013dfc8aed', 'honey_a', 2),
	(20939, 'steam:11000013dfc8aed', 'bong', 0),
	(20940, 'steam:11000013dfc8aed', 'black_money', 0),
	(20941, 'steam:11000013dfc8aed', 'wine', 0),
	(20942, 'steam:11000013dfc8aed', 'hamajifish', 0),
	(20943, 'steam:11000013dfc8aed', 'poolreceipt', 0),
	(20944, 'steam:11000013dfc8aed', 'ledeer', 6),
	(20945, 'steam:11000013dfc8aed', 'whisky', 0),
	(20946, 'steam:11000013dfc8aed', 'Scrap_a', 0),
	(20947, 'steam:11000013dfc8aed', 'bandage', 0),
	(20948, 'steam:11000013dfc8aed', 'cheesebows', 0),
	(20949, 'steam:11000013dfc8aed', 'powerade', 0),
	(20950, 'steam:11000013dfc8aed', 'coffe', 0),
	(20951, 'steam:11000013dfc8aed', 'welding_gun', 1),
	(20952, 'steam:11000013dfc8aed', 'sportlunch', 0),
	(20953, 'steam:11000013dfc8aed', 'wool', 0),
	(20954, 'steam:11000013dfc8aed', 'weapongrip', 0),
	(20955, 'steam:11000013dfc8aed', 'Gears', 0),
	(20956, 'steam:11000013dfc8aed', 'carokit', 0),
	(20957, 'steam:11000013dfc8aed', 'bag', 0),
	(20958, 'steam:11000013dfc8aed', 'chips', 0),
	(20959, 'steam:11000013dfc8aed', 'diamond', 0),
	(20960, 'steam:11000013dfc8aed', 'bait', 0),
	(20961, 'steam:11000013dfc8aed', 'honey_b', 0),
	(20962, 'steam:11000013dfc8aed', 'bread', 0),
	(20963, 'steam:11000013dfc8aed', 'blindfold', 0),
	(20964, 'steam:11000013dfc8aed', 'battery', 0),
	(20965, 'steam:11000013dfc8aed', 'essence', 0),
	(20966, 'steam:11000013dfc8aed', 'cowpackage', 0),
	(20967, 'steam:11000013dfc8aed', 'knife', 1),
	(20968, 'steam:11000013dfc8aed', 'fish', 104),
	(20969, 'steam:11000013dfc8aed', 'stone', 8),
	(20970, 'steam:11000013dfc8aed', 'copper', 0),
	(20971, 'steam:11000013dfc8aed', 'orangewater_b', 0),
	(20972, 'steam:11000013dfc8aed', 'pumkin', 1),
	(20973, 'steam:11000013dfc8aed', 'meat', 1),
	(20974, 'steam:11000013dfc8aed', 'steel_b', 0),
	(20975, 'steam:11000013dfc8aed', 'orange_a', 0),
	(20976, 'steam:11000013dfc8aed', 'cigarett', 2),
	(20977, 'steam:11000013dfc8aed', 'binoculars', 1),
	(20978, 'steam:11000013dfc8aed', 'shell', 6),
	(20979, 'steam:11000013dfc8aed', 'handcuffs', 0),
	(20980, 'steam:11000013dfc8aed', 'whale', 0),
	(20981, 'steam:11000013dfc8aed', 'hamburger', 0),
	(20982, 'steam:11000013dfc8aed', 'petrol', 0),
	(20983, 'steam:11000013dfc8aed', 'worm', 20),
	(20984, 'steam:11000013dfc8aed', 'cutted_wood', 0),
	(20985, 'steam:11000013dfc8aed', 'water', 4),
	(20986, 'steam:11000013dfc8aed', 'washed_stone', 0),
	(20987, 'steam:11000013dfc8aed', 'gym_membership', 0),
	(20988, 'steam:11000013dfc8aed', 'coke', 0),
	(20989, 'steam:11000013dfc8aed', 'cannabis', 0),
	(20990, 'steam:11000013dfc8aed', 'fishingrod', 3),
	(20991, 'steam:11000013dfc8aed', 'fishbait', 30),
	(20992, 'steam:11000013dfc8aed', 'turtlebait', 9),
	(20993, 'steam:11000013dfc8aed', 'fixkit', 5),
	(20994, 'steam:11000013dfc8aed', 'sandwich', 0),
	(20995, 'steam:11000013dfc8aed', 'hatchet', 0),
	(20996, 'steam:11000013dfc8aed', 'squid', 0),
	(20997, 'steam:11000013dfc8aed', 'glass', 0),
	(20998, 'steam:11000013dfc8aed', 'protein_shake', 0),
	(20999, 'steam:11000013dfc8aed', 'iron', 0),
	(21000, 'steam:11000013dfc8aed', 'cocaine', 0),
	(21001, 'steam:11000013dfc8aed', 'lighter', 1),
	(21002, 'steam:11000013dfc8aed', '9mm_rounds', 0),
	(21003, 'steam:11000013dfc8aed', 'weed_pooch', 0),
	(21004, 'steam:11000013dfc8aed', 'bcabbage', 0),
	(21005, 'steam:11000013dfc8aed', 'SteelScrap', 2),
	(21006, 'steam:11000013dfc8aed', 'wood', 10),
	(21007, 'steam:11000013dfc8aed', 'monkey', 1),
	(21008, 'steam:11000013dfc8aed', 'meat_w', 0),
	(21009, 'steam:11000013dfc8aed', 'weaponskin', 0),
	(21010, 'steam:11000013dfc8aed', 'weaponflashlight', 0),
	(21011, 'steam:11000013dfc8aed', 'crabpack', 0),
	(21012, 'steam:11000013dfc8aed', 'prawnbait', 20),
	(21013, 'steam:11000013dfc8aed', 'cashew', 0),
	(21014, 'steam:11000013dfc8aed', 'vodka', 0),
	(21015, 'steam:11000013dfc8aed', 'gold', 0),
	(21016, 'steam:11000013dfc8aed', 'turtle', 5),
	(21017, 'steam:11000013dfc8aed', 'slaughtered_chicken', 0),
	(21018, 'steam:11000013dfc8aed', 'acabbage', 0),
	(21019, 'steam:11000013dfc8aed', 'lockpick', 0),
	(21020, 'steam:11000013dfc8aed', 'squidbait', 20),
	(21021, 'steam:11000013dfc8aed', 'blowpipe', 0),
	(21022, 'steam:11000013dfc8aed', 'icetea', 1),
	(21023, 'steam:11000013dfc8aed', 'rice_pro', 0),
	(21024, 'steam:11000013dfc8aed', 'shark', 0),
	(21025, 'steam:11000013dfc8aed', 'shovel', 1),
	(21026, 'steam:11000013dfc8aed', 'fabric', 0),
	(21027, 'steam:11000013dfc8aed', 'alive_chicken', 0),
	(21028, 'steam:11000013dfc8aed', 'coke_pooch', 0),
	(21029, 'steam:11000013dfc8aed', 'cockles', 0),
	(21030, 'steam:11000013dfc8aed', 'rice', 0),
	(21031, 'steam:11000013dfc8aed', 'oxygen_mask', 0),
	(21032, 'steam:11000013dfc8aed', 'clip', 0),
	(21033, 'steam:11000013dfc8aed', 'pumkin_pro', 0),
	(21034, 'steam:11000013dfc8aed', 'phone', 1),
	(21035, 'steam:11000013dfc8aed', 'pro_wood', 0),
	(21036, 'steam:11000013dfc8aed', 'carotool', 0),
	(21037, 'steam:11000013dfc8aed', 'petrol_raffin', 0),
	(21038, 'steam:11000013dfc8aed', 'poteto', 0),
	(21039, 'steam:11000013dfc8aed', 'sicklecrab', 1),
	(21040, 'steam:11000013dfc8aed', 'prawn', 0),
	(21041, 'steam:11000013dfc8aed', 'croquettes', 1),
	(21042, 'steam:11000013dfc8aed', 'crab_a', 0),
	(21043, 'steam:11000013dfc8aed', 'deer', 2),
	(21044, 'steam:11000013dfc8aed', 'bottle', 6),
	(21045, 'steam:11000013dfc8aed', 'bolchips', 0),
	(21046, 'steam:11000013dfc8aed', 'packaged_chicken', 0),
	(21047, 'steam:11000013dfc8aed', 'fixtool', 0),
	(21048, 'steam:11000013dfc8aed', 'beer', 0),
	(21049, 'steam:11000013dfc8aed', 'AED', 0),
	(21050, 'steam:11000013dfc8aed', 'milk', 1),
	(21051, 'steam:11000013dfc8aed', 'cupcake', 0),
	(21052, 'steam:11000013dfc8aed', 'hatchet_lj', 1),
	(21053, 'steam:11000013dfc8aed', 'cow', 1),
	(21054, 'steam:11000013dfc8aed', 'chest_a', 27),
	(21055, 'steam:11000013dfc8aed', 'function', 0),
	(21056, 'steam:11000013dfc8aed', 'marijuana_cigarette', 0),
	(21057, 'steam:11000013dfc8aed', 'clothe', 0),
	(21058, 'steam:11000013dfc8aed', 'meth', 0),
	(21059, 'steam:11000013dfc8aed', 'lay_b', 0),
	(21060, 'steam:11000013dfc8aed', 'magazine', 0),
	(21061, 'steam:11000013dfc8aed', 'gunpowder', 0),
	(21062, 'steam:11000013dfc8aed', 'ammo_pistol', 0),
	(21063, 'steam:11000013dfc8aed', 'spring', 0),
	(21064, 'steam:11000013dfc8aed', 'armor', 0),
	(21065, 'steam:11000013dfc8aed', 'ammo_pistol50', 0),
	(21066, 'steam:11000013dfc8aed', 'nots', 0),
	(21067, 'steam:11000013dfc8aed', 'WEAPON_BAT', 0),
	(21068, 'steam:11000013dfc8aed', 'aluminium', 0),
	(21069, 'steam:11000013dfc8aed', 'table_saw', 0),
	(21070, 'steam:11000013dfc8aed', 'wire', 0),
	(21071, 'steam:11000013dfc8aed', 'c4_bank', 0),
	(21072, 'steam:11000013dfc8aed', 'knife_handel', 0),
	(21073, 'steam:11000013dfc8aed', 'a_clar', 0),
	(21074, 'steam:11000013dfc8aed', 'saltpeter', 0),
	(21075, 'steam:11000013dfc8aed', 'b_clar', 0),
	(21076, 'steam:11000013dfc8aed', 'news_mic', 0),
	(21077, 'steam:11000013dfc8aed', 'burrito', 0),
	(21078, 'steam:11000013dfc8aed', 'leather_gun', 0),
	(21079, 'steam:11000013dfc8aed', 'donut1', 0),
	(21080, 'steam:11000013dfc8aed', 'gun_barrel', 0),
	(21081, 'steam:11000013dfc8aed', 'handcuffs_key', 0),
	(21082, 'steam:11000013dfc8aed', 'grill', 0),
	(21083, 'steam:11000013dfc8aed', 'donut2', 0),
	(21084, 'steam:11000013dfc8aed', 'bikersuit', 0),
	(21085, 'steam:11000013dfc8aed', 'news_bmic', 0),
	(21086, 'steam:11000013dfc8aed', 'candy', 0),
	(21087, 'steam:11000013dfc8aed', 'zap_oil', 0),
	(21088, 'steam:11000013dfc8aed', 'news_cam', 0),
	(21089, 'steam:11000013dfc8aed', 'keyhouse', 0),
	(21090, 'steam:11000013dfc8aed', 'steel_bar', 0),
	(21091, 'steam:11000013dfc8aed', 'meatfood', 0),
	(21092, 'steam:11000013dfc8aed', 'broken_gun', 0),
	(21093, 'steam:110000114ec25fb', 'cocaine', 0),
	(21094, 'steam:110000114ec25fb', 'protein_shake', 0),
	(21095, 'steam:110000114ec25fb', 'clothe', 0),
	(21096, 'steam:110000114ec25fb', 'leather_gun', 0),
	(21097, 'steam:110000114ec25fb', 'weaponflashlight', 0),
	(21098, 'steam:110000114ec25fb', 'battery', 0),
	(21099, 'steam:110000114ec25fb', 'whale', 0),
	(21100, 'steam:110000114ec25fb', 'ammo_pistol', 0),
	(21101, 'steam:110000114ec25fb', 'cupcake', 0),
	(21102, 'steam:110000114ec25fb', 'marijuana_cigarette', 0),
	(21103, 'steam:110000114ec25fb', 'spring', 0),
	(21104, 'steam:110000114ec25fb', 'leather', 0),
	(21105, 'steam:110000114ec25fb', 'binoculars', 0),
	(21106, 'steam:110000114ec25fb', 'sicklecrab', 0),
	(21107, 'steam:110000114ec25fb', 'pro_wood', 0),
	(21108, 'steam:110000114ec25fb', 'cheesebows', 0),
	(21109, 'steam:110000114ec25fb', 'glass', 0),
	(21110, 'steam:110000114ec25fb', 'worm', 0),
	(21111, 'steam:110000114ec25fb', 'lockpick', 0),
	(21112, 'steam:110000114ec25fb', 'sandwich', 0),
	(21113, 'steam:110000114ec25fb', 'petrol', 0),
	(21114, 'steam:110000114ec25fb', 'b_clar', 0),
	(21115, 'steam:110000114ec25fb', 'gazbottle', 0),
	(21116, 'steam:110000114ec25fb', 'wire', 0),
	(21117, 'steam:110000114ec25fb', 'turtle', 0),
	(21118, 'steam:110000114ec25fb', 'bong', 0),
	(21119, 'steam:110000114ec25fb', 'AED', 0),
	(21120, 'steam:110000114ec25fb', 'blowpipe', 0),
	(21121, 'steam:110000114ec25fb', 'a_clar', 0),
	(21122, 'steam:110000114ec25fb', 'cowpackage', 0),
	(21123, 'steam:110000114ec25fb', 'crab_a', 0),
	(21124, 'steam:110000114ec25fb', 'burrito', 0),
	(21125, 'steam:110000114ec25fb', 'hamajifish', 0),
	(21126, 'steam:110000114ec25fb', 'wool', 0),
	(21127, 'steam:110000114ec25fb', 'cashew', 0),
	(21128, 'steam:110000114ec25fb', 'gun_barrel', 0),
	(21129, 'steam:110000114ec25fb', 'vodka', 0),
	(21130, 'steam:110000114ec25fb', 'carokit', 0),
	(21131, 'steam:110000114ec25fb', 'carotool', 0),
	(21132, 'steam:110000114ec25fb', 'fixkit', 0),
	(21133, 'steam:110000114ec25fb', 'bolchips', 0),
	(21134, 'steam:110000114ec25fb', 'meat', 0),
	(21135, 'steam:110000114ec25fb', 'weapongrip', 0),
	(21136, 'steam:110000114ec25fb', 'phone', 0),
	(21137, 'steam:110000114ec25fb', 'sportlunch', 0),
	(21138, 'steam:110000114ec25fb', 'SteelScrap', 0),
	(21139, 'steam:110000114ec25fb', 'coffe', 0),
	(21140, 'steam:110000114ec25fb', 'turtlebait', 0),
	(21141, 'steam:110000114ec25fb', 'bcabbage', 0),
	(21142, 'steam:110000114ec25fb', 'acabbage', 0),
	(21143, 'steam:110000114ec25fb', 'sickle', 0),
	(21144, 'steam:110000114ec25fb', 'news_mic', 0),
	(21145, 'steam:110000114ec25fb', 'cow', 0),
	(21146, 'steam:110000114ec25fb', 'weed_pooch', 0),
	(21147, 'steam:110000114ec25fb', 'whisky', 0),
	(21148, 'steam:110000114ec25fb', 'iron', 0),
	(21149, 'steam:110000114ec25fb', 'shell', 0),
	(21150, 'steam:110000114ec25fb', 'drills', 0),
	(21151, 'steam:110000114ec25fb', 'lighter', 0),
	(21152, 'steam:110000114ec25fb', 'bag', 0),
	(21153, 'steam:110000114ec25fb', 'cannabis', 0),
	(21154, 'steam:110000114ec25fb', 'meat_w', 0),
	(21155, 'steam:110000114ec25fb', 'packaged_chicken', 0),
	(21156, 'steam:110000114ec25fb', 'lay_b', 0),
	(21157, 'steam:110000114ec25fb', 'washed_stone', 0),
	(21158, 'steam:110000114ec25fb', 'aluminium', 0),
	(21159, 'steam:110000114ec25fb', 'oxygen_mask', 0),
	(21160, 'steam:110000114ec25fb', 'rice', 0),
	(21161, 'steam:110000114ec25fb', 'honey_b', 0),
	(21162, 'steam:110000114ec25fb', 'donut1', 0),
	(21163, 'steam:110000114ec25fb', 'sand', 0),
	(21164, 'steam:110000114ec25fb', 'hatchet', 0),
	(21165, 'steam:110000114ec25fb', 'alive_chick', 0),
	(21166, 'steam:110000114ec25fb', 'orangewater_b', 0),
	(21167, 'steam:110000114ec25fb', 'alive_chicken', 0),
	(21168, 'steam:110000114ec25fb', 'ammo_pistol50', 0),
	(21169, 'steam:110000114ec25fb', 'orange_a', 0),
	(21170, 'steam:110000114ec25fb', 'poolreceipt', 0),
	(21171, 'steam:110000114ec25fb', 'rope', 0),
	(21172, 'steam:110000114ec25fb', 'knife', 0),
	(21173, 'steam:110000114ec25fb', 'blindfold', 0),
	(21174, 'steam:110000114ec25fb', 'hamburger', 0),
	(21175, 'steam:110000114ec25fb', 'fishingrod', 0),
	(21176, 'steam:110000114ec25fb', 'handcuffs_key', 0),
	(21177, 'steam:110000114ec25fb', 'chest_a', 0),
	(21178, 'steam:110000114ec25fb', 'coke', 0),
	(21179, 'steam:110000114ec25fb', 'ledeer', 0),
	(21180, 'steam:110000114ec25fb', 'magazine', 0),
	(21181, 'steam:110000114ec25fb', 'poteto', 0),
	(21182, 'steam:110000114ec25fb', '9mm_rounds', 0),
	(21183, 'steam:110000114ec25fb', 'donut2', 0),
	(21184, 'steam:110000114ec25fb', 'copper', 0),
	(21185, 'steam:110000114ec25fb', 'honey_a', 0),
	(21186, 'steam:110000114ec25fb', 'fabric', 0),
	(21187, 'steam:110000114ec25fb', 'pumkin_pro', 0),
	(21188, 'steam:110000114ec25fb', 'weaponskin', 0),
	(21189, 'steam:110000114ec25fb', 'welding_gun', 0),
	(21190, 'steam:110000114ec25fb', 'prawnbait', 0),
	(21191, 'steam:110000114ec25fb', 'wine', 0),
	(21192, 'steam:110000114ec25fb', 'c4_bank', 0),
	(21193, 'steam:110000114ec25fb', 'slaughtered_chicken', 0),
	(21194, 'steam:110000114ec25fb', 'squidbait', 0),
	(21195, 'steam:110000114ec25fb', 'crab', 0),
	(21196, 'steam:110000114ec25fb', 'car_keys', 0),
	(21197, 'steam:110000114ec25fb', 'milk', 0),
	(21198, 'steam:110000114ec25fb', 'grill', 0),
	(21199, 'steam:110000114ec25fb', 'bait', 0),
	(21200, 'steam:110000114ec25fb', 'squid', 0),
	(21201, 'steam:110000114ec25fb', 'wood', 0),
	(21202, 'steam:110000114ec25fb', 'table_saw', 0),
	(21203, 'steam:110000114ec25fb', 'deer', 0),
	(21204, 'steam:110000114ec25fb', 'shovel', 0),
	(21205, 'steam:110000114ec25fb', 'crabpack', 0),
	(21206, 'steam:110000114ec25fb', 'bottle', 0),
	(21207, 'steam:110000114ec25fb', 'steel_b', 0),
	(21208, 'steam:110000114ec25fb', 'news_cam', 0),
	(21209, 'steam:110000114ec25fb', 'bandage', 0),
	(21210, 'steam:110000114ec25fb', 'medikit', 0),
	(21211, 'steam:110000114ec25fb', 'icetea', 0),
	(21212, 'steam:110000114ec25fb', 'cutted_wood', 0),
	(21213, 'steam:110000114ec25fb', 'zap_oil', 0),
	(21214, 'steam:110000114ec25fb', 'lemonkey', 0),
	(21215, 'steam:110000114ec25fb', 'rice_pro', 0),
	(21216, 'steam:110000114ec25fb', 'cigarett', 0),
	(21217, 'steam:110000114ec25fb', 'bikersuit', 0),
	(21218, 'steam:110000114ec25fb', 'black_money', 0),
	(21219, 'steam:110000114ec25fb', 'diamond', 0),
	(21220, 'steam:110000114ec25fb', 'stone', 0),
	(21221, 'steam:110000114ec25fb', 'pumkin', 0),
	(21222, 'steam:110000114ec25fb', 'prawn', 0),
	(21223, 'steam:110000114ec25fb', 'function', 0),
	(21224, 'steam:110000114ec25fb', 'knife_handel', 0),
	(21225, 'steam:110000114ec25fb', 'beer', 0),
	(21226, 'steam:110000114ec25fb', 'chips', 0),
	(21227, 'steam:110000114ec25fb', 'gunpowder', 0),
	(21228, 'steam:110000114ec25fb', 'powerade', 0),
	(21229, 'steam:110000114ec25fb', 'candy', 0),
	(21230, 'steam:110000114ec25fb', 'bread', 0),
	(21231, 'steam:110000114ec25fb', 'petrol_raffin', 0),
	(21232, 'steam:110000114ec25fb', 'crab_pro', 0),
	(21233, 'steam:110000114ec25fb', 'packaged_plank', 0),
	(21234, 'steam:110000114ec25fb', 'essence', 0),
	(21235, 'steam:110000114ec25fb', 'monkey', 0),
	(21236, 'steam:110000114ec25fb', 'handcuffs', 0),
	(21237, 'steam:110000114ec25fb', 'clip', 0),
	(21238, 'steam:110000114ec25fb', 'shark', 0),
	(21239, 'steam:110000114ec25fb', 'news_bmic', 0),
	(21240, 'steam:110000114ec25fb', 'water', 0),
	(21241, 'steam:110000114ec25fb', 'cockles', 0),
	(21242, 'steam:110000114ec25fb', 'nots', 0),
	(21243, 'steam:110000114ec25fb', 'saltpeter', 0),
	(21244, 'steam:110000114ec25fb', 'meth', 0),
	(21245, 'steam:110000114ec25fb', 'meth_pooch', 0),
	(21246, 'steam:110000114ec25fb', 'tequila', 0),
	(21247, 'steam:110000114ec25fb', 'gym_membership', 0),
	(21248, 'steam:110000114ec25fb', 'steel_bar', 0),
	(21249, 'steam:110000114ec25fb', 'broken_gun', 0),
	(21250, 'steam:110000114ec25fb', 'fishbait', 0),
	(21251, 'steam:110000114ec25fb', 'meatfood', 0),
	(21252, 'steam:110000114ec25fb', 'WEAPON_BAT', 0),
	(21253, 'steam:110000114ec25fb', 'chocolate', 0),
	(21254, 'steam:110000114ec25fb', 'hatchet_lj', 0),
	(21255, 'steam:110000114ec25fb', 'Scrap_a', 0),
	(21256, 'steam:110000114ec25fb', 'armor', 0),
	(21257, 'steam:110000114ec25fb', 'fixtool', 0),
	(21258, 'steam:110000114ec25fb', 'Gears', 0),
	(21259, 'steam:110000114ec25fb', 'gold', 0),
	(21260, 'steam:110000114ec25fb', 'croquettes', 0),
	(21261, 'steam:110000114ec25fb', 'fish', 0),
	(21262, 'steam:110000114ec25fb', 'keyhouse', 0),
	(21263, 'steam:110000114ec25fb', 'coke_pooch', 0),
	(21264, 'steam:11000013d499d1e', 'c4_bank', 0),
	(21265, 'steam:11000013d499d1e', 'donut2', 0),
	(21266, 'steam:11000013d499d1e', 'gun_barrel', 0),
	(21267, 'steam:11000013d499d1e', 'keyhouse', 0),
	(21268, 'steam:11000013d499d1e', 'gunpowder', 0),
	(21269, 'steam:11000013d499d1e', 'broken_gun', 0),
	(21270, 'steam:11000013d499d1e', 'zap_oil', 0),
	(21271, 'steam:11000013d499d1e', 'news_bmic', 0),
	(21272, 'steam:11000013d499d1e', 'knife_handel', 0),
	(21273, 'steam:11000013d499d1e', 'aluminium', 0),
	(21274, 'steam:11000013d499d1e', 'news_cam', 0),
	(21275, 'steam:11000013d499d1e', 'table_saw', 0),
	(21276, 'steam:11000013d499d1e', 'steel_bar', 0),
	(21277, 'steam:11000013d499d1e', 'meatfood', 0),
	(21278, 'steam:11000013d499d1e', 'armor', 0),
	(21279, 'steam:11000013d499d1e', 'candy', 0),
	(21280, 'steam:11000013d499d1e', 'bikersuit', 0),
	(21281, 'steam:11000013d499d1e', 'grill', 0),
	(21282, 'steam:11000013d499d1e', 'leather_gun', 0),
	(21283, 'steam:11000013d499d1e', 'a_clar', 0),
	(21284, 'steam:11000013d499d1e', 'spring', 0),
	(21285, 'steam:11000013d499d1e', 'wire', 0),
	(21286, 'steam:11000013d499d1e', 'handcuffs_key', 0),
	(21287, 'steam:11000013d499d1e', 'saltpeter', 0),
	(21288, 'steam:11000013d499d1e', 'ammo_pistol', 0),
	(21289, 'steam:11000013d499d1e', 'b_clar', 0),
	(21290, 'steam:11000013d499d1e', 'magazine', 0),
	(21291, 'steam:11000013d499d1e', 'WEAPON_BAT', 0),
	(21292, 'steam:11000013d499d1e', 'nots', 0),
	(21293, 'steam:11000013d499d1e', 'ammo_pistol50', 0),
	(21294, 'steam:11000013d499d1e', 'donut1', 0),
	(21295, 'steam:11000013d499d1e', 'news_mic', 0),
	(21296, 'steam:11000013d499d1e', 'burrito', 0),
	(21297, 'steam:11000013d499d1e', 'radio', 0),
	(21298, 'steam:11000013dfc8aed', 'radio', 1),
	(21299, 'steam:11000013dfc8aed', 'anesthetic1', 0),
	(21300, 'steam:11000013dfc8aed', 'copper_bar', 0),
	(21301, 'steam:11000013dfc8aed', 'anesthetic2', 0),
	(21302, 'steam:11000013dfc8aed', 'iron_gun', 0),
	(21303, 'steam:11000013dfc8aed', 'milk_package', 0),
	(21304, 'steam:11000013dfc8aed', 'catfishfood', 0),
	(21305, 'steam:11000013dfc8aed', 'catfish', 0),
	(21306, 'steam:11000013dfc8aed', 'metal_scrap', 0),
	(21307, 'steam:11000013dfc8aed', 'milk_engine', 0),
	(21308, 'steam:11000013dfc8aed', 'paper_bag', 0),
	(21309, 'steam:11000013dfc8aed', 'org_a', 0),
	(21310, 'steam:11000013dfc8aed', 'gold_t', 0),
	(21311, 'steam:11000013dfc8aed', 'mushroom', 0),
	(21312, 'steam:11000013dfc8aed', 'mushroom_d', 0),
	(21313, 'steam:11000013dfc8aed', 'gold_o', 4),
	(21314, 'steam:11000013dfc8aed', 'mushroom_p', 0),
	(21315, 'steam:11000013dfc8aed', 'wale', 1);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_licenses: ~16 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(218, 'dmv', 'steam:11000011b44055b'),
	(219, 'drive', 'steam:11000011b44055b'),
	(220, 'dmv', 'steam:110000116e3c6b0'),
	(221, 'drive', 'steam:110000116e3c6b0'),
	(222, 'dmv', 'steam:11000010e4093d5'),
	(223, 'drive', 'steam:11000010e4093d5'),
	(224, 'dmv', 'steam:1100001352d04d1'),
	(225, 'drive', 'steam:1100001352d04d1'),
	(226, 'dmv', 'steam:11000010480fe75'),
	(227, 'drive', 'steam:11000010480fe75'),
	(228, 'dmv', 'steam:11000010b3f3065'),
	(229, 'drive', 'steam:11000010b3f3065'),
	(230, 'drive_bike', 'steam:11000010b3f3065'),
	(231, 'drive', 'steam:11000013d499d1e'),
	(232, 'drive', 'steam:1100001074479bd'),
	(234, 'weapon', 'steam:11000013d499d1e'),
	(235, 'dmv', 'steam:11000013cd0f06b'),
	(236, 'drive', 'steam:11000013cd0f06b'),
	(237, 'dmv', 'steam:110000110da5ab4'),
	(238, 'drive', 'steam:110000110da5ab4'),
	(239, 'drive', 'steam:11000013dfc8aed'),
	(240, 'weapon', 'steam:11000013dfc8aed');
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_whitelist
CREATE TABLE IF NOT EXISTS `user_whitelist` (
  `identifier` varchar(255) NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.user_whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_whitelist` DISABLE KEYS */;
INSERT INTO `user_whitelist` (`identifier`, `whitelisted`) VALUES
	('steam:11000011b44055b', 1);
/*!40000 ALTER TABLE `user_whitelist` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.vehicles: ~103 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('16challenger', '16CHALLENGER', 1599000, 'mnsports'),
	('BMW M760 I', '17m760i', 185000, 'mnsedans'),
	('2018LamborghiniHuracanPerformante', '18performante', 9999999, 'mnsuper'),
	('BugattiChiron', '2017chiron', 1500000, 'mnsuper'),
	('Nissan 370Z Nismo Z34', '370Z', 1200000, 'mnsuper'),
	('Honda CRF 450 Turbo Motard', '450crf', 149000, 'mnmotors'),
	('Ford GT 350R', '66fastback', 230000, 'mnmuscle'),
	('Mcralen', '720s', 9999999, 'zeventz'),
	('Porsche 911 Turbo S 2016', '911TURBOS', 1800000, 'mnsuper'),
	('Audi A8 FSI 2010', 'A8FSI', 150000, 'mnsedans'),
	('Lada OKA', 'AOKA', 40000, 'mncompacts'),
	('APERTA', 'APERTA', 9999999, 'mnnew'),
	('Audi RS6 TK', 'AUDIRS6TK', 2300000, 'mnnew'),
	('BC', 'BC', 9999999, 'mnnew'),
	('BBTWNTYBF Benito', 'BFbenito', 40000, 'mncompacts'),
	('Ferrari 250GT California Spyder', 'CALI57', 2200000, 'mncompacts'),
	('Toyota Camry 2016', 'CAMRY55', 60000, 'mncompacts'),
	('Honda Civic AlperB', 'CIVIC', 56000, 'mncompacts'),
	('MercedesBenz CLS 2015', 'CLS2015', 230000, 'mnsedans'),
	('Bentley Continental GT SS 2018', 'CONTSS18', 1500000, 'mnsports'),
	('Chevrolet', 'COUNTRY', 389000, 'mncarmod'),
	('Mercedes Benz G65 AMG', 'G65AMG', 189000, 'mnsuvs'),
	('Bravado Gauntlet Classic', 'GAUNTLETC', 250000, 'mnmuscle'),
	('Hummer H2', 'H2M', 489000, 'mnsuvs'),
	('Huracan Spyder', 'HURAPERFOSPY', 2300000, 'mnsuper'),
	('LP670', 'LP670', 9999999, 'mnnew'),
	('LWHURACAN', 'LWHURACAN', 9999999, 'mnnew'),
	('BMW M346', 'M346', 9999999, 'mncarmod'),
	('BMW E30 M3', 'M3E30', 45000, 'mncompacts'),
	('BMWM3E46RB', 'M3KEAN', 165000, 'mncarmod'),
	('MercedesBenz S63AMG Cabriolet', 'MERS63C', 320000, 'mnsedans'),
	('lancer-evolution', 'MLEC', 369000, 'mncarmod'),
	('M-Slaz', 'MSLAZ', 112500, 'mnmotors'),
	('Mvi siongt', 'MVISIONGT', 250000, 'mnnew'),
	('McLarenP1', 'P1', 1609000, 'mnsuper'),
	('Agera One HQ Vans123', 'RAPTOR', 15000, 'mnmotors'),
	('Ford Velociraptor 6x6 2018', 'RAPTOR2017', 120000, 'mnoffroad'),
	('Vapid Razor', 'RAZOR', 210000, 'mnmuscle'),
	('RCF', 'RCF', 9999999, 'mnnew'),
	('Audi RS3 Sportback 2018', 'RS318', 454900, 'mnnew'),
	('aprilia-rsv4', 'RSV4', 150000, 'mnmotors'),
	('BBTWNTY Blade Retro Custom', 'RTROBLADE', 200000, 'mnmuscle'),
	('MazdaRX3', 'RX3', 290000, 'mncompacts'),
	('Mazda RX7 Tunable', 'RX7TUNABLE', 329000, 'mncompacts'),
	('Mazda RX8 Spirit R 2012', 'RX8R', 228900, 'mnsedans'),
	('MercedesBenz S500 W222', 'S500W222', 205000, 'mnsedans'),
	('ChevroletSilvDonk', 'SILV86', 110000, 'mnsuvs'),
	('Nissan Skyline', 'SKYLINE', 180000, 'mnsedans'),
	('Nissan Skyline R34', 'SKYLINE1', 1490000, 'mnsuper'),
	('Audi TTS Coupe 2007', 'TTS07', 159000, 'mnsports'),
	('henessey', 'XNSGT', 9999999, 'zeventz'),
	('Honda S2000 AP2', 'ap2', 69000, 'mncompacts'),
	('AstonMartin Vanquish 2013', 'ast', 490000, 'mnsuper'),
	('Bison', 'bison', 100000, 'mnvans'),
	('BMW E36', 'bmwe36', 30000, 'mncompacts'),
	('BMWS 1000RR 2014', 'bmws', 229000, 'mnmotors'),
	('2019 BMWZ4 M40i', 'bmwz4', 349900, 'mnsports'),
	('BMX', 'bmx', 1000, 'mnmotors'),
	('Honda CBR 1000RR 2014', 'cbrr', 220000, 'mnmotors'),
	('MINI John Cooper Works', 'cooperworks', 60000, 'mncompacts'),
	('Ducati1199', 'd99', 259000, 'mnmotors'),
	('Devel Six', 'develSix', 9999999, 'mnnew'),
	('1995BMWM5E34', 'e34', 30000, 'mncompacts'),
	('Eleanor', 'eleanor', 1239000, 'mnmuscle'),
	('Ford F150 SVT Raptor R', 'f150', 175000, 'mnoffroad'),
	('Ford F150 XLT 1978', 'f15078', 40000, 'mnoffroad'),
	('Faggio', 'faggio', 10000, 'mnmotors'),
	('Vaspa', 'faggio2', 10000, 'mnmotors'),
	('Honda NSX', 'filthynsx', 9999999, 'zeventz'),
	('Fixter', 'fixter', 1000, 'mnmotors'),
	('SuzukiGSXR1000 2014', 'gsxr', 290000, 'mnmotors'),
	('FordMustangGT500NFS', 'gt500', 389000, 'mnmuscle'),
	('NissanGTR', 'gtr', 1490000, 'mnsports'),
	('Plymouth GTX 1971', 'gtx', 270000, 'mnmuscle'),
	('SuzukiHayabusaGSX13002015', 'hayabusa', 125000, 'mnmotors'),
	('BMW I8 2015', 'i8', 890000, 'mnsuper'),
	('KSR', 'ksr', 55600, 'mnmotors'),
	('Kuruma', 'kuruma', 190000, 'mnsports'),
	('BMW M2 F22', 'm2f22', 256000, 'mnsedans'),
	('BMW M3 GTR', 'm3gtr', 1295000, 'mncarmod'),
	('TheMothership', 'mothership', 250000, 'mnvans'),
	('Moto Compo', 'motoc', 3000, 'mnmotors'),
	('Mazda MX-5 Miata', 'mx5mt', 890000, 'mncompacts'),
	('Kawasaki Ninja 2', 'nh2r', 179000, 'mnmotors'),
	('nissantitan', 'nissantitan17', 390000, 'mnoffroad'),
	('P1 GTR', 'p1gtr', 9999999, 'mnnew'),
	('PCX', 'pcx', 83300, 'mnmotors'),
	('Yamaha YZF R1', 'r1', 289000, 'mnmotors'),
	('Yamaha R25 2019', 'r25', 196000, 'mnmotors'),
	('Nissan GTR R35 LibertyWalk', 'r35lw', 9999999, 'zeventz'),
	('Yamaha YZF R6 2017', 'r6', 149000, 'mnmotors'),
	('Audi R8 v10', 'r8prior', 830000, 'mnsuper'),
	('aventador', 'rmodlp750', 9999999, 'zeventz'),
	('S15 Rocket Bunny', 'rocketbunny', 9999999, 'zeventz'),
	('Western Motorcycle Company Slave', 'slave', 233000, 'mnmotors'),
	('Supra', 'supra2', 9999999, 'zeventz'),
	('Tri Bike', 'tribike3', 1000, 'mnmotors'),
	('msx', 'vader', 60000, 'mnmotors'),
	('Yamaha Raptor 700R', 'ymhdkr700', 169000, 'mnmotors'),
	('Yamaha YZ 450 F', 'yz450f', 142500, 'mnmotors'),
	('Kawasaki Z1000', 'z1000', 222000, 'mnmotors'),
	('Chevrolet Camaro Zl 2017', 'zl12017', 1250000, 'mnsports'),
	('KawasakiNinjaZX10R', 'zx10', 185000, 'mnmotors');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicles_for_sale
CREATE TABLE IF NOT EXISTS `vehicles_for_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) NOT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.vehicles_for_sale: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicles_for_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles_for_sale` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.vehicle_categories: ~10 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('mncarmod', 'MN Carmod'),
	('mncompacts', 'MN Compacts'),
	('mnmotors', 'MN Motos'),
	('mnmuscle', 'MN Muscle'),
	('mnnew', 'MN NEW'),
	('mnoffroad', 'MN Offroad'),
	('mnsedans', 'MN Sedans'),
	('mnsports', 'MN Sports'),
	('mnsuper', 'MN Super'),
	('mnsuvs', 'MN Suvs'),
	('mnvans', 'MN Vans'),
	('zeventz', 'z Event z');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table essentialmode.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.weashops: ~1 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'BlackWeashop', 'WEAPON_PISTOL50', 30000);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
