extends Player

func _on_movement_ended():
	if position[0]==0:
		sprite.modulate = Color(1,0.3922,0.3922,1)
	elif position[0]==128:
		sprite.modulate = Color(1,0.3922,0.3922,0.5)
	elif position[0]==256:
		sprite.modulate = Color(1,0.3922,0.3922,0)
