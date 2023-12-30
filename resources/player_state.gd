class_name PlayerState extends Resource

# Array of FoundClueItems
var found_clue_items: Array[FoundClueItem] = []

# Map of puzzle_zone_ids to dictionaries maps of slotIds to FoundClueItems in those slots
# e.g. {
#	[zone0Id]: {
#		[slot0]: null
#		[slot1]: FoundClueItem
#	},
#	[zone1Id]: {
#		[slot0]: FoundClueItem
#		[slot1]: FoundClueItem
#	}
#}
var puzzle_zones_to_slot_values = {}

var book_last_viewed_puz_tab_idx: int = 0
var book_last_viewed_clue_tab_idx: int = 0
var book_last_seen_clue_count_by_idx: Array[int] = [0,0,0]

var book_clues_names_sorting_by_alpha: bool = false
var book_clues_symbols_sorting_by_alpha: bool = false
var book_clues_names_sorting_asc: bool = true
var book_clues_symbols_sorting_asc: bool = true

var has_seen_welcome_letter = false
#var has_been_clicked_by_node_path: Dictionary[]

@export var test_value: int = 0

# Called when the node enters the scene tree for the first time.
func _init(g_found_clue_items: Array[FoundClueItem] = [], g_puzzle_zones_to_slot_values = {}):
	found_clue_items = g_found_clue_items
	puzzle_zones_to_slot_values = g_puzzle_zones_to_slot_values

func getFoundCluesOfType(clue_type: ClueItem.CLUE_TYPE) -> Array:
	var filtered_found_clue_items = found_clue_items.filter(
		func(found_clue_item: FoundClueItem):
			return found_clue_item.getClueType() == clue_type
	)
	return filtered_found_clue_items

func isClueFound(clue_item_to_find: ClueItem) -> bool:
	var matching_found_clues = found_clue_items.filter(
		func(found_clue_item: FoundClueItem):
			return found_clue_item.clue_item.isSameClue(clue_item_to_find)
	)
	return matching_found_clues.size() > 0

func isClueFaceFound(clue_face_value: ClueItem.CLUE_FACE) -> bool:
	var matching_found_clues = found_clue_items.filter(
		func(found_clue_item: FoundClueItem):
			return found_clue_item.clue_item.face_value == clue_face_value
	)
	return matching_found_clues.size() > 0

# If a given clue is not already among the FoundClueItems, creates a FoundClueItem
# for it and adds it to found_clue_items.
# Returns 'true' if a new FoundClueItems was created and added
# Returns 'false' if no changes were made
func addClueIfNotAlreadyFound(clue_item: ClueItem) -> bool:
	if (!isClueFound(clue_item)):
		var found_clue_item = FoundClueItem.new(clue_item)
		found_clue_items.push_front(found_clue_item)
		return true
	else:
		return false

func getSlotValuesForPuzzleZone(puzzle_zone_id: String) -> Dictionary:
	var slot_values = puzzle_zones_to_slot_values.get(puzzle_zone_id, {})
	return slot_values

func setPuzzleZoneSlotValues(puzzle_zone_id: String, slot_values: Dictionary) -> void:
	puzzle_zones_to_slot_values[puzzle_zone_id] = slot_values

