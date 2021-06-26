extends Area2D


# Declare member variables here. Examples:
onready var speed = 400
export var max_health = 5
var health = max_health
var invincible = false
var isFlashingWhite = false

onready var screensize = get_viewport_rect().size
onready var collision_node = $CollisionShape2D
onready var sprite_node = $AnimatedSprite

signal out_of_health

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Main/Level").set_player_heath(health,max_health)

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
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if (isFlashingWhite && invincible):
		sprite_node.modulate = Color(1,1,1,0)
	else:
		sprite_node.modulate = Color(1,1,1,1)


func _on_Player_area_entered(area):
	if (!invincible):
		area.apply_damage(10)
		health -= 1
		get_node("/root/Main/Level").set_player_heath(health,max_health)
		if (health <= 0):
			emit_signal("out_of_health")
		else:
			collision_node.set_deferred("disabled", true)
			invincible = true
			$InvincibleTimer.start()


func _on_FlashTimer_timeout():
	isFlashingWhite = !isFlashingWhite


func _on_InvincibleTimer_timeout():
	collision_node.set_deferred("disabled", false)
	invincible = false
