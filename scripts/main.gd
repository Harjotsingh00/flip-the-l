extends Node2D

@export var hazard_scene: PackedScene = preload("res://scenes/hazard_l.tscn")
@onready var player: CharacterBody2D = $Player
@onready var spawn_timer: Timer = $SpawnTimer
@onready var score_label: Label = $ScoreLabel
@onready var camera: Camera2D = $Camera2D

var score: int = 0
var is_game_over: bool = false
var shake_amount: float = 0.0

func _ready() -> void:
	position = Vector2.ZERO
	$Background.position = Vector2.ZERO
	$Camera2D.position = Vector2(640, 360)

	spawn_timer.wait_time = 2.0
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	player.flipped_l.connect(_on_player_flipped_l)
	player.took_damage.connect(_on_player_took_damage)
	player.shake_requested.connect(_on_shake_requested)
	update_ui(3)
	spawn_enemy()
	spawn_enemy()

func _process(delta: float) -> void:
	if is_game_over and Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()

	if shake_amount > 0:
		shake_amount = move_toward(shake_amount, 0, 45.0 * delta)
		camera.offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount))
	else:
		camera.offset = Vector2.ZERO

func _on_shake_requested(strength: float) -> void:
	shake_amount = max(shake_amount, strength)

func _on_spawn_timer_timeout() -> void:
	if is_game_over:
		return
	# Keep 2 to 4 enemies active in the arena
	if get_tree().get_nodes_in_group("enemy").size() < 3:
		spawn_enemy()

func spawn_enemy() -> void:
	var enemy = Area2D.new()
	enemy.add_to_group("enemy")
	# Spawn along the outer edges of the arena
	var margin = 80.0
	var pos = Vector2(randf_range(margin, 1280 - margin), randf_range(margin, 720 - margin))
	while pos.distance_to(player.position) < 280.0:
		pos = Vector2(randf_range(margin, 1280 - margin), randf_range(margin, 720 - margin))
	enemy.position = pos

	# Red Enemy Square with a clear "!" or face label
	var box = ColorRect.new()
	box.size = Vector2(46, 46)
	box.position = Vector2(-23, -23)
	box.color = Color(0.9, 0.2, 0.2, 1.0)
	enemy.add_child(box)

	var lbl = Label.new()
	lbl.text = ">:("
	lbl.add_theme_font_size_override("font_size", 18)
	lbl.position = Vector2(-14, -13)
	enemy.add_child(lbl)

	var col = CollisionShape2D.new()
	var shape = RectangleShape2D.new()	
	shape.size = Vector2(46, 46)
	col.shape = shape
	enemy.add_child(col)

	# Give the enemy its own shoot timer so it fires red "L"s at you!
	var shoot_timer = Timer.new()
	shoot_timer.wait_time = randf_range(1.6, 2.4)
	shoot_timer.autostart = true
	shoot_timer.timeout.connect(func():
		if is_instance_valid(enemy) and not is_game_over:
			fire_l_from(enemy.position)
	)
	enemy.add_child(shoot_timer)
	add_child(enemy)

func fire_l_from(origin: Vector2) -> void:
	var hazard = hazard_scene.instantiate()
	hazard.position = origin
	hazard.direction = (player.position - origin).normalized()
	add_child(hazard)

func _on_player_flipped_l(w_proj: Area2D) -> void:
	score += 5
	spawn_sparks(player.position, Color.GREEN) # Green burst when flipping an L!
	update_ui(player.health)
	w_proj.enemy_destroyed.connect(func():
		score += 50
		spawn_sparks(w_proj.position, Color.ORANGE_RED) # Fiery burst when an enemy explodes!
		_on_shake_requested(12.0)
		update_ui(player.health)
	)


func _on_player_took_damage(health_left: int) -> void:
	update_ui(health_left)
	if health_left <= 0:
		is_game_over = true
		player.hide()
		score_label.text = "GAME OVER! Score: " + str(score) + "  |  Press R to Restart"

func update_ui(hp: int) -> void:
	score_label.text = "Score: " + str(score) + "   |   Lives: " + str(hp) + "   |   Aim with Mouse + Click/Space when Ring turns GOLD!"

func spawn_sparks(pos: Vector2, spark_color: Color) -> void:
	var particles = CPUParticles2D.new()
	particles.position = pos
	particles.emitting = true
	particles.one_shot = true
	particles.explosiveness = 1.0
	particles.amount = 18
	particles.lifetime = 0.45
	particles.spread = 180.0
	particles.initial_velocity_min = 120.0
	particles.initial_velocity_max = 320.0
	particles.scale_amount_min = 4.0
	particles.scale_amount_max = 7.0
	particles.color = spark_color
	add_child(particles)
	# Automatically clean up after playing
	get_tree().create_timer(0.6).timeout.connect(particles.queue_free)
