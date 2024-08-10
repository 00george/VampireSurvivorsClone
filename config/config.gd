extends Node

var config

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://config/difficulty.json", FileAccess.READ);
	var content = file.get_as_text();
	config = JSON.parse_string(content);


func _get_spawn_rate(currentMinute: int):
	var spawn_rate = config["spawn_rate_curve"][currentMinute]
	return spawn_rate;
