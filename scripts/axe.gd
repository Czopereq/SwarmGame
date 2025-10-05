extends CharacterBody2D

var dir:Vector2
var speed:float = 45
var rotation_
var dmg:int = 1

func _ready() -> void:
	dir = Vector2.RIGHT.rotated(rotation_)

func _physics_process(delta: float) -> void:
	rotation_degrees += 540 * delta
	velocity = dir * speed
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(dmg)
		queue_free()
