class_name Character
extends CharacterBody3D


func char_name() -> String:
	return name.to_lower().replace(' ', '_')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
