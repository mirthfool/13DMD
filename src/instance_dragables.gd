extends GridContainer

@onready var dragable := preload("res://Scenes/texture_rect.tscn")

@onready var max_col: int = 7
@onready var max_row: int = 7

func _ready() -> void:
	for i in range(max_col * max_row):
		add_child(dragable.instantiate())
