extends Node2D

func _ready():
    get_parent().add_child.call_deferred(GamePlayManager.get_player())