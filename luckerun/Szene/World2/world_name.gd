extends CanvasLayer

@onready var panel = $WN_Background
@onready var label = $WN_Background/WN_Text
@onready var timer = $WN_Timer

func _ready():
	# Startwerte setzen
	panel.modulate.a = 0.0
	panel.visible = false

	# Testanzeige beim Weltstart
	show_world_name("Paris")

func show_world_name(name: String):
	label.text = name
	panel.visible = true
	
	var tween = create_tween()
	tween.tween_property(panel, "modulate:a", 1.0, 1.0) # Fade-In in 1 Sekunde
	
	# Timer starten (wie lange der Text stehen bleibt)
	timer.start(2.0) # z. B. 2 Sekunden sichtbar



func _hide_panel():
	panel.visible = false


func _on_wn_timer_timeout():
	var tween = create_tween()
	tween.tween_property(panel, "modulate:a", 0.0, 1.0) # Fade-Out in 1 Sekunde
	tween.tween_callback(Callable(self, "_hide_panel"))
