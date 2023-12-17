class_name PuzzlePortrait extends PanelContainer

@export var player_state: PlayerState
@export var required_clue_value: ClueItem.CLUE_FACE
@export var texture_resource_path: String = ""

@onready var character_texture_rect = $TextureRect_character
@onready var empty_texture_rect = $TextureRect_empty
# Called when the node enters the scene tree for the first time.
func _ready():
	var portrait_texture = load(texture_resource_path)
	character_texture_rect.texture = portrait_texture

	if (isCorrect()):
		character_texture_rect.visible = true
		empty_texture_rect.visible = false

func isCorrect() -> bool:
	return player_state.isClueFaceFound(required_clue_value)
