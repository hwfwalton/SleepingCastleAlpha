extends PanelContainer

@onready var button_node: Button = $Button
@export var nav_destination_name = ""

signal load_level_request(level_name)

func _ready():
	# Assign the tooltip from the root Control node to the Button
	button_node.tooltip_text = tooltip_text

func _on_nav_sparkle_pressed():
	load_level_request.emit(nav_destination_name)
	AudioManager.sfx_door_creak.play()
