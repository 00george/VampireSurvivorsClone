extends Node2D

const XPAMOUNT = 20.0

func _on_bread_pick_up_collision_body_entered(body):
	if body.has_method("gain_xp"):
		body.gain_xp(XPAMOUNT)
		self.queue_free()
