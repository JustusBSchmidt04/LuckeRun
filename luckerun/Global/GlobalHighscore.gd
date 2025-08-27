extends Node

const HIGHSCORE_PATH := "user://highscores.save"

var last_run_id: int = -1
var last_run: Dictionary = {}  # wird beim Speichern gesetzt

func clear_highscores() -> void:
	if FileAccess.file_exists(HIGHSCORE_PATH):
		DirAccess.remove_absolute(HIGHSCORE_PATH)
		print("Highscores gelöscht.")
	else:
		print("Keine Highscore-Datei vorhanden.")

func save_run(deaths: int, time: float) -> void:
	# Eindeutige ID für diesen Run (für Markierung)
	var run_id := Time.get_ticks_msec()
	var run := {
		"id": run_id,
		"deaths": deaths,
		"time": time
	}

	last_run_id = run_id
	last_run = run.duplicate(true)

	var highscores := load_highscores()
	highscores.append(run)

	# Godot 4: sort_custom mit Callable
	highscores.sort_custom(Callable(self, "_sort_runs"))

	# optional: Top 10 behalten
	if highscores.size() > 10:
		highscores = highscores.slice(0, 10)

	var f = FileAccess.open(HIGHSCORE_PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(highscores, "\t"))
	f.close()

func load_highscores() -> Array:
	if not FileAccess.file_exists(HIGHSCORE_PATH):
		return []
	var f = FileAccess.open(HIGHSCORE_PATH, FileAccess.READ)
	var content = f.get_as_text()
	f.close()
	var parsed = JSON.parse_string(content)
	if parsed is Array:
		return parsed
	return []

func _sort_runs(a, b) -> bool:
	if a["deaths"] == b["deaths"]:
		return a["time"] < b["time"]
	return a["deaths"] < b["deaths"]

func print_highscores() -> void:
	var highscores = load_highscores()
	for i in highscores.size():
		var run = highscores[i]
		print("%d. Deaths: %d | Time: %.2f sec" % [i + 1, run["deaths"], run["time"]])
