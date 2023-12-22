extends Control

# Close Icon
# https://www.flaticon.com/free-icon/close_2976286

@export var player_state: PlayerState
@onready var book_view_clue_item_scene: PackedScene = preload("res://BookView/book_view_clue_item_combined.tscn")
@onready var book_port = $BookViewSubViewportContainer/SubViewport/BookPort
@onready var clues_tab_container = $BookViewSubViewportContainer/SubViewport/BookPort/PagesContainer/LeftBookMargin/TabContainer_Clues
@onready var puzzles_tab_container = $BookViewSubViewportContainer/SubViewport/BookPort/PagesContainer/RightBookMargin/TabContainer_Puzzles
@onready var names_tab = $BookViewSubViewportContainer/SubViewport/BookPort/PagesContainer/LeftBookMargin/TabContainer_Clues/Names
@onready var symbols_tab = $BookViewSubViewportContainer/SubViewport/BookPort/PagesContainer/LeftBookMargin/TabContainer_Clues/Symbols

@onready var book_last_seen_clue_count_by_idx: Array[int] = player_state.book_last_seen_clue_count_by_idx

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.sfx_book_open.play()
	AudioManager.playBookMusic()
	book_port.grab_focus()
	
	_populateTabWithType(ClueItem.CLUE_TYPE.NAME, names_tab, book_last_seen_clue_count_by_idx[0], 0)
	_populateTabWithType(ClueItem.CLUE_TYPE.SYMBOL, symbols_tab, book_last_seen_clue_count_by_idx[1], 1)
	
	clues_tab_container.current_tab = player_state.book_last_viewed_clue_tab_idx
	clues_tab_container.tab_changed.connect(_on_clue_tab_change)
	
	puzzles_tab_container.current_tab = player_state.book_last_viewed_puz_tab_idx
	puzzles_tab_container.tab_changed.connect(_on_puzzle_tab_change)


func _populateTabWithType(clue_type: ClueItem.CLUE_TYPE, tab_node: Control, last_viewed_count: int, tab_index):
	var found_clue_items_of_type = player_state.getFoundCluesOfType(clue_type)
	#clues_tab_container.set_tab_hidden(tab_index, found_clue_items_of_type.size() == 0)

	found_clue_items_of_type.map(func(found_clue_item: FoundClueItem):
		var clue_item_node = book_view_clue_item_scene.instantiate().init(found_clue_item)
		tab_node.add_child(clue_item_node)
	)
	tab_node.draw.connect(_on_clue_tab_visible)
	if (found_clue_items_of_type.size() > last_viewed_count):
		tab_node.name += "*"


func _defered_update_clue_initial_postions():
	call_deferred("__update_clue_initial_positions")


func __update_clue_initial_positions():
	clues_tab_container.get_current_tab_control().get_children().map(func(clue_node: BookViewClueItemCombined):
		clue_node.setInitialPosition()
	)


func _on_clue_tab_visible():
	_defered_update_clue_initial_postions()


func _on_clue_tab_change(selected_tab_idx: int):
	AudioManager.sfx_book_page_turn.play()
	var departing_tab_idx = player_state.book_last_viewed_clue_tab_idx
	var departing_tab_node = clues_tab_container.get_child(departing_tab_idx)
	var departing_tab_item_count = departing_tab_node.get_child_count()
	
	book_last_seen_clue_count_by_idx[departing_tab_idx] = departing_tab_item_count
	player_state.book_last_seen_clue_count_by_idx = book_last_seen_clue_count_by_idx
	
	departing_tab_node.name = departing_tab_node.name.replace("*", "")
	player_state.book_last_viewed_clue_tab_idx = selected_tab_idx


func _on_puzzle_tab_change(selected_tab_idx: int):
	AudioManager.sfx_book_page_turn.play()
	player_state.book_last_viewed_puz_tab_idx = selected_tab_idx


func _on_close_button_pressed():
	AudioManager.sfx_book_close.play()
	AudioManager.playStageMusic()
	queue_free()
	get_parent().emit_signal("ready")
