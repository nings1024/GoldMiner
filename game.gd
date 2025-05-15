extends Node2D
@onready var player_1: Player = $Player
@onready var player_2: Player = $Player2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("down"):
		player_1.shoot()
	if event.is_action_pressed("ui_down"):
		player_2.shoot()
