extends Node
# Top level manager for the current scene.

const StartMenu = preload("res://Misc/StartMenu.tscn")
const BasicLevel = preload("res://Misc/BasicLevel.tscn")

func _ready():
	add_child(StartMenu.instance())

func begin_level():
	remove_child(get_child(0))
	add_child(BasicLevel.instance())
