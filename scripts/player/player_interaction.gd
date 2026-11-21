extends Node
class_name PlayerInteraction
## Ray-based interaction helper. Add as a child of the player and assign a Camera3D.

@export var camera: Camera3D
@export_range(1.0, 8.0, 0.1) var reach: float = 2.5

func get_target() -> WorldInteractable:
	if camera == null:
		return null

	var origin := camera.global_position
	var end := origin + (-camera.global_transform.basis.z * reach)
	var query := PhysicsRayQueryParameters3D.create(origin, end)
	query.exclude = _get_excluded_rids()
	var result := camera.get_world_3d().direct_space_state.intersect_ray(query)
	if result.is_empty():
		return null

	var collider: Object = result.get("collider")
	while collider != null:
		if collider is WorldInteractable:
			return collider as WorldInteractable
		if collider is Node:
			collider = (collider as Node).get_parent()
		else:
			break
	return null

func try_interact(actor: Node) -> bool:
	var target := get_target()
	if target == null or not target.can_interact(actor):
		return false
	target.interact(actor)
	return true

func _get_excluded_rids() -> Array[RID]:
	var excluded: Array[RID] = []
	var parent := get_parent()
	if parent is CollisionObject3D:
		excluded.append((parent as CollisionObject3D).get_rid())
	return excluded
