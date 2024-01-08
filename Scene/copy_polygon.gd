extends Polygon2D

@export var target_polygon : Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	polygon = target_polygon.polygon;
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	polygon = target_polygon.polygon;
	pass
