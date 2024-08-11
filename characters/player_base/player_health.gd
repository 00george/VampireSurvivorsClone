extends Node


signal health_depleted

@export var health = 100.0
@export var main_menu_scene: PackedScene
@export var health_bar: ProgressBar
@export var hurt_box: Area2D

func _ready():
	pass
func _physics_process(delta):
	const DAMAGE_RATE = 20.0
	var overlapping_mobs = hurt_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		health_bar.value = health
		if health <= 0.0:
			get_tree().change_scene_to_packed(main_menu_scene)
			health_depleted.emit()		

func change_health(amount):
	health += amount
	health_bar.value = health
