extends CharacterBody2D

@export var move_speed: float = 400.0
@export var recoil_force: float = 650.0
@export var friction: float = 1200.0

var recoil_velocity: Vector2 = Vector2.ZERO
var health: int = 3
var l_in_range: bool = false
var flash_timer: float = 0.0

@onready var parry_zone: Area2D = $ParryZone
@onready var hurt_box: Area2D = $HurtBox
@onready var visual: ColorRect = $ColorRect
@onready var flip_sound: AudioStreamPlayer2D = $FlipSound
@onready var hurt_sound: AudioStreamPlayer2D = $HurtSound
@onready var boom_sound: AudioStreamPlayer2D = $BoomSound


signal flipped_l(w_projectile: Area2D)
signal took_damage(health_left: int)
signal shake_requested(strength: float)

func _ready() -> void:
	hurt_box.area_entered.connect(_on_hurt_box_area_entered)

func _process(delta: float) -> void:
	if flash_timer > 0:
		flash_timer -= delta

	l_in_range = false
	for area in parry_zone.get_overlapping_areas():
		if area.is_in_group("L_hazard"):
			l_in_range = true
			break
	queue_redraw()

func _draw() -> void:
	var ring_col = Color.GOLD if l_in_range else Color(0.3, 0.8, 1.0, 0.4)
	if flash_timer > 0:
		ring_col = Color.WHITE
	draw_arc(Vector2.ZERO, 75.0, 0, TAU, 36, ring_col, 3.5)

	var aim_dir = to_local(get_global_mouse_position()).normalized()
	var line_col = Color(0.2, 1.0, 0.4, 0.85) if l_in_range else Color(1, 1, 1, 0.15)
	draw_line(Vector2.ZERO, aim_dir * 130.0, line_col, 2.5)


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_select") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		flash_timer = 0.12
		try_flip_l()

	# Smooth WASD / Arrow movement + Recoil bounce back
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	recoil_velocity = recoil_velocity.move_toward(Vector2.ZERO, friction * delta)
	velocity = (input_dir * move_speed) + recoil_velocity

	var collision = move_and_collide(velocity * delta)
	if collision:
		recoil_velocity = recoil_velocity.bounce(collision.get_normal())

func try_flip_l() -> void:
	for area in parry_zone.get_overlapping_areas():
		if area.is_in_group("L_hazard"):
			var aim_dir = (get_global_mouse_position() - global_position).normalized()

			# 1. Flip the red "L" into a fast green "W" aimed at your mouse!
			area.remove_from_group("L_hazard")
			area.add_to_group("W_projectile")
			area.global_position = global_position + (aim_dir * 30.0)
			area.direction = aim_dir
			area.speed = 850.0
			var lbl = area.get_node_or_null("Label")
			if lbl:
				lbl.text = "W"
				lbl.modulate = Color.GREEN

			# 2. Bounce the player backward from the recoil!
			recoil_velocity = -aim_dir * recoil_force
			visual.color = Color.GREEN
			flipped_l.emit(area)
			flip_sound.pitch_scale = randf_range(0.95, 1.15)
			flip_sound.play()
			area.enemy_destroyed.connect(func():
				boom_sound.pitch_scale = randf_range(0.9, 1.1)
				boom_sound.play()
			)

			shake_requested.emit(7.0)
			await get_tree().create_timer(0.15).timeout
			visual.color = Color.WHITE
			break

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("L_hazard"):
		area.queue_free()
		health -= 1
		visual.color = Color.RED
		took_damage.emit(health)
		hurt_sound.play()

		shake_requested.emit(14.0)
		await get_tree().create_timer(0.15).timeout
		visual.color = Color.WHITE
