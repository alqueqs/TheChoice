extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("restart") and Global.player_dead == true:
		Global.player_health = 5
		get_tree().reload_current_scene()
