extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(_delta: float) -> void:
	# 1. Capturamos la dirección (configura estas teclas en Project Settings -> Input Map)
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# 2. Aplicamos la velocidad
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	# 3. Función mágica de Godot que maneja colisiones y deslizamiento
	move_and_slide()
