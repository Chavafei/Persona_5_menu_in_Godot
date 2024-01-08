extends Node
class_name State

var state_machine : StateMachine

signal Transitioned

#for connect signal to enter the state directly
func  _direct_enter_state():
	Transitioned.emit(self,self.name)

func Enter():
	pass
	
func Exit():
	pass

func Update(_delta: float):
	pass
	
func Physic_Update(_delta: float):
	pass

func Unhandled_input(event):
	pass



# other function

func check_for_active() -> bool:
	if state_machine.current_state == self : 
		return true
	else : return false
	
