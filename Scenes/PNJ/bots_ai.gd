extends Node
@export var bibliothequeSons: AudioStreamPlayer
@onready var hand = $"../BattleUI/Hand"
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
var plswork
var rng = RandomNumberGenerator.new()
var rngx
var rngy
var tween_portal: Tween
signal npc_turn(nb: int)
signal gameover()


func _ready()-> void:
	var turnchang = get_node("/root/Events")
	#var trba = get_node("res://Scenes/card_ui/card_states/card_dragging_state.gd")
	turnchang.turnchange.connect(_botsplay)
	nbchildf = 0
	nbchildf2 = 0
	
func _emitNpcTurn(playerturn) -> void:
	print("went into emit, valuer act:", playerturn)
	npc_turn.emit(playerturn)
	
func _botsplay(): 
	if !hand.get_children().is_empty():
		_emitNpcTurn(Events.playerturn)
		if Events.playerturn == 1:
			await get_tree().create_timer(1.2).timeout
			_bot1play()
			print("Turn ", Events.playerturn)
			await get_tree().create_timer(1.2).timeout
			Events.cardbot1 = hand2.get_child_count()
			if !hand2.get_children().is_empty():
				print("handexist")
				print(hand2.get_children())
			else:
				Events.playerturn = 1
				gameover.emit()
				print("bot 1 wins")
				return
		elif Events.playerturn == 2:
			await get_tree().create_timer(1.2).timeout
			_bot2play()
			print("Turn ", Events.playerturn)
			await get_tree().create_timer(1.2).timeout
			Events.cardbot2 = hand3.get_child_count()
			if !hand3.get_children().is_empty():
				print("handexist")
				print(hand2.get_children())
			else:
				Events.playerturn = 2
				gameover.emit()
				print("bot 2 wins")
				return
		elif Events.playerturn == 3:
			await get_tree().create_timer(1.2).timeout
			_bot3play()
			print("Turn ", Events.playerturn)
			Events.playerturn = 3
			await get_tree().create_timer(1.2).timeout
			Events.cardbot3 = hand4.get_child_count()
			print(plswork)
			if plswork == 0:
				if !hand4.get_children().is_empty():
					print("handexist")
					print(hand4.get_children())
					Events.playerturn = 0
				else:
					Events.playerturn = 3
					gameover.emit()
					print("bot3 wins")
					return
		if Events.playerturn != 0:
			Events.turnchange.emit()
		else:
			_emitNpcTurn(Events.playerturn)
	else:
		Events.playerturn = 0
		print("player1 wins")
		gameover.emit()
			

