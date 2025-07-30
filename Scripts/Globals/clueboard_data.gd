extends Node

var data := {
		"cards": []
	}
	




var correct_links = {
	"RichardLovings" : "StephanyRomy"
}


func _is_correct_pair(suspect_id: String, victim_id: String) -> bool:
	return correct_links.get(suspect_id) == victim_id
