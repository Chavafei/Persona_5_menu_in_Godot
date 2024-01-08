extends Juicy_effect
class_name Juicy_effect_set_order
## for setting the z index of the canvas

@export var target_node : Node
@export var set_to : int

func Play_Enter():
	
	target_node.z_index = set_to
	
	pass
 
func Play_Physic_Process():
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	pass
