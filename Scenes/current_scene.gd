extends Node2D

var current_scene: Node = null


func change_screen(new_scene_path: String):
	#Clean up previous screen
	if current_scene and current_scene.is_inside_tree():
		current_scene.queue_free()
	
	#Load new screen
	var new_scene = load(new_scene_path).instantiate()
	add_child(new_scene)
	current_scene = new_scene
	
	if new_scene.has_signal("back_to_hub"):
		new_scene.back_to_hub.connect(on_back_to_hub_pressed)
	
	#if  new_scene.has_method("init_data"):
		#new_scene.init_data(data)

func on_back_to_hub_pressed():
	change_screen("res://Scenes/LibraryHUB/library_hub.tscn")
