extends Node

var Statystki:Staty
var Postac:String:
	set(value):
		Postac = value
		AddStatsToCharacter()
var GameStarted:bool = true

func _ready() -> void:
	SelectPlayer("res://scenes/Log_character_1.tscn")
	ChooseCard()

func SelectPlayer(value:String):
	# Jezeli kliknalem play
	if GameStarted:
		# Dodaje gracza do sceny
		var player = load(value).instantiate()
		player.position = Vector2(
			540,
			330
		)
		get_node("/root/main").add_child(player)
		# Zaczyna się gra
		GameStart()

func GameStart():
	Statystki = Staty.new()
	   
func AddStatsToCharacter():
	Statystki.MaxHp = DataBase.Data[Postac]["Hp"]
	Statystki.Hp = Statystki.MaxHp

func ChooseCard():
	RandomCards()

func RandomCards():
	var available:Array = []
	var chosen:Array = []
	for upgrade in DataBase.Upgrades:
		if DataBase.Upgrades[upgrade]["lvl"] == 5:
			pass
		available.append(upgrade)
	var count = min(3, available.size())
	while chosen.size() < count:
		var pick = available[
			randi() % available.size()
			]
		if pick not in chosen:
			chosen.append(pick)
	
	return chosen
