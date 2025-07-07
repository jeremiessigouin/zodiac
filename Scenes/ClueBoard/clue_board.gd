extends Node2D

@onready var polaroids_list = $HUD/Control/PolaroidsList
@onready var suspects_list = $HUD/Control/SuspectsPanel
@onready var camera = $Camera2D

var current_line: Line2D = null
var line_start_card: Node = null

#var card

func _ready():
	polaroids_list.hide()
	suspects_list.hide()

func _process(_delta):
	if current_line and line_start_card:
		var mouse_world_pos = camera.get_global_mouse_position()
		current_line.set_point_position(1, mouse_world_pos)

func _on_polaroids_button_pressed():
	if not polaroids_list.visible:
		polaroids_list.show()
	elif polaroids_list.visible:
		polaroids_list.hide()


func _on_stephany_romy_button_pressed():
	var card = preload("res://Scenes/ClueBoard/VictimCards/stephany_romy_card.tscn").instantiate()
	_add_card_to_board(card)
	$HUD/Control/PolaroidsList/VictimsContainer/StephanyRomy_Button.queue_free()


func _on_suspects_button_pressed():
	if not suspects_list.visible:
		suspects_list.show()
	elif suspects_list.visible:
		suspects_list.hide()


func _on_suspect_1_button_pressed():
	var card = preload("res://Scenes/ClueBoard/SuspectsCards/suspect_card_template.tscn").instantiate()
	_add_card_to_board(card)
	$HUD/Control/SuspectsPanel/SuspectsContainer/Suspect1Button.queue_free()
	

func _on_richard_lovings_button_2_pressed():
	var card = preload("res://Scenes/ClueBoard/SuspectsCards/richard_lovings_card.tscn").instantiate()
	_add_card_to_board(card)
	$HUD/Control/SuspectsPanel/SuspectsContainer/RichardLovingsButton2.queue_free()


func _on_card_right_clicked(card):
	if line_start_card == null:
		#Start drawing line
		line_start_card = card
		#current_line = Line2D.new()
		current_line = preload('res://Scenes/ClueBoard/Line/link_line.tscn').instantiate()
		current_line.default_color = Color.RED
		current_line.width = 3.0
		
		add_child(current_line)
		
		current_line.card_a = card
		current_line.add_point(card.global_position)
		current_line.add_point(camera.get_global_mouse_position())
		
		#var start_pos = card.global_position
		#var mouse_world_pos = camera.get_global_mouse_position()
		#current_line.add_point(start_pos)
		#current_line.add_point(mouse_world_pos)
	else:
		#var end_pos = card.global_position
		#current_line.set_point_position(1,  end_pos)
		
		current_line.card_b = card
		current_line.set_point_position(1, card.global_position)
		
		current_line = null
		line_start_card = null


func _add_card_to_board(card):
	$CardsOnBoard.add_child(card)
	card.add_to_group("Cards")
	card.connect('right_clicked', _on_card_right_clicked)
