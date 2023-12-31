extends VBoxContainer
class_name BookViewCluesPage


@export var player_state_alpha_sort_key: String = ""
@export var player_state_sort_asc_key: String = ""
@export var player_state: PlayerState

@onready var clues_container = $CluesContainer
@onready var alpha_sort_button_node: Button = $SortButtons/AlphaSortButton
@onready var time_sort_button_node: Button = $SortButtons/TimeSortButton
@onready var sort_dir_button_node: Button = $SortButtons/SortDirectionButton

var clues_to_show: Array[FoundClueItem]
var clue_item_scene_to_use: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var is_alpha_sort = player_state[player_state_alpha_sort_key]
	var is_sort_asc = player_state[player_state_sort_asc_key]
	
	if is_alpha_sort:
		alpha_sort_button_node.button_pressed = true
	else:
		time_sort_button_node.button_pressed = true
	
	sort_dir_button_node.button_pressed = is_sort_asc
	
	if (clues_to_show && clue_item_scene_to_use):
		render_clues()


func set_clues_and_clue_scene(found_clues_to_show: Array[FoundClueItem], book_view_clue_item_scene: PackedScene):
	clues_to_show = found_clues_to_show
	clue_item_scene_to_use = book_view_clue_item_scene

func render_clues():
	var is_alpha_sort = player_state[player_state_alpha_sort_key]
	var is_sort_asc = player_state[player_state_sort_asc_key]

	clues_to_show.sort_custom(func(item_a: FoundClueItem, item_b: FoundClueItem):
		var is_a_before_b = false
		if (is_alpha_sort):
			is_a_before_b = item_a.clue_item.getClueSortValue() < item_b.clue_item.getClueSortValue()
		else:
			is_a_before_b = item_a.found_timestamp < item_b.found_timestamp
		
		return is_a_before_b if is_sort_asc else !is_a_before_b
	)
	
	# Clear out existing children before adding the new ones
	var existing_children = clues_container.get_children()
	clues_container.get_children().map(func(child):
			clues_container.remove_child(child)
			child.queue_free()
	)

	clues_to_show.map(func(found_clue_item: FoundClueItem):
		var clue_item_node = clue_item_scene_to_use.instantiate().init(found_clue_item)
		clues_container.add_child(clue_item_node)
	)

func set_clue_items_initial_position():
	clues_container.get_children().map(func(clue_node):
		clue_node.setInitialPosition()
	)


func _on_alpha_sort_button_pressed():
	player_state[player_state_alpha_sort_key] = true
	render_clues()


func _on_time_sort_button_pressed():
	player_state[player_state_alpha_sort_key] = false
	render_clues()


func _on_sort_direction_button_toggled(toggled_on):
	player_state[player_state_sort_asc_key] = toggled_on
	render_clues()
