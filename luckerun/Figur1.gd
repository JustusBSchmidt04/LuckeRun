extends Node2D



func _on_detection_area_body_entered(body: Node2D) -> void:
	$Text.visible=true

func _on_detection_area_body_exited(body: Node2D) -> void:
	$Text.visible=false
