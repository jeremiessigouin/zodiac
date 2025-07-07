extends Line2D

var card_a: Node2D
var card_b: Node2D

func _process(_delta):
	if card_a and card_b:
		set_point_position(0, card_a.global_position)
		set_point_position(1, card_b.global_position)
