extends Control

@export var txt_npc: String = "Votre texte ici" 

@onready var label_npc: Label = $LabelNpc
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	label_npc.text = txt_npc
	
func _TourDuJoeur() -> void:
	animation.play("Typewriten")
