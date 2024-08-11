extends Node

@export var animatedSprite: AnimatedSprite2D;
@export var characterBody2D: CharacterBody2D;
@export var player_stats: PlayerStats
var speed: int = 200;

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction == Vector2.LEFT:
		animatedSprite.play("run_left")
	if direction == Vector2.RIGHT:
		animatedSprite.play("run_right")
	if direction == Vector2.UP:
		animatedSprite.play("run_up")
	if direction == Vector2.DOWN:
		animatedSprite.play("run_down")
	if direction < Vector2(-0.5, -0.5):
		animatedSprite.play("run_left")
	if direction > Vector2(0.5, 0.5):
		animatedSprite.play("run_right")
	if direction == Vector2.ZERO:
		animatedSprite.play("idle_down")
		
	characterBody2D.move_and_collide(direction * speed * player_stats.speed * delta)
