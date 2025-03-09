extends AudioStreamPlayer

func SonPresseBouton() -> void:
	play()
	self["parameters/switch_to_clip"] = "PresseBouton"

func SonCarteDepose() -> void:
	self["parameters/switch_to_clip"] = "CarteDepose"
	play()
	

func SonCarteSelection() -> void:
	play()
	self["parameters/switch_to_clip"] = "CarteSelection"

func SonCarteErreur() -> void:
	self["parameters/switch_to_clip"] = "CarteErreur"
	play()
