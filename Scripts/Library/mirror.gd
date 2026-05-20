extends StaticBody2D

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
		var current_scene = get_tree().current_scene.name
		
		if current_scene == "MainSceneLibrary":
			get_tree().change_scene_to_file("res://Scenes/ModernLibrary/ReflectionLibrary.tscn")
			
		elif current_scene == "ReflectionLibrary":
			get_tree().change_scene_to_file("res://Scenes/ModernLibrary/MainSceneLibrary.tscn")
