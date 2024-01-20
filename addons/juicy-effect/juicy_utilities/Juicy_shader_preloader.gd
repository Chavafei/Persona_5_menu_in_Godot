extends Node
class_name Juicy_shader_preloader
## This script is created as a workaround on how when object is visible for the first time, it cause a lag to happen.



## Make node visible for a short time then back to invisible.
@export var Target_Nodes : Array[Node]

@export var shaders : Array[Shader]
@export var materials : Array[Material]



func _ready():

	for i in shaders :
		var dummy_node : ColorRect
		dummy_node = ColorRect.new()
		dummy_node.material = ShaderMaterial.new()
		dummy_node.material.shader = i
		add_child(dummy_node)
	
	for i in materials :
		var dummy_node : ColorRect
		dummy_node = ColorRect.new()
		dummy_node.material = i
		add_child(dummy_node)

	for i in Target_Nodes :
		if i.visible == false :
				print("preload " + i.name)
				var initial_pos = i.position
				#i.position = i.position + Vector2(10000.0,0.0)
				i.visible = true
				await get_tree().create_timer(0.1).timeout
				i.position = initial_pos
				i.visible = false
	
	
