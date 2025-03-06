extends Node

enum TypeColor{Yellow,Black,Purple,Cyan}
var rng = RandomNumberGenerator.new()
var playerturn
#Card Related Events
signal card_aim_started(card_ui : CardUI)
signal card_aim_ended(card_ui: CardUI)
signal card_played(card: Card)
signal card_drag_started(card_ui : CardUI)
signal card_drag_ended(card_ui : CardUI)


#Player-related event
signal player_hand_drawn
#signal player_hand_discarded
#signal player_turn_ended
#signal player_died
#
##Enemy-related events
#signal enemy_action_completed(enemy: Enemy)
#signal enemy_turn_ended

#variables

var oldcardnmb : int
var oldcardcolor: TypeColor

func _ready() -> void:
	 #RNG pour la carte du début
	oldcardnmb = rng.randi_range(0.0, 9)
	print(oldcardnmb)
	oldcardcolor = rng.randi_range(0, 3)
	print(oldcardcolor)
	playerturn = 0
