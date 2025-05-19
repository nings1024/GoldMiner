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
		
@export_enum('white','green','blue') var num_color:String='white'

@onready var h_box_container: HBoxContainer = $Control/HBoxContainer
var num_display:Dictionary={}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var colors=['white','green','blue']
	for color in colors:
		var nums=[]
		for i in range(10):
			nums.append(load("res://UIControl/number_%s/%s.tres"%[color,str(i)]))
		num_display.set(color,nums)
	call_deferred("show_number")	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_number():
	if h_box_container==null:
		return 
	var num_str=str(num)
	var num_len=len(num_str)
	for i in h_box_container.get_children():
		i.queue_free()
	for word in num_str:
		var texture=TextureRect.new()
		texture.texture=num_display[num_color][int(word)]
		h_box_container.add_child(texture)
