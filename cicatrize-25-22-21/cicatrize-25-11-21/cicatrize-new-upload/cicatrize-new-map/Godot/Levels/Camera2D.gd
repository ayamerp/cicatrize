extends Camera2D

onready var p1 = get_parent().get_node("rize")
onready var p2 = get_parent().get_node("cica")

var zoommin = 1.2
var zoommax = 1.1

func _physics_process(delta):
	position = (p1.position + p2.position) / Vector2(2,2)
	
	zoom.x = max(zoommin , abs( (p1.position.x-p2.position.x)/600) )
	zoom.y = max(zoommin , abs( (p1.position.x-p2.position.x)/600) )
	
	if zoom.x > zoommax :
		zoom.y = zoommax
		zoom.x = zoommax
