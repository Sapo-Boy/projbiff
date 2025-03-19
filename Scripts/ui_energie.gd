extends Label

func _ready() -> void:
	Events.turnchange.connect(_changenb)

func _changenb() -> void:
	if Events.nbcardplayed > 4:
		self.text = str((Events.nbcardplayed / 5) + 1)
