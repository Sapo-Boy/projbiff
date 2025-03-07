extends Node

@onready var hand2 = $"../BattleUI/Hand2"
var check
@onready var newhand2

func _ready()-> void:
	var turnchang = get_node("/root/Events")
	turnchang.turnchange.connect(_botsplay)
	newhand2 = hand2.instantiate()
	
func _botsplay(): 
	for child in newhand2.get_children():
		if newhand2.card_ui.card.typeCardat == Events.oldcardnmb:
			print(newhand2.card_ui.card.typeColorat)
			check = 1
			return
