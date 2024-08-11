extends Node2D

@onready var ui = $CanvasLayer
@onready var buttonContainer = $CanvasLayer/HFlowContainer
@export var weapons: Array[PackedScene]

var rng = RandomNumberGenerator.new()
var player

func level_up(player_arg: Node2D):
	player = player_arg
	get_tree().paused = true;
	_create_display()
	ui.show()
	
func _create_display():
	for i in 3:
		var weapon_idx = rng.randi_range(0, weapons.size() -1)
		var weapon: Node2D = weapons[weapon_idx].instantiate()
		var button = Button.new();
		button.text = weapon.get_node("Weapon").weapon_information.weapon_name;
		button.process_mode = Node.PROCESS_MODE_ALWAYS
		
		button.custom_minimum_size = Vector2(50,50)
		button.pressed.connect(_add_weapon_to_inventory.bind(weapon))
		buttonContainer.add_child(button)
		
func _add_weapon_to_inventory(weapon: Node2D):
	var inventory = player.get_node("Inventory")
	inventory.add_weapon(weapon)
	ui.hide();
	
	for button in buttonContainer.get_children():
		buttonContainer.remove_child(button)
		button.queue_free()
		
	get_tree().paused = false;
