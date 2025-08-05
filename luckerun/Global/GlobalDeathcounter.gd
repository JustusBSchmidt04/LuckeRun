
extends Node

var deaths: int = 0
const SAVE_PATH := "user://death.save"



func _ready():
	load_progress()

func load_progress():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var f := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content := f.get_as_text()
	f.close()
	var parsed = JSON.parse_string(content)
	if parsed is Dictionary and parsed.has("deaths"):
		deaths = int(parsed.deaths)

func save_progress():
	var data := {"deaths": deaths}
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(data, "\t"))
	f.close()

func add_death():
	deaths += 1
	save_progress()
