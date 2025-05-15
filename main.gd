extends Control
@onready var count_down_show: Control = $CanvasLayer/CountDownShow
@onready var current_gold: Control = $CanvasLayer/CurrentGold
@onready var goal_gold: Control = $CanvasLayer/GoalGold

func _ready() -> void:
	GameState.gold_changed.connect(_on_gold_changed)
	GameState.time_changed.connect(_on_time_changed)


func _on_gold_changed(value: int) -> void:
	current_gold.num=value

func _on_goal_changed(value: int) -> void:
	goal_gold.num=value

func _on_time_changed(value: int) -> void:
	count_down_show.num=value
