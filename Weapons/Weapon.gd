extends Node2D

export var damage = 1
export var fireDelay = 0.2
export var projectileSpeed = 750
export(PackedScene) var projectileScene

var cFireDelay = fireDelay

func _process(delta):
	cFireDelay -= delta;
	if (cFireDelay <= 0):
		FireWeapon();
		cFireDelay = fireDelay;
		
func FireWeapon():
	pass;

func AddProjectile(target):
	var proj = projectileScene.instance();
	get_node("/root").add_child(proj);
	proj.position = get_parent().get_position();
	proj.speed = projectileSpeed;
	proj.direction = proj.position.direction_to(target);
	proj.damage = damage
	return proj;
