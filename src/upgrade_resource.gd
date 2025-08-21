class_name Upgrade extends Resource

@export var name: String;
@export var sprite: Texture2D;
@export var behaviour: Callable;

func _init(name: String, sprite: Texture2D, callback: Callable):
	self.name = name;
	self.sprite = sprite;
	self.behaviour = callback;

func apply_upgrade(scores: ScoreDisplay):
	behaviour.call(scores);
