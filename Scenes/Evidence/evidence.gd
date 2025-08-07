extends Node2D

@onready var evidence_detail_window = $CanvasLayer/EvidenceDetailWindow
@onready var evidence_image = $CanvasLayer/EvidenceDetailWindow/Panel/Image
@onready var evidence_description = $CanvasLayer/EvidenceDetailWindow/Panel/Description

@onready var evidence_grid = $MarginContainer/EvidenceGrid
#var evidence_thumbnail_scene = preload("res://Scenes/Evidence/evidence_thumbnail.tscn")

func _ready():
	EvidenceData.evidence_added.connect(_on_evidence_added)
	evidence_detail_window.hide()
	for key in EvidenceData.EVIDENCES.keys():
		_create_texture_button(key)


func _on_evidence_added(key: String) -> void:
	_create_texture_button(key)

func _create_texture_button(key: String) -> void:
	var evidence = EvidenceData.EVIDENCES.get(key)
	if evidence == null:
		return
	var texture_button := TextureButton.new()
	texture_button.texture_normal = load(evidence["image"])
	texture_button.tooltip_text = evidence["description"]
	texture_button.name = key
	
	texture_button.custom_minimum_size = Vector2(120,120)
	texture_button.ignore_texture_size = true
	texture_button.stretch_mode = TextureButton.STRETCH_SCALE
	
	# Optionally connect pressed signal
	texture_button.pressed.connect(_on_evidence_button_pressed.bind(key))
	evidence_grid.add_child(texture_button)


func _unhandled_input(_event):
	if Input.is_action_pressed("Escape"):
		$CanvasLayer/EvidenceDetailWindow/Panel/CloseButton.emit_signal('pressed')




#GATHERING THE INFORMATIONS FOR THE EVIDENCE

#func init_data(data: Dictionary):
	#if data.has("evidence"):
		#set_evidence_data(data["evidence"])

func set_evidence_data(evidence: Dictionary):
	evidence_description.text = evidence.get("description", "")
	var image_path = evidence.get("image", "")
	if image_path != "":
		evidence_image.texture = load(image_path)


# EVIDENCE BUTTONS SIGNALS

func _on_evidence_button_pressed(evidence_id: String) -> void:
	var evidence = EvidenceData.EVIDENCES.get(evidence_id)
	if evidence == null:
		return
	set_evidence_data(evidence)
	evidence_detail_window.show()


func _on_close_button_pressed():
	evidence_detail_window.hide()
