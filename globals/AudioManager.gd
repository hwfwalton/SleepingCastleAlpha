extends Node

var mus_flute_lead: AudioStream = preload("res://assets/audio/music/mus-flute-lead-song-10-dec-2023.ogg")
var mus_neutral_loop: AudioStream = preload("res://assets/audio/music/mus-neutral-loop-10-dec-2023.ogg")
var mus_expository_song: AudioStream = preload("res://assets/audio/music/mus-expository-song-10-dec-2023.ogg")
@onready var stage_music_player: AudioStreamPlayer = $stage_music_player
@onready var book_music_player: AudioStreamPlayer = $book_music_player
@onready var sfx_book_open: AudioStreamPlayer = $sfx_book_open
@onready var sfx_book_page_turn: AudioStreamPlayer = $sfx_book_page_turn
@onready var sfx_book_close: AudioStreamPlayer = $sfx_book_close


# Called when the node enters the scene tree for the first time.
func _ready():
	#mus_flute_lead
	stage_music_player.play()
	book_music_player.play()
	book_music_player.stream_paused = true

func playMainMenuMusic():
	stage_music_player.stream = mus_flute_lead
	stage_music_player.stream_paused = false
	stage_music_player.play()

func switchStageMusicTrackToCastle():
	stage_music_player.stream = mus_expository_song
	stage_music_player.play()
	stage_music_player.stream_paused = true

func playStageMusic():
	book_music_player.stream_paused = true
	stage_music_player.stream_paused = false

func playBookMusic():
	stage_music_player.stream_paused = true
	book_music_player.stream_paused = false
