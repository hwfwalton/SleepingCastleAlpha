extends Control

func getClueNodes():
	var clue_nodes = get_children().filter(func(node):
		return node.is_in_group("clue_item")
	)
	return clue_nodes

func getArtifactNodes():
	var artifact_sparkles = get_children().filter(func(node):
		return node.is_in_group("artifact_sparkle")
	)
	return artifact_sparkles
