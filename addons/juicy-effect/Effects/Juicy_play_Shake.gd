extends Juicy_effect
class_name Juicy_effect_shake

@export var target_node : Node

@onready var initial_pos  = target_node.position

@export_category("Shake parameter")
@export var min_value: float = -0.5;
## Minimum value.

@export var max_value: float = 0.5;
## Maximum value.

@export var fall_off: Curve; 
## Shake fall off curve. Only applies if constant == false.

var constant: bool = false;

## Making Node shake
# The Script reference source : https://github.com/Rofle44-git/shaker-plugin-gd4/blob/master/addons/shaker/shaker.gd



func Play_Enter():
	pass
	#self.add_child(timer);
	#timer.wait_time = duration;
	#timer.timeout.connect(stop_play)

func Play_Physic_Process():
	var curve_value = fall_off.sample(curDuration/duration)
	
	if target_node is Node3D :
		target_node.position =  initial_pos + Vector3(
				randf_range(min_value, max_value) * curve_value,
				randf_range(min_value, max_value) * curve_value,
				randf_range(min_value, max_value) * curve_value
				);
	else :
		target_node.position =  initial_pos + Vector2(
				randf_range(min_value, max_value) * curve_value,
				randf_range(min_value, max_value) * curve_value,
				);
	

	pass

func Play_Exit():
	target_node.position = initial_pos
	pass






