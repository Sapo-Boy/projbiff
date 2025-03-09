extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@export var bibliothequeMusiques: AudioStreamPlayer

func _ready() -> void:
	bibliothequeMusiques.MusiqueMenuZdJ()


func _on_card_scene_emit_npc_turn(nbNpc: int) -> void:
	print_debug("un tour de: ",nbNpc)
