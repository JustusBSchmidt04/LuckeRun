extends Control

@onready var main = $"../../"



func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready():
	$Panel/VBoxContainer/BackToMain.pressed.connect(_on_BackToMain_button_pressed)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when Start button is pressed

	
func _on_BackToMain_button_pressed():
	get_tree().change_scene_to_file("res://Szene/Startbildschirm/main_menu_bg.tscn")
	GlobalDeathcounter.deaths = 0
