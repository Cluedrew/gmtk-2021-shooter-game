extends "res://Weapons/Weapon.gd"

func UpdateParamsFromEnemyCount(enemyCounts):
	var enemyCount = enemyCounts[0]
	if (enemyCount <= 0):
		fireDelay = 99999
		cFireDelay = 99999
	else:
		fireDelay = fireDelayMult * 1.0 / (enemyCount)
		cFireDelay = min(cFireDelay,fireDelay)
	pass;

func FireWeapon():
	AddProjectile(get_viewport().get_mouse_position())
