extends Control

@export var bibliothequeSons: AudioStreamPlayer
@export var bibliothequeMusiques: AudioStreamPlayer

func _ready() -> void:
	bibliothequeMusiques.play()
	bibliothequeMusiques["parameters/switch_to_clip"] = "MenuPrinicpal"
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/1_Zone_De_Jeu/Scene_De_Jeu.tscn")

func _on_quitter_pressed() -> void:
	get_tree().quit()

func _on_option_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
