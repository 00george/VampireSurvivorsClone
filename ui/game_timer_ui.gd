extends Control

func _ready():
	GameTimer.tick.connect(on_tick)

func on_tick():
	$RichTextLabel.text = "%02d:%02d" % [GameTimer.elapsed_time_minutes, GameTimer.elapsed_time_seconds]
