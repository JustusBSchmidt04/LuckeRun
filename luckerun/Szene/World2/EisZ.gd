extends CharacterBody2D

var is_falling := false
var fall_speed := 100.0

func _physics_process(delta):
	if is_falling:
		velocity.y = fall_speed
		move_and_slide()
	else:
		velocity.y = 0.0

func _ready():
	$DetectionArea.body_entered.connect(_on_detection_area_body_entered)

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		is_falling = true
