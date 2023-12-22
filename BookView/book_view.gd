extends Control

# Close Icon
# https://www.flaticon.com/free-icon/close_2976286

@export var player_state: PlayerState
var book_view_name_item: PackedScene = preload("res://BookView/book_view_clue_item_combined.tscn")
var book_view_symbol_item: PackedScene = preload("res://BookView/SymbolItems/symbol_item_combined.tscn")

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
	
	_populateTabWithType(ClueItem.CLUE_TYPE.NAME, names_tab, book_view_name_item)
	_populateTabWithType(ClueItem.CLUE_TYPE.SYMBOL, symbols_tab, book_view_symbol_item)
	
	clues_tab_container.current_tab = player_state.book_last_viewed_clue_tab_idx
	clues_tab_container.tab_changed.connect(_on_clue_tab_change)
	
	puzzles_tab_container.current_tab = player_state.book_last_viewed_puz_tab_idx
	puzzles_tab_container.tab_changed.connect(_on_puzzle_tab_change)
	
	_update_has_unseen_items_marks()


func _populateTabWithType(clue_type: ClueItem.CLUE_TYPE, tab_node: Control, book_view_clue_item_scene: PackedScene):
	var found_clue_items_of_type = player_state.getFoundCluesOfType(clue_type)

	found_clue_items_of_type.map(func(found_clue_item: FoundClueItem):
		var clue_item_node = book_view_clue_item_scene.instantiate().init(found_clue_item)
		tab_node.add_child(clue_item_node)
	)
	tab_node.draw.connect(_on_clue_tab_visible)


func _defered_update_clue_initial_postions():
	call_deferred("__update_clue_initial_positions")


func __update_clue_initial_positions():
	# clue_node can be BookViewClueItemCombined or SymbolItemCombined
	clues_tab_container.get_current_tab_control().get_children().map(func(clue_node):
		clue_node.setInitialPosition()
	)


func _update_has_unseen_items_marks():
	clues_tab_container.get_children().map(func(tab_node: Control):
		var tab_idx = clues_tab_container.get_tab_idx_from_control(tab_node)
		var last_seen_item_count = book_last_seen_clue_count_by_idx[tab_idx]
		var items_in_tab = tab_node.get_child_count()
		if (items_in_tab > last_seen_item_count):
			clues_tab_container.set_tab_title(tab_idx, tab_node.name + "*")
		else:
			clues_tab_container.set_tab_title(tab_idx, tab_node.name)
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
	
	_update_has_unseen_items_marks()
	
	player_state.book_last_viewed_clue_tab_idx = selected_tab_idx


func _on_puzzle_tab_change(selected_tab_idx: int):
	AudioManager.sfx_book_page_turn.play()
	player_state.book_last_viewed_puz_tab_idx = selected_tab_idx


func _on_close_button_pressed():
	AudioManager.sfx_book_close.play()
	AudioManager.playStageMusic()
	queue_free()
	get_parent().emit_signal("ready")
