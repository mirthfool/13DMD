extends Node

var upgrades: Dictionary = {
	"Testupgrade": Upgrade.new("test upgrade", Texture2D.new(), Callable(self, "test_upgrade")),
}

func test_upgrade(scores: ScoreDisplay):
	print("this is a test upgrade");
