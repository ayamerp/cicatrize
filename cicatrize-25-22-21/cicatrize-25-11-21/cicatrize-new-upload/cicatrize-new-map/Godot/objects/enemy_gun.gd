extends Sprite

onready var player = get_tree().current_scene.get_node('rize')
onready var player2 = get_tree().current_scene.get_node('cica')
var can_fire = true
var bullet = preload("res://objects/enemy_bullet.tscn")

func _ready():
	set_as_toplevel(true)


func _physics_process(delta):
	position.x = lerp(position.x, get_parent().position.x, 0.5)
	position.y = lerp(position.y, get_parent().position.y +-5, 0.5)
	flip_v = true if player.global_position.x < global_position.x else false
	flip_v = true if player2.global_position.x < global_position.x else false
	
	if global_position.distance_to(player.global_position) < 250:
		look_at(player.global_position)
		if can_fire:
			var bullet_instance = bullet.instance()
			bullet_instance.rotation = rotation + rand_range(-0.1, 0.1)
			bullet_instance.global_position = $muzzle.global_position
			get_parent().add_child(bullet_instance)
			can_fire = false
			yield(get_tree().create_timer(0.6), "timeout")
			can_fire = true 
