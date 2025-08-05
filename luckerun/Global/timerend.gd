extends Panel

func _ready():
	# No reset/start here — only displaying!
	pass

func _process(delta):
	var time = GlobalTimer.get_time()

	var minutes = int(time) / 60
	var seconds = int(time) % 60
	var msec = int((time - int(time)) * 1000)

	$Min2.text = "%02d:" % minutes
	$Sec2.text = "%02d." % seconds
	$MiSec2.text = "%03d" % msec
