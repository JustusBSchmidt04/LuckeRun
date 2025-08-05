extends Node
var time: float = 0.0
var running: bool = false

const SAVE_PATH := "user://time.save"

func _process(delta):
	if running:
		time += delta

func save_progress():
	var data := {"time": time}
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(data, "\t"))
	f.close()

func start():
	running = true

func stop():
	running = false

func reset():
	time = 0.0

func get_time():
	return time
