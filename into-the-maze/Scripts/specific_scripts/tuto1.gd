extends Player

func _on_movement_ended():
	if position[0]==1024:
		sprite.modulate = Color(1,0.3922,0.3922,1)
	elif position[0]==1152:
		sprite.modulate = Color(1,0.3922,0.3922,0.66)
	elif position[0]==1280:
		sprite.modulate = Color(1,0.3922,0.3922,0.33)
	elif position[0]==1408:
		sprite.modulate = Color(1,0.3922,0.3922,0)
