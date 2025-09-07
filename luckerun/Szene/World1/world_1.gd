extends Node2D
func _ready():
	GlobalDeathcounter.deaths = 0
	GlobalTimer.reset()
	GlobalTimer.start()

	
