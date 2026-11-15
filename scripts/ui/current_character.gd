extends ColorRect


func _on_player_turn_start(character: String) -> void:
	if get_parent().name == character:
		visible = true

func _on_player_turn_end(character: String) -> void:
	if get_parent().name == character:
		visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.player_character_turn_start.connect(_on_player_turn_start)
	EventBus.player_character_turn_end.connect(_on_player_turn_end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
