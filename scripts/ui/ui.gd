extends Node2D


@export var MinimapSubviewport: SubViewport
@onready var Minimap: TextureRect = $Control/PanelContainer/HBoxContainer/Minimap/MinimapRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if MinimapSubviewport:
		Minimap.texture = MinimapSubviewport.get_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
