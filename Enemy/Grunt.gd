extends Area2D

onready var speed: float = 100
onready var player: Area2D = get_player()
var max_health = 10
onready var cur_health = max_health

signal out_of_health

func _process(delta: float):
	var velocity: Vector2 = position.direction_to(player.position)
	position += velocity * delta * speed
	rotation = (position - player.position).angle() + deg2rad(-90)

func get_player():
	# Brittle, must be a sibling of the Player.
	return get_node("../Player")

func apply_damage(damage: int):
	cur_health -= clamp(0, damage, max_health)
	if 0 == cur_health:
		emit_signal("out_of_health")
		set_script(preload("res://Enemy/DyingEnemy.gd"))
