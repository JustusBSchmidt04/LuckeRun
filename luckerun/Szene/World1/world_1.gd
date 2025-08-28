extends Node2D
func _ready():
	GlobalTimer.reset()
	GlobalTimer.start()
	GlobalDeathcounter.deaths = 0
	
