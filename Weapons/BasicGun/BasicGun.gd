extends Node2D

export var projectileSpeed = 30;
export(PackedScene) var projectileScene;

var maxFireDelay = 0.1 # delay between shots, in seconds
var cFireDelay = maxFireDelay

func _ready():
	pass # Replace with function body.

func _process(delta):
	cFireDelay -= delta;
	if (cFireDelay <= 0):
		FireProjectile();
		cFireDelay = maxFireDelay;
	
func FireProjectile():
	var proj = projectileScene.instance();
	get_node("/root").add_child(proj);
	proj.position = get_node("..").get_position();
	proj.speed = projectileSpeed;
	proj.direction = proj.position.direction_to(get_viewport().get_mouse_position());
	pass
