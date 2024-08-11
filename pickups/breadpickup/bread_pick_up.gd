extends Node2D

const AMOUNT = 30.0

func _on_bread_pick_up_collision_body_entered(body):
	var player_health = body.get_node("PlayerHealth");
	if player_health != null:
		player_health.change_health(AMOUNT);
		self.queue_free()