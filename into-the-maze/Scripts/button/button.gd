extends Area2D
class_name FillButton

@export var linked_walls: Array[StaticBody2D]
@export var linked_buttons: Array[FillButton] 

var pressed_image = load("res://Assets/godot/pressed_button.png")
@onready var sprite = $Sprite2D
var tile_size = 128
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)

func press():
	set_collision_mask_value(1, false)
	sprite.texture = pressed_image
	

func _on_area_entered(area: Area2D) -> void:
	print("pressed")
	for wall in linked_walls:
		wall.hide()
		wall.set_collision_layer_value(1,false)
	press()
	for button in linked_buttons:
		button.press()
