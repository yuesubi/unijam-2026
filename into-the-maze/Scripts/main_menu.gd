extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SfxPlayer.audioStream = %SFXAudioPlayer.get_stream_playback()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






# Button actions 
# --------------------


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	SfxPlayer.play(SfxPlayer.Forward)
	%VolumePanel.visible = true


func _on_volume_panel_on_back_clicked() -> void:
	SfxPlayer.play(SfxPlayer.Back)





# Button Hovers
# ---------------------
func _on_play_button_mouse_entered() -> void:
	SfxPlayer.play(SfxPlayer.Hover)


func _on_settings_button_mouse_entered() -> void:
	SfxPlayer.play(SfxPlayer.Hover)


func _on_quit_button_mouse_entered() -> void:
	SfxPlayer.play(SfxPlayer.Hover)
