extends "res://Weapons/Weapon.gd"
	
func FireWeapon():
	AddProjectile(get_parent().position + Vector2(-1,-1))
	AddProjectile(get_parent().position + Vector2(1,-1))
	AddProjectile(get_parent().position + Vector2(-1,1))
	AddProjectile(get_parent().position + Vector2(1, 1))
