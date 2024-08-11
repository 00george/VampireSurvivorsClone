class_name WeaponPanel extends Node

signal weapon_selected

const weapon_panel: PackedScene = preload("res://gameplay/weapon_panel.tscn")
static var weapon

static func init(weapon_arg: Node2D):
	weapon = weapon_arg
	var new_weapon_panel = weapon_panel.instantiate()
	var weapon_information = weapon.get_node("Weapon").weapon_information
	
	# Set child nodes
	new_weapon_panel.get_node("MarginContainer/Background/Name").text = weapon_information.weapon_name
	new_weapon_panel.get_node("MarginContainer/Background/Icon").texture = weapon_information.weapon_icon
	new_weapon_panel.get_node("MarginContainer/Background/Description").text = weapon_information.weapon_description
	return new_weapon_panel

func _on_button_pressed():
	var inventory = GamePlayManager.get_player().get_node("Inventory")
	inventory.add_weapon(weapon)
	weapon_selected.emit()
	
