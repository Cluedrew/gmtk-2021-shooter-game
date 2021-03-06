extends Node2D

const GameOver = preload("res://Misc/GameOver.tscn")
const WinScreen = preload("res://Misc/WinScreen.tscn")

func _ready():
	var main = get_parent()
	var player = $Player
	main.will_change_scene(player, "out_of_health", GameOver)
	var boss = $Path2D/PathFollow2D/Boss
	main.will_change_scene(boss, "out_of_health", WinScreen)

# TODO: pretty this up.
var health_label: Label
var max_player_health = 0
var cur_player_health = 0
var max_boss_health = 0
var cur_boss_health = 0

func update_health_label():
	if null == health_label:
		health_label = $HealthLabel
		assert(health_label)
	var text = """
	Player Health: {pc}/{pm}
	Boss Health: {bc}/{bm}
	"""
	health_label.text = text.format({
		"pc": cur_player_health,
		"pm": max_player_health,
		"bc": cur_boss_health,
		"bm": max_boss_health,
	})

func set_player_heath(cur_health, max_health):
	cur_player_health = cur_health
	max_player_health = max_health
	update_health_label()

func set_boss_health(cur_health, max_health):
	cur_boss_health = cur_health
	max_boss_health = max_health
	update_health_label()
