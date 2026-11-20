extends Node

# Message log
signal message_log(message: String)

# Battle signals
signal battle_start()
signal enemy_defeated(enemy)
signal game_over()
signal battle_end()

# Turn based signals
signal player_character_turn_start(character)
signal player_character_turn_end(character)
signal enemy_turn_start(character)
signal enemy_turn_end(character)
signal action_start(action) # TODO determine type of action
signal action_end(action)

# Action specific signals
signal display_selector(character: String, type: String, radius: float, target: Vector3)

# ATB signals
signal atb_filled(character)
signal atb_estimation(character: String, progress_reduction: float)
signal decrease_atb(character: String, progress_reduction: float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
