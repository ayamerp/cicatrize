extends TileMap

var debug = false

func _ready():
	$Camera2D.add_target($Player)
	$Camera2D.add_target($Player2)

	
	var r = get_used_rect()
	$Camera2D.limit_left = r.position.x * cell_size
	$Camera2D.limit_right = r.end.x * cell_size

var cam_rect = Rect2()

