extends PanelContainer
class_name SymbolItemLabel

var found_clue_item: FoundClueItem

@onready var texture_rect: TextureRect = $TextureRect

func init(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	updateLabel()


func updateLabel():
	if (found_clue_item):
		tooltip_text = found_clue_item.clue_item.getClueDisplayText()
		texture_rect.texture = found_clue_item.clue_item.getClueSymbolResource()

