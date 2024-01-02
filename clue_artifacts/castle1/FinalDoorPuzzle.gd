extends Control

@export var player_state: PlayerState
@onready var slots_node: PuzzleZone = $VFlowContainer/Slots
@onready var symbols_node = $VFlowContainer/FoundSymbols
var symbol_item_scene = preload("res://BookView/SymbolItems/symbol_item_combined.tscn")
var credits_view = preload("res://CreditsView/credits_view.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_populate_symbols_node()
	slots_node.zone_completed.connect(_on_zone_completed)

func _populate_symbols_node():
	var found_symbol_items = player_state.getFoundCluesOfType(ClueItem.CLUE_TYPE.SYMBOL)
	found_symbol_items.map(func(found_symbol: FoundClueItem):
		var clue_item_node = symbol_item_scene.instantiate().init(found_symbol)
		symbols_node.add_child(clue_item_node)
	)
	pass


func _on_zone_completed():
	get_tree().change_scene_to_packed(credits_view)
	print("You win!")
