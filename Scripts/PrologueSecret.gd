extends Node2D

func transition_finished():
	get_tree().change_scene("res://Scenes/Prologue/PrologueRight.tscn")

func _on_BlackOrb_body_entered(body):
	Global.has_black_orb = true
	$AnimationPlayer.play("Orb")
	yield($AnimationPlayer, "animation_finished")
	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play("End")
