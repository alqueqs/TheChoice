extends Node2D

var left = false
var right = false

func _ready():
	$PlayerPosition.position = Global.player_pos_main
	$ProloguePlayer.position = $PlayerPosition.position

func transition_finished():
	if right == true:
		get_tree().change_scene("res://Scenes/Prologue/PrologueRight.tscn")
	elif left == true:
		get_tree().change_scene("res://Scenes/Prologue/PrologueOutside.tscn")

func _on_Right_body_entered(body):
	right = true
	$AnimationPlayer.play("End")
	Global.player_pos_main = Vector2(590, 130)

func _on_Left_body_entered(body):
	left = true
	$AnimationPlayer.play("End")
