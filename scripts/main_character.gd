class_name MainCharacter
extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var movement = Vector3(0,0,0)

func _ready():
	print("Hello world")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	# --- CÓDIGO PARA EMPUJAR OBJETOS RIGIDBODY3D ---
	# Ajusta este valor para que el personaje empuje con más o menos fuerza
	var push_force: float = 3

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		# Comprobamos si el objeto con el que chocamos es un cuerpo rígido
		if collider is RigidBody3D:
			# Calculamos la dirección del empuje (desde nosotros hacia el objeto)
			# Usamos -collision.get_normal() para empujar en la dirección del impacto
			var push_direction = -collision.get_normal()
			
			# Eliminamos el componente vertical (Y) para que no salga volando hacia arriba
			push_direction.y = 0
			push_direction = push_direction.normalized()
			
			# Aplicamos un impulso central en el punto exacto del choque
			# Multiplicamos por la velocidad actual para que empuje más fuerte si corre
			var final_force = push_direction * velocity.length() * push_force
			
			# Usamos 'apply_central_impulse' para empujar el objeto uniformemente
			collider.apply_central_impulse(final_force)
