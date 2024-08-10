extends CharacterBody2D

var health = 3

@export var speed: int = 150.0

var player

func _ready():
	player = get_tree().get_first_node_in_group("PlayersGroup")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
