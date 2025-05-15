extends StateNode

var hook_machine: HookMachine
var line: Line2D
var hook: Node2D
var speed := 500.0
var min_length := 50.0

func _enter_state(old_state, state_data: Dictionary) -> void:
	hook_machine = owner as Node2D
	line = hook_machine.get_node("Line2D")
	hook = hook_machine.get_node("HookHead")

func _exit_state(new_state, state_data: Dictionary) -> void:
	pass

func _process(delta: float) -> void:
	var dst = line.get_point_position(1) - Vector2(0, speed * delta)
	if dst.distance_to(line.get_point_position(0)) < min_length:
		hook_machine.swing()
		return
	line.set_point_position(1, dst)
	hook.position = dst
