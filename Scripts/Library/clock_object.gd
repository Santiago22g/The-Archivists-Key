extends StaticBody2D

@onready var prompt: Control = $FloatingPrompt
@onready var clock_ui: Control = $"../ClockUI"

var is_player_nearby: bool = false

func _ready() -> void:
	prompt.hide()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_nearby = true
		prompt.show()

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_player_nearby = false
		prompt.hide()

func _process(_delta: float) -> void:
	if is_player_nearby and Input.is_action_just_pressed("interact"):
		prompt.hide()
		clock_ui.open_clock()
