extends Node2D

export var damage = 1
export var projectileSpeed = 750
export(PackedScene) var projectileScene

var fireDelay = 9999
var cFireDelay = fireDelay
onready var frameCount = $AnimatedSprite.frames.get_frame_count("default")
var enemyType = 0

func _ready():
	get_node("/root/Node2D/Node").connect("enemy_counts_changed",self,"UpdateParamsFromEnemyCount")

func _process(delta):
	cFireDelay -= delta
	if (cFireDelay <= 0):
		FireWeapon();
		cFireDelay = fireDelay;
		
	var chargePercentage = 1 - (cFireDelay / fireDelay)
	$AnimatedSprite.frame = floor(chargePercentage * frameCount)
	
		
func FireWeapon():
	pass;
	
func UpdateParamsFromEnemyCount(enemyCounts):
	pass;

func AddProjectile(target):
	var proj = projectileScene.instance();
	get_node("/root").add_child(proj);
	proj.position = get_parent().get_position();
	proj.speed = projectileSpeed;
	proj.direction = proj.position.direction_to(target);
	proj.damage = damage
	return proj;
