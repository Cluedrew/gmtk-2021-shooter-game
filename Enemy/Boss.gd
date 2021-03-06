extends "res://Enemy/Enemy.gd"

func _ready():
	get_node("/root/Main/Level").set_boss_health(cur_health,max_health)

func _process(delta):
	get_node("..").unit_offset += delta * speed / 1000;

# Don't look for the player:
func get_player():
	return null

func apply_damage(damage: int):
	if (cur_health - damage > 0): get_node("/root/Main/Level").set_boss_health(cur_health - damage,max_health)
	.apply_damage(damage)
