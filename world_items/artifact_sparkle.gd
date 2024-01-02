extends PanelContainer
class_name ArtifactSparkle

@export var player_state: PlayerState
@export var artifact_name: String = ""
@export var alt_icon_resource_path: String = ""

@onready var button_node: Button = $Button
@onready var texture_rect: TextureRect = $TextureRect

signal open_artifact_view(artifact_name: String)

func _ready():
	_update_has_seen_appearance()

	# Assign the tooltip from the root Control node to the Button
	button_node.tooltip_text = tooltip_text
	if not alt_icon_resource_path == "":
		texture_rect.texture = load(alt_icon_resource_path)


func _update_has_seen_appearance():
	if not player_state.seen_artifact_views.get(artifact_name, false):
		modulate = Color(Color.YELLOW, 0.7)
	else:
		modulate = Color.WHITE

func _on_button_pressed():
	open_artifact_view.emit(artifact_name)
	_update_has_seen_appearance()
