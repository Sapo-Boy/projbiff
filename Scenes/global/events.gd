extends Node

enum TypeColor{Yellow,Black,Purple,Cyan}
var playerturn
#Card Related Events
signal card_aim_started(card_ui : CardUI)
signal card_aim_ended(card_ui: CardUI)
signal card_played(card: Card)
signal card_drag_started(card_ui : CardUI)
signal card_drag_ended(card_ui : CardUI)


#Player-related event
signal player_hand_drawn
signal turnchange

#variables

var oldcardnmb : int
var oldcardcolor: TypeColor
var cardbot1
var cardbot2
var cardbot3
