
extends Node2D
class_name HookMachine

const STATE_SHOOT = "Shoot"
const STATE_RETRACT = "Retract"
const STATE_IDLE = "Idle"


@onready var state_machine: StateMachine = $StateMachine
@onready var line_2d: Line2D = $Line2D
@onready var hook_head: HookHead = $HookHead

var swing_amplitude = 70         # 最大摆动角度（度）
var swing_speed = 2.0            # 摆动速度（频率）
var swing_time = 0.0             # 时间累加器


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shoot():
	state_machine.enter_state(STATE_SHOOT)
	#state_machine.set_state('Shoot')

func retact(state_data: Dictionary):
	state_machine.enter_state(STATE_RETRACT,state_data)
	
func swing():
	hook_head.reset()
	state_machine.set_state(STATE_IDLE)	
