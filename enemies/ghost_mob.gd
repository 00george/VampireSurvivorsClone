extends CharacterBody2D



@export var speed: int = 900.0

var player

func _ready():
	player = get_tree().get_first_node_in_group("PlayersGroup")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
