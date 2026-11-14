extends Node2D

var cross = preload("res://Scenes/cross.tscn")

var tile_size = 128
var objective:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		spawn_cross(get_global_mouse_position().snapped(Vector2.ONE * tile_size))

func spawn_cross(pos):
	var instance = cross.instantiate()
	instance.position = pos
	add_child(instance)


func _on_death():
	print("death")
	get_tree().reload_current_scene()


func _on_objective() -> void:
	objective+=1
	print(objective)
	if objective==2:
		print("victory")


func _on_objective_left() -> void:
	objective-=1
