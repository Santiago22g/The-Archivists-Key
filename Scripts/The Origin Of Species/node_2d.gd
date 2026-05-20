extends Node2D

var is_moving: bool = false
var target_y: float = 1000.0
var speed: float = 120.0

func _ready():
	get_parent().correctAnswer = false
func _process(delta: float) -> void:
	if get_parent().correctAnswer == true and not is_moving:
		if position.y < target_y:
			is_moving = true

	if is_moving:
		position.y += speed * delta
		if position.y >= target_y:
			position.y = target_y
			is_moving = false


		
