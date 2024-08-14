extends CharacterBody2D

var health = 5

var player

func _ready():
	player = get_tree().get_first_node_in_group("PlayersGroup")
	$Slime.play_walk()

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 150.0
	move_and_slide()

func take_damage():
	health -= 1
	$Slime.play_hurt()
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://effects/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
