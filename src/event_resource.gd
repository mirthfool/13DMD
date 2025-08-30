class_name Event extends Resource

@export var name: String;
@export var description: String;
@export var upgrade: Upgrade;

func _init(name: String, description: String, upgrade: Upgrade) -> void:
	self.name = name;
	self.description = description;
	self.upgrade = upgrade;
