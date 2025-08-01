extends TextureRect

func _get_drag_data(at_position: Vector2) -> Variant:
	var preview_texture: TextureRect = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(70, 70)

	var preview: Control = Control.new()
	preview.add_child(preview_texture)

	set_drag_preview(preview)
	texture = null

	return preview_texture.texture

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Texture2D

func _drop_data(at_position: Vector2, data: Variant) -> void:
	texture = data
