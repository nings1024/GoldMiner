extends Node

signal gold_changed(value: int)
signal goal_changed(value: int)
signal time_changed(value: int)

var current_gold: int = 0:
	set(value):
		current_gold = value
		emit_signal("gold_changed", value)

var goal_gold: int = 100:
	set(value):
		goal_gold = value
		emit_signal("goal_changed", value)

var time_left: int = 60:
	set(value):
		time_left = value
		emit_signal("time_changed", value)
