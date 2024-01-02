extends Control

signal load_level_request(level_name: String)
signal clue_item_found(clue_item: ClueItem)
signal open_clue_container(container_name: String)
signal open_artifact_view(artifact_name: String)

var nav_sparkle_nodes = []
var clue_item_nodes = []
var clue_container_nodes = []
var artifact_nodes = []
var hidden_nodes = []

# Moon Icon
# https://www.vecteezy.com/png/1189147-moon-crescent

# Called when the node enters the scene tree for the first time.
func _ready():
	var childNodes = get_children()
	childNodes.map(func(node):
		if (node.is_in_group("nav_sparkle")):
			node.load_level_request.connect(self._on_nav_sparkle_load_level_request)
			nav_sparkle_nodes.push_front(node)
		elif (node.is_in_group("clue_item")):
			node.clue_item_found.connect(self._on_clue_sparkle_clue_item_found)
			clue_item_nodes.push_front(node)
		elif (node.is_in_group("container_sparkle")):
			node.open_clue_container.connect(self._on_container_sparkle_open_clue_container)
			clue_container_nodes.push_front(node)
		elif (node.is_in_group("artifact_sparkle")):
			node.open_artifact_view.connect(self._on_artifact_sparkle_open_artifact_view)
			artifact_nodes.push_front(node)
		elif (node.is_in_group("hidden_sparkle")):
			node.open_artifact_view.connect(self._on_artifact_sparkle_open_artifact_view)
			hidden_nodes.push_front(node)
	)
	)

func _on_nav_sparkle_load_level_request(level_name):
	load_level_request.emit(level_name)


func _on_clue_sparkle_clue_item_found(clue_item):
	clue_item_found.emit(clue_item)


func _on_container_sparkle_open_clue_container(container_name):
	open_clue_container.emit(container_name)


func _on_artifact_sparkle_open_artifact_view(artifact_name):
	open_artifact_view.emit(artifact_name)

