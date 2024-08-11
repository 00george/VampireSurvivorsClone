extends Control

@export var character_scenes: Array[PackedScene];

const characters = ['George', 'Becky', 'Chris']
const icon_animated_sprite_paths = {
	'Becky': "res://assets/becky_player/character_selection.tres",
	'Chris': "res://assets/chris_player/character_selection.tres",
}  

@onready var music = $"../../Music"

# Called when the node enters the scene tree for the first time.
func _ready():
	for character in characters:
		print(character)
		print(icon_animated_sprite_paths.get(character))
		%CharacterList.add_item(character, load(icon_animated_sprite_paths.get(character, "res://assets/sprites/happy_boo/square_ref.png")))

func _on_start_pressed():
	var selected_items = %CharacterList.get_selected_items()
	if selected_items.size() > 0:
		# Instantiate first level and add to 'LevelsGroup' 2D Node
		for menu_node in get_tree().get_first_node_in_group("MenusGroup").get_children():
			menu_node.hide()
		music.stop()
		GamePlayManager.set_player(character_scenes[selected_items[0]].instantiate())
		get_tree().paused = false
		get_tree().get_first_node_in_group("LevelsGroup").add_child(load("res://levels/Level1.tscn").instantiate())
