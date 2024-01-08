extends Control
## I called this "Container" but this is actually useable in all Control node

@export var list_delay : float
var allc
# Called when the node enters the scene tree for the first time.
func _ready():
	allc =  get_children()
	
	draw.connect(list_appear)




func list_appear():
	print("visible")
	
	for c in allc :
		c.visible = false
	if visible == false : return
	for i in allc.size() :
		allc[i].visible = true
		if i == 0 :
			allc[i].grab_focus()
		await get_tree().create_timer(list_delay).timeout
		
		
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#allc[0].global_position = p
	pass
