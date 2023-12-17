extends Control


@onready var options_pane_container = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer
@onready var back_button = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer/MarginContainer/VBoxContainer/BackButton
# Called when the node enters the scene tree for the first time.
func _ready():
	options_pane_container.grab_focus()
	#back_button.grab_focus()


func _on_back_button_pressed():
	queue_free()
	get_parent().emit_signal("ready")


func _on_button_pressed():
	get_tree().quit()
