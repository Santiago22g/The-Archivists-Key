extends StaticBody2D

@export_group("Dialogue Manager Setup")
@export var dialogue_resource: DialogueResource
@export var dialogue_title: String = "base title"

@onready var prompt = $FloatingPrompt
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
		if dialogue_resource != null:
			prompt.hide()
			DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_title)
		else:
			return
