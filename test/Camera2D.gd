extends Camera2D

onready var p1 = get_parent().get_node("Player")
onready var p2 = get_parent().get_node("Player2")

var zoommin = 0.7
var zoommax = .9

func _physics_process(delta):
	position = (p1.position + p2.position) / Vector2(2,2)
	
	zoom.x = max(zoommin , abs( (p1.position.x-p2.position.x)/600) )
	zoom.y = max(zoommin , abs( (p1.position.x-p2.position.x)/600) )
	
	if zoom.x > zoommax :
		zoom.y = zoommax
		zoom.x = zoommax
