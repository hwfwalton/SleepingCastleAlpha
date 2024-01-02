extends PanelContainer

@export var player_state: PlayerState
@export var container_name: String = ""
@onready var button_node: Button = $Button

signal open_clue_container(container_name: String)

func _ready():
	_update_has_seen_appearance()
	
	# Assign the tooltip from the root Control node to the Button
	button_node.tooltip_text = tooltip_text


func _update_has_seen_appearance():
	if not player_state.seen_container_views.has(container_name):
		modulate = Color(Color.YELLOW, 0.7)
	else:
		modulate = Color.WHITE


func _on_button_pressed():
	if not player_state.seen_container_views.has(container_name):
		player_state.seen_container_views.append(container_name)

	open_clue_container.emit(container_name)
	_update_has_seen_appearance()
