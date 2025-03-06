extends AudioStreamPlayer

func SonPresseBouton() -> void:
	play()
	self["parameters/switch_to_clip"] = "PresseBouton"
