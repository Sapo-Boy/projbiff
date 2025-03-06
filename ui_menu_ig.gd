extends Control

@export var bibliothequeSons: AudioStreamPlayer

func _on_quitter_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
	get_tree().change_scene_to_file("res://Scenes/0_Menu_Principal/control_Menu_Principal.tscn")

func _on_option_pressed() -> void:
	bibliothequeSons.SonPresseBouton()

func _on_mute_pressed() -> void:
	bibliothequeSons.SonPresseBouton()

func _on_instruction_pressed() -> void:
	bibliothequeSons.SonPresseBouton()

func _on_retour_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
