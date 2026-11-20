extends Control

@export_range(0.0, 1.0) var progress: float = 0.0 : set = set_progress
@export_range(-1.0, 1.0) var remaining: float = -1.0 : set = set_remaining
@export var background_color: Color = Color(0.2, 0.2, 0.2, 0.6)
@export var fill_color: Color = Color(1.0, 0.8, 0.0, 1.0) # Color dorado ATB
@export var ring_width: float = 4.0
var character_speed = 2
var _time: float = 0.0

func _ready() -> void:
	progress = randf_range(0.4, 0.6)
	EventBus.atb_estimation.connect(calculate_remaining)
	EventBus.player_character_turn_end.connect(reset_remaining)
	EventBus.player_character_turn_start.connect(reset_remaining)

func reset_remaining(character):
	if character == get_parent().name:
		remaining = -1.0

func calculate_remaining(character, consumption):
	if character == get_parent().name:
		remaining = max(0, progress - consumption)

func set_progress(value: float) -> void:
	progress = clamp(value, 0.0, 1.0)
	queue_redraw() # Fuerza a que el nodo se redibuje al cambiar el valor

func set_remaining(value: float) -> void:
	remaining = clamp(value, -1.0, 1.0)
	queue_redraw() # Fuerza a que el nodo se redibuje al cambiar el valor

func _draw() -> void:
	var center = size / 2.0
	var radius = (min(size.x, size.y) / 2.0) - (ring_width / 2.0)
	
	# 1. Dibuja el anillo de fondo (la pista vacía)
	draw_arc(center, radius, 0, TAU, 64, background_color, ring_width, true)
	
	# 2. Dibuja el arco de progreso (comienza arriba: -PI / 2)
	if progress > 0.0:
		var start_angle = -PI / 2
		var end_angle = start_angle + (progress * TAU)
		var draw_color = fill_color
		if remaining > -1.0:
			draw_color.a = (sin(_time) + 1.2) * 0.4
		draw_arc(center, radius, start_angle, end_angle, 64, draw_color, ring_width, true)
	
	if remaining > 0.0:
		var start_angle = -PI / 2
		var end_angle = start_angle + (remaining * TAU)
		draw_arc(center, radius, start_angle, end_angle, 64, fill_color, ring_width, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_time += delta * 1.2
	if progress < 1.0:
		progress += delta * GameData.battle_speed * character_speed
		if progress >= 1.0:
			progress = 1.0
			EventBus.atb_filled.emit(get_parent().name)
	elif remaining > -1.0:
		queue_redraw()
