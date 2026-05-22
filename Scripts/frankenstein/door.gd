extends Node2D
@export var resource: DialogueResource
@export var title: String = "gate_terminal"
var speaking = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "MainCharacter":
		speaking = true
		body.set_physics_process(false)  
		body.set_process(false)
		body.update_animation(Vector2.ZERO)
		DialogueManager.show_example_dialogue_balloon(resource, title, [self,owner])
		await DialogueManager.dialogue_ended
		
		speaking = false
		body.set_physics_process(true)  
		body.set_process(true)	

func openDoors():
		%closedDoor.visible = false
		%opendoor1.visible = true
		%opendoor2.visible = true
		%doorCollision.disabled=true
