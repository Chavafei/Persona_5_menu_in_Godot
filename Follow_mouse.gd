extends Node2D

@export var targetobject : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	targetobject.global_position = get_global_mouse_position()
	
	pass
	
