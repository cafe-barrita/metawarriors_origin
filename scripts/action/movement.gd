class_name Movement
extends Action


static func create(source_char: Character) -> Movement:
	var movement = Movement.new()
	movement.source = source_char
	movement.selector_type = "area"
	movement.selector_radius = 0.8 # TODO get char radius
	movement.selector_gradient = false
	return movement

func initial_target() -> Vector3:
	return source.global_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
