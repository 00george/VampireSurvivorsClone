extends Node


@export var path_follow : PathFollow2D;
var timer: Timer;

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer");
	spawn_mob()


func spawn_mob():
	var ghost_mob = preload("res://enemies/ghostmob/ghost_mob.tscn").instantiate()
	var slime_mob = preload("res://enemies/slime/slime.tscn").instantiate()
	path_follow.progress_ratio = randf()
	ghost_mob.global_position = path_follow.global_position
	slime_mob.global_position = path_follow.global_position
	add_child(ghost_mob)
	add_child(slime_mob)


func _on_timer_timeout():
	timer.wait_time *= 0.98;
	spawn_mob()
