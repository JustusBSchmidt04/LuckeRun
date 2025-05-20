extends Control
func _process(delta):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayButton.pressed.connect(_on_start_button_pressed)
	$OptionsButton.pressed.connect(_on_options_button_pressed)
	$QuitButton.pressed.connect(_on_quit_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when Start button is pressed
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Szene/World1/World1.tscn")
	

	

# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when Start button is pressed
func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Szene/OptionenSeite/option_screen.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when Start button is pressed
func _on_quit_button_pressed():
	get_tree().quit()
