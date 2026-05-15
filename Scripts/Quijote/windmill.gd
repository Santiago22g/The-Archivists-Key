extends Sprite2D

@export var resource: DialogueResource
@export var title: String = "giant_shout"

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("EntrA??")
	if body.name == "MainCharacter":
		var current_state = get_parent().mission_state
		
		if current_state == "read_note":
			DialogueManager.show_example_dialogue_balloon(resource, title, [get_parent()])
			

		else:
			get_tree().quit()
