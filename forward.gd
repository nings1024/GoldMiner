extends StateNode

var rope: Node2D 
var line: Line2D
var hook: Node2D
var speed=500.0
# Called by a StateMachine once it is ready.
func _state_machine_ready() -> void:
	pass


# Called by a StateMachine when the state is entered.
func _enter_state(old_state, state_data: Dictionary):
	rope=owner.rope
	line=owner.line_2d
	hook=owner.hook


# Called by a StateMachine when the state is exited.
func _exit_state(new_state, state_data: Dictionary):
	pass

func _process(delta: float) -> void:
	var dst=line.get_point_position(1)+Vector2(0,speed*delta)
	line.set_point_position(1,dst)	
	hook.position=dst
	
