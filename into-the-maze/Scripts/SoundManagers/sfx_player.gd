extends Node

var audioStream:AudioStreamPlaybackPolyphonic 

#Menu
var Hover = preload("res://Sounds/SFX/hover 2.wav")
var Forward = preload("res://Sounds/SFX/forward.wav")
var Back = preload("res://Sounds/SFX/back.wav")


func play(audio: AudioStream) -> void:
	audioStream.play_stream(audio)
