extends Control

@export var num:int=0:
	set(v):
		num=v
		call_deferred("show_number")
	get():
		return num
@export var rect_size:int=2:
	set(v):
		if v<=2:
			v=2
		rect_size=2
		call_deferred("change_nine_patch")
	get():
		return rect_size


@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var h_box_container: HBoxContainer = $Control/HBoxContainer
var num_display:Array=[]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10):
		num_display.append(load("res://UIControl/number_white/"+str(i)+".tres"))
	call_deferred("change_nine_patch")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_nine_patch():
	nine_patch_rect.size=Vector2(rect_size*66,nine_patch_rect.size.y)
	
func show_number():
	var num_str=str(num)
	var num_len=len(num_str)
	if num_len>7:
		nine_patch_rect.size=Vector2(((num_len/8)+1)*230,nine_patch_rect.size.y)
	for i in h_box_container.get_children():
		i.queue_free()
	for word in num_str:
		var texture=TextureRect.new()
		texture.texture=num_display[int(word)]
		h_box_container.add_child(texture)
