extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@onready var deck_portail: AnimatedSprite2D = $Zone_Deck/Deck_Portail

func _on_teleport() -> void:
	deck_portail.play("tp")
	bibliothequeSons.SonCarteWarp()
