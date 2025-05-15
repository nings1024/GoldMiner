extends Node2D
class_name Player
@onready var hook_machine: HookMachine = $HookMachine




func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func shoot():
	hook_machine.shoot()
