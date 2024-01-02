extends MarginContainer

# Gear Icon
# https://www.freepik.com/icon/gear-outline_44724
# Book Icon
# https://www.freepik.com/icon/book_828370

@onready var options_view_scene = preload("res://options_menu.tscn")
@onready var options_button_node = $HUDButtons/OptionsButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_options_button_pressed():
	var options_view = options_view_scene.instantiate()
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(options_view)
	options_button_node.visible = false
	options_view.tree_exited.connect(_on_options_view_closed)

func _on_options_view_closed():
	options_button_node.visible = true
