class_name BookViewClueSlot extends Control

signal clue_submitted(found_clue_item: FoundClueItem, slot_name: String)
var found_clue_item: FoundClueItem
@onready var clue_slot_collider = $BookViewClueSlotCollider
@onready var book_view_clue_item: BookViewClueItem = $BookViewClueItem
@export var correct_clue_name_values: Array[ClueItem.CLUE_NAME] = []
@export var correct_clue_symbol_values: Array[ClueItem.CLUE_SYMBOL] = []
@export var accepted_clue_types: Array[ClueItem.CLUE_TYPE] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	clue_slot_collider.clue_submitted.connect(_on_book_view_clue_slot_found_clue_submitted)
	#book_view_clue_item.hideBackgroundRect()
	updateFoundClue(found_clue_item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalState.is_dragging:
		modulate = Color(Color.AQUA, 0.7)
	else: 
		modulate = Color(Color.MEDIUM_PURPLE, 0.7)


func _on_book_view_clue_slot_found_clue_submitted(g_found_clue_item):
	found_clue_item = g_found_clue_item
	clue_submitted.emit(found_clue_item, name)

func updateFoundClue(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	book_view_clue_item.init(found_clue_item).updateLabel()

func isCorrect():
	if (!found_clue_item):
		return false
	
	if (accepted_clue_types.has(ClueItem.CLUE_TYPE.NAME)):
		if (correct_clue_name_values.has(found_clue_item.clue_item.name_value)):
			return true

	if (accepted_clue_types.has(ClueItem.CLUE_TYPE.SYMBOL)):
		if (correct_clue_symbol_values.has(found_clue_item.clue_item.symbol_value)):
			return true
	
	return false
