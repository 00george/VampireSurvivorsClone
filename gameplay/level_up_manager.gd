extends Node2D

@onready var ui = $CanvasLayer
@onready var optionsContainer = $CanvasLayer/VFlowContainer
@export var weapons: Array[PackedScene]

var rng = RandomNumberGenerator.new()
var player

func level_up():
	player = GamePlayManager.get_player()
	get_tree().paused = true;
	_create_display()
	ui.show()

func _create_display():
	for i in 3:
		var weapon_idx = rng.randi_range(0, weapons.size() -1)
		var weapon: Node2D = weapons[weapon_idx].instantiate()
		var weapon_panel: PanelContainer = WeaponPanel.init(weapon)
		
		optionsContainer.add_child(weapon_panel)
		weapon_panel.weapon_selected.connect(_on_weapon_selected)

func _on_weapon_selected():
	ui.hide()
	for weapon_option in optionsContainer.get_children():
		optionsContainer.remove_child(weapon_option)
		weapon_option.queue_free()
	get_tree().paused = false
