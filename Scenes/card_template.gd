extends Node2D

var draggable = false
var is_inside_droppable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

signal right_clicked(card_node)



func _process(_delta):
	if draggable and not Global.screen_is_dragging:
		if Input.is_action_just_pressed("Click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.card_is_dragging = true
		if Input.is_action_pressed('Click'):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("Click"):
			Global.card_is_dragging = false
			


func _on_area_2d_mouse_entered():
	if not Global.card_is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.card_is_dragging:
		draggable = false
		scale = Vector2(1, 1)


func _on_area_2d_body_entered(body):
	if body.is_in_group('droppable'):
		is_inside_droppable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body


func _on_area_2d_body_exited(body):
	if body.is_in_group('droppable'):
		is_inside_droppable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		right_clicked.emit(self)
