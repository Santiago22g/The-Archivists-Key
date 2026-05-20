extends Node

const SCENES: Array[String] = [
	"res://Scenes/ModernLibrary/MainSceneLibrary.tscn",
	"res://Scenes/Rooms/The Metamorphosis/MetamorphosisMainScene.tscn",
	"res://Scenes/DonQuijote/quijote.tscn",
	"res://Scenes/Rooms/The Republic/RepublicMainScene.tscn",
	"res://Scenes/The Origin Of Species/origin.tscn",
	"res://Scenes/frankenstein.tscn",
]

var current_scene_index: int = 0

func go_to_next_scene() -> void:
	current_scene_index += 1
	if current_scene_index < SCENES.size():
		get_tree().change_scene_to_file(SCENES[current_scene_index])
	else:
		get_tree().change_scene_to_file("res://Scenes/UI/WinScene.tscn")
