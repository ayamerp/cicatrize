extends Sprite

func _process(delta):
	if Global.rize != null:
		frame = Global.rize.health
