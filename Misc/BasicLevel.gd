extends Node2D

const GameOver = preload("res://Misc/GameOver.tscn")

func _ready():
	var parent = get_parent()
	var player = $Player
	var err = player.connect("out_of_health", parent, "change_scene",
			[GameOver])
	if OK != err:
		print("connect failed: ", err)
