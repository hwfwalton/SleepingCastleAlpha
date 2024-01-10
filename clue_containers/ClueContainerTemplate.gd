extends Control
class_name ContainerView


func getClueNodes():
	var clue_nodes = get_children().filter(func(node):
		return node.is_in_group("clue_item")
	)
	return clue_nodes

func getArtifactNodes():
	var artifact_sparkle = get_children().filter(func(node):
		return node.is_in_group("artifact_sparkle")
	)
	return artifact_sparkle
