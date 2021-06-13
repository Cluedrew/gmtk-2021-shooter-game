extends "res://Weapons/Weapon.gd"

func UpdateParamsFromEnemyCount(enemyCounts):
	var enemyCount = enemyCounts[0]
	UpdateFireRateFromEnemyCount(enemyCount)

func FireWeapon():
	AddProjectile(get_viewport().get_mouse_position())
