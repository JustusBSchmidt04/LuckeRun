extends CharacterBody2D
var is_falling := false
var fall_speed := 200.0

func _physics_process(delta):
	if is_falling:
		velocity.y = fall_speed
		move_and_slide()
	else:
		velocity.y = 0.0

func _on_detection_area_area_entered(area: Area2D) -> void:
	is_falling = true
