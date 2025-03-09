extends Node

@onready var hand2 = $"../BattleUI/Hand2"
@onready var hand3 = $"../BattleUI/Hand3"
@onready var hand4 = $"../BattleUI/Hand4"
@onready var PH = $"../PlayerHandler"
@onready var coordcard = $"../CardDropArea/CollisionShape2D"
@onready var BUI = $"../BattleUI"
var check
var ACardUi
var AnewCardUi
var nbchild
var nbchildf
var nbchildf2
var nbchildf3
var finish
var thecard
var rng = RandomNumberGenerator.new()
var rngx
var rngy
func _ready()-> void:
	var turnchang = get_node("/root/Events")
	#var trba = get_node("res://Scenes/card_ui/card_states/card_dragging_state.gd")
	turnchang.turnchange.connect(_botsplay)
	nbchildf = 0
	nbchildf2 = 0
	
	
func _botsplay(): 
	if Events.playerturn == 1:
		_bot1play()
		print("Turn ", Events.playerturn)
		await get_tree().create_timer(2.0).timeout
	elif Events.playerturn == 2:
		_bot2play()
		print("Turn ", Events.playerturn)
		await get_tree().create_timer(2.0).timeout
	elif Events.playerturn == 3:
		_bot3play()
		print("Turn ", Events.playerturn)
		Events.playerturn = 2
		await get_tree().create_timer(2.0).timeout
		Events.playerturn= 0
		
	if Events.playerturn != 0:
		Events.turnchange.emit()
			
			

func _bot1play():
	#1 Find a playable card
	var playable_card : CardUI
	nbchild = 0 + nbchildf
	#print(hand2.get_children())
	#print(nbchild)
	for child in hand2.get_children():
		thecard = hand2.get_child(nbchild)
		if thecard.card.typeCardat == Events.oldcardnmb and thecard.card.typeColorat == Events.oldcardcolor: # is this card playable?
			playable_card = thecard # found a card
			nbchildf += 1
			finish = 1
			break # exit the loop, you found a card
		nbchild += 1
	if finish == 0:
		nbchild = 0 + nbchildf
		for child in hand2.get_children():
			thecard = hand2.get_child(nbchild)
			if thecard.card.typeColorat == Events.oldcardcolor:
				playable_card = thecard # found a card
				nbchildf += 1
				finish = 1
				break # exit the loop, you found a card
			nbchild += 1
	if finish == 0:
		nbchild = 0 + nbchildf
		for child in hand2.get_children():
			thecard = hand2.get_child(nbchild)
			if thecard.card.typeCardat == Events.oldcardnmb:
				playable_card = thecard # found a card
				nbchildf += 1
				finish = 1
				break # exit the loop, you found a card
			nbchild += 1
	if playable_card == null: # did not find a card
		PH.draw_cardbot() # draw
	else:
		print(hand2.new_card_ui.card.typeColorat)
		ACardUi = playable_card
		_movecard()
		print_debug(Events.playerturn)

	# end your turn
	Events.playerturn += 1
	if Events.playerturn > 3:
		Events.playerturn = 0
	return

func _bot2play():
	#1 Find a playable card
	var playable_card : CardUI
	nbchild = 0 + nbchildf2
	for child in hand3.get_children():
		#print_debug(hand2.new_card_ui.card)
		thecard = hand3.get_child(nbchild)
		if thecard.card.typeCardat == Events.oldcardnmb: # is this card playable?
			playable_card = thecard # found a card
			nbchildf2 += 1
			break # exit the loop, you found a card
		nbchild += 1
	if playable_card == null: # did not find a card
		PH.draw_cardbot() # draw
	else:
		print(hand3.new_card_ui.card.typeColorat)
		ACardUi = playable_card
		_movecard()
		print_debug(Events.playerturn)

	# end your turn
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
	AnewCardUi = ACardUi.duplicate(true)
	add_child(AnewCardUi)
	AnewCardUi.reparent($"../BattleUI")
	ACardUi.queue_free()
	AnewCardUi.position = coordcard.position + Vector2(-50, -400)
	rngx = rng.randf_range(-100.0, 0.0)
	rngy = rng.randf_range(-100.0, 0.0)
	check = 1
	print_debug(AnewCardUi.position)
	return
	
func _process(delta):
	if check == 1:
		AnewCardUi.position = AnewCardUi.position.move_toward(coordcard.position + Vector2(rngx,rngy),5.0)
