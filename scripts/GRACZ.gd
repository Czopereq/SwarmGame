extends CharacterBody2D
class_name Gracz
@export var Nazwa:String = ""
@export var character_speed:float = 1000
@export var multiplier_speed:float = 1

func _ready() -> void:
	GameManager.Postac = Nazwa

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("lewo","prawo","gora","dol")
	velocity = direction * character_speed *delta * multiplier_speed
	move_and_slide()
