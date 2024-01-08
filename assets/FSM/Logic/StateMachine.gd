extends Node
class_name StateMachine

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

signal stateChange(state_name : String)

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
			child.state_machine = self
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)
		

func _physics_process(delta):
	if current_state:
		current_state.Physic_Update(delta)

func on_child_transition(state, new_state_input):
	#if(state != current_state):
		#return
	if new_state_input == null : return
	var input
	if new_state_input is State :
		input = new_state_input.name
	else :
		input = new_state_input

	var new_state = states.get(input.to_lower())
	if !new_state:
		return
		
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	
	current_state = new_state
	
	
func _unhandled_input(event):
	if current_state:
		current_state.Unhandled_input(event)
	
