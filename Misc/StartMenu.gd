extends Control

func _ready():
	var view_size := get_viewport().size
	var hbox = $HBoxContainer
	var vbox = $HBoxContainer/VBoxContainer
	self.rect_size = view_size
	hbox.rect_size = view_size
	vbox.rect_size = view_size

	var button: Button = $HBoxContainer/VBoxContainer/Button
	var main = get_parent()
	main.will_change_scene(button, "pressed", main.BasicLevel)
