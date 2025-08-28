
extends Button

func _ready():
	$".".pressed.connect(_on_Restart_button_pressed)
	
func _on_Restart_button_pressed():
	get_tree().change_scene_to_file("res://Szene/World1/World1.tscn")
