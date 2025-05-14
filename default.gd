extends StateNode

var rope: Node2D

# Called by a StateMachine once it is ready.
func _state_machine_ready() -> void:
	pass


# Called by a StateMachine when the state is entered.
func _enter_state(old_state, state_data: Dictionary):
	call_deferred('_init_refs')
	

func _init_refs():
	pass
	
func _process(delta: float) -> void:
	owner.init_end.emit()
	

# Called by a StateMachine when the state is exited.
func _exit_state(new_state, state_data: Dictionary):
	pass
