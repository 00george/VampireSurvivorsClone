extends Node

var experience: float = 0
var level: int = 0
var experience_cap: float = 10
const LEVEL_THRESHOLD_MULTIPLIER = 1.5

@export var player_stats: PlayerStats

func gain_xp(amount : int):
	experience += amount * player_stats.xp_gain
	
	if experience >= experience_cap:
		level += 1
		experience -= experience_cap
		experience_cap *= LEVEL_THRESHOLD_MULTIPLIER
		get_parent().get_parent().get_node("LevelUpManager").level_up()
