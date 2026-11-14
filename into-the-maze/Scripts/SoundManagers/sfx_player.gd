extends Node

var audioStream:AudioStreamPlaybackPolyphonic 

#Menu

"""
var Confirm = preload("res://Sounds/SFX/Confirm.wav") 
var Confirm2 = preload("res://Sounds/SFX/Confirm 2.wav") 
var Hover = preload("res://Sounds/SFX/hover 2.wav")
var sparkle = preload("res://Sounds/SFX/sparkle.wav")
var pshit = preload("res://Sounds/SFX/pshit.wav")
var hit = preload("res://Sounds/SFX/hit.wav")
var grab = preload("res://Sounds/SFX/grab.wav")
"""

func play(audio: AudioStream) -> void:
	audioStream.play_stream(audio)
