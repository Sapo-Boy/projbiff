extends Node

@onready var hand2 = $"../BattleUI/Hand2"
@onready var PH = $"../PlayerHandler"
@onready var coordcard = $"../CardDropArea/CollisionShape2D"
var check
var ACardUi
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
			ACardUi = hand2.new_card_ui
			#_movecard()
			_movecard() #.completed
			#Function -> lerp -> await() -> go back
			print_debug(Events.playerturn)
			Events.playerturn += 1
			if Events.playerturn > 3:
				Events.playerturn = 0
			return
		print_debug("NoCard")
		PH.draw_cardbot()
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

func _movecard():
	ACardUi.reparent($"..")
	ACardUi.position = coordcard.position + Vector2(-50, -400)
	check = 1
	#await get_tree().create_timer(5.0).timeout
	#ACardUi.position = ACardUi.position.move_toward(coordcard.position,1.0)
	print_debug(ACardUi.position)
	await(ACardUi)
	return
	
func _process(delta):
	if check == 1:
		ACardUi.position = ACardUi.position.move_toward(coordcard.position,5.0)
