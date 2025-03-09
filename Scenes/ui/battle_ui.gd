class_name BattleUI
extends CanvasLayer

@export var char_stats: CharacterStats : set = _set_char_stats

@onready var hand: Hand = $Hand as Hand
@onready var hand2: Hand = $Hand2 as Hand
@onready var hand3: Hand = $Hand3 as Hand
@onready var hand4: Hand = $Hand4 as Hand
@onready var mana_ui: ManaUI = $ManaUI as ManaUI

func _set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	mana_ui.char_stats = char_stats
	hand.char_stats = char_stats
	hand2.char_stats = char_stats
	hand3.char_stats = char_stats
	hand4.char_stats = char_stats
