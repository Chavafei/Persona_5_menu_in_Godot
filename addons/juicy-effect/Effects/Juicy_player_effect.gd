extends Juicy_effect
class_name Juicy_effect_player
## The effect for playing other Juicy_player

## Assign other Juicy_player you want to play
@export var target_Player : Juicy_player

func Initialize():
	pass

func Play_Enter():
	target_Player.Play()
	pass
 
func Play_Physic_Process():
	pass
	
func Play_Process():
	pass
 
func Play_Exit():
	pass
