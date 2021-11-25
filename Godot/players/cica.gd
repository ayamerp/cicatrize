extends KinematicBody2D

const speed = 300
const GRAVITY = 50
const JUMPFORCE = -950
export (int) var health = 3

var velocity = Vector2.ZERO

func _process(delta):
	
	#this is running
	var tmp_speed = speed 
	
	if(Input.is_action_pressed("2run")):
		tmp_speed = speed * 2
	
	#left and right movement
	if(Input.is_action_pressed("2right")):
		velocity.x = tmp_speed
	elif(Input.is_action_pressed("2left")):
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
			$AnimatedSprite.play("default")
	else: 
		if(is_on_floor()):
			$AnimatedSprite.play("idle")
		else:
			if(velocity.y < 0):
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
	
	
	
	#gravity
	velocity.y = velocity.y + GRAVITY
	
	#Jumping
	if Input.is_action_just_pressed("2up") and is_on_floor():
		velocity.y = JUMPFORCE 
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)


func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemy"):
		health -= 1
		get_parent().find_node("HealthBar2").find_node("HealthSprite2").frame -= 1
		if health <= 0:
			get_tree().reload_current_scene()
			queue_free()

