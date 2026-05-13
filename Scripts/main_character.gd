extends CharacterBody2D

@export var speed: float = 250.0
@onready var sprite = $AnimatedSprite2D

var last_dir_string = "down" 

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	move_and_slide()
	
	update_animation(direction)

func update_animation(dir: Vector2):
	var state = "idle"
	
	if dir != Vector2.ZERO:
		state = "walk"
		last_dir_string = get_direction_string(dir)
	
	var anim_name = last_dir_string + "-" + state
	
	if sprite.animation != anim_name:
		sprite.play(anim_name)

func get_direction_string(dir: Vector2) -> String:
	var dir_name = ""
	
	if dir.y < -0.1: dir_name = "up"
	elif dir.y > 0.1: dir_name = "down"
	
	var x_name = ""
	if dir.x < -0.1: x_name = "left"
	elif dir.x > 0.1: x_name = "right"
	
	if dir_name != "" and x_name != "":
		return dir_name + "-" + x_name
	elif dir_name != "":
		return dir_name
	else:
		return x_name
