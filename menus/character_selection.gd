extends Control

const characters = ['George', 'Becky']
const sprite_path = "res://assets/sprites/happy_boo/square_ref.png"
# Called when the node enters the scene tree for the first time.
func _ready():
	for character in characters:
		%CharacterList.add_item(character, load("res://assets/sprites/happy_boo/square_ref.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	# Instantiate first level and add to 'LevelsGroup' 2D Node
	for menu_node in get_tree().get_first_node_in_group("MenusGroup").get_children():
		menu_node.hide()
	get_tree().paused = false
	get_tree().get_first_node_in_group("LevelsGroup").add_child(load("res://levels/Level1.tscn").instantiate())
