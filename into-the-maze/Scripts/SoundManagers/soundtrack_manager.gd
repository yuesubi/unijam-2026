extends Node

var audioStream:AudioStreamPlaybackPolyphonic 


var lvl1 = preload("res://Sounds/Soundtrack/lvl1.wav")
var lvl2 = preload("res://Sounds/Soundtrack/lvl2.wav")
var lvl3 = preload("res://Sounds/Soundtrack/lvl3.wav")
var lvl4 = preload("res://Sounds/Soundtrack/lvl4.wav")
var lvl5 = preload("res://Sounds/Soundtrack/lvl5.wav")

var lvl_id_list: Array[int]

var current_lvl = -1


## Start the main game soundtrack.
## 
## lvl is the level you want to start.
## It start at 0 and end at 4.
func play_main_game(lvl: int) -> void :
	lvl_id_list = []
	
	lvl_id_list.append(audioStream.play_stream(lvl1))
	if lvl != 0 : audioStream.set_stream_volume(lvl_id_list[0], linear_to_db(0))
	
	lvl_id_list.append(audioStream.play_stream(lvl2))
	if lvl != 1 : audioStream.set_stream_volume(lvl_id_list[1], linear_to_db(0))
	
	lvl_id_list.append(audioStream.play_stream(lvl3))
	if lvl != 2 : audioStream.set_stream_volume(lvl_id_list[2], linear_to_db(0))
	
	lvl_id_list.append(audioStream.play_stream(lvl4))
	if lvl != 3 : audioStream.set_stream_volume(lvl_id_list[3], linear_to_db(0))
	
	lvl_id_list.append(audioStream.play_stream(lvl5))
	if lvl != 4 : audioStream.set_stream_volume(lvl_id_list[4], linear_to_db(0))

	current_lvl = lvl

## Switch the current lvl with the new_lvl 
##
## 
func switch_lvl(new_lvl: int) -> void :
	audioStream.set_stream_volume(lvl_id_list[current_lvl], linear_to_db(0))
	audioStream.set_stream_volume(lvl_id_list[new_lvl], linear_to_db(1))
	current_lvl = new_lvl


func play_main_menu() -> void : 
	pass
	
func stop() -> void:
	audioStream.stop()

func pause() -> void:
	audioStream.stream_paused = true

func release() -> void:
	audioStream.stream_paused = false
