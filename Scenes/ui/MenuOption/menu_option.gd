extends Control

@export var bibliothequeSons: AudioStreamPlayer
 
@onready var MUSIQUE_BUS_ID = AudioServer.get_bus_index("Musique")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("Sfx")

func _on_musique_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIQUE_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIQUE_BUS_ID, value < 0.05)

func _on_sons_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < 0.05)

func _on_retour_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
