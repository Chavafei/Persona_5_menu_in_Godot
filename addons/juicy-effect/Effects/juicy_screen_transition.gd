extends Juicy_effect
class_name Juicy_effect_screen_transition

# A texture for animating transition, Black = start, White = end
@export var transition_texture : Texture2D


var transition_shader : Shader = preload("../shader/screen_transition_shader.gdshader")
var texture_rect : TextureRect
func Initialize():
	pass

func Play_Enter():
	if texture_rect != null : 
		texture_rect.queue_free()
	
	var img = get_viewport().get_texture().get_image()

	var texture = ImageTexture.create_from_image(img)
	texture_rect = TextureRect.new()
	texture_rect.name = "TransitionRect"
	texture_rect.set_anchors_preset(Control.PRESET_FULL_RECT)
	texture_rect.texture = texture
	
	texture_rect.material = ShaderMaterial.new()
	texture_rect.material.shader = transition_shader
	texture_rect.material.set_shader_parameter("transition_pattern",transition_texture)
	
	add_child(texture_rect)
	#transistion_sprite.texture = texture
	
	pass
 
func Play_Physic_Process():
	var time = curDuration/duration
	texture_rect.material.set_shader_parameter("transition_state",time)
	
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	texture_rect.queue_free()
	pass
 
