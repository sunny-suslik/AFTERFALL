extends Node3D
## Builds a simple greybox test area at runtime. Replace with authored world scenes later.

const PlayerController = preload("res://scripts/player/player.gd")

func _ready() -> void:
	_build_environment()
	_build_test_ground()
	_build_test_structures()
	var player := PlayerController.new()
	player.name = "Player"
	player.position = Vector3(0, 1.2, 5)
	add_child(player)


func _build_environment() -> void:
	var world_environment := WorldEnvironment.new()
	var environment := Environment.new()
	environment.background_mode = Environment.BG_SKY
	var sky := Sky.new()
	var sky_material := ProceduralSkyMaterial.new()
	sky_material.sky_top_color = Color(0.12, 0.18, 0.24)
	sky_material.sky_horizon_color = Color(0.42, 0.43, 0.39)
	sky_material.ground_bottom_color = Color(0.08, 0.09, 0.08)
	sky_material.ground_horizon_color = Color(0.25, 0.24, 0.20)
	sky.sky_material = sky_material
	environment.sky = sky
	environment.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
	environment.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	world_environment.environment = environment
	add_child(world_environment)

	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-48, -32, 0)
	sun.light_energy = 1.1
	sun.shadow_enabled = true
	add_child(sun)


func _build_test_ground() -> void:
	var ground := MeshInstance3D.new()
	var mesh := PlaneMesh.new()
	mesh.size = Vector2(100, 100)
	ground.mesh = mesh
	ground.position.y = -0.1
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.19, 0.20, 0.17)
	material.roughness = 1.0
	ground.material_override = material
	add_child(ground)

	var body := StaticBody3D.new()
	body.name = "GroundCollision"
	var collision := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = Vector3(100, 0.2, 100)
	collision.shape = shape
	collision.position.y = -0.1
	body.add_child(collision)
	add_child(body)


func _build_test_structures() -> void:
	_add_block(Vector3(-8, 1.5, -8), Vector3(5, 3, 5), Color(0.27, 0.29, 0.28))
	_add_block(Vector3(8, 2, -12), Vector3(8, 4, 3), Color(0.31, 0.29, 0.25))
	_add_block(Vector3(0, 0.75, -18), Vector3(12, 1.5, 2), Color(0.22, 0.25, 0.25))


func _add_block(block_position: Vector3, block_size: Vector3, tint: Color) -> void:
	var body := StaticBody3D.new()
	body.position = block_position
	var mesh_instance := MeshInstance3D.new()
	var mesh := BoxMesh.new()
	mesh.size = block_size
	mesh_instance.mesh = mesh
	var material := StandardMaterial3D.new()
	material.albedo_color = tint
	material.roughness = 0.9
	mesh_instance.material_override = material
	body.add_child(mesh_instance)
	var collision := CollisionShape3D.new()
	var shape := BoxShape3D.new()
	shape.size = block_size
	collision.shape = shape
	body.add_child(collision)
	add_child(body)
