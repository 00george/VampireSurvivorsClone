extends Node

@export var player: Node2D

func add_weapon(weapon: Node2D):
    player.add_child(weapon)

