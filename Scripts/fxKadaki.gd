extends Node2D

@onready var flash_1: AnimatedSprite2D = $Flash1
@onready var flash_2: AnimatedSprite2D = $Flash2
@onready var flash_3: AnimatedSprite2D = $Flash3

func _ready() -> void:
	Events.botcardplayed.connect(_animeff)

func _animeff():
	if Events.playerturn == 2:
		flash_1.play()
		flash_2.play()
		flash_3.play()
