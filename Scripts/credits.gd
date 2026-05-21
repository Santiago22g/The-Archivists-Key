extends CanvasLayer

@onready var scroll = $ColorRect/ScrollContainer

func _process(delta):
	scroll.scroll_vertical += 2
	if(scroll.scroll_vertical>1550):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")	
