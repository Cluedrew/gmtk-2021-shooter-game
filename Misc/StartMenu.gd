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
	var err = button.connect("pressed", main, "begin_level")
	if err != OK:
		print("connect Start Game button: ", err)
