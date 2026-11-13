extends Control

@export_range(0.0, 1.0) var progress: float = 0.0 : set = set_progress
@export var background_color: Color = Color(0.2, 0.2, 0.2, 0.6)
@export var fill_color: Color = Color(1.0, 0.8, 0.0, 1.0) # Color dorado ATB
@export var ring_width: float = 4.0
var no_action_speed = 0.07
var action_speed = 0.03
var character_speed = 2

func _ready() -> void:
	progress = randf_range(0.4, 0.6)

func set_progress(value: float) -> void:
	progress = clamp(value, 0.0, 1.0)
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
		draw_arc(center, radius, start_angle, end_angle, 64, fill_color, ring_width, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress < 1.0:
		progress += delta * no_action_speed * character_speed
		if progress >= 1.0:
			progress = 1.0
			EventBus.atb_filled.emit(get_parent().name)
