extends Control

#var root_node = 
@onready var main_menu_scene = load("res://main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_return_to_main_menu_button_pressed():
	get_tree().change_scene_to_packed(main_menu_scene)

