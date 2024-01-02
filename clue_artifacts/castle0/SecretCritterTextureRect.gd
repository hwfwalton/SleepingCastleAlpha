extends TextureRect

@export var player_state: PlayerState

# Called when the node enters the scene tree for the first time.
func _ready():
	ClueItem.CLUE_NAME.values().map(func(enumValue):
		var clue_item = ClueItem.new(ClueItem.CLUE_TYPE.NAME, enumValue)
		player_state.addClueIfNotAlreadyFound(clue_item)
	)
	ClueItem.CLUE_SYMBOL.values().map(func(enumValue):
		var clue_item = ClueItem.new(
			ClueItem.CLUE_TYPE.SYMBOL,
			ClueItem.CLUE_NAME.NONE,
			enumValue
		)
		player_state.addClueIfNotAlreadyFound(clue_item)
	)
	ClueItem.CLUE_FACE.values().map(func(enumValue):
		var clue_item = ClueItem.new(
			ClueItem.CLUE_TYPE.FACE,
			ClueItem.CLUE_NAME.NONE,
			ClueItem.CLUE_SYMBOL.NONE,
			enumValue
		)
		player_state.addClueIfNotAlreadyFound(clue_item)
	)
	#player_state.addClueIfNotAlreadyFound(clue_item)
	pass # Replace with function body.
