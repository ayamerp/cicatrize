extends StaticBody2D

var debug = false

func _ready():
	$Camera2D.add_target($Player)
	$Camera2D.add_target($Player2)

	
	var r = get_used
	$Camera2D.limit_left = r.position.x * ce
	$Camera2D.limit_right = r.end.x * cell_s

var cam_rect = Rect2()

