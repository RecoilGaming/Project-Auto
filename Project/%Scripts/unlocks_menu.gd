extends Control

## METHODS
# Signals
func _on_back_pressed():
	queue_free()

func _on_general_pressed():
	print("unlocks.general")

func _on_visuals_pressed():
	print("unlocks.visuals")

func _on_audio_pressed():
	print("unlocks.audio")

func _on_misc_pressed():
	print("unlocks.misc")
