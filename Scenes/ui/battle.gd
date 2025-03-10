extends Node2D

@export var char_stats: CharacterStats
@export var VictoryScreen: Control

@onready var battle_ui: BattleUI = $BattleUI as BattleUI
@onready var player_handler: PlayerHandler = $PlayerHandler as PlayerHandler

signal emitNpcTurn(nbNpc: int)

func _ready() -> void:
	var new_stats: CharacterStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats

	start_battle(new_stats)

func start_battle(stats: CharacterStats) -> void:
	player_handler.start_battle(stats)


func _on_bots_ai_npc_turn(nb: int) -> void:
	print("le tour de: ",nb)
	emitNpcTurn.emit(nb)


func _on_bots_ai_gameover() -> void:
	VictoryScreen._ongameend()
