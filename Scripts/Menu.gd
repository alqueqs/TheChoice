extends Control

func _ready():
	$Two.hide()

func transition_finished():
	get_tree().change_scene("res://Scenes/Prologue/PrologueMain.tscn")

func _on_Play_pressed():
	$One.hide()
	$TheChoice.hide()
	$Two.show()

func _on_Quit_pressed():
	get_tree().quit()

func _on_Back_pressed():
	$Two.hide()
	$One.show()
	$TheChoice.show()
