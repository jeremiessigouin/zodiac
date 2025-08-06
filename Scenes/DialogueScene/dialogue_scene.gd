extends Node2D

@onready var dialogue_label: RichTextLabel = $CanvasLayer/DialogueBox/DialogueText
@onready var name_label: Label = $CanvasLayer/DialogueBox/NameLabel
@onready var click_indicator = $CanvasLayer/DialogueBox/ClickIndicator

var LIBRARY_HUB_SCENE = preload("res://Scenes/LibraryHUB/library_hub.tscn")

var dialogues = [
	{"name": "Officer Christensen", "text": "Hey... I was waiting for you. You okay? Ready for this?"},
	{"name": "Officer Christensen", "text": "I tried to set you up a small place. Gave you access to everything you need."},
	{"name": "Officer Christensen", "text": "I figure it's the least I can do... If there's ever anything... I'm just a phone call away."}
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
		get_tree().change_scene_to_file("res://Scenes/main.tscn") # or emit signal / go to next scene
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
