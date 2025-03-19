extends Control

@export var bibliothequeSons: AudioStreamPlayer
@export var BoutonMenuZdJ: Control

func _on_retour_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
	BoutonMenuZdJ.show()
