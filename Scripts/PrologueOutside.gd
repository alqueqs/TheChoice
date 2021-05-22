extends Node2D

func _ready():
	$Granny.hide()
	$StartPoint.show()

func _on_StartPoint_body_entered(body):
	$Camera2D.current = true
	$ProloguePlayer.hide()
	$ProloguePlayer.set_script(null)
	$Granny.play("Default")
	$AnimationPlayer.play("Death")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("End")

func transition_finished():
	get_tree().change_scene("res://Scenes/Prologue/Void.tscn")
