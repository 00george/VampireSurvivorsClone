extends Node

#Functions for you: func_and_sync()

@export_category("Settings")
@export_group("Fix Bugs")
@export var camera_path: NodePath
@export_group("Sync Properties")
@export var nodes: Array[NodePath]
@export var properties: Array[String]
@export var sync_once: Array[bool]
@export_group("Sync Functions")
@export var Nodes: Array[NodePath]
@export var functions: Array[String]

#AUTHORITY AND CONNECTION CONTROL
func _enter_tree():
	get_parent().set_multiplayer_authority(get_parent().name.to_int())

func _ready():
	set_process(false)
	
	if not get_parent().is_multiplayer_authority():
		for i in Nodes.size():
			if get_node(Nodes[i]).has_method("_process"):
				get_node(Nodes[i]).call_deferred("set_process", false)
			if get_node(Nodes[i]).has_method("_physics_process"):
				get_node(Nodes[i]).call_deferred("set_physics_process", false)
		for i in nodes.size():
			if get_node(nodes[i]).has_method("_process"):
				get_node(nodes[i]).call_deferred("set_process", false)
			if get_node(nodes[i]).has_method("_physics_process"):
				get_node(nodes[i]).call_deferred("set_physics_process", false)
		if get_node_or_null(camera_path):
			get_node_or_null(camera_path).queue_free()

func _on_update_for_new_player():
	synchronize_once()
	set_process(true)

func _on_server_disconnected():
	set_process(false)

#PROPERTIES SYNC
func synchronize_once():
	if get_parent().is_multiplayer_authority():
		for i in nodes.size():
			if sync_once[i] == true:
				rpc("reliable", nodes[i], properties[i], get_node(nodes[i])[properties[i]])

func _process(_delta):
	if get_parent().is_multiplayer_authority():
		for i in nodes.size():
			if sync_once[i] == false:
				rpc("unreliable", nodes[i], properties[i], get_node(nodes[i])[properties[i]])

@rpc("any_peer", "call_remote", "reliable", 0)
func reliable(node_path, property, value):
	get_node(node_path)[property] = value

@rpc("any_peer", "call_remote", "unreliable", 1)
func unreliable(node_path, property, value):
	get_node(node_path)[property] = value

#FUNCTIONS SYNC
func func_and_sync(function_name, v1=null, v2=null, v3=null, v4=null, v5=null, v6=null, v7=null, v8=null):
	if get_parent().is_multiplayer_authority():
		rpc("function", function_name, v1, v2, v3, v4, v5, v6, v7, v8)

@rpc("any_peer", "call_local", "reliable", 2)
func function(function_name, v1=null, v2=null, v3=null, v4=null, v5=null, v6=null, v7=null, v8=null):
	var array = []
	for i in [v1, v2, v3, v4, v5, v6, v7, v8]:
		if i != null:
			array.append(i)
	for i in functions.size():
		if functions[i] == function_name:
			get_node(Nodes[i]).callv(function_name, array)
