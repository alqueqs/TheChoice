extends Node2D

var near_door = false

var one = false
var two = false
var three = false
var four = false
var five = false

func _ready():
	if Global.has_black_orb == true:
		$Worlds/world_5.show()
		$Worlds/world_5/world_5/CollisionShape2D.disabled = false
	else:
		$Worlds/world_5.hide()
		$Worlds/world_5/world_5/CollisionShape2D.disabled = true
	
	$ProloguePlayer/PlayerText.text = "So am I dead?"
	$Worlds/world_1/RedText.text = "???"
	$Worlds/world_2/GreenText.text = "???"
	$Worlds/world_3/BlueText.text = "???"
	$Worlds/world_4/YellowText.text = "???"
	$Worlds/world_5/BlackText.text = "???"
	
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("PlayerText")
	yield(get_tree().create_timer(2.5), "timeout")
	$AnimationPlayer.play_backwards("PlayerText")

func _process(delta):
	if Input.is_action_just_pressed("action") and near_door == true:
		$ProloguePlayer.set_script(null)
		$AnimationPlayer.play("Scale")
		yield($AnimationPlayer, "animation_finished")
		$AnimationPlayer.play("End")
		pass

func transition_finished():
	if one == true:
		get_tree().change_scene("res://Scenes/Platformer/Platformer.tscn")
	elif two == true:
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
	elif three == true:
		pass
	elif four == true:
		pass
	elif five == true:
		pass

func _on_world_1_body_entered(body):
	near_door = true
	one = true
	$AnimationPlayer.play("One")

func _on_world_1_body_exited(body):
	near_door = false
	one = false
	$AnimationPlayer.play_backwards("One")

func _on_world_2_body_entered(body):
	near_door = true
	two = true
	$AnimationPlayer.play("Two")

func _on_world_2_body_exited(body):
	near_door = false
	two = false
	$AnimationPlayer.play_backwards("Two")

func _on_world_3_body_entered(body):
	near_door = true
	three = true
	$AnimationPlayer.play("Three")

func _on_world_3_body_exited(body):
	near_door = false
	three = false
	$AnimationPlayer.play_backwards("Three")

func _on_world_4_body_entered(body):
	near_door = true
	four = true
	$AnimationPlayer.play("Four")

func _on_world_4_body_exited(body):
	near_door = false
	four = false
	$AnimationPlayer.play_backwards("Four")

func _on_world_5_body_entered(body):
	near_door = true
	five = true
	$AnimationPlayer.play("Five")

func _on_world_5_body_exited(body):
	near_door = false
	five = false
	$AnimationPlayer.play_backwards("Five")
