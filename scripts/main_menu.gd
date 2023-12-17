extends Control

signal load_level_request(level_name)

@onready var start_button = $MarginContainer/VBoxContainer/StartButton

#var options = preload("res://options_menu.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.playMainMenuMusic()
	_on_ready()


func _on_ready():
	start_button.grab_focus()


func _on_start_button_pressed():
	AudioManager.switchStageMusicTrackToCastle()
	AudioManager.playStageMusic()
	load_level_request.emit("castle0")
	pass # Replace with function body.


func _on_options_button_pressed():
	var options = load("res://options_menu.tscn").instantiate()
	get_tree().current_scene.add_child(options)


func _on_quit_button_pressed():
	get_tree().quit()
