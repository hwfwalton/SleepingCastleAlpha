extends Control

@export var artifact_name: String = ""

signal open_artifact_view(artifact_name: String)


func _on_texture_button_pressed():
	open_artifact_view.emit(artifact_name)
