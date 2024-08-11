extends Node

@onready var sprite = $sprite
@onready var area_2d = $Area2D
@onready var ui = $CanvasLayer
@export var buttonContainer: HFlowContainer
@export var weapons: Array[PackedScene]
var rng = RandomNumberGenerator.new()
var player


func _on_area_2d_body_entered(body):
	player = body;
	sprite.play("open")
	get_tree().paused = true;
	_create_buttons();
	ui.show()
	area_2d.set_collision_mask_value(3, false)

func _create_buttons():
	for i in 3:
		var weapon_idx = rng.randi_range(0, weapons.size() -1)
		var weapon: Node2D = weapons[weapon_idx].instantiate()
		var button = Button.new();
		button.text = weapon.get_node("Weapon").weapon_information.weapon_name;
		button.custom_minimum_size = Vector2(50,50)
		button.pressed.connect(_add_weapon_to_invetory.bind(weapon))
		buttonContainer.add_child(button)

func _add_weapon_to_invetory(weapon: Node2D):
	var inventory = player.get_node("Inventory")
	inventory.add_weapon(weapon)
	ui.hide();
	get_tree().paused = false;
