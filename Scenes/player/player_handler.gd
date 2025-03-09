class_name PlayerHandler
extends Node

const HAND_DRAW_INTERVAL := 0.25

@export var hand: Hand
@export var hand2: Hand
@export var hand3: Hand
@export var hand4: Hand

var character: CharacterStats

func start_battle(char_stats: CharacterStats) -> void:
	character = char_stats
	character.draw_pile = character.deck.duplicate(true)
	character.draw_pile.shuffle()
	character.discard = CardPile.new()
	start_turn()

func start_turn() -> void:
	character.reset_mana()
	draw_cards(character.cards_per_turn)
	draw_cardsbot(character.cards_per_turn)
	draw_cardsbot2(character.cards_per_turn)
	draw_cardsbot3(character.cards_per_turn)

func draw_card() -> void:
	if !character.draw_pile.empty():
		hand.add_card(character.draw_pile.draw_card())
	else:
		character.draw_pile = character.deck.duplicate(true)
		hand.add_card(character.draw_pile.draw_card())

func draw_cards(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_card)
		tween.tween_interval(HAND_DRAW_INTERVAL)
		
func draw_cardbot() -> void:
	if !character.draw_pile.empty():
		hand2.add_card(character.draw_pile.draw_card())
	else:
		character.draw_pile = character.deck.duplicate(true)
		hand2.add_card(character.draw_pile.draw_card())

func draw_cardsbot(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_cardbot)
		tween.tween_interval(HAND_DRAW_INTERVAL)
	
	tween.finished.connect(
		func() : Events.player_hand_drawn.emit()
	)

func draw_cardbot2() -> void:
	if !character.draw_pile.empty():
		hand3.add_card(character.draw_pile.draw_card())
	else:
		character.draw_pile = character.deck.duplicate(true)
		hand3.add_card(character.draw_pile.draw_card())

func draw_cardsbot2(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_cardbot2)
		tween.tween_interval(HAND_DRAW_INTERVAL)
	
	tween.finished.connect(
		func() : Events.player_hand_drawn.emit()
	)
func draw_cardbot3() -> void:
	if !character.draw_pile.empty():
		hand4.add_card(character.draw_pile.draw_card())
	else:
		character.draw_pile = character.deck.duplicate(true)
		hand4.add_card(character.draw_pile.draw_card())

func draw_cardsbot3(amount: int) -> void:
	var tween := create_tween()
	for i in range(amount):
		tween.tween_callback(draw_cardbot3)
		tween.tween_interval(HAND_DRAW_INTERVAL)
	
	tween.finished.connect(
		func() : Events.player_hand_drawn.emit()
	)

func _on_button_pressed() -> void:
	draw_card()
