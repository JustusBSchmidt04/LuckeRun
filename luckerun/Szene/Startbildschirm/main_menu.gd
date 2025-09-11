extends Control
func _process(delta):
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalDeathcounter.deaths = 0
	GlobalDeathcounter.save_progress()
