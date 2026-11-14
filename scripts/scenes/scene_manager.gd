extends Node3D


var battle_manager: BattleManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	battle_manager = BattleManager.new()
	add_child(battle_manager)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
