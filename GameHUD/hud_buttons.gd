extends MarginContainer

# Gear Icon
# https://www.freepik.com/icon/gear-outline_44724
# Book Icon
# https://www.freepik.com/icon/book_828370

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_options_button_pressed():
	var options = load("res://options_menu.tscn").instantiate()
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(options)


func _on_book_button_pressed():
	var options = load("res://BookView/book_view.tscn").instantiate()
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(options)
