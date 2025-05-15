extends Node
@export var time_left: float = 60.0  # 倒计时秒数
var running := false

signal timeout

func _ready():
	GameState.time_left=ceil(time_left)
	running=true

func _process(delta: float) -> void:
	if running and time_left > 0:
		time_left -= delta
		GameState.time_left=ceil(time_left)
		if time_left <= 0:
			time_left = 0
			running = false
			emit_signal("timeout")

		
