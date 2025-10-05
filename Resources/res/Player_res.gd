extends Resource
class_name Staty

@export var MaxHp:int
@export var Hp:int
@export var Xp:float
@export var Speed_multiplayer:float = 1
@export var Xp_multiplayer:float = 1
@export var Level:int = 1
var LevelUp:Array = [10,10,10,10]


func take_damage(amount: int):
	Hp = max(0, Hp - amount)
	if Hp == 0:
		print("Koniec gry")

func heal(amount: int):
	Hp = min(Hp + amount, MaxHp)

func add_exp(amount:int):
	print(Xp)
	Xp += amount * Xp_multiplayer
	if Xp >= LevelUp[Level - 1]:
		Xp = 0
		Level += 1
		return true
	return false
