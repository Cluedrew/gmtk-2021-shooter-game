extends Node

onready var grunt_count = 0

func register_grunt(grunt):
	grunt_count += 1
	grunt.connect("out_of_health", self, "_on_grunt_count",
			[], CONNECT_ONESHOT)

func _on_grunt_decrement():
	grunt_count -= 1
