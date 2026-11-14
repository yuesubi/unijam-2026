extends Node2D

var objective:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
	print(objective)
