extends State
class_name Movement_State

@export var characterBody : CharacterBody3D

@export var moveSpeed :float = 3

@export_category("Animation")
@export var animaiton_player : AnimationPlayer
@export var animation_name = "Walk_forward"
@export var animation_speed : float = 1

@export_category("Related States")
@export var state_on_stop : State

var _input_dir
var _move_dir = Vector3.ZERO

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func Enter():
	#animaiton["parameters/Transition/transition_request"] = "Move"
	
	
	if animaiton_player:
		animaiton_player.play(animation_name,0.1,animation_speed)


func Update(_delta: float):
	pass

# place to write about how to set the move direction
func MovementHandle():
	
	pass
	

func Physic_Update(_delta: float):
	gravity_handle(_delta)
	var _target_look = atan2(_move_dir.x, _move_dir.z)
	characterBody.rotation.y = lerp_angle(characterBody.rotation.y, _target_look, 0.5)

	MovementHandle()

	characterBody.velocity.x = _move_dir.x * moveSpeed
	characterBody.velocity.z = _move_dir.z * moveSpeed

	characterBody.move_and_slide()
	
	if(_move_dir == Vector3.ZERO):
		if state_on_stop != null :
			Transitioned.emit(self,state_on_stop.name)
		return
	

func gravity_handle(_delta : float):
	if not characterBody.is_on_floor():
		characterBody.velocity.y -= gravity * _delta

