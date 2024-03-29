extends Node

var mus_flute_lead: AudioStream = preload("res://assets/audio/music/mus-flute-lead-song-10-dec-2023.ogg")
var mus_neutral_loop: AudioStream = preload("res://assets/audio/music/mus-neutral-loop-10-dec-2023.ogg")
var mus_expository_song: AudioStream = preload("res://assets/audio/music/mus-expository-song-10-dec-2023.ogg")
var mus_victory_reprise: AudioStream = preload("res://assets/audio/music/mus-victory-reprise-29-dec-2023.ogg")
@onready var music_stage_player: AudioStreamPlayer = $music_stage_player
@onready var music_book_player: AudioStreamPlayer = $music_book_player
@onready var music_artifact_player: AudioStreamPlayer = $music_artifact_player
@onready var sfx_book_open: AudioStreamPlayer = $sfx_book_open
@onready var sfx_book_page_turn: AudioStreamPlayer = $sfx_book_page_turn
@onready var sfx_book_close: AudioStreamPlayer = $sfx_book_close
@onready var sfx_reverb_kick: AudioStreamPlayer = $sfx_reverb_kick
@onready var sfx_door_creak: AudioStreamPlayer = $sfx_door_creak
@onready var sfx_artifact_touch: AudioStreamPlayer = $sfx_artifact_touch

var artifact_open_sfx_streams = {
	GlobalState.ARTIFACT_TOUCH_SFX.ITEMS: preload("res://assets/audio/sfx/sfx-misc-items-fall-29-dec-2023.ogg"),
	GlobalState.ARTIFACT_TOUCH_SFX.PAPER: preload("res://assets/audio/sfx/sfx-unfurling-scroll-29-dec-2023.ogg"),
	GlobalState.ARTIFACT_TOUCH_SFX.WHISPERS: preload("res://assets/audio/sfx/sfx-indistinct-whispers-29-dec-2023.ogg"),
}

# Called when the node enters the scene tree for the first time.
func _ready():
	music_stage_player.play()
	music_book_player.play()
	music_book_player.stream_paused = true

func playMainMenuMusic():
	if (music_stage_player.stream == mus_flute_lead && music_stage_player.playing):
		return
	music_stage_player.stream = mus_flute_lead
	music_stage_player.stream_paused = false
	music_stage_player.play()

func _switchStageMusicTrackToCastle():
	music_stage_player.stream = mus_expository_song
	music_stage_player.play()
	music_stage_player.stream_paused = true

func _switchStageMusicTrackToVictory():
	music_stage_player.stream = mus_victory_reprise
	music_stage_player.play()
	music_stage_player.stream_paused = true

func setArtifactMusicTrackTo(artifact_music_audio_stream: AudioStream):
	music_artifact_player.stream = artifact_music_audio_stream
	music_artifact_player.play()
	music_artifact_player.stream_paused = true

func playStageMusic():
	music_artifact_player.stream_paused = true
	music_book_player.stream_paused = true

	music_stage_player.stream_paused = false
	
func playBookMusic():
	music_artifact_player.stream_paused = true
	music_stage_player.stream_paused = true

	music_book_player.stream_paused = false

func playArtifactMusic():
	music_stage_player.stream_paused = true
	music_book_player.stream_paused = true

	music_artifact_player.stream_paused = false

func playNewGameSfxAndMusic():
	_switchStageMusicTrackToCastle()
	playStageMusic()
	sfx_reverb_kick.play()

func playGameVictoryMusic():
	_switchStageMusicTrackToVictory()
	playStageMusic()

func playArtifactTouchSfx(artifact_touch_sfx: GlobalState.ARTIFACT_TOUCH_SFX):
	if (artifact_touch_sfx == GlobalState.ARTIFACT_TOUCH_SFX.NONE):
		return
	else:
		sfx_artifact_touch.stream = artifact_open_sfx_streams.get(artifact_touch_sfx)
		sfx_artifact_touch.play()
		
