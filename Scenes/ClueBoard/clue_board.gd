extends Node2D

@onready var polaroids_list = $HUD/Control/PolaroidsList
@onready var suspects_list = $HUD/Control/SuspectsPanel

#var victim_card_scene = preload("res://Scenes/ClueBoard/VictimCards/victim_card.tscn")

func _ready():
	polaroids_list.hide()
	suspects_list.hide()

func _on_polaroids_button_pressed():
	if not polaroids_list.visible:
		polaroids_list.show()
	elif polaroids_list.visible:
		polaroids_list.hide()
	


func _on_stephany_romy_button_pressed():
	var card = preload("res://Scenes/ClueBoard/VictimCards/stephany_romy_card.tscn").instantiate()
	$CardsOnBoard.add_child(card)
	$HUD/Control/PolaroidsList/VictimsContainer/StephanyRomy_Button.queue_free()


func _on_suspects_button_pressed():
	if not suspects_list.visible:
		suspects_list.show()
	elif suspects_list.visible:
		suspects_list.hide()


func _on_suspect_1_button_pressed():
	var card = preload("res://Scenes/ClueBoard/SuspectsCards/suspect_card_template.tscn").instantiate()
	$CardsOnBoard.add_child(card)
	$HUD/Control/SuspectsPanel/SuspectsContainer/Suspect1Button.queue_free()
	

func _on_richard_lovings_button_2_pressed():
	var card = preload("res://Scenes/ClueBoard/SuspectsCards/richard_lovings_card.tscn").instantiate()
	$CardsOnBoard.add_child(card)
	$HUD/Control/SuspectsPanel/SuspectsContainer/RichardLovingsButton2.queue_free()
