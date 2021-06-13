extends AnimatedSprite

func _on_ExplosionEffect_animation_finished():
	queue_free()
