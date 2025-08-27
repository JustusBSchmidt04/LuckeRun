extends Control

var list_container: VBoxContainer

func _ready():
	# Den Container aus der Szene holen
	list_container = get_node_or_null("Hintergrund/ScrollContainer/HighscoreListe")
	if list_container == null:
		# Debughilfe: Baum ausgeben, damit man den korrekten Pfad sieht
		push_error("⚠ HighscoreListe nicht gefunden! Aktueller Baum:\n" + get_tree().get_current_scene().get_tree_string_pretty())
		return

	show_highscores()


func show_highscores():
	# 1) Alte Einträge entfernen
	for child in list_container.get_children():
		child.queue_free()

	# 2) Daten laden
	var highscores: Array = GlobalHighscore.load_highscores()
	var last_id: int = GlobalHighscore.last_run_id

	# 3) Keine Einträge?
	if highscores.is_empty():
		var lbl_no := Label.new()
		lbl_no.text = "Keine Highscores vorhanden."
		list_container.add_child(lbl_no)
		return

	# 4) Zeilen bauen
	for i in range(highscores.size()):
		var run: Dictionary = highscores[i]
		var deaths := int(run.get("deaths", 0))
		var time_sec := float(run.get("time", 0.0))
		var id := int(run.get("id", -1))

		var is_current := (id == last_id && id != -1)

		# Reihe
		var row := HBoxContainer.new()
		row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.custom_minimum_size = Vector2(0, 30)

		# Rang
		var rank_lbl := Label.new()
		rank_lbl.text = str(i + 1) + "."
		rank_lbl.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		rank_lbl.custom_minimum_size = Vector2(32, 0)
		row.add_child(rank_lbl)

		# Text
		var line := Label.new()
		line.text = "Deaths: %d | Time: %s" % [deaths, _format_time(time_sec)]
		line.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		if is_current:
			# Highlight (gold + größere Schrift)
			line.add_theme_color_override("font_color", Color(1.0, 0.84, 0.3))
			line.add_theme_font_size_override("font_size", 20)

		row.add_child(line)

		list_container.add_child(row)


func _format_time(seconds: float) -> String:
	var total_ms := int(round(seconds * 1000.0))
	var mins := total_ms / 60000
	var secs := (total_ms % 60000) / 1000
	var cs := (total_ms % 1000) / 10  # Zentisekunden
	return "%02d:%02d.%02d" % [mins, secs, cs]
