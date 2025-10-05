extends Node

var Statystki:Staty
var Postac:String:
	set(value):
		Postac = value
		AddStatsToCharacter()
var GameStarted:bool = true

func _ready() -> void:
	SelectPlayer("res://scenes/Log_character_1.tscn")

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
