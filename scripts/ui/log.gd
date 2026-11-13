extends Node2D

@export var max_mensajes: int = 20 # Límite de mensajes antes de borrar los antiguos
@export var tamano_fuente: int = 8

@onready var contenedor: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var scroll: ScrollContainer = $ScrollContainer

# Llama a esta función desde cualquier otro script para añadir un mensaje
func agregar_mensaje(texto: String, color: Color = Color.BLACK) -> void:
	# 1. Creamos una nueva etiqueta para el mensaje
	var nuevo_label = RichTextLabel.new()
	nuevo_label.bbcode_enabled = true
	nuevo_label.fit_content = true # Ajusta su altura automáticamente al texto
	nuevo_label.scroll_active = false # Evita que cada mensaje tenga su propia barra de scroll
	nuevo_label.add_theme_font_size_override("normal_font_size", tamano_fuente)
	nuevo_label.text = "[color=#%s]%s[/color]" % [color.to_html(), texto]
	
	# 2. Lo añadimos al VBoxContainer
	contenedor.add_child(nuevo_label)
	
	# 3. Si superamos el límite, eliminamos el mensaje más antiguo (el primero de la lista)
	if contenedor.get_child_count() > max_mensajes:
		var mensaje_antiguo = contenedor.get_child(0)
		mensaje_antiguo.queue_free()
	
	# 4. Bajamos el scroll automáticamente hasta el final
	await get_tree().process_frame
	scroll.scroll_vertical = int(scroll.get_v_scroll_bar().max_value)

func atb_message(character):
	agregar_mensaje("Turno del personaje " + character)

func _ready() -> void:
	EventBus.atb_filled.connect(atb_message)
