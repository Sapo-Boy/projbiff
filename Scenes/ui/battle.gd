extends Node2D

@export var char_stats: CharacterStats
@export var VictoryScreen: Control

@onready var battle_ui: BattleUI = $BattleUI as BattleUI
@onready var player_handler: PlayerHandler = $PlayerHandler as PlayerHandler
@onready var passbutton: Button = $BattleUI/PassTurn
@export var bibliothequeSons: AudioStreamPlayer


signal emitNpcTurn(nbNpc: int)

func _ready() -> void:
	var new_stats: CharacterStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats
	Events.emitButtonColor.connect(changebuttoncol)

	start_battle(new_stats)

func start_battle(stats: CharacterStats) -> void:
	player_handler.start_battle(stats)


func _on_bots_ai_npc_turn(nb: int) -> void:
	print("le tour de: ",nb)
	emitNpcTurn.emit(nb)


func _on_bots_ai_gameover() -> void:
	VictoryScreen._ongameend()


func _on_button_pressed() -> void: #Bouton saute tour (on change extrashmove pour qu'on puisse changer la couleur du button) 
	if Events.extraschmove == 0:
		Events.playerturn = 1
		Events.turnchange.emit()
		Events.extraschmove = 1
		changebuttoncol()
	else:
		bibliothequeSons.SonCarteErreur()

func changebuttoncol():
	if Events.extraschmove == 0 and (Events.nbcardplayed > 4):
		passbutton.modulate.a = 1
	else:
		passbutton.modulate.a = 0.7
