extends Node2D

@export var xp_amount = 10

func _on_area_2d_body_entered(body):
	var player_xp = body.get_node("PlayerExperience");
	player_xp.gain_xp(xp_amount)
	queue_free()
