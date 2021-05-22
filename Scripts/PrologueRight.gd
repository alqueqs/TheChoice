extends Node2D

var left = false
var right = false
var near_door = false

func _ready():
	$AnimationPlayer.play("Begin")
	$PlayerPosition.position = Global.player_pos_right
	$ProloguePlayer.position = $PlayerPosition.position
	if Global.has_black_orb == true:
		$Door.queue_free()

func _process(delta):
	if near_door != false:
		if Input.is_action_just_pressed("action"):
			right = true
			Global.player_pos_right = Vector2(637, 144)
			$AnimationPlayer.play("End")

func transition_finished():
	if left == true:
		get_tree().change_scene("res://Scenes/Prologue/PrologueMain.tscn")
	elif right == true:
		get_tree().change_scene("res://Scenes/Prologue/PrologueSecret.tscn")

func _on_Left_body_entered(body):
	left = true
	Global.player_pos_right = Vector2(8, 93)
	$AnimationPlayer.play("End")

func _on_Door_body_entered(body):
	near_door = true
	$AnimationPlayer.play("Door")

func _on_Door_body_exited(body):
	near_door = false
	$AnimationPlayer.play_backwards("Door")

