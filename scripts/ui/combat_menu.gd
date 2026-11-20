extends Node2D

var current_character: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.player_character_turn_start.connect(display_menu)
	$Move.button_up.connect(_on_move_pressed)

func _on_move_pressed() -> void:
	EventBus.display_selector.emit(
		current_character,
		"movement",
		GameData.characters[current_character]["radius"],
		GameData.characters[current_character]["node"].global_position
	)
	visible = false

func display_menu(character) -> void:
	visible = true
	current_character = character

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_released('action_move'):
			_on_move_pressed()
