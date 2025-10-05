extends Area2D

var axe:PackedScene = preload("res://scenes/AXE.tscn") 

func _physics_process(_delta: float) -> void:
	var enemies = get_overlapping_bodies()
	if enemies.size() > 0:
		var target = enemies.front()
		$rotator.look_at(target.global_position)

func _on_timer_timeout() -> void:
	var a = axe.instantiate()
	a.global_position = global_position
	a.rotation_ = $rotator.global_rotation
	get_node("/root/main/Projectiles").add_child(a)
