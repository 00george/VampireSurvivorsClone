extends Node2D

const AMOUNT = 30.0

func _on_bread_pick_up_collision_body_entered(body):
	if body.has_method("change_health"):
		body.change_health(AMOUNT)
		self.queue_free()
