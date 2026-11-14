extends Area2D

@export var speed: float = 280.0
var direction: Vector2 = Vector2.ZERO

signal enemy_destroyed

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

	if position.x < -120 or position.x > 1400 or position.y < -120 or position.y > 850:
		queue_free()

func _on_area_entered(other: Area2D) -> void:
	# If this is now a green "W", it destroys Enemies AND incoming red "L"s!
	if is_in_group("W_projectile"):
		if other.is_in_group("enemy"):
			other.queue_free()
			enemy_destroyed.emit()
			queue_free() # The W spends itself destroying the enemy
		elif other.is_in_group("L_hazard"):
			other.queue_free() # Slices right through other red Ls!
