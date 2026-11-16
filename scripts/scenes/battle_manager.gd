class_name BattleManager
extends Node

var party_turn_queue: Array = []
var enemy_turn_queue: Array = []
var action_queue: Array = [] 
var current_player_character: String = ""
var current_enemy: String = ""
var current_action = null # TODO determine type of action probably new class

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.atb_filled.connect(_on_atb_filled)
	EventBus.player_character_turn_end.connect(_on_player_character_turn_end)
	EventBus.enemy_turn_end.connect(_on_enemy_turn_end)
	EventBus.message_log.emit("Battle Start!")

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
				GameData.battle_speed = GameData.action_battle_speed
		"enemy":
			enemy_turn_queue.append(character_name)
			if current_player_character == "":
				current_enemy = character_name
				EventBus.enemy_turn_start.emit(current_enemy)
		_:
			push_warning("BattleManager: Tipo desconocido '%s' para el personaje '%s'." % [char_data.get("type"), character_name])

func _on_player_character_turn_end(character_name: String) -> void:
	party_turn_queue.pop_front()
	if party_turn_queue.is_empty():
		current_player_character = ""
		if action_queue.is_empty():
			GameData.battle_speed = GameData.idle_battle_speed
	else:
		current_player_character = party_turn_queue.front()
		EventBus.player_character_turn_start.emit(current_player_character)

func _on_enemy_turn_end(character_name: String) -> void:
	enemy_turn_queue.pop_front()
	if party_turn_queue.is_empty():
		current_enemy = ""
	else:
		current_enemy = enemy_turn_queue.front()
		EventBus.enemy_character_turn_start.emit(current_enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
