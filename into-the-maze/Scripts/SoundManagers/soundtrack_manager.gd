extends Node

var audioPlayer:AudioStreamPlayer2D



func play(audio: AudioStream) -> void:
	audioPlayer.stream = audio
	audioPlayer.play()
	
func stop() -> void:
	audioPlayer.stop()

func pause() -> void:
	audioPlayer.stream_paused = true

func release() -> void:
	audioPlayer.stream_paused = false
