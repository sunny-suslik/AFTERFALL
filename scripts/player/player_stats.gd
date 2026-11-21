extends Resource
class_name PlayerStats
## Reusable player attributes. UI should listen to the changed signal.

signal changed

@export_range(1.0, 1000.0, 1.0) var max_health: float = 100.0
@export_range(1.0, 1000.0, 1.0) var max_stamina: float = 100.0
@export_range(0.0, 100.0, 0.5) var health: float = 100.0
@export_range(0.0, 100.0, 0.5) var stamina: float = 100.0
@export_range(0.0, 100.0, 0.5) var hunger: float = 100.0
@export_range(0.0, 100.0, 0.5) var thirst: float = 100.0

func apply_damage(amount: float) -> void:
	if amount <= 0.0:
		return
	health = clampf(health - amount, 0.0, max_health)
	changed.emit()

func heal(amount: float) -> void:
	if amount <= 0.0:
		return
	health = clampf(health + amount, 0.0, max_health)
	changed.emit()

func consume_stamina(amount: float) -> bool:
	if amount <= 0.0:
		return true
	if stamina < amount:
		return false
	stamina -= amount
	changed.emit()
	return true

func restore_stamina(amount: float) -> void:
	if amount <= 0.0:
		return
	stamina = clampf(stamina + amount, 0.0, max_stamina)
	changed.emit()

func is_alive() -> bool:
	return health > 0.0
