extends Sprite

func _process(delta):
	if Global.cica != null:
		frame = Global.cica.health
