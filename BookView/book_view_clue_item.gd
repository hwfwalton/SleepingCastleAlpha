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
		color_rect.color = ClueItem.clue_type_colors.get(found_clue_item.clue_item.type)
		item_label_value = found_clue_item.clue_item.getClueDisplayText()

	item_label.text = item_label_value

func hideBackgroundRect():
	color_rect.visible = false
