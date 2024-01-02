extends Control

var level_instance: GameStage
var open_clue_views: Array
@onready var level_anchor = $Container/LevelAnchor
@onready var book_button_node = $BookButton

@onready var clue_container_shell = preload("res://clue_containers/ClueContainerShell.tscn")
@onready var book_view_scene = preload("res://BookView/book_view.tscn")
@export var player_state: PlayerState

signal load_level_request(level_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level("castle0")
	book_button_node.pressed.connect(_on_book_button_pressed)
	book_button_node.mouse_entered.connect(_on_book_button_mouse_entered)
	book_button_node.mouse_exited.connect(_on_book_button_mouse_exited)

func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null

func load_level(level_name):
	unload_level()
	var level_path = "res://stages/%s.tscn" % level_name
	var level_resource = load(level_path).instantiate()
	if (level_resource):
		level_instance = level_resource
		level_instance.load_level_request.connect(_on_load_level_request)
		level_instance.clue_item_found.connect(_on_clue_item_found)
		level_instance.open_clue_container.connect(_on_open_clue_container)
		level_instance.open_artifact_view.connect(_on_open_artifact_view)
		level_anchor.add_sibling(level_instance)
		
		if (player_state.has_seen_welcome_letter == false):
			_on_open_artifact_view("castle0/welcome_letter")
			player_state.has_seen_welcome_letter = true


func _on_load_level_request(level_name: String):
	load_level(level_name)

func _on_clue_item_found(clue_item: ClueItem):
	player_state.addClueIfNotAlreadyFound(clue_item)

func _on_open_clue_container(container_name: String):
	var clue_container_shell_instance = clue_container_shell.instantiate() as ClueContainerShell
	clue_container_shell_instance.clue_container_name = container_name
	clue_container_shell_instance.clue_item_found.connect(_on_clue_item_found)
	clue_container_shell_instance.open_artifact_view.connect(_on_open_artifact_view)
	
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(clue_container_shell_instance)
	
	open_clue_views.append(clue_container_shell_instance)
	clue_container_shell_instance.tree_exiting.connect(_on_clue_view_close.bind(clue_container_shell_instance))

func _on_open_artifact_view(artifact_name: String):
	var clue_container_shell_instance = clue_container_shell.instantiate() as ClueContainerShell
	clue_container_shell_instance.artifact_name = artifact_name
	clue_container_shell_instance.clue_item_found.connect(_on_clue_item_found)
	
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(clue_container_shell_instance)
	
	open_clue_views.append(clue_container_shell_instance)
	clue_container_shell_instance.tree_exiting.connect(_on_clue_view_close.bind(clue_container_shell_instance))

func _on_clue_view_close(clue_being_closed: ClueContainerShell):
	open_clue_views = open_clue_views.filter(func(open_view):
		return open_view != clue_being_closed
	)
	open_clue_views.map(func(open_view):
		open_view.update_has_seen_appearance_of_all_nodes()
	)
	level_instance.update_has_seen_appearance_of_all_nodes()

func _on_book_button_pressed():
	var book_view = book_view_scene.instantiate()
	var scene_to_add_to = get_tree().current_scene.get_viewport()
	scene_to_add_to.add_child(book_view)
	book_button_node.visible = false
	book_view.tree_exited.connect(_on_book_view_closed)

func _on_book_view_closed():
	book_button_node.visible = true


func _on_book_button_mouse_entered():
	book_button_node.scale = Vector2(1.05, 1.05)


func _on_book_button_mouse_exited():
	book_button_node.scale = Vector2(1, 1)
