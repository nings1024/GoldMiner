extends CanvasLayer

## 场景路径集中管理
#enum Scene { SHOP = "res://Shop/shop.tscn", GAME = "res://main.tscn" }
## 当前场景引用（用于手动释放）
var current_scene: Node = null
## 切换参数
var transition_data: Dictionary = {}

func _ready():
	pass

## 安全切换场景（同步）
func switch_scene(scene_path: String) -> bool:
	if not ResourceLoader.exists(scene_path):
		push_error("场景路径无效: " + scene_path)
		return false
	
	if current_scene:
		current_scene.queue_free()
	
	var new_scene = load(scene_path).instantiate()
	add_child(new_scene)
	current_scene = new_scene
	return true

## 异步切换（带动画）
func switch_scene_async(scene_path: String) -> void:
	# 示例：淡出动画
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	
	# 异步加载
	ResourceLoader.load_threaded_request(scene_path)
	var progress = []
	while ResourceLoader.load_threaded_get_status(scene_path, progress) != ResourceLoader.THREAD_LOAD_LOADED:
		await get_tree().process_frame
	
	# 切换并淡入
	var new_scene = ResourceLoader.load_threaded_get(scene_path).instantiate()
	if current_scene:
		current_scene.queue_free()
	add_child(new_scene)
	current_scene = new_scene
	$AnimationPlayer.play("fade_in")
