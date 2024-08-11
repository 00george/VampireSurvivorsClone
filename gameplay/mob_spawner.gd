extends Node

var path_follow : PathFollow2D;
var player
var timer: Timer;

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	path_follow = get_parent().get_node("YoutubePlayer2D/Path2D/PathFollow2D")
	spawn_mob()


func spawn_mob():
	var coconut_mob = preload("res://enemies/coconut/coconut.tscn").instantiate()
	var snake_mob = preload("res://enemies/snake/snake.tscn").instantiate()
	path_follow.progress_ratio = randf()
	coconut_mob.global_position = path_follow.global_position
	snake_mob.global_position = path_follow.global_position
	get_parent().add_child.call_deferred(coconut_mob)
	get_parent().add_child.call_deferred(snake_mob)


func _on_timer_timeout():
	var wait_time = Config.get_spawn_rate(GameTimer._get_elapsed_time_minutes())
	if (timer.wait_time != wait_time):
		timer.wait_time = wait_time;
	var spawn_size = Config.get_spawn_size(GameTimer._get_elapsed_time_minutes())
	for n in spawn_size:
		spawn_mob()
