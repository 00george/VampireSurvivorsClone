extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%OptionsMarginContainer/VBoxContainer/MainMenu.grab_focus()


func _on_mainmenu_pressed():
	var main_menu_node = get_tree().get_first_node_in_group("MenusGroup").get_child(0)
	hide() # hide menu
	main_menu_node.show()


func _on_fullscreen_pressed():
	var window_mode = DisplayServer.window_get_mode()
	if (window_mode == DisplayServer.WINDOW_MODE_FULLSCREEN):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
