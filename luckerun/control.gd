extends Control

func _process(delta):
	pass

func _ready():
	$BackToMain.pressed.connect(_on_backtomain_button_pressed)
	
func _on_backtomain_button_pressed():
	get_tree().change_scene_to_file("res://Szene/Startbildschirm/main_menu_bg.tscn")
