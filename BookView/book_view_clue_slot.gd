class_name BookViewClueSlot extends Control

signal clue_submitted(found_clue_item: FoundClueItem, slot_name: String)
var found_clue_item: FoundClueItem
@onready var item_slot_collider = $ItemSlotCollider
@onready var book_view_clue_item: BookViewClueItem = $ItemLabel
@onready var clue_item_color_rect = $ItemLabel/ColorRect

@export var correct_clue_name_values: Array[ClueItem.CLUE_NAME] = []
@export var correct_clue_symbol_values: Array[ClueItem.CLUE_SYMBOL] = []
@export var accepted_clue_types: Array[ClueItem.CLUE_TYPE] = []


func _ready():
	item_slot_collider.clue_submitted.connect(_on_found_clue_submitted)
	updateFoundClue(found_clue_item)
	_update_slot_color_for_accepted_types()
	
	accepted_clue_types.map(func(clue_type: ClueItem.CLUE_TYPE):
		var drop_group = ClueItem.clue_type_drop_groups.get(clue_type)
		item_slot_collider.add_to_group(drop_group)
	)


func _process(delta):
	if GlobalState.is_dragging:
		modulate = Color.AQUA
	else: 
		# Reset to default when not dragging
		modulate = Color.WHITE


func _update_slot_color_for_accepted_types():
	if accepted_clue_types.size() == 1:
		clue_item_color_rect.color = ClueItem.clue_type_colors.get(accepted_clue_types[0])
	elif (accepted_clue_types.size() == 2):
		clue_item_color_rect.color = ClueItem.clue_type_colors.get("BOTH")


func _on_found_clue_submitted(g_found_clue_item):
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
