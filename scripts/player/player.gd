extends CharacterBody3D
## Basic player controller for the first AFTERFALL greybox prototype.

@export var walk_speed: float = 4.5
@export var sprint_speed: float = 7.0
@export var jump_velocity: float = 4.5
@export var mouse_sensitivity: float = 0.0025

var gravity: float = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
var camera_pivot: Node3D
var spring_arm: SpringArm3D
var camera: Camera3D
var first_person := false
var mouse_captured := true


func _ready() -> void:
	_build_collision()
	_build_visual()
	_build_camera()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and mouse_captured:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera_pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		camera_pivot.rotation.x = clamp(camera_pivot.rotation.x, deg_to_rad(-65), deg_to_rad(55))
	elif event.is_action_pressed("toggle_camera"):
		_toggle_camera()
	elif event.is_action_pressed("ui_cancel"):
		mouse_captured = not mouse_captured
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if mouse_captured else Input.MOUSE_MODE_VISIBLE


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var input_vector := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (global_transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()
	var speed := sprint_speed if Input.is_action_pressed("sprint") else walk_speed

	if direction.length() > 0.01:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, walk_speed * 8.0 * delta)
		velocity.z = move_toward(velocity.z, 0.0, walk_speed * 8.0 * delta)

	move_and_slide()


func _toggle_camera() -> void:
	first_person = not first_person
	if first_person:
		spring_arm.spring_length = 0.0
		camera.position = Vector3(0, 0, 0.08)
	else:
		spring_arm.spring_length = 4.0
		camera.position = Vector3.ZERO


func _build_collision() -> void:
	var collision := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.38
	capsule.height = 1.8
	collision.shape = capsule
	collision.position.y = 0.9
	add_child(collision)


func _build_visual() -> void:
	var body_mesh := MeshInstance3D.new()
	var capsule_mesh := CapsuleMesh.new()
	capsule_mesh.radius = 0.36
	capsule_mesh.height = 1.75
	body_mesh.mesh = capsule_mesh
	body_mesh.position.y = 0.9
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.32, 0.38, 0.39)
	material.metallic = 0.25
	material.roughness = 0.72
	body_mesh.material_override = material
	add_child(body_mesh)


func _build_camera() -> void:
	camera_pivot = Node3D.new()
	camera_pivot.position.y = 1.55
	add_child(camera_pivot)

	spring_arm = SpringArm3D.new()
	spring_arm.spring_length = 4.0
	spring_arm.margin = 0.2
	camera_pivot.add_child(spring_arm)

	camera = Camera3D.new()
	camera.position = Vector3.ZERO
	camera.fov = 75.0
	spring_arm.add_child(camera)
	camera.current = true
