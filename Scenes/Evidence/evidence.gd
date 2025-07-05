extends Node2D

@onready var evidence_detail_window = $CanvasLayer/EvidenceDetailWindow
@onready var evidence_image = $CanvasLayer/EvidenceDetailWindow/Panel/Image
@onready var evidence_description = $CanvasLayer/EvidenceDetailWindow/Panel/Description

@onready var evidence_grid = $MarginContainer/EvidenceGrid
#var evidence_thumbnail_scene = preload("res://Scenes/Evidence/evidence_thumbnail.tscn")

func _ready():
	evidence_detail_window.hide()


func _unhandled_input(_event):
	if Input.is_action_pressed("Escape"):
		$CanvasLayer/EvidenceDetailWindow/Panel/CloseButton.emit_signal('pressed')



#GATHERING THE INFORMATIONS FOR THE EVIDENCE

func init_data(data: Dictionary):
	if data.has("evidence"):
		set_evidence_data(data["evidence"])

func set_evidence_data(evidence: Dictionary):
	evidence_description.text = evidence.get("description", "")
	var image_path = evidence.get("image", "")
	if image_path != "":
		evidence_image.texture = load(image_path)


# EVIDENCE BUTTONS SIGNALS

func _on_missing_women_pressed():
	evidence_detail_window.show()
	var evidence_id = "missing_women"
	var evidence = EvidenceData.EVIDENCES.get(evidence_id)
	set_evidence_data(evidence)


func _on_close_button_pressed():
	evidence_detail_window.hide()