func _bot1play():
	#1 Find a playable card
	var playable_card : CardUI
	nbchild = 0
	#print(hand2.get_children())
	#print(nbchild)
	finish = 0
	for child in hand2.get_children():
		if hand2.get_child(nbchild).get_index() != null:
			thecard = hand2.get_child(nbchild)
			if thecard.card.typeColorat == Events.oldcardcolor:
				playable_card = thecard # found a card
				finish = 1
				break # exit the loop, you found a card
			nbchild += 1
		else:
			while hand2.get_child(nbchild).get_index() != null:
				nbchild += 1
	#endfor
	print("endforcol")
	if finish == 0:
		nbchild = 0
		for child in hand2.get_children():
			if hand2.get_child(nbchild).get_index() != null:
				thecard = hand2.get_child(nbchild)
				if thecard.card.typeCardat == Events.oldcardnmb:
					playable_card = thecard # found a card
					finish = 1
					break # exit the loop, you found a card
				nbchild += 1
			else:
				while hand2.get_child(nbchild).get_index() != null:
					nbchild += 1
	print("endfornb")
	if playable_card == null: # did not find a card
		PH.draw_cardbot() # draw
		bibliothequeSons.SonCarteErreur()
		Events.cardbot1 = hand2.get_child_count()
		return
	else:
		bibliothequeSons.SonCarteDepose()
		ACardUi = playable_card
		Events.oldcardcolor = playable_card.card.typeColorat
		Events.oldcardnmb = playable_card.card.typeCardat
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
	nbchild = 0
	#print(hand3.get_children())
	#print(nbchild)
	finish = 0
	for child in hand3.get_children():
		if hand3.get_child(nbchild).get_index() != null:
			thecard = hand3.get_child(nbchild)
			if thecard.card.typeColorat == Events.oldcardcolor:
				playable_card = thecard # found a card
				finish = 1
				break # exit the loop, you found a card
			nbchild += 1
		else:
			while hand3.get_child(nbchild).get_index() != null:
				nbchild += 1
	#endfor
	print("endforcol")
	if finish == 0:
		nbchild = 0
		for child in hand3.get_children():
			if hand3.get_child(nbchild).get_index() != null:
				thecard = hand3.get_child(nbchild)
				if thecard.card.typeCardat == Events.oldcardnmb:
					playable_card = thecard # found a card
					finish = 1
					break # exit the loop, you found a card
				nbchild += 1
			else:
				while hand3.get_child(nbchild).get_index() != null:
					nbchild += 1
	print("endfornb")
	if playable_card == null: # did not find a card
		PH.draw_cardbot2() # draw
		bibliothequeSons.SonCarteErreur()
		Events.cardbot2 = hand3.get_child_count()
		return
	else:
		bibliothequeSons.SonCarteDepose()
		ACardUi = playable_card
		Events.oldcardcolor = ACardUi.card.typeColorat
		Events.oldcardnmb = ACardUi.card.typeCardat
		_movecard()
		print_debug(Events.playerturn)

	# end your turn
	Events.playerturn += 1
	if Events.playerturn > 3:
		Events.playerturn = 0
	return
	
func _bot3play():
#1 Find a playable card
	var playable_card : CardUI
	nbchild = 0
	plswork = 0
	#print(hand4.get_children())
	#print(nbchild)
	finish = 0
	for child in hand4.get_children():
		if hand4.get_child(nbchild).get_index() != null:
			thecard = hand4.get_child(nbchild)
			if thecard.card.typeColorat == Events.oldcardcolor:
				playable_card = thecard # found a card
				finish = 1
				break # exit the loop, you found a card
			nbchild += 1
		else:
			while hand4.get_child(nbchild).get_index() != null:
				nbchild += 1
	#endfor
	print("endforcol")
	if finish == 0:
		nbchild = 0
		for child in hand4.get_children():
			if hand4.get_child(nbchild).get_index() != null:
				thecard = hand4.get_child(nbchild)
				if thecard.card.typeCardat == Events.oldcardnmb:
					playable_card = thecard # found a card
					finish = 1
					break # exit the loop, you found a card
				nbchild += 1
			else:
				while hand4.get_child(nbchild).get_index() != null:
					nbchild += 1
	print("endfornb")
	if playable_card == null: # did not find a card
		PH.draw_cardbot3() # draw
		plswork = 1
		bibliothequeSons.SonCarteErreur()
		Events.cardbot3 = hand4.get_child_count()
		return
	else:
		bibliothequeSons.SonCarteDepose()
		ACardUi = playable_card
		Events.oldcardcolor = ACardUi.card.typeColorat
		Events.oldcardnmb = ACardUi.card.typeCardat
		plswork = 0
		_movecard()
		print_debug(Events.playerturn)

	# end your turn
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
	tween_portal = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween_portal.tween_property(AnewCardUi.material, "shader_parameter/dissolve_value", 1.0, 1.0).from(0.0)
	Events.botcardplayed.emit()
	print_debug(AnewCardUi.position)
	return
	
func _process(_delta):
	if check == 1:
		AnewCardUi.position = AnewCardUi.position.move_toward(coordcard.position + Vector2(rngx,rngy),25.0)
		#AnewCardUi.material.set_shader_parameter("dissolve_value",_delta)
	if hand.get_children().is_empty():
		Events.playerturn = 0
		print("player1 wins")
		gameover.emit()
