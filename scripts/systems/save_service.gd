extends Node
class_name SaveService
## Small JSON save service. Save files live in the user data directory.

const SAVE_DIRECTORY := "user://saves"

func save_game(slot_name: String, payload: Dictionary) -> Error:
	if slot_name.is_empty() or slot_name.contains("/") or slot_name.contains("\\"):
		return ERR_INVALID_PARAMETER

	var directory := DirAccess.open("user://")
	if directory == null:
		return ERR_CANT_OPEN
	var make_error := directory.make_dir_recursive("saves")
	if make_error != OK and make_error != ERR_ALREADY_EXISTS:
		return make_error

	var file := FileAccess.open("%s/%s.json" % [SAVE_DIRECTORY, slot_name], FileAccess.WRITE)
	if file == null:
		return FileAccess.get_open_error()
	file.store_string(JSON.stringify(payload, "\t"))
	return OK

func load_game(slot_name: String) -> Dictionary:
	if slot_name.is_empty() or slot_name.contains("/") or slot_name.contains("\\"):
		return {}

	var path := "%s/%s.json" % [SAVE_DIRECTORY, slot_name]
	if not FileAccess.file_exists(path):
		return {}

	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	return parsed if parsed is Dictionary else {}
