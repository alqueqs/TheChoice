extends KinematicBody2D

const ACCELERATION = 20
const MAX_SPEED = 80
const FRICTION = 0.8
const AIR_RESISTANCE = 0.08
const GRAVITY = 40
const JUMP_FORCE = 400

var velocity = Vector2.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

	if x_input != 0:
		velocity.x += x_input * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
		if x_input < 0:
			$AnimatedSprite.flip_h = true
		

	velocity.y += GRAVITY

	if is_on_floor():
		if x_input == 0:
			$AnimatedSprite.play("Idle")
			velocity.x = lerp(velocity.x, 0, FRICTION)
	else:
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, AIR_RESISTANCE)

	velocity = move_and_slide(velocity, Vector2.UP)
