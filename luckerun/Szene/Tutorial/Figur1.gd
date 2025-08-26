extends Node2D
var Detected = 0

func _physics_process(delta):
	if Detected==0:
		$Text.visible = false
	else:
		$Text.visible = true

func _on_detection_area_body_entered(body: Node2D) -> void:
	Detected = 1

func _on_detection_area_body_exited(body: Node2D) -> void:
	Detected = 0
