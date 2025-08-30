class_name TileBar extends GridContainer

@onready var dragable: Resource = preload("res://Scenes/texture_rect.tscn")

func _ready() -> void:
	for i: int in range(5):
		add_child(dragable.instantiate());
