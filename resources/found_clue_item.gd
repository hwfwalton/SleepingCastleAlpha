
class_name FoundClueItem

var clue_item: ClueItem
var found_timestamp: int


func _init(g_clue_item):
	clue_item = g_clue_item
	found_timestamp = Time.get_ticks_usec()

func getClueType():
	return clue_item.type
	
func getClueValue():
	return clue_item.value

func isSameClue(found_clue_item_to_compare: FoundClueItem):
	var clue_item_to_compare = found_clue_item_to_compare.clue_item
	var clue_item_types_match = clue_item_to_compare.type == clue_item.type
	if (clue_item_types_match == false):
		return false
	
	if (clue_item.type == ClueItem.CLUE_TYPE.NAME):
		return clue_item.name_value == clue_item_to_compare.name_value
	elif (clue_item.type == ClueItem.CLUE_TYPE.SYMBOL):
		return clue_item.symbol_value == clue_item_to_compare.symbol_value
	elif (clue_item.type == ClueItem.CLUE_TYPE.FACE):
		return clue_item.face_value == clue_item_to_compare.face_value

