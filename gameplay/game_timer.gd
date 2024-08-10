extends Node

signal tick;

var elapsed_time_seconds = 0
var elapsed_time_minutes = 0

func _on_timer_timeout():
	elapsed_time_seconds += 1;
	if elapsed_time_seconds == 60:
		elapsed_time_minutes += 1
		elapsed_time_seconds = 0 
	tick.emit()
		
func _get_elapsed_time_seconds():
	return elapsed_time_seconds;
	
func _get_elapsed_time_minutes():
	return elapsed_time_minutes;
		
