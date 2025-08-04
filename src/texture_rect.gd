extends TextureRect

var previous_texture

func _get_drag_data(_at_position: Vector2) -> Variant:
	previous_texture = texture
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(70, 70)
	preview_texture.position = -0.5 * preview_texture.size

	var preview: Control = Control.new()
	preview.add_child(preview_texture)

	set_drag_preview(preview)
	texture = null

	return preview_texture.texture

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	texture = data

func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and not is_drag_successful():
		texture = previous_texture
	if what == NOTIFICATION_DRAG_END and is_drag_successful():
		previous_texture = null

