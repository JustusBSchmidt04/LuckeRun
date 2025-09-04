extends Control
var config = ConfigFile.new()

@onready var main = $"../../"



func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready():
	$Panel/VBoxContainer/BackToMain.pressed.connect(_on_BackToMain_button_pressed)
	_load_volume()

	# Set slider to current volume
	var volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$VolumeSlider.value = volume

	# Connect slider manually (optional if not done in editor)
	$VolumeSlider.value_changed.connect(_on_VolumeSlider_value_changed)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.


# Called when Start button is pressed

	
func _on_BackToMain_button_pressed():
	get_tree().change_scene_to_file("res://Szene/Startbildschirm/main_menu_bg.tscn")
	GlobalDeathcounter.deaths = 0

func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

	# Save volume to config
	config.set_value("audio", "master_volume", value)
	config.save("user://settings.cfg")

func _load_volume():
	if config.load("user://settings.cfg") == OK:
		var vol = config.get_value("audio", "master_volume", 0)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), vol)
		$VolumeSlider.value = vol
