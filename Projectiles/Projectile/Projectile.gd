extends Area2D

export(PackedScene) var explosionScene
export var explosionAnimName = "default"
var speed;
var direction = Vector2();
var damage;
var homingPower = 1;
var homingTarget;

var homingPowerMult = 0.02

func _ready():
	$AnimatedSprite.playing = true

func _process(delta):
	if direction.length() > 0:
		direction = direction.normalized()
		if homingTarget:
			var targetDirection = (homingTarget - position).normalized()
			direction = direction.rotated(direction.angle_to(targetDirection) * homingPower * homingPowerMult);
			homingPower -= delta
		position += direction * delta * speed;
		
	rotation = direction.angle() + deg2rad(90)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
	pass


func _on_Projectile_area_entered(area):
	area.apply_damage(damage)
	var expl = explosionScene.instance()
	expl.position = position
	get_node("/root").add_child(expl)
	expl.play(explosionAnimName)
	queue_free()
	pass
