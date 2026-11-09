extends Node

var party: Dictionary
var enemies: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	party = {
		'Lucio': Vector2(0,0)
	}
	enemies = {
		'Dragonfly A': Vector2(-2.5, -4),
		'Dragonfly B': Vector2(0, -4.5),
		'Dragonfly C': Vector2(2.5, -4)
	}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
