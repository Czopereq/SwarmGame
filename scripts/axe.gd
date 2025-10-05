extends CharacterBody2D

var dir:Vector2
var speed:float = 140
var rotation_

func _init() -> void:
	dir = Vector2.RIGHT.rotated(rotation_)

func _physics_process(delta: float) -> void:
	rotation_degrees += 540 * delta
	velocity = dir * speed
	move_and_slide()
