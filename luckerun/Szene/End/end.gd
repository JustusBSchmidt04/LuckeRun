extends Node2D

func _ready():
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0, 0, 0, 0) # komplett durchsichtig
	$Endscreen/TimerEnd.add_theme_stylebox_override("panel", style)


  
	GlobalTimer.stop()
	GlobalTimer.save_progress()
	GlobalDeathcounter.save_progress()
	$DeathCount.text = "%d" % GlobalDeathcounter.deaths
	end_game()
	GlobalDeathcounter.deaths = 0
	#GlobalHighscore.clear_highscores()  #LÖSCHT HIGHSCORES

func end_game():
	var deaths = GlobalDeathcounter.deaths
	var time = GlobalTimer.get_time()

	print("Deaths:", deaths)
	print("Time:", time)
	# Optional: direkt anzeigen
	GlobalHighscore.save_run(deaths, time)
	GlobalHighscore.print_highscores()


func load_value(path: String) -> float:
	if not FileAccess.file_exists(path):
		return 0.0
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return float(content)
