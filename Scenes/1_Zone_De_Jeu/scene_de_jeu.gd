extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@export var bibliothequeMusiques: AudioStreamPlayer

func _ready() -> void:
	bibliothequeMusiques.play()
	bibliothequeMusiques["parameters/switch_to_clip"] = "ZoneDeJeu"
