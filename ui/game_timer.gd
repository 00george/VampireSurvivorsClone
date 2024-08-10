extends Control

var time_elapsed_seconds = 0;

func _on_timer_timeout():
	time_elapsed_seconds += 1;
	var minutes = floor(time_elapsed_seconds / 60);
	var remaining_seconds = time_elapsed_seconds - (minutes * 60)
	$RichTextLabel.text = "%02d:%02d" % [minutes, remaining_seconds]
