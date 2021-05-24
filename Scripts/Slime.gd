extends KinematicBody2D

var gravity =  10
var velocity = Vector2(0, 0)

var speed = 32 # pixels per second

var direction = -1

func _ready():
	$AnimationPlayer.play("Walk")

func _physics_process(delta):
	move_character()
	detect_turn_around()
	$Label.text = str($RayCast2D.get_collider())
		
func move_character():
	velocity.y += gravity
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		direction *= -1
		scale.x = -scale.x
