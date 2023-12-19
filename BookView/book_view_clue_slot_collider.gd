extends StaticBody2D

signal clue_submitted(found_clue_item: FoundClueItem)

# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_visible_in_tree():
		_on_hidden()


func emitFoundClueSubmitted(found_clue_item: FoundClueItem):
	clue_submitted.emit(found_clue_item)

func _on_hidden():
	# When not visible, move the slot to a different collision layer so the
	# draggable clue items don't detect this slot
	collision_layer = 2

func _on_draw():
	collision_layer = 1
