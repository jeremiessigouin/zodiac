extends Node2D

@onready var evidence_detail_window = $CanvasLayer/EvidenceDetailWindow
@onready var evidence_image = $CanvasLayer/EvidenceDetailWindow/Panel/Image
@onready var evidence_description = $CanvasLayer/EvidenceDetailWindow/Panel/Description

@onready var evidence_grid = $MarginContainer/EvidenceGrid
var evidence_button_scene = preload("res://Scenes/Evidence/evidence_button.tscn")

func _ready():
	evidence_detail_window.hide()
	#EvidenceManager.connect('evidence_unlocked', self, '_on_evidence_unlocked')
	#
	#
#func _on_evidence_unlocked(evidence_id):
	#var button = evidence_button_scene.intantiate()
	#button.evidence_id = evidence_id
	#button.texture_normal = preload("res://assets/evidence/%s.png" % id)
	#button.connect("pressed", Callable(self, "_on_evidence_pressed").bind(id))
	#evidence_grid.add_child(button)
#
#func _on_evidence_pressed(id):
	#print("Evidence clicked:", id)
	## Show evidence window, etc.
	



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
