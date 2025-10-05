extends CharacterBody2D
class_name Gracz
@export var Nazwa:String = ""
@export var character_speed:float = 1000
@export var multiplier_speed:float = 1
@export var animated_sprite:AnimatedSprite2D
func _ready() -> void:
	GameManager.Postac = Nazwa
	

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("lewo","prawo","gora","dol")
	velocity = direction * character_speed *delta * multiplier_speed
	move_and_slide()
	handle_animations(direction)

func handle_animations(dir):
	if !velocity:
		animated_sprite.play("idle")
	elif dir == Vector2(1,-1) || dir == Vector2(-1,-1) || dir == Vector2(0,-1):
		animated_sprite.play("gora")
	elif dir == Vector2(1,0):
		animated_sprite.play("prawo")
	elif dir == Vector2(-1,0):
		animated_sprite.play("lewo")
	
	elif dir == Vector2(0,1):
		animated_sprite.play("dol")
