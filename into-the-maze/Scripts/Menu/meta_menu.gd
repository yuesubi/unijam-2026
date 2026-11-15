extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SfxPlayer.audioStream = %SFXAudioPlayer.get_stream_playback()
	SoundtrackManager.audioStream = %SoundtrackAudioPlayer.get_stream_playback()
	SoundtrackManager.play_main_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
