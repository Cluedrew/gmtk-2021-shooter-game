extends KinematicBody2D

var speed;
var direction = Vector2();

func _process(delta):
	if direction .length() > 0:
		direction  = direction .normalized() * speed
	move_and_collide(direction * delta * speed);


func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
