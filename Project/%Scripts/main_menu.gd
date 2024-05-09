extends CanvasLayer

## FIELDS


## METHODS
# Base
func _ready():
	$Menu/HFlex/Margins/VFlex/Play.grab_focus()

# Signals
func _on_play_pressed():
	get_tree().change_scene_to_file(Constants.arena_scene)

func _on_unlocks_pressed():
	var scene = load(Constants.unlocks_menu_scene).instantiate()
	get_tree().current_scene.add_child(scene)

func _on_options_pressed():
	var scene = load(Constants.options_menu_scene).instantiate()
	get_tree().current_scene.add_child(scene)

func _on_quit_pressed():
	get_tree().quit()
