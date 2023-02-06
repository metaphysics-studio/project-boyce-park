extends Node

func _input(event):
	if event.is_action_pressed("temp_force_quit"):
		get_tree().quit()
