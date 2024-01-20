extends Juicy_effect
class_name Juicy_effect_set_active

## set visibility of the node, additionally you can also set its process

@export var target_node : Node
@export var initial_state : set_active_action
@export var play_start_state : set_active_action
@export var action : set_active_action
@export var also_set_process : bool

func Initialize():
	setactive(initial_state)

func Pre_Enter() :
	setactive(play_start_state)

func Play_Enter():
	setactive(action)
	pass
	
	
	
	
 
func Play_Physic_Process():
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	pass


func setactive(set_action : set_active_action):
	
	if set_action == set_active_action.None : return
	
	match set_action :
		set_active_action.To_True :
			target_node.visible = true
			
			pass
		set_active_action.To_False :
			target_node.visible = false
			
			pass
		set_active_action.Toggle :
			if target_node.visible == true : target_node.visible = false
			if target_node.visible == false : target_node.visible = true
			pass
	
	
	
	if target_node.visible == true :
		target_node.set_process(true)
	
	if also_set_process :
		if target_node.visible == true :
			target_node.set_process(true)
		elif target_node.visible == false :
			target_node.set_process(false)
	
	pass


enum set_active_action {
	None,
	To_True,
	To_False,
	Toggle

}
