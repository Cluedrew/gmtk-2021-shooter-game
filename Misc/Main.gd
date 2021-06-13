extends Node
# Top level manager for the current scene.

const StartMenu = preload("res://Misc/StartMenu.tscn")

func _ready():
	add_child(StartMenu.instance())
