extends Marker2D

var axe:PackedScene = preload("res://scenes/AXE.tscn") 


func _on_timer_timeout() -> void:
	var a = axe.instantiate()
	a.global_position = global_position
	a.rotation_ = rotation
	print("axe")
	add_child(a)
