extends Control
@onready var Cardmid = $BackCard
@onready var LabelMid = $LabelMid


func _ready() -> void:
	match Events.oldcardcolor: #Change couleur carte début
		0:
			Cardmid.texture = load("res://Assets/Img/Cartes_Vides/carte_fond_jaune2.png")
		1:
			Cardmid.texture = load("res://Assets/Img/Cartes_Vides/carte_fond_noir.png")
		2:
			Cardmid.texture = load("res://Assets/Img/Cartes_Vides/carte_fond_violet1.png")
		3:
			Cardmid.texture = load("res://Assets/Img/Cartes_Vides/carte_fond__cyan.png")
	LabelMid.text = str(Events.oldcardnmb)
