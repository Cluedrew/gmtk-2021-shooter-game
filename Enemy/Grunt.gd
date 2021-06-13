extends "res://Enemy/Enemy.gd"

func _process(delta):
	face_player()
	move_toward_player(delta)
