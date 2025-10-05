extends HBoxContainer

var UpgradeScene:PackedScene = preload("res://scenes/UpgradeGUI.tscn")
func fill_upgrades(upgrades):
	var count:int = 0
	for i in upgrades:
		var GUI:TextureRect = UpgradeScene.instantiate()
		GUI.find_child("IMG").texture = DataBase.Upgrades[i]["txt"]
		GUI.find_child("UPGRADE").text = str(i).capitalize()
		GUI.find_child("DESCRIPTION").text = str(DataBase.Upgrades[i][DataBase.Upgrades[i]["lvl"]] + " < "
		+ DataBase.Upgrades[i][DataBase.Upgrades[i]["lvl"] + 1])
