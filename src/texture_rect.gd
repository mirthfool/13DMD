class_name GridSquare extends TextureRect

var previous_texture: Texture2D
var previous_tile: Tile
@export var tile: Tile

func _ready() -> void:
	await get_tree().physics_frame
	if tile != null:
		texture = tile.sprite

func _get_drag_data(_at_position: Vector2) -> Variant:
	previous_texture = texture
	previous_tile = tile
	texture = tile.sprite
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.texture = tile.sprite
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(70, 70)
	preview_texture.position = -0.5 * preview_texture.size
	var preview_tile = tile

	var preview: Control = Control.new()
	preview.add_child(preview_texture)

	set_drag_preview(preview)
	texture = null
	tile = null

	return preview_tile

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Tile

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	texture = data.sprite
	tile = data

func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and not is_drag_successful():
		texture = previous_texture
		tile = previous_tile
	if what == NOTIFICATION_DRAG_END and is_drag_successful():
		previous_texture = null
		previous_tile = null
