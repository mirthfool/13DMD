extends GridContainer

@onready var dragable := preload("res://Scenes/texture_rect.tscn")

@onready var max_col: int = 7
@onready var max_row: int = 7

func _ready() -> void:
	for i in range(max_col * max_row):
		add_child(dragable.instantiate())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		get_active_textures()

func get_active_textures() -> Array[TextureRect]:
	var active_textures: Array[TextureRect]
	for child:TextureRect in find_children("*", "TextureRect", false, false):
		if child.texture != null:
			active_textures.append(child)
	return active_textures
