extends CardState

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
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
	elif confirm:
		if Events.oldcardnmb != card_ui.card.typeCardat and Events.oldcardcolor != card_ui.card.typeColorat:
			transition_requested.emit(self, CardState.State.BASE)
		else:
			print(Events.oldcardcolor)
			Events.oldcardnmb = card_ui.card.typeCardat
			Events.oldcardcolor = card_ui.card.typeColorat
			print(Events.oldcardcolor)
			get_viewport().set_input_as_handled()
			transition_requested.emit(self, CardState.State.RELEASED)
