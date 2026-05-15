extends Node2D

var is_moving: bool = false
var target_y: float = 1000.0
var speed: float = 120.0
var starting_fade: bool = false
var fade_speed: float = 0.5

func _ready():
	%fade_panel.modulate.a = 0.0
	get_parent().correctAnswer = false
func _process(delta: float) -> void:
	if get_parent().correctAnswer == true and not is_moving and not starting_fade:
		if position.y < target_y:
			is_moving = true

	if is_moving:
		position.y += speed * delta
		if position.y >= target_y:
			position.y = target_y
			is_moving = false
			starting_fade = true 

	if starting_fade:
		if %fade_panel.modulate.a < 1.0:
			%fade_panel.modulate.a += fade_speed * delta
		else:
			%fade_panel.modulate.a = 1.0
			starting_fade = false 
		
