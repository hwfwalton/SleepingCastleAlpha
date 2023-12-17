extends Control
class_name ClueSparkle

@export var clue_item_type: ClueItem.CLUE_TYPE = ClueItem.CLUE_TYPE.NAME
@export var clue_item_name_value: ClueItem.CLUE_NAME = ClueItem.CLUE_NAME.NONE
@export var clue_item_symbol_value: ClueItem.CLUE_SYMBOL = ClueItem.CLUE_SYMBOL.NONE
@export var clue_item_face_value: ClueItem.CLUE_FACE = ClueItem.CLUE_FACE.NONE
@export var clue_item_value: String = ""

@onready var clue_item: ClueItem = ClueItem.new(
	clue_item_type,
	clue_item_name_value,
	clue_item_symbol_value,
	clue_item_face_value
)

signal clue_item_found(clue_item: ClueItem)
# Search Icon
# https://www.flaticon.com/free-icon/search_149852

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_button_pressed():
	if clue_item:
		clue_item_found.emit(clue_item)

func emit_found_signal():
	print("emitting found signal: %s" % clue_item.getClueDebugValue())
	clue_item_found.emit(clue_item)
