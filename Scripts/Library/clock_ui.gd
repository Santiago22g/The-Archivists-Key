extends Control

@onready var time_label: Label = $Panel/Label
@export_group("Dialogue Manager Setup")
@export var dialogue_resource: DialogueResource
@export var dialogue_title: String = "base title"

var hours: int = 12
var minutes: int = 0

const CORRECT_HOUR: int = 4
const CORRECT_MINUTE: int = 45

func _ready() -> void:
	hide()
	update_display()

func update_display() -> void:
	time_label.text = "%02d:%02d" % [hours, minutes]

func _on_btn_hour_pressed() -> void:
	hours += 1
	if hours > 12:
		hours = 1
	update_display()
	check_solution()


func _on_btn_minute_pressed() -> void:
	minutes += 15
	if minutes >= 60:
		minutes = 0
	update_display()
	check_solution()

func check_solution() -> void:
	if hours == CORRECT_HOUR and minutes == CORRECT_MINUTE:
		await get_tree().create_timer(1.0).timeout
		close_clock()
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_title)

func open_clock() -> void:
	show()

func close_clock() -> void:
	hide()

func _on_btn_close_pressed() -> void:
	close_clock()
