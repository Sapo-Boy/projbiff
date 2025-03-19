extends Node2D

@export var bibliothequeSons: AudioStreamPlayer
@export var bibliothequeMusiques: AudioStreamPlayer

@onready var PJ_marqueur_tour: AnimationPlayer = $PjL3S4ge/MarqueurTour/AnimationPlayer
@onready var Kadaki_marqueur_tour: AnimationPlayer = $PNJ/Kadaki_V1/MarqueurTour/AnimationPlayer
@onready var Le_duc_marqueur_tour: AnimationPlayer = $PNJ/Le_Duc/MarqueurTour/AnimationPlayer
@onready var Triclop_marqueur_tour: AnimationPlayer = $PNJ/Triclop/MarqueurTour/AnimationPlayer
@onready var morecardturn: AnimationPlayer = $PjL3S4ge/GainBonus/AnimationPlayer
var extracardvar

func _ready() -> void:
	bibliothequeMusiques.MusiqueMenuZdJ()

func _on_card_scene_emit_npc_turn(nbNpc: int) -> void:
	
	if nbNpc == 0:
		PJ_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		PJ_marqueur_tour.play("RESET")
	elif nbNpc == 1:
		if (Events.nbcardplayed % 5 == 0 and Events.nbcardplayed > 4 and extracardvar == 0):
			morecardturn.play("Typewriten")
		Kadaki_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		morecardturn.play("RESET")
		Kadaki_marqueur_tour.play("RESET")
		extracardvar = 1
	elif nbNpc == 2:
		extracardvar = 0
		Le_duc_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		Le_duc_marqueur_tour.play("RESET")
	elif nbNpc == 3:
		Triclop_marqueur_tour.play("Typewriten")
		await get_tree().create_timer(2.0).timeout
		Triclop_marqueur_tour.play("RESET")

	
		
		
		
