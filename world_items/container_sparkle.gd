extends PanelContainer

@export var container_name: String = ""
@onready var button_node: Button = $Button

signal open_clue_container(container_name: String)

func _ready():
	# Assign the tooltip from the root Control node to the Button
	button_node.tooltip_text = tooltip_text

func _on_button_pressed():
	open_clue_container.emit(container_name)
