extends Area2D

@onready var ray = $RayCast2D
@export var tile_map: TileMap



var tile_size = 128
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}


signal death
signal objective
signal objective_left

var animation_speed = 6.7
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	#position += Vector2.ONE * tile_size

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
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


func _on_body_entered(body: Node2D) -> void:
	if get_collision_mask_value(2):
		#print("death")
		death.emit()
	elif get_collision_mask_value(3):
		objective.emit()


func _on_body_exited(body: Node2D) -> void:
	if not get_collision_mask_value(3):
		objective_left.emit()
