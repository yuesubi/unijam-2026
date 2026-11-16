extends Area2D
class_name Player

@onready var ray = $RayCast2D
@export var tile_map: TileMap

@onready var player = $"../Player"
@onready var invis_player = $"../invis_player"

var sprite: Sprite2D

var sprite_up = load("res://Assets/spider/Spider_up.png")
var sprite_right = load("res://Assets/spider/Spider_Right.png")
var sprite_left = load("res://Assets/spider/Spider_Left.png")
var sprite_down = load("res://Assets/spider/Spider_Down.png")
var tile_size = 128
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}


signal death
signal objective
signal objective_left
signal movement_ended

var animation_speed = 6.7
var moving = false
var warping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	sprite = get_child(0)

func _unhandled_input(event):
	if moving or player.warping or invis_player.warping:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	if dir == "ui_right":
		sprite.texture = sprite_right
	elif dir == "ui_left":
		sprite.texture = sprite_left
	elif dir == "ui_up":
		sprite.texture = sprite_up
	elif dir == "ui_down":
		sprite.texture = sprite_down
		
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
		movement_ended.emit()
		
		# SFX player is moving for shure 
		if sprite.visible : SfxPlayer.play(SfxPlayer.Step)
		
	


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	var layer:int
	if body is TileMapLayer:
		var coords = body.get_coords_for_body_rid(body_rid)
		var tile_data = body.get_cell_tile_data(coords)
		layer=tile_data.get_custom_data("layer")
	if layer==1:
		death.emit()
	if layer==2:
		await movement_ended
		await get_tree().create_timer(0.1).timeout
		objective.emit()


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	var layer:int
	if body is TileMapLayer:
		var coords = body.get_coords_for_body_rid(body_rid)
		var tile_data = body.get_cell_tile_data(coords)
		layer=tile_data.get_custom_data("layer")
	if layer==2:
		objective_left.emit()
