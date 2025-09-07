extends Node2D

var already_saved: bool = false

func _ready():
	# Stylebox für Timer unsichtbar machen
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0, 0, 0, 0)
	$Background/TimerEnd.add_theme_stylebox_override("panel", style)

	GlobalTimer.stop()
	GlobalTimer.save_progress()
	GlobalDeathcounter.save_progress()

	$DeathCount.text = "%d" % GlobalDeathcounter.deaths

	# Nur speichern, wenn noch nicht geschehen
	if not already_saved:
		end_game()
		already_saved = true

	# Debug-Ausgabe der Highscores
	GlobalHighscore.print_highscores()


func end_game():
	var deaths = GlobalDeathcounter.deaths
	var time = GlobalTimer.get_time()

	print("Deaths:", deaths)
	print("Time:", time)

	GlobalHighscore.save_run(deaths, time)


func load_value(path: String) -> float:
	if not FileAccess.file_exists(path):
		return 0.0
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
