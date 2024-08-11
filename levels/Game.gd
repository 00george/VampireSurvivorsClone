extends Node2D

class_name GameManager

func _input(event : InputEvent):
	# If escape pressed and we are in a level (levelsgroup has nodes) then pause the game and bring up pause menu
	# Avoids bringing up pause menu when not in a level
	if(event.is_action_pressed("game_pause") and get_tree().get_first_node_in_group("LevelsGroup").get_child_count() > 0):
		if get_tree().paused == true && get_tree().get_first_node_in_group("MenusGroup").get_child(2).visible == false:
			return;
		print(get_tree().get_first_node_in_group("MenusGroup").get_child_count())
		var paused_current = get_tree().paused
		get_tree().paused = !paused_current
		get_tree().get_first_node_in_group("MenusGroup").get_child(2).set_visible(!paused_current)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
