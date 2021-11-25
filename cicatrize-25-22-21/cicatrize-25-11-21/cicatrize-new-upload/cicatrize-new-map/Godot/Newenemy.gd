extends KinematicBody2D

var move = Vector2(SPEED,0)
onready var tilemap = get_tree().current_scene.get_node("TileMap")
export var flip = false
const SPEED = 200
const GRAVITY = 7
var velocity = Vector2.ZERO
onready var player = get_node("/root/Level1/rize")

func dir_changed():
	flip = !flip
	$AnimatedSprite.flip_h = flip
	move.x *= -1


func _physics_process(delta):
	if not is_on_floor():
		move.y += 10
	if !flip:
		var tile = tilemap.world_to_map(global_position + Vector2(16,64))
		check_wall(tile)
	else:
		var tile = tilemap.world_to_map(global_position + Vector2(-16,64))
		check_wall(tile)
	move_and_slide(move, Vector2.UP)

func check_wall(tile):
	var tile_info = tilemap.get_cellv(tile)
	if tile_info == -1:
		dir_changed()


func _on_obj_detect_body_entered(body):
	dir_changed()
