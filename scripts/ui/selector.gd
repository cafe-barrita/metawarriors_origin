extends Node3D

const SPEED = 5.0
var current_character: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.display_selector.connect(_on_display_selector)


func _on_display_selector(character, type, radius, target):
	current_character = character
	visible = true
	global_position = target
	if type == "single":
		$Area.visible = false
		$Single.visible = true
	else:
		$Area.visible = true
		$Single.visible = false
		$Area.mesh.size = Vector2(radius*2, radius*2)
		# TODO change shader depending on area or movement types

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		if Input.is_action_just_released('action_item'):
			visible = false
			EventBus.player_character_turn_start.emit(current_character)
			return
		var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction == Vector3.ZERO:
			return
		if $Area.visible:
			var target = global_position + direction*SPEED*delta
			if GameData.battle_area.has_point(Vector2(target.x, target.z)):
				global_position = target
				# TODO check if navigation and change color
				# TODO use navigation to calculate real distance
				var distance = global_position.distance_to(
					GameData.characters[current_character]["node"].global_position
				)
				EventBus.atb_estimation.emit(current_character, distance * 0.05)
		else:
			# TODO single target should only move between valid targets
			pass
