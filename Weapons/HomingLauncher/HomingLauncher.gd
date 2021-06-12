extends "res://Weapons/Weapon.gd"

export var homingPower = 1

func FireWeapon():
	AddProjectile(get_parent().position + Vector2(-1,-1))
	AddProjectile(get_parent().position + Vector2(1,-1))
	AddProjectile(get_parent().position + Vector2(-1,1))
	AddProjectile(get_parent().position + Vector2(1, 1))

func AddProjectile(targetPos):
	var proj = .AddProjectile(targetPos)
	proj.homingPower = homingPower
	proj.homingTarget = get_viewport().get_mouse_position()
