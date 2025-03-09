extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@export var bibliothequeMusiques: AudioStreamPlayer

@onready var PJ_marqueur_tour: AnimationPlayer = $PjL3S4ge/MarqueurTour/AnimationPlayer
@onready var Kadaki_marqueur_tour: AnimationPlayer = $PNJ/Kadaki_V1/MarqueurTour/AnimationPlayer
@onready var Le_duc_marqueur_tour: AnimationPlayer = $PNJ/Le_Duc/MarqueurTour/AnimationPlayer
@onready var Triclop_marqueur_tour: AnimationPlayer = $PNJ/Triclop/MarqueurTour/AnimationPlayer


func _ready() -> void:
	bibliothequeMusiques.MusiqueMenuZdJ()


func _on_card_scene_emit_npc_turn(nbNpc: int) -> void:
	
	if nbNpc == 0:
		PJ_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		PJ_marqueur_tour.play("RESET")
	elif nbNpc == 1:
		Kadaki_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		Kadaki_marqueur_tour.play("RESET")
	elif nbNpc == 2:
		Le_duc_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		Le_duc_marqueur_tour.play("RESET")
	elif nbNpc == 3:
		Triclop_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		Triclop_marqueur_tour.play("RESET")
