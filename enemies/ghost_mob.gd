extends CharacterBody2D



@export var speed: int = 900.0

var player

func _ready():
	player =  %YoutubePlayer2D

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
