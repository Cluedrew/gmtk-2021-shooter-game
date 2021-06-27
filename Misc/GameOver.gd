extends Control

func _ready():
	var view_size := get_viewport().size
	var hbox = $HBox
	var vbox = $HBox/VBox
	self.rect_size = view_size
	hbox.rect_size = view_size
	vbox.rect_size = view_size

	var again = $HBox/VBox/Again
	var start = $HBox/VBox/StartMenu
	var parent = get_parent()
	parent.will_change_scene(again, "pressed", parent.BasicLevel)
	parent.will_change_scene(start, "pressed", parent.StartMenu)
