extends Camera2D

# Zoom settings
var zoom_step := 0.1
var min_zoom := 0.3
var max_zoom := 1.5

#Drag settings
var dragging := false
var last_mouse_pos := Vector2.ZERO
var drag_speed = 2

# For ZOOM

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
		zoom_camera(-zoom_step)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
		zoom_camera(zoom_step)

func zoom_camera(amount):
	var new_zoom = zoom + Vector2(amount, amount)
	new_zoom.x = clamp(new_zoom.x, min_zoom, max_zoom)
	new_zoom.y = clamp(new_zoom.y, min_zoom, max_zoom)
	zoom = new_zoom


#For DRAG

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			dragging = event.pressed
			last_mouse_pos = event.position
	elif event is InputEventMouseMotion and dragging and not Global.card_is_dragging:
		var delta = last_mouse_pos - event.position
		global_position += delta * drag_speed
		last_mouse_pos = event.position
		Global.screen_is_dragging = true
	elif event is not InputEventMouseButton:
		Global.screen_is_dragging = false
		
