extends Node2D

var detected = false
var dialog = [
	"Hallo! Willkommen im Spiel.",
	"Ich habe eine Aufgabe für dich.",
	"Bist du bereit?"
]
var current_index = 0
var text_timer = 0.0
var display_time = 2.0  # Sekunden pro Text

var label

func _ready():
	label = $Text

func _physics_process(delta):
	if detected:
		label.visible = true
		
		# Text automatisch wechseln
		text_timer += delta
		if text_timer >= display_time:
			text_timer = 0
			current_index += 1
			if current_index >= dialog.size():
				current_index = current_index-1  # oder detected = false, um zu stoppen
			label.text = dialog[current_index]
	else:
		label.visible = false
		current_index = 0
		text_timer = 0

func _on_detection_area_body_entered(body):
	detected = true
	label.text = dialog[current_index]

func _on_detection_area_body_exited(body):
	detected = false
