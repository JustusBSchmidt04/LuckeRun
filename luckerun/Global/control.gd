extends Control

var config = ConfigFile.new()

func _ready():
	$BackToMain.pressed.connect(_on_backtomain_button_pressed)
	_load_volume()

	# Set slider to current volume
	var volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$VolumeSlider.value = volume

	# Connect slider manually (optional if not done in editor)
	$VolumeSlider.value_changed.connect(_on_VolumeSlider_value_changed)

func _on_backtomain_button_pressed():
	get_tree().change_scene_to_file("res://Szene/Startbildschirm/main_menu_bg.tscn")

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
