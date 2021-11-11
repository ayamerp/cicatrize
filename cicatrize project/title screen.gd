extends Control

var scene_path_to_load

func _ready():
	$menu/centerrow/buttons/newgamebutton.grab_focus()
	for button in $menu/centerrow/buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])


func _on_Button_pressed(scene_to_load):
	$fadein.show()
	$fadein.fade_in()
	scene_path_to_load = scene_to_load


func _on_FadeIn_fade_finished():
	$fadein.hide()
	get_tree().change_scene(scene_path_to_load)
