extends Control

var selected_category: String 
var button_pressed
var previous_page
var current_page
var new_page

#PATHS
@onready var warning_text = $HomeScreen/WarningText



func _ready():
	current_page =  $HomeScreen


func _input(_event):
	if Input.is_action_just_pressed("Escape"):
		current_page.hide()
		previous_page.show()
	if Input.is_action_just_pressed('Enter'):
		$HomeScreen/SearchButton.emit_signal('pressed')


func _on_crime_scenes_button_pressed():
	if button_pressed:
		button_pressed.modulate = Color.WHITE
		print('button pressed')
	button_pressed = $HomeScreen/HBoxContainer/CrimeScenesButton
	selected_category = 'crime_scenes'
	button_pressed.modulate = Color.BLACK

func _on_arrests_report_button_pressed():
	if button_pressed:
		button_pressed.modulate = Color.WHITE
	button_pressed = $HomeScreen/HBoxContainer/ArrestsReportButton
	selected_category = 'arrests_report'
	button_pressed.modulate = Color.BLACK

func _on_missings_button_pressed():
	if button_pressed:
		button_pressed.modulate = Color.WHITE
	button_pressed = $HomeScreen/HBoxContainer/MissingsButton
	selected_category = 'missing_persons'
	button_pressed.modulate = Color.BLACK


func _on_search_button_pressed():
		#NEED SYSTEM SIMILAR TO NEWSPAPER, WHERE THE CONTENT OF THE PAGE DEPENDS ON CATEGORY SELECTED AND NAME TYPED IN
	if selected_category == 'crime_scenes':
		pass
	
	elif selected_category == 'arrests_report':
		pass
	
	
	elif selected_category == 'missing_persons':
		if $HomeScreen/LineEdit.text == 'Jane Doe':
			$HomeScreen.hide()
			$MissingPersonsScreen.show()
			previous_page = $HomeScreen
			current_page = $MissingPersonsScreen
		else: 
			warning_text.modulate = Color.YELLOW
			warning_text.text = 'No results found. Please type in name correctly.'
	
	
	
	
	
	else:
		warning_text.modulate = Color.RED
		warning_text.text = 'ERROR: NO FILE CATEGORY SELECTED'
		
