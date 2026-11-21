extends Node3D

const SPEED = 5.0
var current_action: Action = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.display_selector.connect(_on_display_selector)


func _on_display_selector(action):
	current_action = action
	visible = true
	global_position = action.initial_target()
	if action.selector_type == "single":
		$Area.visible = false
		$Single.visible = true
	else:
		$Area.visible = true
		$Single.visible = false
		var radius = action.selector_radius
		$Area.mesh.size = Vector2(radius*2, radius*2)
		# TODO check if more parameters are needed
		$Area.mesh.material.set_shader_parameter("use_gradient", action.selector_gradient)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_released('action_item'):
			visible = false
			EventBus.player_character_turn_start.emit(current_action.source.char_name())
			current_action.queue_free()
			current_action = null
			return
		var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction == Vector3.ZERO:
			return
		if $Area.visible:
			var target = global_position + direction*SPEED*delta
			if GameData.battle_area.has_point(Vector2(target.x, target.z)) and current_action.source.can_walk_towards(target):
				global_position = target
				EventBus.atb_estimation.emit(
					current_action.source.char_name(),
					current_action.atb_consumed(target)
				)
		else:
			# TODO single target should only move between valid targets
			pass
