extends TextureButton

@export var scores: ScoreDisplay;

@export var event_handler: EventHandler;

func _ready() -> void:
	self.pressed.connect(_new_day);

func _new_day():
		scores.update_scores();
		event_handler.trigger_event();
