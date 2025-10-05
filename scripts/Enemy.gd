extends CharacterBody2D
class_name Enemy

@export var enemy_name: String = "Mob"
@export var max_hp: int = 5
@export var speed: float = 7
@export var damage: int = 3
@export var xp_reward: int = 1

var XpScene = preload("res://scenes/Xp.tscn")
var current_hp: int
var player: Node2D = null

func _ready() -> void:
	current_hp = max_hp
	add_to_group("enemies")
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	if player == null:
		return
	
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()


func take_damage(amount: int) -> void:
	current_hp -= amount
	# Dodaj efekt trafienia!!!!
	if current_hp <= 0:
		die()

func die() -> void:
	var xp = XpScene.instantiate()
	xp.global_position = global_position
	xp.player = player
	xp.value = xp_reward
	get_tree().get_child("XP").add_child(xp)
	queue_free()
