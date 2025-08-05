extends Node

const HIGHSCORE_PATH := "user://highscores.save"

func clear_highscores():  
	if FileAccess.file_exists(HIGHSCORE_PATH):
		DirAccess.remove_absolute(HIGHSCORE_PATH)
		print("Highscores gelöscht.")
	else:
		print("Keine Highscore-Datei vorhanden.")

# Run speichern
func save_run(deaths: int, time: float) -> void:
	var run = {
		"deaths": deaths,
		"time": time
	}

	var highscores = load_highscores()
	highscores.append(run)

	#sortieren 
	highscores.sort_custom(Callable(self, "_sort_runs"))

	# Maximal 5 behalten
	if highscores.size() > 10:
		highscores = highscores.slice(0, 10)

	# Speichern
	var file = FileAccess.open(HIGHSCORE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(highscores, "\t"))
	file.close()

# Highscores laden
func load_highscores() -> Array:
	if not FileAccess.file_exists(HIGHSCORE_PATH):
		return []
	var file = FileAccess.open(HIGHSCORE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var parsed = JSON.parse_string(content)
	if parsed is Array:
		return parsed
	return []

# Sortierregel: Erst nach Deaths, dann nach Zeit
func _sort_runs(a, b) -> bool:
	if a["deaths"] == b["deaths"]:
		return a["time"] < b["time"]
	return a["deaths"] < b["deaths"]

# (Optional) Highscores im Terminal anzeigen
func print_highscores() -> void:
	var highscores = load_highscores()
	for i in highscores.size():
		var run = highscores[i]
		print("%d. Deaths: %d | Time: %.2f sec" % [i + 1, run["deaths"], run["time"]])
