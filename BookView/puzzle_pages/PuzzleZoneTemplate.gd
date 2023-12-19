extends Control

@export var puzzle_zone_id: String = ""
@export var player_state: PlayerState
@onready var panel_node = $Panel
# Array[BookViewClueSlot]
var clue_slots: Array = []
# Array[PuzzlePortrait]
var portrait_nodes: Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#clue_slots = _get_clue_slots() as Array[BookViewClueSlot]
	clue_slots = get_children().filter(func(node: Node):
		return node.is_in_group("clue_slot")
	)
	#clue_slots = filtered_clue_slots
	portrait_nodes = get_children().filter(func(node):
		return node.is_in_group("puzzle_portrait")
	)

	clue_slots.map(func(clue_slot: BookViewClueSlot):
		clue_slot.clue_submitted.connect(self._on_clue_slot_clue_submitted)
	)
	_rerender_with_state_from_cache()


func _on_clue_slot_clue_submitted(found_clue_item: FoundClueItem, slot_name: String):
	var slot_items = player_state.getSlotValuesForPuzzleZone(puzzle_zone_id).duplicate()
	slot_items[slot_name] = found_clue_item
	player_state.setPuzzleZoneSlotValues(puzzle_zone_id, slot_items)
	_rerender_with_state_from_cache()

func _rerender_with_state_from_cache():
	var cached_slot_items = player_state.getSlotValuesForPuzzleZone(puzzle_zone_id)
	clue_slots.map(func(clue_slot: BookViewClueSlot):
		var cached_item = cached_slot_items.get(clue_slot.name, null)
		clue_slot.updateFoundClue(cached_item)
	)
	
	if (zoneIsComplete()):
		panel_node.theme_type_variation = "PuzzleZoneComplete"
	else:
		panel_node.theme_type_variation = "PuzzleZoneIncomplete"

func zoneIsComplete() -> bool:
	var portraits_complete: bool = portrait_nodes.all(func(portrait: PuzzlePortrait):
		return portrait.isCorrect()
	)
	var slots_complete: bool = clue_slots.all(func(clue_slot: BookViewClueSlot):
		return clue_slot.isCorrect()
	)
	return portraits_complete && slots_complete

