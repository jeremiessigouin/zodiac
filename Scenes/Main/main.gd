extends Node2D

@onready var current_scene = $CurrentScene

var newspaper_scene_path = "res://Scenes/Newspaper/newspaper.tscn"
var board_scene_path = "res://Scenes/ClueBoard/Utility/clue_board.tscn"
const POLICE_REPORTS_SCENE = "res://Scenes/PoliceReports/police_reports.tscn"
const LIBRARY_HUB_SCENE = "res://Scenes/LibraryHUB/library_hub.tscn"
const EVIDENCE_TABLE_SCENE = "res://Scenes/Evidence/evidence.tscn"
const DIALOGUE_SCENE = "res://Scenes/DialogueScene/dialogue_scene.tscn"


func _ready():
	current_scene.change_screen(LIBRARY_HUB_SCENE)
	$CanvasLayer.show()


func _on_newspaper_button_pressed():
	$CurrentScene.change_screen(newspaper_scene_path)

func _on_board_button_pressed():
	$CurrentScene.change_screen(board_scene_path)

func _on_police_reports_button_pressed():
	$CurrentScene.change_screen(POLICE_REPORTS_SCENE)


func _on_evidence_button_pressed() -> void:
	$CurrentScene.change_screen(EVIDENCE_TABLE_SCENE)


func _on_dialogue_test_pressed():
	$CanvasLayer.hide()
	$CurrentScene.change_screen(DIALOGUE_SCENE)
