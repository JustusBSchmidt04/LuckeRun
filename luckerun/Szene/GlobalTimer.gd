extends Node
var time: float = 0.0
var running: bool = false

func _process(delta):
	if running:
		time += delta

func start():
	running = true

func stop():
	running = false

func reset():
	time = 0.0

func get_time():
	return time
