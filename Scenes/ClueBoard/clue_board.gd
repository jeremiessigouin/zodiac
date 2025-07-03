extends Node2D

@onready var polaroids_list = $HUD/Control/PolaroidsList

var victim_card_scene = preload("res://Scenes/ClueBoard/VictimCards/victim_card.tscn")


func _ready():
	polaroids_list.hide()

func _on_polaroids_button_pressed():
	if not polaroids_list.visible:
		polaroids_list.show()
	elif polaroids_list.visible:
		polaroids_list.hide()
	


func _on_stephany_romy_button_pressed():
	var card = preload("res://Scenes/ClueBoard/VictimCards/stephany_romy_card.tscn").instantiate()
	$CardsOnBoard.add_child(card)
	$HUD/Control/PolaroidsList/GridContainer/StephanyRomy_Button.queue_free()
