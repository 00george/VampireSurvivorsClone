extends Node

@onready var sprite = $sprite
@onready var area_2d = $Area2D


func _on_area_2d_body_entered(body):
	sprite.play("open")
	print("Chest: You should treat yourself NOW")
	area_2d.set_collision_mask_value(3, false)
