extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%MainMenuMarginContainer/VBoxContainer/Start.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	print("Start pressed") # Replace with function body.
	# Instantiate first level and add to 'LevelsGroup' 2D Node
	for menu_node in get_tree().get_first_node_in_group("MenusGroup").get_children():
		menu_node.hide()
	get_tree().paused = false
	get_tree().get_first_node_in_group("LevelsGroup").add_child(load("res://levels/Level1.tscn").instantiate())

func _on_options_pressed():
	print("Options pressed")
	var options_node = get_tree().get_first_node_in_group("MenusGroup").get_child(1)
	hide() # hide menu
	options_node.show()

func _on_exit_pressed():
	get_tree().quit()
