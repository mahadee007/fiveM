INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('oxygen_mask', 'Oxygen Mask', 1, 0, 1),
	('clip', 'Weapon Clip', -1, 0, 1),
	('weaponskin', 'Weapon Skin', -1, 0, 1),
	('weapongrip', 'Weapon Grip', -1, 0, 1),
	('weaponflashlight', 'Weapon Flashlight', -1, 0, 1)

;

INSERT INTO `shops` (store, item, price) VALUES
	('pillbox', 'oxygen_mask', 500),
	('weaponacc', 'clip', 1500),
	('weaponacc', 'weaponflashlight', 700),
	('weaponacc', 'weapongrip', 700),
	('weaponacc', 'weaponskin', 1700)
;