extends StateNode

# 摆动参数
var swing_amplitude = 90         # 最大摆动角度（度）
var swing_speed = 2.0            # 摆动速度（频率）
var swing_time = 0.0             # 时间累加器
var rope: Node2D 

# Called by a StateMachine when the state is entered.
func _enter_state(old_state, state_data: Dictionary):
	rope= owner.rope
	swing_amplitude=owner.swing_amplitude
	swing_speed=owner.swing_speed
	swing_time=owner.swing_time
	reset_swing_from_current()


# Called by a StateMachine when the state is exited.
func _exit_state(new_state, state_data: Dictionary):
	owner.swing_time=swing_time

func _process(delta: float) -> void:
		swing_time += delta
		rope.rotation_degrees = sin(swing_time * swing_speed) * swing_amplitude

func reset_swing_from_current():
	# 让当前角度无缝进入 sin 曲线：通过反解 sin(t)
	var current_angle = rope.rotation_degrees
	var clamped = clamp(current_angle / swing_amplitude, -1.0, 1.0)
	swing_time = asin(clamped) / swing_speed
