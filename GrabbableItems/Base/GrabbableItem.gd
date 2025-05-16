extends Area2D
class_name GrabbableItem




@export var item_id: String = "gold_small"
@export_enum("Gold", "Stone", "Mouse", "Bone") var item_type: String = "Gold"
@export var item_name: String = '默认名称'
@export var weight: float = 1.0
@export var value: int = 100
@export var movable: bool = false
@export var grabbed_texture: AtlasTexture
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var path_node_name: String = "Path2D" # 可配置路径名称
@export var move_speed: float = 50.0 # 单位：像素/秒

var going_forward := true
var path_follow: PathFollow2D

func _ready():
	if movable:
		start_moving()

func start_moving():
	# 在父节点中查找 Path2D
	var parent = get_parent()
	var path_node := parent.get_node_or_null(path_node_name)

	if path_node == null or not path_node is Path2D:
		printerr("未找到路径节点: ", path_node_name)
		return
	
	# 创建 PathFollow2D 并挂到 Path2D 下
	path_follow = PathFollow2D.new()
	path_node.add_child(path_follow)
	path_follow.loop = false
	self.reparent(path_follow)
	position = Vector2.ZERO  # 避免初始偏移

	set_process(true)


func _process(delta):
	if not path_follow:
		return

	var curve = path_follow.get_parent().curve
	if not curve:
		return

	var path_length = curve.get_baked_length()
	var offset_delta = move_speed * delta
	if going_forward:
		path_follow.progress += offset_delta
		if path_follow.progress_ratio>=1.0:
			going_forward = false
			_flip_horizontal()
	else:
		path_follow.progress -= offset_delta
		if path_follow.progress_ratio<=0.0:
			going_forward = true
			_flip_horizontal()

func _flip_horizontal():
	self.scale.x *= -1
func on_caught():
	queue_free()

func to_dict() -> Dictionary:
	return {
		"item_id": item_id,
		"item_type": item_type,
		"item_name": item_name,
		"weight": weight,
		"value": value,
	}
