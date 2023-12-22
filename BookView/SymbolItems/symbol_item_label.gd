extends PanelContainer
class_name SymbolItemLabel

var clue_item: ClueItem

@onready var texture_rect: TextureRect = $TextureRect

func init(g_clue_item: ClueItem):
	clue_item = g_clue_item
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func updateTextureAndTooltip():
	if (clue_item):
		tooltip_text = clue_item.getClueDisplayText()
		texture_rect.texture = clue_item.getClueSymbolResource()

