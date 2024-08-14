extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%MainMenuMarginContainer/VBoxContainer/Start.grab_focus()

func _on_start_pressed():
	var character_select_node = get_tree().get_first_node_in_group("MenusGroup").get_child(3)
	hide()
	character_select_node.show()
	

func _on_options_pressed():
	var options_node = get_tree().get_first_node_in_group("MenusGroup").get_child(1)
	hide() # hide menu
	options_node.show()

func _on_exit_pressed():
	get_tree().quit()
