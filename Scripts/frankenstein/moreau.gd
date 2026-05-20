extends Sprite2D


@export var resource: DialogueResource
@export var title: String = "moreau_intro"

var speaking = false

func setTrue():
	get_parent().correctAnswer = true
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		speaking = true
		DialogueManager.show_example_dialogue_balloon(resource, title, [self])
		
		
		await get_tree().create_timer(1.0).timeout
		speaking = false
