extends PanelContainer
class_name ArtifactSparkle

@export var artifact_name: String = ""
@onready var button_node: Button = $Button

signal open_artifact_view(artifact_name: String)

func _ready():
	# Assign the tooltip from the root Control node to the Button
	button_node.tooltip_text = tooltip_text

func _on_button_pressed():
	open_artifact_view.emit(artifact_name)
