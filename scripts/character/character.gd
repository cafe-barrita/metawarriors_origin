class_name Character
extends CharacterBody3D


func char_name() -> String:
	return name.to_lower().replace(' ', '_')

func can_walk_towards(target: Vector3) -> bool:
	var nav_agent = $NavigationAgent3D
	var obstacle = $NavigationObstacle3D
	obstacle.avoidance_enabled  = false

	nav_agent.target_position = target
	var reachable = nav_agent.is_target_reachable()

	obstacle.avoidance_enabled  = true

	return reachable

func has_line_of_sight(target: Vector3) -> bool:
	return true

func estimated_distance(target: Vector3) -> float:
	var nav_agent = $NavigationAgent3D
	var obstacle = $NavigationObstacle3D
	obstacle.avoidance_enabled  = false

	nav_agent.set_target_position(target)
	var distance = nav_agent.distance_to_target()

	obstacle.avoidance_enabled  = true

	return distance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
