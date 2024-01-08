extends State

@export var characterBody : CharacterBody3D
@export var animaiton : AnimationTree # not used, I left this in for now
@export var animaiton_player : AnimationPlayer
@export var animation_name = "Idle"

@export_category("Related States")
@export var Move_state : State

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func Enter():
	if animaiton_player:
		animaiton_player.play(animation_name,0.1)
	
func Exit():
	pass

func Update(_delta: float):
	
	var _input_dir = Input.get_vector("left", "right", "forward", "backward")
	
	if(_input_dir != Vector2.ZERO):
		Transitioned.emit(self,Move_state.name)
	

	
func Physic_Update(_delta: float):
	gravity_handle(_delta)
	characterBody.move_and_slide()

func gravity_handle(_delta : float):
	if not characterBody.is_on_floor():
		characterBody.velocity.y -= gravity * _delta
		

