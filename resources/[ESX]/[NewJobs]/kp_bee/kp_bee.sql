USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('honey_a', 'Honey Pest', -1, 0, 1),
	('honey_b', 'Honey Bottle', -1, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('bee_processing', 'Bee Processing License')
;