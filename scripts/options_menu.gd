extends Control


@onready var options_pane_container = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer
@onready var back_button = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer/MarginContainer/VBoxContainer/BackButton
@onready var master_slider = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer/MarginContainer/VBoxContainer/HBoxContainer/MasterSlider
@onready var sfx_slider = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer/MarginContainer/VBoxContainer/HBoxContainer2/SfxSlider
@onready var music_slider = $OptionsMenuSubViewportContainer/SubViewport/OptionsPanelContainer/MarginContainer/VBoxContainer/HBoxContainer3/MusicSlider

# Check the "default_bus_layout" file for the source of these bus names
var master_bus_name = "Master"
var sfx_bus_name = "SFX"
var music_bus_name = "Music"

@onready var master_bus_idx = AudioServer.get_bus_index(master_bus_name)
@onready var sfx_bus_idx = AudioServer.get_bus_index(sfx_bus_name)
@onready var music_bus_idx = AudioServer.get_bus_index(music_bus_name)
# Called when the node enters the scene tree for the first time.
func _ready():
	options_pane_container.grab_focus()
	var master_value = db_to_linear(AudioServer.get_bus_volume_db(master_bus_idx))
	var sfx_value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus_idx))
	var music_value = db_to_linear(AudioServer.get_bus_volume_db(music_bus_idx))
	master_slider.value = master_value
	sfx_slider.value = sfx_value
	music_slider.value = music_value


func _on_back_button_pressed():
	queue_free()
	get_parent().emit_signal("ready")


func _on_button_pressed():
	get_tree().quit()


func _on_master_slider_value_changed(value: float):
	AudioServer.set_bus_volume_db(master_bus_idx, linear_to_db(value))


func _on_sfx_slider_value_changed(value: float):
	AudioServer.set_bus_volume_db(sfx_bus_idx, linear_to_db(value))


func _on_music_slider_value_changed(value: float):
	AudioServer.set_bus_volume_db(music_bus_idx, linear_to_db(value))
