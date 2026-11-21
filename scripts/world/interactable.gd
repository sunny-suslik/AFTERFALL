extends Node3D
class_name WorldInteractable
## Base class for doors, loot containers, switches and other usable objects.

signal interaction_requested(actor: Node)

@export var interaction_text: String = "Взаимодействовать"
@export var is_enabled: bool = true

func can_interact(_actor: Node) -> bool:
	return is_enabled

func interact(actor: Node) -> void:
	if not can_interact(actor):
		return
	interaction_requested.emit(actor)
