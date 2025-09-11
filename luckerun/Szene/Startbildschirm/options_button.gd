
extends Button

func _ready():
	$".".pressed.connect(_on_Options_button_pressed)
	
func _on_Options_button_pressed():
	get_tree().change_scene_to_file("res://Szene/OptionenSeite/option_screen.tscn")
