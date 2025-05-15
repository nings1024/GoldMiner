extends Area2D
class_name GrabbableItem




@export var item_id: String = "gold_small"
@export_enum("Gold", "Stone", "Mouse", "Bone") var item_type: String = "Gold"
@export var item_name: String = '默认名称'
@export var weight: float = 1.0
@export var value: int = 100
@export var movable: bool = false
@export var grabbed_texture: AtlasTexture



func _ready():
	if movable:
		start_moving()

func start_moving():
	# 可以在这里实现自动移动逻辑（动画、路径、随机漂移等）
	pass

func on_caught():
	queue_free()
