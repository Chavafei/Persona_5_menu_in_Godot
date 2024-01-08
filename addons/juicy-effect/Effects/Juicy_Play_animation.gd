extends Juicy_effect
class_name Juicy_effect_animation

## Play the animtion player 
# I'll add support for animation tree later.

@export var animation_name : String
@export var animation_player : AnimationPlayer
@export var animation_blend : float = 0.0;
@export var animation_speed : float = 1.0;

func Initialize():
	pass

func Play_Enter():
	
	animation_player.play(animation_name,animation_blend,animation_speed)
	
	pass
 
func Play_Physic_Process():
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	pass
 
