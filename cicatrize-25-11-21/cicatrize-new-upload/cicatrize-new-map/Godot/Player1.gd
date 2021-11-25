extends KinematicBody2D

const speed = 430
const GRAVITY = 50
const JUMPFORCE = -950

var velocity = Vector2.ZERO

func _process(delta):
	
	#this is running
	var tmp_speed = speed 
	
	if(Input.is_action_pressed("run")):
		tmp_speed = speed * 2
	
	#left and right movement
	if(Input.is_action_pressed("ui_right")):
		velocity.x = tmp_speed
	elif(Input.is_action_pressed("ui_left")):
		velocity.x = -tmp_speed
	else:
		velocity.x = 0
	
	if(velocity.x > 0):
		$AnimatedSprite.scale.x = 1
	elif(velocity.x < 0):
		$AnimatedSprite.scale.x = -1
	
	if(abs(velocity.x) > 0):
		if (abs(velocity.x) > speed):
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("walk")
	
	
	#gravity
	velocity.y = velocity.y + GRAVITY
	
	#Jumping
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
