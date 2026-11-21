extends Node
class_name SettingsService
## Persistent user settings stored in user://settings.cfg.

const SETTINGS_PATH := "user://settings.cfg"

func save_value(section: String, key: String, value: Variant) -> Error:
	var config := ConfigFile.new()
	var load_error := config.load(SETTINGS_PATH)
	if load_error != OK and load_error != ERR_FILE_NOT_FOUND:
		return load_error
	config.set_value(section, key, value)
	return config.save(SETTINGS_PATH)

func get_value(section: String, key: String, default_value: Variant = null) -> Variant:
	var config := ConfigFile.new()
	if config.load(SETTINGS_PATH) != OK:
		return default_value
	return config.get_value(section, key, default_value)
