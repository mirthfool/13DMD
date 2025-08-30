class_name EventHandler extends Control

@export var gameboard: GameBoard;

@export var blocker: ColorRect;

@export var name_label: Label;
@export var description_label: Label;

@export var accept: Button;
@export var reject: Button;

var event: Event;

func _ready() -> void:
	blocker.visible = false;
	self.visible = false;
	accept.pressed.connect(_accept);
	reject.pressed.connect(_reject);

func trigger_event():
	event = Upgrades.events.pick_random();

	name_label.text = event.name;
	description_label.text = event.description;
	
	blocker.visible = true;
	self.visible = true;

func _accept():
	if self.visible == false:
		return;
	gameboard.add_upgrade(event.upgrade);
	self.visible = false;
	blocker.visible = false;

func _reject():
	if self.visible == false:
		return;
	self.visible = false;
	blocker.visible = false;
