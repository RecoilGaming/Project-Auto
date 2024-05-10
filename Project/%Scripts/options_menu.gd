extends Control

## METHODS
# Signals
func _on_back_pressed():
	queue_free()

func _on_general_pressed():
	print("options.general")

func _on_visuals_pressed():
	print("options.visuals")

func _on_audio_pressed():
	print("options.audio")

func _on_misc_pressed():
	print("options.misc")
