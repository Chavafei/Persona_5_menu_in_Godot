extends Juicy_effect
class_name Juicy_effect_scale_mass
## this will try to scale all child of the target_node

@export var target_node : Node
var all_child : Array[Node]
@export var target_scale : Vector3 = Vector3(1,1,1) # a scale at curve one
@export var curve : Curve

@export var revert_on_exit : bool = true
var initial_scale : Array[Vector2]



func Play_Enter():

	all_child = target_node.get_children()
	for i in all_child.size() :
		initial_scale.insert(i,all_child[i].scale);
	pass
 
func Play_Physic_Process():
	var curve_value = curve.sample(curDuration/duration)
	
	var tar_s = target_scale
	if !target_node is Node3D :
		tar_s  = Vector2(target_scale.x,target_scale.y)
	
	
	for t in all_child.size() :
		all_child[t].scale = initial_scale[t] + (curve_value * (tar_s - initial_scale[t]));
	
	
	
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	if revert_on_exit :
		target_node.scale = initial_scale
	pass



