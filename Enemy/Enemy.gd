class_name Enemy
extends Area2D

export var speed: float = 100
onready var player: Area2D = get_player()
export var max_health = 10
onready var cur_health = max_health

const explosionScene = preload("res://AnimatedEffects/ShipExplosion.tscn")

signal out_of_health

func move_toward_player(delta,speedMult=1):
	var velocity: Vector2 = position.direction_to(player.position)
	position += velocity * delta * speed * speedMult
	
func face_player():
	rotation = (position - player.position).angle() + deg2rad(-90)

func get_player():
	# Brittle, must be a sibling of the Player.
	return get_node("../Player")

func apply_damage(damage: int):
	cur_health -= clamp(damage, 0, cur_health)
	if 0 == cur_health:
		emit_signal("out_of_health")
		var expl := explosionScene.instance()
		expl.position = position
		get_node("/root").add_child(expl)
		expl.play("default")
		set_script(preload("res://Enemy/DyingEnemy.gd"))
