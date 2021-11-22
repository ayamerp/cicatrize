extends KinematicBody2D


export var speed = 130 
onready var tilemap = get_tree().current_scene.get_node("TileMap2")
export var flip = false
var move = Vector2(speed,0)
export var hitpoints = 4 
export var has_gun = true

func _ready():
	if !has_gun:
		$enemy_gun.queue_free()

func dir_changed():
	flip = !flip
	$enemy.flip_h = flip
	$obj_detect.rotation_degrees = 180 if flip else 0
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
