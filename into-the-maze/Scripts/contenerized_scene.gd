extends Node

signal switching_to(scene: PackedScene)
signal reloading_scene()

func switch_to(scene: PackedScene):
	switching_to.emit(scene)

func reload_scene():
	reloading_scene.emit()
