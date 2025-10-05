extends Node2D
class_name EnemySpawner

@export var spawn_interval: float = 2.0 
@export var spawn_distance: float = 800.0

var EnemyScene:PackedScene =preload("res://scenes/enemy.tscn")

func _ready() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	var enemi = EnemyScene.instantiate()
	$PathFollow2D.progress_ratio = randf()
	enemi.global_position = $PathFollow2D.global_position
	get_node("/root/main/Enemy").add_child(enemi)
