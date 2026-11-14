extends Control

signal on_back_hovered
signal on_back_clicked

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
	SfxPlayer.play(SfxPlayer.Forward)


func _on_back_button_pressed() -> void:
	visible = false
	on_back_clicked.emit()
	


func _on_back_button_mouse_entered() -> void:
	on_back_hovered.emit()
