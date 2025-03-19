extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@onready var deck_portail: AnimatedSprite2D = $Zone_Deck/Deck_Portail

func _ready() -> void:
	Events.botcardplayed.connect(_on_teleport)
	
	
func _on_teleport() -> void:
	deck_portail.play("tp")
	bibliothequeSons.SonCarteWarp()
	await get_tree().create_timer(1.2).timeout
	deck_portail.play("idle")
