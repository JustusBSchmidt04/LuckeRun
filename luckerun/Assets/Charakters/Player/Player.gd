class_name Lucke
extends CharacterBody2D

@export var spawn_point: Marker2D
@export var tilemap: TileMapLayer
@export var death: String = "Death"

@export var gravity: float = 700
@export var speed: float = 80
const jump_force = -270

var was_in_air = false  # Tracks if in air

func _ready():
	if not spawn_point:
		spawn_point = get_node("/root/World/Respawnpoint")
	if tilemap == null: 
		tilemap = get_node_or_null("/root/World/Map/Death")
	if spawn_point == null:
		push_error("spawn_point nicht gefunden")
	if tilemap == null:
		push_error("tilemap nicht gefunden")

func _physics_process(delta):
	if tilemap == null:
		return
	
	velocity.y += gravity * delta
	
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		$AnimatedSprite2D.flip_h = true
		
	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	# Animation Logic
	if not is_on_floor():
		if $AnimatedSprite2D.animation != "jump":
			$AnimatedSprite2D.play("jump")
		was_in_air = true
	else:
		if was_in_air:
			# Just landed
			was_in_air = false
			if abs(velocity.x) > 0.1:
				if $AnimatedSprite2D.animation != "walk":
					$AnimatedSprite2D.play("walk")
			else:
				if $AnimatedSprite2D.animation != "default":
					$AnimatedSprite2D.play("default")
		else:
			# Already on ground, decide between walk/default
			if abs(velocity.x) > 0.1:
				if $AnimatedSprite2D.animation != "walk":
					$AnimatedSprite2D.play("walk")
			else:
				if $AnimatedSprite2D.animation != "default":
					$AnimatedSprite2D.play("default")
	
	move_and_slide()
	
	# Death Check
	var used_cells = tilemap.get_used_cells()
	for cell in used_cells:
		if tilemap.map_to_local(cell).distance_to(global_position) < 8:
			respawn()
			push_error("DAMNIT")
	
	var tile_pos: Vector2i = tilemap.local_to_map(global_position)
	var tile_it = tilemap.get_cell_source_id(tile_pos)
	if tile_it != -1:
		push_error("HIER")
		respawn()

func respawn():
	global_position = spawn_point.global_position
	velocity = Vector2.ZERO
	push_error("DEFUCK")
