extends Node

class SideData:
	var begin: Vector2
	var end: Vector2
	var offset: Vector2

	func _init(begin_: Vector2, end_: Vector2, offset_: Vector2):
		begin = begin_
		end = end_
		offset = offset_

const Grunt = preload("res://Enemy/Grunt.tscn")

var rng := RandomNumberGenerator.new()

onready var grunt_count := 0
onready var view_size: Vector2 = get_viewport().size
onready var sides := [
	SideData.new(Vector2(), Vector2(view_size.x, 0), Vector2(-1, 0)),
	SideData.new(Vector2(view_size.x, 0), view_size, Vector2(0, 1)),
	SideData.new(view_size, Vector2(0, view_size.y), Vector2(1, 0)),
	SideData.new(Vector2(0, view_size.y), Vector2(), Vector2(0, -1))
]

func _ready():
	rng.randomize()

func register_grunt(grunt):
	grunt_count += 1
	grunt.connect("out_of_health", self, "_on_grunt_count",
			[], CONNECT_ONESHOT)

func _on_grunt_decrement():
	grunt_count -= 1

func get_random_spawn_point(distance: float = 0) -> Vector2:
	var side_index: int = rng.randi_range(0, 3)
	var side: SideData = sides[side_index]
	return (distance * side.offset) + Vector2(
			rng.randf_range(side.begin.x, side.end.x),
			rng.randf_range(side.begin.y, side.end.y))

# This is also "level" code.
func _on_Timer_timeout():
	var grunt := Grunt.instance()
	grunt.position = get_random_spawn_point(16)
	get_parent().add_child(grunt)
	register_grunt(grunt)
