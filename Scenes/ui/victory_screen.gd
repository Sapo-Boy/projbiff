extends Control

@onready var textvictory: RichTextLabel = $CanvasLayer/Panel/RichTextLabel
@onready var animation: AnimationPlayer = $CanvasLayer/Panel/AnimationPlayer
@onready var panelend: Panel = $CanvasLayer/Panel
func _ongameend() -> void:
	panelend.show()
	match Events.playerturn:
		0:
			textvictory.text = "[wave amp=35.0 freq=5.0 connected=1] You win!"
		1:
			textvictory.text = "[wave amp=35.0 freq=5.0 connected=1] Le Duc wins!"
		2:
			textvictory.text = "[wave amp=35.0 freq=5.0 connected=1] Kadaki wins!"
		3:
			textvictory.text = "[wave amp=35.0 freq=5.0 connected=1] Triclop wins!"
	animation.play("Schmove")
