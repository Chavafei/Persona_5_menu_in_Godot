extends Button
class_name Juicy_button
## The Juicy effect you wanted to be interact with must be a child of the button

@export var juicy_focus_name : String = "Focus"
@export var juicy_unfocus_name : String = "Unfocus"
@export var juicy_pressed_name : String = "Confirm"
var select_effect : Juicy_player;
var unselect_effect : Juicy_player;
var pressed_effect : Juicy_player;
@export var isFocus : bool

# set pivot at center, good for if you want to scale the button
@export var auto_pivot_center: bool 

# Called when the node enters the scene tree for the first time.
func _ready():
	select_effect = get_node(juicy_focus_name)
	unselect_effect = get_node(juicy_unfocus_name)
	pressed_effect = get_node(juicy_pressed_name)
	
	if select_effect : 	focus_entered.connect(func() : select_effect.Play())
	if unselect_effect : focus_exited.connect(func() : unselect_effect.Play())
	if pressed_effect :	button_down.connect(func() : pressed_effect.Play())
	

	
	if isFocus :
		grab_focus()
		
	if auto_pivot_center :
		pivot_offset = size/2
		
	
	
	
	
	pass # Replace with function body.
	
	
func _set_focus():
	grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

