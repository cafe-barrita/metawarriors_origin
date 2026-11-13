extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.atb_filled.connect(display_menu)

func display_menu(character) -> void:
	if character == "lucio":
		visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
