extends Node2D
class_name Level_base

var cross = preload("res://Scenes/cross.tscn")
var instance

var tile_size = 128

var objective:int = 0

signal death

func _on_death():
	# SFX (to be safe)
	SfxPlayer.play(SfxPlayer.Death) 
	
	# Code
	death.emit()
	

func _on_objective() -> void:
	objective+=1
	if objective==2:
		print("victory")
		
		# SFX
		SfxPlayer.play(SfxPlayer.Finish)

func _on_objective_left() -> void:
	objective-=1
	print(objective)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("reload"):
		get_tree().call_deferred("reload_current_scene")

#Mounir Shenanigans (la croix)

#Parce que c'est scuffed as fuck et j'suis fatigué

func choicer():
	var x
	var y

	x = int(get_global_mouse_position().x) % 128
	y = int(get_global_mouse_position().y) % 128
	var positon = Vector2.ZERO
	print("x :", x)
	print("y :", y)
	if (x < 64 and y < 64):
		positon += 64*(Vector2.ONE)
	elif (x > 64 and y > 64):
		positon -= 64*(Vector2.ONE)
	elif (x > 64 and y < 64):
		positon += 64*(Vector2.DOWN+Vector2.LEFT)
	else :
		positon -= 64*(Vector2.DOWN+Vector2.LEFT)
	return (positon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("left_click") or Input.is_action_just_pressed("ui_accept")):
		spawn_cross(get_global_mouse_position())

func spawn_cross(pos):
	pos = pos.snapped(Vector2.ONE * tile_size) + choicer()
	if (!instance):
		instance = cross.instantiate()
		instance.position = pos
		add_child(instance)
	else:
		instance.queue_free()
		instance = cross.instantiate()
		instance.position = pos
		add_child(instance)
