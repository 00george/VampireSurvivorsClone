extends Node

var experience: float = 0;
@export var player_stats: PlayerStats

func gain_xp(amount : int):
	experience += amount * player_stats.xp_gain
	print("Experience:" + str(experience))
