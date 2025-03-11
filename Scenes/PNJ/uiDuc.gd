extends Label

@onready var label : Label = $"."

func _process(delta):
	label.text = str(Events.cardbot1)
