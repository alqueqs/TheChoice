extends Control

func boot_finished():
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
