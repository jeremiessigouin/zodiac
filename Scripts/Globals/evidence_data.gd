extends Node

signal evidence_added(key: String)
#EVIDENCE DICTIONARY

#EXAMPLE OF EVIDENCE FORMAT
#'Jane Doe Report': {
		#'description': 'The missing person report from an unidentified Jane Doe.',
		#'image': "res://Assets/Police Reports/Missing Persons Reports/Missing Report Template.png"
	#}
	



var EVIDENCES = {
	
	'missing_women': {
		'description': "A paid advertisement found in a magazine.",
		'image': "res://Assets/Evidence/missingwomen.webp"
	} ,
	
	
}


func add_evidence(key: String, description: String, image_path: String) -> void:
	if EVIDENCES.has(key):
		return # Avoid duplicates
	EVIDENCES[key] = {
		'description': description,
		'image': image_path
	}
	emit_signal("evidence_added", key)
