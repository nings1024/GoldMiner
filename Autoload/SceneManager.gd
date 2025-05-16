extends CanvasLayer

## 当前加载的场景节点
var current_scene: Node = null

## 可用于场景切换时传递参数
var transition_data: Dictionary = {}

func _ready():
	#fade_rect.visible = false
	pass

# ⚡立即切换场景（不带动画）
func switch_scene(scene_path: String):
	get_tree().change_scene_to_file(scene_path)
