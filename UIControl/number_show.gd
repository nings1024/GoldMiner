extends Control

@export var num:int=0:
	set(v):
		num=v
		call_deferred("show_number")
	get():
		return num
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var h_box_container: HBoxContainer = $HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_number():
	var num_str=str(num)
	var num_len=len(num_str)
	nine_patch_rect.size=nine_patch_rect.size+Vector2.RIGHT*16
