extends Node2D
class_name FiniteStateMachine
 
var current_state: State
var previous_state: State

@export var attack = 0

func _ready():
	current_state = find_child("Idle") as State
	previous_state = current_state
	current_state.enter()
 
func change_state(state):
	current_state = find_child(state) as State
	current_state.enter()
	previous_state.exit()
	previous_state = current_state
	
	
	await get_tree().create_timer(3.0).timeout
	if current_state.name == "Attack":
		Global.life = Global.life - attack
		
