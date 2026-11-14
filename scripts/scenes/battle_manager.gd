class_name BattleManager
extends Node

var party_turn_queue: Array = []
var enemy_turn_queue: Array = []
var current_player_character: String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.atb_filled.connect(_on_atb_filled)
	EventBus.player_character_turn_end.connect(_on_player_character_turn_end)

func _on_atb_filled(character_name: String) -> void:
	var char_data = GameData.characters.get(character_name)
	if char_data == null:
		push_warning("BattleManager: Personaje '%s' no encontrado en GameData.characters." % character_name)
		return
	
	match char_data.get("type"):
		"party":
			party_turn_queue.append(character_name)
			if current_player_character == "":
				current_player_character = character_name
				EventBus.player_character_turn_start.emit(current_player_character)
		"enemy":
			enemy_turn_queue.append(character_name)
		_:
			push_warning("BattleManager: Tipo desconocido '%s' para el personaje '%s'." % [char_data.get("type"), character_name])

func _on_player_character_turn_end(character_name: String) -> void:
	party_turn_queue.pop_front()
	if party_turn_queue.is_empty():
		current_player_character = ""
	else:
		current_player_character = party_turn_queue.front()
		EventBus.player_character_turn_start.emit(current_player_character)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
