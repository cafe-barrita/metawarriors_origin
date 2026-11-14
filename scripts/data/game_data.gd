extends Node

var characters: Dictionary
var obstacles

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	characters = {
		'lucio': {
			'type': 'party'
		},
		'bianca': {
			'type': 'party'
		},
		'dragonfly_a': {
			'type': 'enemy'
		},
		'dragonfly_b': {
			'type': 'enemy'
		},
		'dragonfly_c': {
			'type': 'enemy'
		}
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
