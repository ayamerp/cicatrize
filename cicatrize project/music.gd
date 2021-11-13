extends AudioStreamPlayer

func _ready():
	if $music.playing == false
		$music.play()
