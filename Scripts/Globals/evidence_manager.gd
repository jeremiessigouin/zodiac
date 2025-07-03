extends Node

var unlocked_evidence = []

signal evidence_unlocked(evidence_id)

func unlock_evidence(evidence_id):
	if evidence_id not in unlocked_evidence:
		unlocked_evidence.append(evidence_id)
		emit_signal('evidence_unlocked', evidence_id)
