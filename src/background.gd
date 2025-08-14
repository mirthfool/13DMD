extends TextureRect

@export var pollution_states: Array[Texture2D];

func _ready() -> void:
	texture = pollution_states[0];

func update_state(stateidx: int) -> void:
	texture = pollution_states[stateidx];
