
extends Button

func _ready():
	$".".pressed.connect(_on_Play_button_pressed)
	
func _on_Play_button_pressed():
	get_tree().change_scene_to_file("res://Szene/Tutorial/worldtu.tscn")
