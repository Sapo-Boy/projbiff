extends Control

@export var bibliothequeSons: AudioStreamPlayer
@export var boutonOption: HBoxContainer
 
@onready var MUSIQUE_BUS_ID = AudioServer.get_bus_index("Musique")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("Sfx")

var fullscreen = true

func _on_musique_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIQUE_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIQUE_BUS_ID, value < 0.05)

func _on_sons_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < 0.05)

func _on_retour_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
	#boutonOption.

func _on_check_button_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
	if fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		fullscreen = false
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		fullscreen = true
