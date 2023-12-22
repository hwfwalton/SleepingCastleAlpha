extends PanelContainer
class_name BookViewClueItemCombined

@onready var static_clue_item = $BookViewClueItem
@onready var draggable_clue_item = $BookViewClueItemDraggable
var found_clue_item: FoundClueItem

func init(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	if (found_clue_item):
		static_clue_item.init(found_clue_item).updateLabel()
		draggable_clue_item.init(found_clue_item).updateLabel()

func setInitialPosition():
	if (draggable_clue_item):
		draggable_clue_item.setInitialPosition()
