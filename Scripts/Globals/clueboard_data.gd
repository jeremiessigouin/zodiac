extends Node


var correct_indices: Array = []

#func add_correct_index(index: int) -> void:
	#if not correct_indices.has(index):
		#correct_indices.append(index)
		#print("Correct index added:", index)
		#
		#if correct_indices.size() == 3:
			#print("You won!")



var data := {
		"cards": []
	}
	




var correct_links = {
	"RichardLovings" : "JaniceSmith",
	"JohnGotti" : "MarieSimpson",
	"EastAreaRapist" : "StephanyRomy"
}


func _is_correct_pair(suspect_id: String, victim_id: String) -> bool:
	return correct_links.get(suspect_id) == victim_id
