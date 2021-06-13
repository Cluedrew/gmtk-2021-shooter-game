extends Area2D


# Declare member variables here. Examples:
onready var speed = 400
export var health = 5

signal out_of_health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized()
	position += velocity * delta * speed


func _on_Player_area_entered(area):
	area.apply_damage(100)
	health -= 1
	if (health <= 0):
		emit_signal("out_of_health")
