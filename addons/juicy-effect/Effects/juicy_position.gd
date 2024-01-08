extends Juicy_effect
class_name Juicy_effect_position

@export var target_node : Node

@export var mode : TransformMode
@export var target_position : Vector3 = Vector3(0,0,0) # a scale at curve one
@export var curve : Curve

@export var revert_on_exit : bool = true
var initial_pos;

## Effect for moving object. a little buggy
## To do :
### - add local transform support

func Play_Enter():
	initial_pos = target_node.position;
	
	pass
 
func Play_Physic_Process():
	var curve_value = curve.sample(curDuration/duration)
	var tar_s = target_position
	

	if !target_node is Node3D :
		tar_s  = Vector2(target_position.x,target_position.y)
	
	
	match mode :
		TransformMode.Global :
			target_node.global_position = initial_pos + (curve_value * (tar_s- initial_pos))
		TransformMode.Local :
			target_node.position = initial_pos + (curve_value * tar_s)
		
	
	
	
	
	
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	if revert_on_exit :
		target_node.position = initial_pos
	pass


enum TransformMode {
	Global,
	Local # works like offset
	}

