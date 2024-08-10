extends Node


var path_follow : PathFollow2D;
var player
var timer: Timer;

# Called when the node enters the scene tree for the first time.
func _ready():
	path_follow = get_parent().get_node("YoutubePlayer2D/Path2D/PathFollow2D")
	timer = get_node("Timer");
	spawn_mob()


func spawn_mob():
	var coconut_mob = preload("res://enemies/coconut/coconut.tscn").instantiate()
	var snake_mob = preload("res://enemies/snake/snake.tscn").instantiate()
	path_follow.progress_ratio = randf()
	coconut_mob.global_position = path_follow.global_position
	snake_mob.global_position = path_follow.global_position
	add_child(coconut_mob)
	add_child(snake_mob)


func _on_timer_timeout():
	timer.wait_time *= 0.98;
	spawn_mob()
