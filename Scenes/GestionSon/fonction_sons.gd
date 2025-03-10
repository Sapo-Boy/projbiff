extends AudioStreamPlayer

func SonPresseBouton() -> void:
	self["parameters/switch_to_clip"] = "PresseBouton"
	play()

func SonCarteDepose() -> void:
	self["parameters/switch_to_clip"] = "CarteDepose"
	play()
	
func SonCarteSelection() -> void:
	self["parameters/switch_to_clip"] = "CarteSelection"
	play()

func SonCarteErreur() -> void:
	self["parameters/switch_to_clip"] = "CarteErreur"
	play()
