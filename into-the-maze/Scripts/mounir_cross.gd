extends Area2D

@onready var ray = $RayCast2D
@export var tile_map: TileMap
@onready var sprite_2d: Sprite2D = $Sprite2D


var tile_size = 128
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}


var animation_speed = 6.7
var moving = false
var warping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.hide()
	position = position.snapped(Vector2.ONE * tile_size)
	ray.target_position = position
	ray.force_raycast_update()
	print(position)
	if ray.is_colliding():
		queue_free()
	await get_tree().create_timer(0.03).timeout
	sprite_2d.visible = true
	#position += Vector2.ONE * (tile_size/2)


func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	#fuck_my_life()
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		var tween = create_tween()
		tween.tween_property(self, "position",
			position + inputs[dir] *    tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false

# 2 LIGNES !!!!!
# FUCK MY LIFE, 2 LIGNES !!!!!!!!!!!!!!!!!
func _on_body_entered(body: Node2D) -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Portal:
		queue_free()
