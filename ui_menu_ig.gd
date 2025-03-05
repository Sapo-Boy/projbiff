extends Control


func _on_quitter_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/0_Menu_Principal/control_Menu_Principal.tscn")

func _on_option_pressed() -> void:
	pass # Replace with function body.

func _on_musique_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
