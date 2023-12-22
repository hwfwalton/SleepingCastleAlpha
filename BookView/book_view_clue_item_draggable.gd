extends Node2D

@export var item_label_value: String = ""
var found_clue_item: FoundClueItem

@onready var book_view_clue_item = $BookViewClueItem
var draggable = false
var overlapped_droppables_stack = []
var offset: Vector2
var initial_position: Vector2


func init(g_found_clue_item: FoundClueItem):
	found_clue_item = g_found_clue_item
	return self

func updateLabel():
	if (book_view_clue_item && found_clue_item):
		book_view_clue_item.init(found_clue_item).updateLabel()

# Called when the node enters the scene tree for the first time.
func _ready():
	updateLabel()


func setInitialPosition():
	initial_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			z_index = 2
			GlobalState.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			z_index = 1
			offset = Vector2(0,0)
			GlobalState.is_dragging = false
			_on_book_view_clue_item_mouse_exited()
			var tween = get_tree().create_tween()
			if (overlapped_droppables_stack.size() > 0):
				var overlapped_body_ref = overlapped_droppables_stack[0]
				tween.tween_property(self, "global_position", overlapped_body_ref.global_position, 0.2).set_ease(Tween.EASE_OUT)
				overlapped_body_ref.emitFoundClueSubmitted(found_clue_item)
			else:
				tween.tween_property(self, "global_position", initial_position, 0.2).set_ease(Tween.EASE_OUT)
			tween.finished.connect(_return_to_start)


func _return_to_start():
	global_position = initial_position


func _on_area_2d_body_entered(body):
	var compatible_drop_group = found_clue_item.clue_item.getClueCompatibleDropGroup()

	if body.is_in_group(compatible_drop_group):
		print("INSIDE VALID DROPPABLE")
		overlapped_droppables_stack.push_front(body)
		body.modulate = Color(Color.REBECCA_PURPLE, 1)


func _on_area_2d_body_exited(body):
	var compatible_drop_group = found_clue_item.clue_item.getClueCompatibleDropGroup()
	
	if body.is_in_group(compatible_drop_group):
		# Remove the exitted body from the "overlapped_droppables_stack"
		overlapped_droppables_stack = overlapped_droppables_stack.filter(func(overlapped_body: StaticBody2D):
			return overlapped_body != body
		)
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)


func _on_book_view_clue_item_mouse_entered():
	if not GlobalState.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_book_view_clue_item_mouse_exited():
	if not GlobalState.is_dragging:
		draggable = false
		scale = Vector2(1, 1)

