extends Node2D
func _ready():
	GlobalTimer.stop()
	GlobalDeathcounter.deaths = 0
	GlobalDeathcounter.save_progress()
