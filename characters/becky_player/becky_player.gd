extends CharacterBody2D

signal health_depleted

var health = 100.0
var animatedSprite: AnimatedSprite2D;
@export var main_menu_scene: PackedScene

func _ready():
	animatedSprite = get_node("AnimatedSprite")

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 200
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
		
	const DAMAGE_RATE = 20.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%HealthBar.value = health
		if health <= 0.0:
			get_tree().change_scene_to_packed(main_menu_scene)
			health_depleted.emit()

	move_and_slide()
		

