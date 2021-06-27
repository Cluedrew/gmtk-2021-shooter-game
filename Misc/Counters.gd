extends Node

signal enemy_counts_changed(counts)

class SideData:
	var begin: Vector2
	var end: Vector2
	var offset: Vector2

	func _init(begin_: Vector2, end_: Vector2, offset_: Vector2):
		begin = begin_
		end = end_
		offset = offset_

enum EnemyIds {
	GRUNT,
	CHARGER,
}

const Grunt = preload("res://Enemy/Grunt.tscn")
const Charger = preload("res://Enemy/Charger.tscn")

var rng := RandomNumberGenerator.new()
var enemy_counts := [0, 0]

onready var view_size: Vector2 = get_viewport().size
onready var sides := [
	SideData.new(Vector2(), Vector2(view_size.x, 0), Vector2(-1, 0)),
	SideData.new(Vector2(view_size.x, 0), view_size, Vector2(0, 1)),
	SideData.new(view_size, Vector2(0, view_size.y), Vector2(1, 0)),
	SideData.new(Vector2(0, view_size.y), Vector2(), Vector2(0, -1))
]

func _ready():
	rng.randomize()

func register_enemy(enemy: Enemy, id: int):
	if EnemyIds.CHARGER < id:
		print("register_enemy: out of range: ", id)
		return
	enemy_counts[id] += 1
	var err := enemy.connect("out_of_health",
			self, "_on_enemy_out_of_health", [id], CONNECT_ONESHOT)
	if OK != err:
		print("register_enemy: connect failed: ", err)
		return
	emit_signal("enemy_counts_changed", enemy_counts.duplicate())

func get_random_spawn_point(distance: float = 0) -> Vector2:
	var side_index: int = rng.randi_range(0, 3)
	var side: SideData = sides[side_index]
	return (distance * side.offset) + Vector2(
			rng.randf_range(side.begin.x, side.end.x),
			rng.randf_range(side.begin.y, side.end.y))

func _on_enemy_out_of_health(id: int):
	enemy_counts[id] -= 1
	emit_signal("enemy_counts_changed", enemy_counts.duplicate())

# This is also "level" code.
func _on_Timer_timeout():
	var grunt := Grunt.instance()
	grunt.position = get_random_spawn_point(16)
	get_parent().add_child(grunt)
	register_enemy(grunt, EnemyIds.GRUNT)

func _on_Timer2_timeout():
	var charger := Charger.instance()
	charger.position = get_random_spawn_point(16)
	get_parent().add_child(charger)
	register_enemy(charger, EnemyIds.CHARGER)
