extends KinematicBody2D

const ACCELERATION = 25
var MAX_SPEED = 120
const FRICTION = 0.4
const AIR_RESISTANCE = 0.04
const GRAVITY = 20
const JUMP_FORCE = 400

var glasses = 5

var can_dash = true

var velocity = Vector2.ZERO

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		velocity.x += x_input * ACCELERATION
		velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
		if x_input < 0:
			$AnimatedSprite.flip_h = true
		
		if Input.is_action_just_pressed("dash") and can_dash == true:
			MAX_SPEED = 360
			$DashParticles.emitting = true
			$AnimatedSprite.play("Dash")
			$Hitbox/CollisionShape2D.disabled = false
			$HurtBox/CollisionShape2D.disabled = true
			set_collision_mask_bit(2, false)
			yield(get_tree().create_timer(0.3), "timeout")
			MAX_SPEED = 120
			$DashParticles.emitting = false
			$AnimatedSprite.play("Dash")
			$Hitbox/CollisionShape2D.disabled = true
			$HurtBox/CollisionShape2D.disabled = false
			set_collision_mask_bit(2, true)
			can_dash = false
			$DashTimer.start()
	
	velocity.y += GRAVITY
	
	
	
	if is_on_floor():
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, FRICTION)
			$AnimatedSprite.play("Idle")
		
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -JUMP_FORCE
		
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < -JUMP_FORCE / 10:
			velocity.y = -JUMP_FORCE / 10
		
		if x_input == 0:
			velocity.x = lerp(velocity.x, 0, AIR_RESISTANCE)
		
		$AnimatedSprite.play("Jump")
		if velocity.y > 0:
			$AnimatedSprite.play("Fall")
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Global.player_health == 0:
		$AnimatedSprite.play("Death")
		Global.player_dead = true
		set_script(null)
	
	$Label.text = str(get_collision_mask_bit(2))
	

func _on_DashTimer_timeout():
	can_dash = true

func _on_HurtBox_area_entered(area):
	Global.player_health -= 1
	$AnimationPlayer.play("Damage")
	match glasses:
		1:
			$CanvasLayer/HP1.play()
		2:
			$CanvasLayer/HP2.play()
		3:
			$CanvasLayer/HP3.play()
		4:
			$CanvasLayer/HP4.play()
		5:
			$CanvasLayer/HP5.play()
	glasses -= 1
