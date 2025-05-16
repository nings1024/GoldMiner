extends Node

signal time_changed(time_left: int)
signal time_out()

var time_left: int = 60:
	set(value):
		time_left = value
		emit_signal("time_changed", time_left)

var _timer := Timer.new()

func _ready():
	_timer.wait_time = 1.0
	_timer.one_shot = false
	_timer.timeout.connect(_on_timer_tick)
	add_child(_timer)

func start(time: int):
	time_left = time
	_timer.start()

func stop():
	_timer.stop()

func is_running() -> bool:
	return _timer.is_stopped() == false

func _on_timer_tick():
	time_left -= 1
	if time_left <= 0:
		time_left = 0
		stop()
		emit_signal("time_out")
