extends Control
@export var item_data: PurchasableItemResource  # 替换原来的所有属性
@export var purchased_sprite: AtlasTexture  # 替换原来的所有属性
@onready var number_show: Control = $TextureRect/NumberShow
var is_selled=false
@onready var default_show: TextureRect = $DefaultShow
@onready var selled_show: TextureRect = $SelledShow
@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	number_show.num=item_data.item_price


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if not is_selled:
		is_selled=true
		self.texture_normal=purchased_sprite
		default_show.hide()
		selled_show.show()
		texture_rect.hide()
