extends Control
class_name ClueContainerShell

@export var player_state: PlayerState
@onready var sub_viewport = $ClueContainerSubViewportContainer/SubViewport
var clue_view_node
var clue_container_name: String = ""
var artifact_name: String = ""
signal clue_item_found(clue_item: ClueItem)
signal open_artifact_view(artifact_name: String)

# Called when the node enters the scene tree for the first time.
func _ready():

	if (clue_container_name):
		clue_view_node = load("res://clue_containers/%s.tscn" % clue_container_name).instantiate()
		sub_viewport.add_child(clue_view_node)
	elif (artifact_name):
		clue_view_node = load("res://clue_artifacts/%s.tscn" % artifact_name).instantiate()
		sub_viewport.add_child(clue_view_node)

	var clue_items_in_container = clue_view_node.getClueNodes()
	clue_items_in_container.map(func(clue_item_node: ClueSparkle):
		clue_item_node.clue_item_found.connect(self._on_clue_item_found)
	)
	
	var artifact_sparkles_in_container = clue_view_node.getArtifactNodes()
	artifact_sparkles_in_container.map(func(artifact_node: ArtifactSparkle):
		artifact_node.open_artifact_view.connect(self._on_open_artifact_view)
	)
	
	get_tree().call_group("clue_item", "emit_found_signal")


func _on_close_button_pressed():
	if (artifact_name):
		player_state.seen_artifact_views[artifact_name] = true
	elif (clue_container_name):
		var all_artifacts_seen = clue_view_node.getArtifactNodes().all(func(artifact_node: ArtifactSparkle):
			return player_state.seen_artifact_views.has(artifact_node.artifact_name)
		)
		player_state.seen_all_artifacts_in_container[clue_container_name] = all_artifacts_seen
		
		
	queue_free()
	get_parent().emit_signal("ready")
	clue_view_node = null

func _on_clue_item_found(clue_item: ClueItem):
	clue_item_found.emit(clue_item)

func _on_open_artifact_view(clicked_artifact_name: String):
	open_artifact_view.emit(clicked_artifact_name)


func update_has_seen_appearance_of_all_nodes():
	clue_view_node.getArtifactNodes().map(func(artifact_node: ArtifactSparkle):
		artifact_node.update_has_seen_appearance()
	)
