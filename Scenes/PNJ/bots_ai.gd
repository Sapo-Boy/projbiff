extends Node

@onready var hand2 = $"../BattleUI/Hand2"
var check

func _ready()-> void:
	var turnchang = get_node("/root/Events")
	turnchang.turnchange.connect(_botsplay)
	
	
func _botsplay(): 
	if Events.playerturn == 1:
		_bot1play()
	elif Events.playerturn == 2:
		_bot2play()
	elif Events.playerturn == 3:
		_bot3play()
	if Events.playerturn != 0:
		Events.turnchange.emit()
			
func _bot1play(): #lerp for movement 
	for child in hand2.get_children():
		if hand2.new_card_ui.card.typeCardat == Events.oldcardnmb:
			print(hand2.new_card_ui.card.typeColorat)
			#Function -> lerp -> await() -> go back
			check = 1
			print_debug(Events.playerturn)
			Events.playerturn += 1
			if Events.playerturn > 3:
				Events.playerturn = 0
			return

func _bot2play():
	print_debug(Events.playerturn)
	Events.playerturn += 1
	if Events.playerturn > 3:
		Events.playerturn = 0
	return
	
func _bot3play():
	print_debug(Events.playerturn)
	Events.playerturn += 1
	if Events.playerturn > 3:
		Events.playerturn = 0
	return
