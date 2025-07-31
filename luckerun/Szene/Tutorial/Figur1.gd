extends Node2D
var Detected = 0

func _physics_process(delta):
	if Detected==1:
		$Text.visible = true
	else:
		$Text.visible = false


func _on_detection_area_body_entered(body: Node2D) -> void:
	Detected = 1


func _on_detection_area_body_exited(body: Node2D) -> void:
	Detected = 0
