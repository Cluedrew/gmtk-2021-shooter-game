extends Area2D

onready var speed: float = 100
onready var player: Area2D = get_player()

func _ready():
	pass

func _process(delta: float):
	var velocity: Vector2 = position.direction_to(player.position)
	position += velocity * delta * speed

func get_player():
	# Brittle, must be a sibling of the Player.
	return get_node("../Player")