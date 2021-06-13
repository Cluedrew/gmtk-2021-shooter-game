extends Node
# Top level manager for the current scene.

const StartMenu = preload("res://Misc/StartMenu.tscn")
const BasicLevel = preload("res://Misc/BasicLevel.tscn")

var scene

func _ready():
	scene = StartMenu.instance()
	add_child(scene)

func begin_level():
	change_scene(BasicLevel)

func change_scene(new_scene: PackedScene):
	if null == new_scene:
		print("change_scene, not a PackedScene.")
	else:
		scene.queue_free()
		scene = new_scene.instance()
		add_child(scene)

func connect_to_change_scene(
		source: Object, signal_name: String, new_scene: PackedScene):
	var err := source.connect(signal_name, self, "change_scene",
			[new_scene], CONNECT_ONESHOT)
	if OK != err:
		print("connect_to_change_scene failed: ", err)
	return err
