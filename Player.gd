extends Area2D


# Declare member variables here. Examples:
onready var speed = 400
export var health = 5
var invincible = false
var isFlashingWhite = false

onready var screensize = get_viewport_rect().size

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
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if (isFlashingWhite && invincible):
		 $AnimatedSprite.modulate = Color(1,1,1,0)
	else:
		$AnimatedSprite.modulate = Color(1,1,1,1)


func _on_Player_area_entered(area):
	if (!invincible):
		area.apply_damage(100)
		health -= 1
		if (health <= 0):
			emit_signal("out_of_health")
		else:
			$CollisionShape2D.set_disabled(true)
			invincible = true
			$InvincibleTimer.start()
		

func _on_FlashTimer_timeout():
	isFlashingWhite = !isFlashingWhite
	

func _on_InvincibleTimer_timeout():
	$CollisionShape2D.set_disabled(false)
	invincible = false
