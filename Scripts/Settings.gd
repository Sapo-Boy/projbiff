extends Node

var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()

func load_settings() -> void:
	var err = config.load("user://AppData/LocalLow/CandH/PBIFF/settings.cfg")
	# If the file didn't load, ignore it.
	if err != OK:
		return

func save_settings() -> void:
	config.save("user://AppData/LocalLow/CandH/PBIFF/settings.cfg")

func set_setting(name, value) -> void:
	config.set_value("settings", name, value)

func get_setting(name):
	return config.get_value("settings", name)
