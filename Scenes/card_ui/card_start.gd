extends Control
@onready var Cardmid = $BackCard
@onready var LabelMid = $LabelMid
var rng = RandomNumberGenerator.new()


func  _ready() -> void:
	print("newcards")
	Events.oldcardnmb = rng.randi_range(0, 9)
	Events.oldcardcolor = rng.randi_range(0, 3)
	Events.playerturn = 0
	Events.cardbot1 = 7
	Events.cardbot2 = 7
	Events.cardbot3 = 7
	if not is_node_ready():
		await ready
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
