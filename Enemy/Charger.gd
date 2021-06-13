extends "res://Enemy/Enemy.gd"

enum charger_state {Move=0, Turn=1, Dash=2}

export var dashSpeedMult = 3
export var closeEnoughToDashDistance = 300
export var dashTime = 1
var state
var stateTimer

func _ready():
	change_state(charger_state.Move)

func change_state(newState):
	state = newState;
	match(state):
		charger_state.Move:
			stateTimer = 1.5
		charger_state.Turn:
			stateTimer = 0.5
		charger_state.Dash:
			stateTimer = dashTime

func _process(delta):
	match(state):
		charger_state.Move:
			face_player()
			move_toward_player(delta)
			if position.distance_to(get_player().position) < closeEnoughToDashDistance:
				change_state(charger_state.Turn)
		charger_state.Turn:
			move_toward_player(delta, -0.5)
			face_player()
		charger_state.Dash:
			position += Vector2(delta*speed*dashSpeedMult,0).rotated(rotation+deg2rad(-90))
			
	stateTimer -= delta
	if (stateTimer < 0):
		 change_state((state + 1) % 3)
