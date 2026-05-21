extends Node2D


@export var resource: DialogueResource
@export var title: String = "start"

var speaking = false

func setTrue():
	
	get_parent().correctAnswer = true
	await get_tree().create_timer(10.0).timeout
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		speaking = true
		body.set_physics_process(false)  
		body.set_process(false)
		body.update_animation(Vector2.ZERO)
		DialogueManager.show_example_dialogue_balloon(resource, title, [self])
		await DialogueManager.dialogue_ended
		
		await get_tree().create_timer(1.0).timeout
		speaking = false
		body.set_physics_process(true)  
		body.set_process(true)
