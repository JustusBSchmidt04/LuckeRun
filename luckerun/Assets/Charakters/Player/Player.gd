class_name player
extends CharacterBody2D


@export var gravity: float = 200
@export var speed: float = 50
const jump_force = -240

func _physics_process(delta):
	
	velocity.y += gravity * delta
	
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("default")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	
	
	move_and_slide()
