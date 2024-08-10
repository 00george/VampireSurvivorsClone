@tool
extends Node
var current_scheme = "Default"

func _process(_delta):
	if current_scheme != get_parent().scheme:
		current_scheme = get_parent().scheme
		change_theme(current_scheme)

func change_theme(theme_name):
	var theme = load("res://addons/lan_multiplayer/assets/scheme/"+theme_name+".tres")
	if get_parent().get_node_or_null("Panel"):
		$"../Panel".theme = theme
	for i in $"../host".get_children():
		i.theme = theme
	for i in $"../join".get_children():
		i.theme = theme
	for i in $"../host".get_children():
		i.theme = theme
	for i in $"../room".get_children():
		i.theme = theme
	for i in $"../settings".get_children():
		i.theme = theme
