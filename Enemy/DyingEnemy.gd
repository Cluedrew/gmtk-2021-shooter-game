extends Area2D

func _init():
	collision_layer = 0
	collision_mask = 0
	var sprite: AnimatedSprite = $AnimatedSprite
	sprite.modulate = Color(0.5, 0, 0)
	start_timer()

func start_timer():
	var timer = Timer.new()
	add_child(timer)
	var err = timer.connect("timeout", self, "_on_Timer_timeout")
	if err != OK:
		print("connect failed ", err)
	timer.start(0.2)

func _on_Timer_timeout():
	queue_free()
