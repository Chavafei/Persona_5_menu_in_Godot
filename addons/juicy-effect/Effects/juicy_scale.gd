extends Juicy_effect
class_name Juicy_effect_scale

@export var target_node : Node

## The target scale when the curve value is 1
@export var target_scale : Vector3 = Vector3(1,1,1) # a scale at curve one

@export var curve : Curve

## will force revert back to the original scale when the effect is finished.
@export var revert_on_exit : bool = true
var initial_scale;

func Play_Enter():
	initial_scale = target_node.scale;
	
	
	pass
 
func Play_Physic_Process():
	var curve_value = curve.sample(curDuration/duration)
	var tar_s = target_scale
	

	if !target_node is Node3D :
		tar_s  = Vector2(target_scale.x,target_scale.y)
	
	
		
	target_node.scale = initial_scale + (curve_value * (tar_s - initial_scale));
	
	
	
	
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	if revert_on_exit :
		target_node.scale = initial_scale
	pass


#idk how to use this yet
enum transformtype {
	Normal,
	Additive
	
	
}

