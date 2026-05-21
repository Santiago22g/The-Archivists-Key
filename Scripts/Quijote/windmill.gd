extends Sprite2D

@export var resource: DialogueResource
@export var title: String = "giant_shout"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		body.set_physics_process(false)  
		body.set_process(false)
		body.update_animation(Vector2.ZERO)
		var current_state = get_parent().mission_state
		
		if current_state == "read_note":
			DialogueManager.show_example_dialogue_balloon(resource, title, [get_parent()])
			await DialogueManager.dialogue_ended
		body.set_physics_process(true)  
		body.set_process(true)
