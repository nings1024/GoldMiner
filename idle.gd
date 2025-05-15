extends StateNode

# 摆动参数
var swing_amplitude = 90         # 最大摆动角度（度）
var swing_speed = 2.0            # 摆动速度（频率）
var swing_time = 0.0             # 时间累加器
var rope: Node2D 

# Called by a StateMachine when the state is entered.
func _enter_state(old_state, state_data: Dictionary):
	swing_amplitude=owner.swing_amplitude
	swing_speed=owner.swing_speed
	swing_time=owner.swing_time


# Called by a StateMachine when the state is exited.
func _exit_state(new_state, state_data: Dictionary):
	owner.swing_time=swing_time

func _process(delta: float) -> void:
		swing_time += delta
		owner.rotation_degrees = sin(swing_time * swing_speed) * swing_amplitude
