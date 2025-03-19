extends Node2D

@onready var flash_1: AnimatedSprite2D = $Flash1

func _ready() -> void:
	Events.botcardplayed.connect(_animeff)

func _animeff():
	if Events.playerturn == 3:
		flash_1.play()
