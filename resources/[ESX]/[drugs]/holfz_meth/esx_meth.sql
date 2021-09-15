USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('meth', 'Meth', 40, 0, 1),
	('meth_pooch', 'Meth Pooch', 16, 0, 1)
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('meth_processing', 'Meth Processing License')
;