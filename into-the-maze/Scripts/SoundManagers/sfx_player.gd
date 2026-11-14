extends Node

var audioStream:AudioStreamPlaybackPolyphonic 

#Menu
var Hover = preload("res://Sounds/SFX/hover 2.wav")
var Forward = preload("res://Sounds/SFX/forward.wav")
var Back = preload("res://Sounds/SFX/back.wav")

# In game
var Finish = preload("res://Sounds/SFX/Finish.wav")
var Wall = preload("res://Sounds/SFX/Block.wav")
#var Button1 = preload("res://Sounds/SFX/Button1.wav")
var MyButton = preload("res://Sounds/SFX/Button2.wav")
#var Warp1 = preload("res://Sounds/SFX/Warp1.wav")
var Warp = preload("res://Sounds/SFX/Warp2.wav")
var Death = preload("res://Sounds/SFX/Death.wav")
var Step = preload("res://Sounds/SFX/pshit.wav")
var BlowUp = preload("res://Sounds/SFX/BlowUp.wav")


func play(audio: AudioStream) -> void:
	audioStream.play_stream(audio)
