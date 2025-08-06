extends Node2D

func _ready():
	$DisplayedScreen/HomeScreen.show()


func _on_print_button_pressed():
	EvidenceManager.unlock_evidence("Jane Doe Report")
	
