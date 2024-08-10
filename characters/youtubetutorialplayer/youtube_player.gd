extends CharacterBody2D

signal health_depleted

var health = 100.0
@export var is_local: bool = false

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if is_multiplayer_authority() || is_local:
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		velocity = direction * 200
		if velocity.length() > 0.0:
			%HappyBoo.play_walk_animation()
		else:
			%HappyBoo.play_idle_animation()
		
		
		const DAMAGE_RATE = 20.0
		var overlapping_mobs = %HurtBox.get_overlapping_bodies()
		if overlapping_mobs.size() > 0:
			health -= DAMAGE_RATE * overlapping_mobs.size() * delta
			%HealthBar.value = health
			if health <= 0.0:
				queue_free()
				health_depleted.emit()

	move_and_slide()
		

