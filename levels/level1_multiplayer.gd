extends Node2D

@export var player_scene: PackedScene
@export var ipBox : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_host_pressed():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_server(9090)
	if error:
		return error
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()


func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)

func _on_join_pressed():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(ipBox.text, 9090)
	if error:
		return error
	multiplayer.multiplayer_peer = peer
