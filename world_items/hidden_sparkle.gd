extends Control

@export var artifact_name: String = ""

signal open_artifact_view(artifact_name: String)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	open_artifact_view.emit(artifact_name)
