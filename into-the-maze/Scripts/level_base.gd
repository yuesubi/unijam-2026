extends Node2D

var objective:int = 0

func _on_death():
	print("death")
	get_tree().call_deferred("reload_current_scene")

func _on_objective() -> void:
	objective+=1
	print(objective)
	if objective==2:
		print("victory")

func _on_objective_left() -> void:
	objective-=1
	print(objective)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("reload"):
		get_tree().call_deferred("reload_current_scene")
		
