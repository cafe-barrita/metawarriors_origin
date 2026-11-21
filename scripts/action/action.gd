class_name Action
extends Node

var source: Character
var target # TODO decide if array of nodes or vector
var selector_type: String # Area or single
var selector_radius: float
var selector_gradient: bool

func atb_consumed(target) -> float:
	return 0.0

func initial_target() -> Vector3:
	return Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
