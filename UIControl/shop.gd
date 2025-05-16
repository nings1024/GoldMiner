extends Control

@onready var level_idnex: Control = $ShopTop/TextureRect2/NumberShow
@onready var boom_nums: Control = $ShopTop/TextureRect4/NumberShow
@onready var golds: Control = $ShopTop/NinePatchRect/NumberShow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boom_nums.num=0
	level_idnex.num=1
	GameState.gold_changed.connect(_on_gold_changed)
	call_deferred("_on_gold_changed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gold_changed():
	golds.num=GameState.current_gold

func _on_texture_button_pressed() -> void:
	GameState.time_left=80
	SceneManager.switch_scene("res://main.tscn")
	
