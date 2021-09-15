USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('pineapple_a', 'สับปะรด', -1, 0, 1),
	('pineapple_b', 'สับปะรดอบแห้ง', -1, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('pineapple_processing', 'Pineapple Processing License')
;