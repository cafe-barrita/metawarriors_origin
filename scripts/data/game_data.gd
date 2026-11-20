extends Node

enum GamepadType { XBOX, PLAYSTATION, SWITCH, KEYBOARD }

var characters: Dictionary = {}
var obstacles
var battle_area: Rect2
var battle_speed: float
var idle_battle_speed: float = 0.07
var action_battle_speed: float = 0.03
var gamepad: GamepadType

func set_current_gamepad_type(_device=0, _connected=false) -> void:
	var connected_pads = Input.get_connected_joypads()
	
	if connected_pads.is_empty():
		gamepad = GamepadType.KEYBOARD # O por defecto si usas teclado
		return
	# Cogemos el nombre del primer mando conectado (índice 0)
	var pad_name = Input.get_joy_name(connected_pads[0]).to_lower()
	
	# Identificamos por las palabras clave que devuelve el sistema operativo
	if "sony" in pad_name or "dualshock" in pad_name or "dualsense" in pad_name or "ps4" in pad_name or "ps5" in pad_name:
		gamepad = GamepadType.PLAYSTATION
	elif "nintendo" in pad_name or "switch" in pad_name or "joy-con" in pad_name:
		gamepad = GamepadType.SWITCH
	else:
		# Por defecto, los mandos genéricos o de Xbox se tratan como Xbox
		gamepad = GamepadType.XBOX

func set_battle_data(party: Node3D, enemies: Node3D) -> void:
	# TODO
	battle_speed = idle_battle_speed
	battle_area = Rect2(Vector2(-8, -5), Vector2(15, 10))
	for member in party.get_children():
		var char_name = member.char_name()
		characters[char_name] = {
			'type': 'party',
			'node': member
		}
	for enemy in enemies.get_children():
		var char_name = enemy.char_name()
		characters[char_name] = {
			'type': 'enemy',
			'node': enemy
		}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO change this, still don't know how
	
	set_current_gamepad_type()
	Input.joy_connection_changed.connect(set_current_gamepad_type)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
