extends AnimatedSprite2D

@export var resource: DialogueResource
@export var title: String = "real_cyclops"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		body.set_physics_process(false)  
		body.set_process(false)
		body.update_animation(Vector2.ZERO)
		DialogueManager.show_example_dialogue_balloon(resource, title, [self])
		await DialogueManager.dialogue_ended
		body.set_physics_process(true)  
		body.set_process(true)
