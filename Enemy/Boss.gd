extends "res://Enemy/Enemy.gd"

func _process(delta):
	get_node("..").unit_offset += delta * speed / 1000;

func apply_damage(damage: int):
	.apply_damage(damage)
	print(cur_health)
