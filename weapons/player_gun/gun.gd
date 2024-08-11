extends Area2D

func _physics_process(delta):
	look_at(get_global_mouse_position())
		
func shoot():
	const BULLET = preload("res://weapons/player_gun/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	shoot() # Replace with function body.
