extends Area2D


export var speed = 900

func _ready():
	set_as_toplevel(true)

func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation)*delta


func _physics_process(delta):
	yield(get_tree().create_timer(0.01), "timeout")
	$boolet.frame = 1
	set_physics_process(false)




func _on_enemy_bullet_body_entered(body):
	if not (body.is_a_parent_of(self) or body.get_parent() == get_parent()):
		queue_free()


