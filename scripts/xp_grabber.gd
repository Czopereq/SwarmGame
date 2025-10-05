extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Xp"):
		area.move = true

func _on_xp_collector_area_entered(area: Area2D) -> void:
	if area.is_in_group("Xp"):
		area.add_exp()
