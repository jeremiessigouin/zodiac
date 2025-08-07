extends Node2D

func _ready():
	$DisplayedScreen/HomeScreen.show()


func _on_print_button_pressed():
	EvidenceData.add_evidence("Jane Doe Report", "A missing person report for a Jane Doe.", "res://Assets/Police Reports/Missing Persons Reports/Missing Report Template.png")
	
