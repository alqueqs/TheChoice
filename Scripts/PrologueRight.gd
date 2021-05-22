extends Node2D

func transition_finished():
	get_tree().change_scene("res://Scenes/Prologue/PrologueMain.tscn")

func _on_Left_body_entered(body):
	$AnimationPlayer.play("End")

func _ready():
	$PlayerPosition.position = Global.player_pos

func _process(delta):
	Global.player_pos = $PlayerPosition.position
