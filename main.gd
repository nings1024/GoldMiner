extends Control
@onready var current_gold: Control = $CanvasLayer/UI_Global/CurrentGold/NinePatchRect/NumberShow
@onready var goal_gold: Control = $CanvasLayer/UI_Level/GoalGold/NinePatchRect/NumberShow
@onready var count_down_show: Control = $CanvasLayer/UI_Level/CountdownTime/NinePatchRect/NumberShow
@onready var countdown_timer: Node = $CountdownTimer

func _ready() -> void:
	GameState.gold_changed.connect(_on_gold_changed)
	GameState.goal_changed.connect(_on_goal_changed)
	countdown_timer.time_changed.connect(_on_time_changed)
	countdown_timer.start(GameState.time_left)
	countdown_timer.time_out.connect(_on_time_out)
	call_deferred("_init_ref")

func _on_gold_changed(value: int) -> void:
	if GameState.current_gold>=GameState.goal_gold:
		current_gold.num_color='green'
	current_gold.num=value

func _on_goal_changed(value: int) -> void:
	goal_gold.num=value

func _on_time_changed(value: int) -> void:
	count_down_show.num=value

func _on_time_out() -> void:
	SceneManager.change_scene(ScenePaths.SHOP,{ "pattern": "scribbles", "pattern_leave": "squares" })

	
func _init_ref() -> void:
	goal_gold.num=GameState.goal_gold
	count_down_show.num=GameState.time_left
	current_gold.num=GameState.current_gold
