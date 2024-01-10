extends Control
class_name ArtifactView

signal close_shell

@export var artifact_touch_sfx: GlobalState.ARTIFACT_TOUCH_SFX = GlobalState.ARTIFACT_TOUCH_SFX.NONE

func _ready():
	AudioManager.playArtifactTouchSfx(artifact_touch_sfx)

func getClueNodes():
	var clue_nodes = get_children().filter(func(node):
		return node.is_in_group("clue_item")
	)
	return clue_nodes

func getArtifactNodes():
	var artifact_sparkles = get_children().filter(func(node):
		return node.is_in_group("artifact_sparkle")
	)
	return artifact_sparkles
