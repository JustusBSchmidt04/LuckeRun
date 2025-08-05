extends Panel

func _process(delta):
	var time = GlobalTimer.get_time()

	var minutes = int(time) / 60
	var seconds = int(time) % 60
	var msec = int((time - int(time)) * 1000)

	$Min.text = "%02d:" % minutes
	$Sec.text = "%02d." % seconds
	$MiSec.text = "%03d" % msec
