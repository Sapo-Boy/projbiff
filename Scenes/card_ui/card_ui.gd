class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@export var card: Card : set = _set_card
@export var char_stats: CharacterStats : set = _set_char_stats

@onready var backCard: TextureRect = $BackCard
@onready var typeCard: TextureRect = $TypeCard
@onready var cost_texture: TextureRect = $CostTexture
@onready var icone_mid: TextureRect = $IconeMid
@onready var symbole_1: TextureRect = $Symbole1
@onready var symbole_2: TextureRect = $Symbole2
@onready var label_mid: Label = $LabelMid
@onready var labelNb: Label = $LabelNb


@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var targets: Array[Node] = []


var parent: Control
var tween: Tween
var disabled := false
var original_index := 0
var velocityCard = false

func _ready() -> void:
	card_state_machine.init(self)
	
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)
	
func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

func _set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
		
	card = value
	backCard.texture = card.BackCard
	typeCard.texture = card.CardType 
	cost_texture.texture = card.costTexture
	icone_mid.texture =  card.IconeMid
	symbole_1.texture = card.Symbole1
	symbole_2.texture = card.Symbole2
	label_mid.text = str(card.LabelMid)
	labelNb.text = str(card.LabelNb)

func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
	
func _set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	char_stats.stats_changed.connect(_on_char_stats_changed)


func _on_char_stats_changed() -> void:
	self.playable = char_stats.can_play_card(card)
