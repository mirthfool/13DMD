class_name ScoreDisplay extends Control

@export var game_board: GameBoard

var upgrades: Array[Upgrade];

var day: int = 1;
@export var day_counter: Label;

var profit: int = 0;
@export var profit_display: Label;

# TODO: Change to include power impacts in future.
var heat_produced: int = 0;
@export var heat_display: Label;

func _ready() -> void:
	day_counter.text = "Day: " + str(day);
	profit_display.text = str(profit);
	heat_display.text = str(heat_produced);

func update_scores() -> void:
	var tiles: Array[Tile] = game_board.get_active_tiles();
	for tile:Tile in tiles:
		profit -= tile.power_per_day
		if tile is Processor:
			tile = tile as Processor;
			profit += tile.income_per_day;
			heat_produced += tile.heat_per_day;
		elif tile is Cooler:
			tile = tile as Cooler;
			heat_produced += tile.heat_per_day;

	for upgrade:Upgrade in game_board.upgrades:
		upgrade.apply_upgrade(self);

	day += 1;

	day_counter.text = "Day: " + str(day);
	profit_display.text = str(profit);
	heat_display.text = str(heat_produced);
