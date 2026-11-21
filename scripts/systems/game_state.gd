extends Node
## Shared runtime state. Keep gameplay rules independent from scene presentation.

signal player_health_changed(current: float, maximum: float)

var player_health: float = 100.0
var player_max_health: float = 100.0
var player_energy: float = 100.0
var player_experience: int = 0
var player_level: int = 1

func set_player_health(value: float) -> void:
	player_health = clampf(value, 0.0, player_max_health)
	player_health_changed.emit(player_health, player_max_health)
