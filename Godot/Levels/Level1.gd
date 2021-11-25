extends Node2D

func _enter_tree():
	if Checkpoint.last_position:
		$rize.global_position = Checkpoint.last_position
