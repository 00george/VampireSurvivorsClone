extends CharacterBody2D

@export var health = 2
@export var speed = 150

var player
@onready var sprite = $sprite

func _ready():
	player = GamePlayManager.get_player()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	
	if direction.x < 0:
		sprite.flip_h = true
	elif direction.x > 0:
		sprite.flip_h = false

	velocity = direction * speed
	move_and_collide(direction * speed * delta)

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		
		const XP_ORB = preload("res://gameplay/xp_orb.tscn")
		var xp_orb = XP_ORB.instantiate()
		
		get_parent().add_child.call_deferred(xp_orb)
		get_parent().add_child.call_deferred(smoke)

		smoke.global_position = global_position
		xp_orb.global_position = global_position
