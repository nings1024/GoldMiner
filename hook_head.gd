extends Area2D
class_name HookHead

@export var init_texture:AtlasTexture

@onready var hook_head: Sprite2D = $"Hook-Head"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_grabbed(texture:Texture):
	collision_shape_2d.set_deferred('disabled',true)
	hook_head.texture=texture
	hook_head.region_enabled=false

func reset():
	collision_shape_2d.set_deferred('disabled',false)
	hook_head.texture=init_texture
	hook_head.region_enabled=false	
	
