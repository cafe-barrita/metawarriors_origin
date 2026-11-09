extends Control

var centro_mapa: Vector2

func _ready() -> void:
	centro_mapa = size/2

func _process(_delta: float) -> void:
	# Forzar al nodo a redibujarse en cada frame para actualizar las posiciones
	queue_redraw()

func _draw() -> void:
	for character in GameData.party:
		draw_circle(
			GameData.party[character]*5 + centro_mapa,
			3.0,
			Color.BLUE
		)

	for enemy in GameData.enemies:
		draw_circle(
			GameData.enemies[enemy]*5  + centro_mapa,
			3.0,
			Color.RED
		)


# Función auxiliar para pintar una cruz perfecta
func dibujar_cruz(posicion: Vector2, tamano: float, color: Color, grosor: float) -> void:
	# Línea Horizontal
	draw_line(posicion + Vector2(-tamano, 0), posicion + Vector2(tamano, 0), color, grosor)
	# Línea Vertical
	draw_line(posicion + Vector2(0, -tamano), posicion + Vector2(0, tamano), color, grosor)
