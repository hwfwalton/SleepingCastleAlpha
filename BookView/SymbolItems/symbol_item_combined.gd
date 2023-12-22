extends PanelContainer
class_name SymbolItemCombined

@onready var static_symbol_item: SymbolItemLabel = $symbol_item_label
@onready var draggable_symbol_item: BookViewDraggableItem = $SymbolItemDraggable
var found_clue_item: FoundClueItem

func init(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	if (found_clue_item):
		static_symbol_item.init(found_clue_item).updateLabel()
		draggable_symbol_item.init(found_clue_item).updateLabel()
		call_deferred("setInitialPosition")

func setInitialPosition():
	if (draggable_symbol_item):
		draggable_symbol_item.setInitialPosition()
