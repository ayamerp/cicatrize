extends Control

onready var text = get_parent().get_node("dialogue").dialogue1

var dialogue_index = 0
var finished 
var active

var position
var expression

func _ready():
	load_dialogue()
	
func _physics_process(delta):
	if active:
	
		if Input.is_action_just_pressed("ui_accept"):
			if finished == true:
				load_dialogue()
			else:
				$textbox/Tween.stop_all()
				$textbox/dialogue.percent_visible = 1
				finished = true
		
func load_dialogue():
	if dialogue_index < text.size():
		active = true
		finished = false
		
		$textbox.visible = true
		$textbox/dialogue.bbcode_text = text[dialogue_index]["Text"]
		$textbox/name.text = text[dialogue_index]["Name"] 
		
		position = text[dialogue_index]["Position"]
		
		$textbox/dialogue.percent_visible = 0
		$textbox/Tween.interpolate_property(
			$textbox/dialogue, "percent_visible", 0, 1, 2,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$textbox/Tween.start()
	else:
		$textbox.visible = false
		finished = true
		active = false
	dialogue_index += 1 
	
	

func _on_Tween_tween_completed(object, key):
	 finished = true
