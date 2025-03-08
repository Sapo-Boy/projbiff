extends Control

@export var bibliothequeSons: AudioStreamPlayer
@export var BoutonMenuZdJ: Control
 
@onready var MUSIQUE_BUS_ID = AudioServer.get_bus_index("Musique")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("Sfx")

@onready var plein_ecran_check: CheckButton = $MarginContainer/VBoxContainer/GridContainer2/PleinEcranCheck

@onready var musique_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/MusiqueSlider
@onready var sons_slider: HSlider = $MarginContainer/VBoxContainer/GridContainer/SonsSlider


func _ready() -> void:
	#Position par défaut du bouton "Plein écran" / Doit être la même dans l'éditeur ?
	plein_ecran_check.button_pressed = true
	
	#Récupération des informations du fichier settings
	var fs_setting = Settings.get_setting("fullscreen")
	var vm_setting = Settings.get_setting("volumeMusique")
	var vs_setting = Settings.get_setting("volumeSfx")
	
	#Mise à jour des différents sliders/boutton en fonction des réglages dans settings si présent
	if (fs_setting !=null and fs_setting is bool):
		plein_ecran_check.button_pressed = fs_setting
	if (vm_setting !=null and vm_setting is float):
		musique_slider.value = vm_setting
	if (vs_setting !=null and vs_setting is float):
		sons_slider.value = vs_setting

func _on_retour_pressed() -> void:
	bibliothequeSons.SonPresseBouton()
	BoutonMenuZdJ.show()

func _on_plein_ecran_check_toggled(toggled_on: bool) -> void:
	#Stocke la valeur du slider dans "fullscreen" 
	Settings.set_setting("fullscreen", toggled_on)
	#Réglage du mode d'écran en fonction de la valeur du bouton
	if toggled_on:
		get_window().set_mode(Window.MODE_FULLSCREEN)
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
	#Sauvegarde dans le fichier settings
	Settings.save_settings()
	
func _on_musique_slider_value_changed(value: float) -> void:
	#Stocke la valeur du slider dans "volumeMusique" 
	Settings.set_setting("volumeMusique", value)
	#Réglage du bus Musique en fonction de la valeur du slider
	#Passe en mute si la valeur est <0.5
	AudioServer.set_bus_volume_db(MUSIQUE_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIQUE_BUS_ID, value < 0.05)
	#Sauvegarde dans le fichier settings
	Settings.save_settings()

func _on_sons_slider_value_changed(value: float) -> void:
	#Stocke la valeur du slider dans "volumeSfx" 
	Settings.set_setting("volumeSfx", value)
	#Réglage du bus Sfx en fonction de la valeur du slider
	#Passe en mute si la valeur est <0.5
	AudioServer.set_bus_volume_db(SFX_BUS_ID, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS_ID, value < 0.05)
	#Sauvegarde dans le fichier settings
	Settings.save_settings()
