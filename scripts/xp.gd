extends Area2D

@export var acceleration: float = 86.0  # Jak szybko przyspiesza
var player: Node2D
var current_speed: float = -50.0
var move: bool = false
var value:int = 1
func _physics_process(delta: float) -> void:
	if not move or player == null:
		return
	
	# Kierunek do gracza
	var direction = (player.global_position - global_position).normalized()
	
	# Przyspiesz (z ujemnej do dodatniej)
	current_speed += acceleration * delta
	
	# Ruch
	global_position += direction * current_speed * delta

func add_exp():
	GameManager.Statystki.add_exp(value)
	queue_free()
