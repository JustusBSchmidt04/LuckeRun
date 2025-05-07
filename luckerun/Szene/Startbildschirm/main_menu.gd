extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.pressed.connect(_on_start_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when Start button is pressed
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Szene/World1/World1.tscn")
