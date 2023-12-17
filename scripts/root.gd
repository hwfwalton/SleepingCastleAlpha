extends Control

var level_instance
# Called when the node enters the scene tree for the first time.
func _ready():
	$Game.visible = false


#func unload_level():
	#if (is_instance_valid(level_instance)):
		#level_instance.queue_free()
	#level_instance = null

func load_level(level_name):
	$MainMenu.visible = false
	$Game.visible = true
	$Game.load_level(level_name)


func _on_main_menu_load_level_request(level_name):
	load_level(level_name)
