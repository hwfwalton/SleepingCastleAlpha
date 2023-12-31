extends Control

@onready var start_button = $MarginContainer/VBoxContainer/StartButton
var credits_view = preload("res://CreditsView/credits_view.tscn")
var options_scene = preload("res://options_menu.tscn")
var game_scene = preload("res://game.tscn")

#var options = preload("res://options_menu.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.playMainMenuMusic()
	_on_ready()


func _on_ready():
	start_button.grab_focus()


func _on_start_button_pressed():
	AudioManager.playNewGameSfxAndMusic()
	get_tree().change_scene_to_packed(game_scene)


func _on_options_button_pressed():
	var options = options_scene.instantiate()
	get_tree().current_scene.add_child(options)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_credits_button_pressed():
	get_tree().change_scene_to_packed(credits_view)
