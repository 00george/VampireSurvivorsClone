extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%OptionsMarginContainer/VBoxContainer/Resume.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_fullscreen_pressed():
	var window_mode = DisplayServer.window_get_mode()
	if (window_mode == DisplayServer.WINDOW_MODE_FULLSCREEN):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_resume_pressed():
	get_tree().paused = false
	for menu_node in get_tree().get_first_node_in_group("MenusGroup").get_children():
		menu_node.hide()


func _on_main_menu_pressed():
	get_tree().get_first_node_in_group("LevelsGroup").get_child(0).free()
	var main_menu_node = get_tree().get_first_node_in_group("MenusGroup").get_child(0)
	hide() # hide menu
	main_menu_node.show()
