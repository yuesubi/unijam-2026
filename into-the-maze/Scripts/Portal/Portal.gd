extends Area2D
class_name Portal

@export var linkedPortal: Portal
var tile_size = 128
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = position.snapped(Vector2.ONE * tile_size)
	
	

func _on_area_entered(area: Area2D) -> void:
	if area is Player:
		if not area.warping:
			print("warping")
			area.warping = true
			var next_pos = linkedPortal.position
			area.position = next_pos.snapped(Vector2.ONE * tile_size)
			
			#SFX
			if area.sprite.visible : SfxPlayer.play(SfxPlayer.Warp)
		else:
			print("not warping")
			area.warping = false
			if get_collision_layer_value(5):
				area.sprite.show()
			else:
				area.sprite.hide()
