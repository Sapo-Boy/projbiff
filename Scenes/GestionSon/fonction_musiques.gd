extends AudioStreamPlayer

func MusiqueMenuPrincipal() -> void:
	play()
	self["parameters/switch_to_clip"] = "MenuPrinicpal"
	
func MusiqueMenuZdJ() -> void:
	play()
	self["parameters/switch_to_clip"] = "ZoneDeJeu"
