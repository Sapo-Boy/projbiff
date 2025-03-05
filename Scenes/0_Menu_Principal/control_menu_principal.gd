extends Control



func _on_start_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/1_Zone_De_Jeu/Scene_De_Jeu.tscn")

func _on_quitter_pressed() -> void:
	get_tree().quit()
