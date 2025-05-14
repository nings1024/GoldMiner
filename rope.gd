extends Node2D
@onready var state_machine: StateMachine = $StateMachine
var twenn:Tween
signal init_end

@onready var rope: Node2D = $rope
@onready var line_2d: Line2D = $rope/Line2D
@onready var hook: Node2D = $rope/Hook



var swing_amplitude = 70         # 最大摆动角度（度）
var swing_speed = 2.0            # 摆动速度（频率）
var swing_time = 0.0             # 时间累加器
var is_swinging = true           # 是否正在摆动

@onready var default: StateNode = $StateMachine/default


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_end.connect(_on_default_end)
	


func _on_default_end():
	state_machine.set_state('swing')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		if state_machine.state=='swing':
			state_machine.set_state('forward')
	
