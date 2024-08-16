extends Node

var config

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://config/difficulty.json", FileAccess.READ);
	var content = file.get_as_text();
	var json = JSON.new()
	var error = json.parse(content);
	if error == OK:
		config = json.data
		print("Read config")
		print(config)
	else:
		print("There was a error")
		print(json.get_error_message())


func get_spawn_rate(currentMinute: int):
	var spawn_rate = config["spawn_rate_curve"][str(currentMinute)]
	return spawn_rate;

func get_spawn_monsters(currentMinute: int):
	var spawn_monsters = config["monsters_spawn_curve"][str(currentMinute)]
	return spawn_monsters;

func get_spawn_size(currentMinute: int):
	var spawn_size = config["spawn_size_curve"][str(currentMinute)]
	return spawn_size;
