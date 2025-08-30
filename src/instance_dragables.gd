class_name GameBoard extends GridContainer

@onready var dragable: Resource = preload("res://Scenes/texture_rect.tscn")

@onready var max_col: int = 7
@onready var max_row: int = 7

var upgrades: Array[Upgrade];

func _ready() -> void:
	for i: int in range(max_col * max_row):
		add_child(dragable.instantiate())

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		print(get_active_tiles())

func get_active_tiles() -> Array[Tile]:
	var active_textures: Array[Tile]
	for child:GridSquare in find_children("*", "GridSquare", false, false):
		if child.texture != null:
			active_textures.append(child.tile)
	return active_textures

func add_upgrade(upgrade: Upgrade):
	upgrades.append(upgrade);
