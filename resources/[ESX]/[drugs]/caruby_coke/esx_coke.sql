USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('coke', 'Cocaine', 40, 0, 1),
	('coke_pooch', 'Coke Pooch', 16, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('coke_processing', 'Coke Processing License')
;