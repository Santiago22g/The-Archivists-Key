extends AnimatedSprite2D

@export var resource: DialogueResource
@export var title: String = "babieca_talk"

var speaking = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter" and not speaking:
		speaking = true
		body.set_physics_process(false)  
		body.set_process(false)
		body.update_animation(Vector2.ZERO)
		DialogueManager.show_example_dialogue_balloon(resource, title, [get_parent()])
		await DialogueManager.dialogue_ended
		
		await get_tree().create_timer(1.0).timeout
		speaking = false
		body.set_physics_process(true)  
		body.set_process(true)
