extends Control

@export var player_state: PlayerState
@onready var slots_node = $Slots
@onready var symbols_node = $Symbols
@onready var book_view_clue_item_scene = preload("res://BookView/book_view_clue_item_combined.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_populate_symbols_node()

func _populate_symbols_node():
	var found_symbol_items = player_state.getFoundCluesOfType(ClueItem.CLUE_TYPE.SYMBOL)
	found_symbol_items.map(func(found_symbol: FoundClueItem):
		var clue_item_node = book_view_clue_item_scene.instantiate().init(found_symbol)
		symbols_node.add_child(clue_item_node)
	)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
