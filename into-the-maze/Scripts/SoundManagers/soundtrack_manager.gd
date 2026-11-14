extends Node

var audioPlayer:AudioStreamPlayer2D

"""
var mainMenu = preload("res://Sounds/Soundtrack/Magical destiny but something wrong.wav")
var loading = preload("res://Sounds/Soundtrack/loading.wav")
var gameOver = preload("res://Sounds/Soundtrack/gameover.wav")
var failure = preload("res://Sounds/Soundtrack/failure.wav")
var success = preload("res://Sounds/Soundtrack/nice.wav")
var victory = preload("res://Sounds/Soundtrack/Victory.wav")

var pandBall = preload("res://Sounds/Soundtrack/Panda ball.wav")
var magicRealm = preload("res://Sounds/Soundtrack/Magic Realm.wav")
var introMinigame = preload("res://Sounds/Soundtrack/intro (minigame).wav")
var rcCarRacing = preload("res://Sounds/Soundtrack/RC car racing 8bit edition.wav")
var magicalWaiting = preload("res://Sounds/Soundtrack/A destiny cannot wait.wav")
"""



func play(audio: AudioStream) -> void:
	audioPlayer.stream = audio
	audioPlayer.play()
	
func stop() -> void:
	audioPlayer.stop()

func pause() -> void:
	audioPlayer.stream_paused = true

func release() -> void:
	audioPlayer.stream_paused = false
