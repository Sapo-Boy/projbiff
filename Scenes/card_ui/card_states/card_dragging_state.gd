extends CardState
@export var bibliothequeSons: AudioStreamPlayer

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	bibliothequeSons.SonCarteDepose()
	if ui_layer:
		card_ui.reparent(ui_layer)

func on_input(event: InputEvent) -> void:
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")

	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
		
	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
		bibliothequeSons.SonCarteErreur()
	elif confirm:
		if Events.oldcardnmb != card_ui.card.typeCardat and Events.oldcardcolor != card_ui.card.typeColorat or Events.playerturn != 0:
			transition_requested.emit(self, CardState.State.BASE)
			print_debug('Wrong Card')
		else:
			if !card_ui.targets.is_empty():
				print(Events.oldcardcolor)
				Events.oldcardnmb = card_ui.card.typeCardat
				Events.oldcardcolor = card_ui.card.typeColorat
				print(Events.oldcardcolor)
				bibliothequeSons.SonCarteDepose()
				get_viewport().set_input_as_handled()
				if (Events.extraschmove == 0) or (Events.nbcardplayed < 5):
					Events.playerturn = 1
					Events.nbcardplayed = Events.nbcardplayed + 1
					Events.extraschmove = Events.nbcardplayed / 5
					Events.emitButtonColor.emit()
					Events.turnchange.emit()
					transition_requested.emit(self, CardState.State.RELEASED)
					Events.checkempty = 0
					
				else:
					Events.extraschmove = Events.extraschmove - 1
					Events.emitButtonColor.emit()
					Events.checkempty = 0
					transition_requested.emit(self, CardState.State.RELEASED)
			else:
				bibliothequeSons.SonCarteErreur()
				transition_requested.emit(self, CardState.State.BASE)
				print_debug('Wrong Drop')
