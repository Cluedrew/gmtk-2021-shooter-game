extends "res://Weapons/Weapon.gd"
	
func FireWeapon():
	AddProjectile(get_viewport().get_mouse_position())
