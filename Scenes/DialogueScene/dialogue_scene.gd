extends Control

@onready var dialogue_label: RichTextLabel = $DialogueBox/DialogueText
@onready var name_label: Label = $DialogueBox/NameLabel
@onready var click_indicator = $DialogueBox/ClickIndicator

var dialogues = [
	{"name": "Mysterious Figure", "text": "Hello there... I've been expecting you."},
	{"name": "Mysterious Figure", "text": "Do you have the artifact?"},
	{"name": "Mysterious Figure", "text": "Very well. Let's begin..."}
]

var current_dialogue_index = 0
var is_typing = false
var char_index = 0
var typing_speed = 0.03  # seconds per character
var full_text = ""

func _ready():
	show_dialogue()

func show_dialogue():
	if current_dialogue_index >= dialogues.size():
		# Dialogue is finished
		queue_free()  # or emit signal / go to next scene
		return

	var entry = dialogues[current_dialogue_index]
	name_label.text = entry["name"]
	full_text = entry["text"]
	dialogue_label.text = ""
	char_index = 0
	is_typing = true
	click_indicator.visible = false
	# Start typing coroutine
	type_text()

func type_text():
	if is_typing:
		if char_index < full_text.length():
			dialogue_label.text += full_text[char_index]
			char_index += 1
			await get_tree().create_timer(typing_speed).timeout
			type_text()
		else:
			is_typing = false
			click_indicator.visible = true

func _input(event):
	if event.is_action_pressed("Click"):
		if is_typing:
			# Instantly finish text
			dialogue_label.text = full_text
			is_typing = false
			click_indicator.visible = true
		else:
			current_dialogue_index += 1
			show_dialogue()
