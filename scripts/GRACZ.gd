extends CharacterBody2D
class_name Gracz

@export var Nazwa: String = ""
@export var character_speed: float = 20
@export var multiplier_speed: float = 1
@export var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	GameManager.Postac = Nazwa

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("lewo", "prawo", "gora", "dol")
	velocity = direction * character_speed * multiplier_speed
	move_and_slide()
	handle_animations(direction)

func handle_animations(dir: Vector2) -> void:
	if dir == Vector2.ZERO:
		animated_sprite.play("idle")
		return

	if dir.y < 0:
		animated_sprite.play("gora")
		return
	if dir.y > 0:
		animated_sprite.play("dol")
		return

	if dir.x > 0:
		animated_sprite.play("prawo")
	elif dir.x < 0:
		animated_sprite.play("lewo")
