extends Node

var events: Array[Event] = [
	Event.new("Test event", "This is a test event created to test the event system", upgrades.get("Testupgrade"))
]

var upgrades: Dictionary[String, Upgrade] = {
	"Testupgrade": Upgrade.new("test upgrade", Texture2D.new(), Callable(self, "test_upgrade")),
}

func test_upgrade(scores: ScoreDisplay):
	print("this is a test upgrade");
