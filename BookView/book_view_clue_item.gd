class_name BookViewClueItem extends PanelContainer

@onready var item_label = $MarginContainer/ItemLabel
@onready var color_rect = $ColorRect
@export var item_label_value: String = ""
var found_clue_item: FoundClueItem

func init(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	return self


# Called when the node enters the scene tree for the first time.
func _ready():
	updateLabel()

func updateLabel():
	if (found_clue_item):
		if (found_clue_item.clue_item.type == ClueItem.CLUE_TYPE.NAME):
			item_label_value = found_clue_item.clue_item.getClueNameDisplayValue()
		elif (found_clue_item.clue_item.type == ClueItem.CLUE_TYPE.SYMBOL):
			item_label_value = found_clue_item.clue_item.getClueSymbolResourcePath()
	item_label.text = item_label_value

func hideBackgroundRect():
	color_rect.visible = false
