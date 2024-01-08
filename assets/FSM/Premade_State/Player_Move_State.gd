extends Movement_State
class_name Player_movement_state

@export var camera : Camera3D #manually assign for now


func Enter():
	#animaiton["parameters/Transition/transition_request"] = "Move"
	super()
	camera = get_viewport().get_camera_3d()

func MovementHandle():
	if !camera : return
	
	_input_dir = Input.get_vector("left", "right", "forward", "backward")
	_move_dir = Vector3(_input_dir.x, 0, _input_dir.y)
	_move_dir = _move_dir.rotated(Vector3.UP, camera.global_rotation.y).normalized()
	
	#if(Input.is_action_pressed("attack")):
		#Transitioned.emit(self,Attack_state.name)
	#



