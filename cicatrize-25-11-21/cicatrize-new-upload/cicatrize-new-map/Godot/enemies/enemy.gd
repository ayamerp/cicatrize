extends KinematicBody2D

var velocity = Vector2()
export var speed = 130 
var move = Vector2(speed,0)
export var hitpoints = 4 
export var has_gun = true
export var direction = 1
export var detects_cliffs = true

func _ready():
	if !has_gun:
		$enemy_gun.queue_free()
	if direction == -1:
		$enemy.flip_h = true 
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1 
		$enemy.flip_h = not $enemy.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = 100 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

