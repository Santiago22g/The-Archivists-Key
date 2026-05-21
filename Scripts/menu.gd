extends Control


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_controls_pressed() -> void:
	%Controls.visible=true


func _on_exit_controls_pressed() -> void:
	%Controls.visible=false


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ModernLibrary/MainSceneLibrary.tscn")
