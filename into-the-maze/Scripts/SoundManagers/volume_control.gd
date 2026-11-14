extends Control

var masterBus = AudioServer.get_bus_index("Master")
var soundtrackBus = AudioServer.get_bus_index("Soundtrack")
var sfxBus = AudioServer.get_bus_index("SFX")




func _on_master_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(masterBus, value)


func _on_soundtrack_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(soundtrackBus, value)


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(sfxBus, value)



func _on_sfx_slider_drag_ended(value_changed: bool) -> void:
	pass
	# SfxPlayer.play(SfxPlayer.Confirm)
