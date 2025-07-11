extends Node2D

@onready var victims_list = $HUD/Control/VictimsList
@onready var suspects_list = $HUD/Control/SuspectsPanel
@onready var camera = $Camera2D

var current_line: Line2D = null
var line_start_card: Node = null



func _ready():
	victims_list.hide()
	suspects_list.hide()
	
	if ClueboardData.data.has("cards"):
		for card_info in ClueboardData.data["cards"]:
			var card_scene = load(card_info["scene_path"])
			if card_scene:
				var card = card_scene.instantiate()
				card.card_id = card_info["card_id"]
				card.global_position = card_info["position"]
				add_child(card)
				card.add_to_group("Cards")

func _process(_delta):
	if current_line and line_start_card:
		var mouse_world_pos = camera.get_global_mouse_position()
		current_line.set_point_position(1, mouse_world_pos)
		

func _exit_tree():
	collect_clueboard_data()


func _on_polaroids_button_pressed():
	if not victims_list.visible:
		victims_list.show()
	elif victims_list.visible:
		victims_list.hide()


func _on_stephany_romy_button_pressed():
	var card = preload("res://Scenes/ClueBoard/VictimCards/stephany_romy_card.tscn").instantiate()
	_add_card_to_board(card)
	$HUD/Control/VictimsList/VictimsContainer/StephanyRomy_Button.queue_free()


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
		current_line = preload('res://Scenes/ClueBoard/Line/link_line.tscn').instantiate()
		current_line.default_color = Color.RED
		current_line.width = 3.0
		
		add_child(current_line)
		
		current_line.card_a = card
		current_line.add_point(card.global_position)
		current_line.add_point(camera.get_global_mouse_position())
		
	else:
		
		current_line.card_b = card
		current_line.set_point_position(1, card.global_position)
		
		current_line = null
		line_start_card = null
		
	


func _add_card_to_board(card):
	$CardsOnBoard.add_child(card)
	card.add_to_group("Cards")
	card.connect('right_clicked', _on_card_right_clicked)
	collect_clueboard_data()


func collect_clueboard_data():
	for card in get_tree().get_nodes_in_group("Cards"):
		ClueboardData.data["cards"].append({
			"card_id": card.card_id,
			"position": card.global_position,
			"scene_path": card.scene_path
		})
