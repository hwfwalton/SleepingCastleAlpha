extends ArtifactView

var mus_fancy_song_music_box: AudioStream = preload("res://assets/audio/music/mus-fancy-song-music-box-version-29-dec-2023.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.setArtifactMusicTrackTo(mus_fancy_song_music_box)
	AudioManager.playArtifactMusic()
