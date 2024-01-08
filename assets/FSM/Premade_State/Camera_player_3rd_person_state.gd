extends State

## How to use
# Create an empty node3d (This will be pivot)
# Add SpringArm3D as child
# Add Camera as SpringArm3D child



@export var springArm_pivot : Node3D
@export var springArm : SpringArm3D
@export var mouse_senstivity : float = 0.05


func Enter():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	pass
	

	
func Exit():
	pass

func Update(_delta: float):
	
	
	
	pass
	
func Physic_Update(_delta: float):
	pass
	
	
func Unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		springArm_pivot.rotate_y(-event.relative.x * mouse_senstivity)
		springArm.rotate_x(-event.relative.y * mouse_senstivity)
		
		# wtf is a PI
		springArm.rotation.x = clamp(springArm.rotation.x, -PI/4, PI/4)
	
	
	pass
