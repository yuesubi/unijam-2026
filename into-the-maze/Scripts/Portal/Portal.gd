extends Area2D
class_name Portal

@export var linkedPortal: Portal
var tile_size = 128
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
