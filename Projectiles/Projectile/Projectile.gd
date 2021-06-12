extends Area2D

var speed;
var direction = Vector2();
var damage;

func _ready():
	$AnimatedSprite.playing = true

func _process(delta):
	if direction.length() > 0:
		direction = direction.normalized()
		position += direction * delta * speed


func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
	pass


func _on_Projectile_area_entered(area):
	area.apply_damage(damage)
	queue_free()
	pass
