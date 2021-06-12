extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed;
var direction = Vector2();

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if direction .length() > 0:
		direction  = direction .normalized() * speed
	move_and_collide(direction * delta * speed);


func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
