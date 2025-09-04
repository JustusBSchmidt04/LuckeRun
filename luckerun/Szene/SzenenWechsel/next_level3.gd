extends Node2D



func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://Szene/World2/world2.tscn")
	#get_tree().change_scene_to_file("res://Szene/End/End.tscn") for testing the Endscreen and Highscore
	pass # Replace with function body.
