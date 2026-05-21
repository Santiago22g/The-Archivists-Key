extends Control

const CORRECT_CODE : String = "286"

@onready var line_edit: LineEdit = $Panel/VBoxContainer/LineEdit
@onready var label_error: Label = $Panel/VBoxContainer/LabelError

func _ready() -> void:
	line_edit.grab_focus()
	label_error.text = ""

func _on_line_edit_text_changed(new_text: String) -> void:
	if not new_text.is_valid_int() and not new_text.is_empty():
		line_edit.text = ""
		return
	if new_text.length() == 3:
		check_code(new_text)

func check_code(user_code: String) -> void:
	if user_code == CORRECT_CODE:
		label_error.modulate = Color.GREEN
		label_error.text = "ACCESS GRANTED!"
		$AudioStreamPlayer2D.play()
		$Button.disabled=true
		await get_tree().create_timer(3.0).timeout
		GlobalData.go_to_next_scene()

	else:
		label_error.modulate = Color.RED
		label_error.text = "Incorrect code. Try again."
		
		line_edit.text = ""


func _on_button_pressed() -> void:
	hide()
