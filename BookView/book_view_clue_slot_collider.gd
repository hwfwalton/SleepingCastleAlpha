extends StaticBody2D

signal clue_submitted(found_clue_item: FoundClueItem)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func emitFoundClueSubmitted(found_clue_item: FoundClueItem):
	clue_submitted.emit(found_clue_item)

