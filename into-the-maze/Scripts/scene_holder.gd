extends Node

@export var default_scene: PackedScene
var current_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !GameData.scene_to_load.is_empty():
		self.default_scene = load(GameData.scene_to_load)
	switch_to(self.default_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func reload_scene() -> void:
	switch_to(self.current_scene)

func switch_to(packed_scene: PackedScene) -> void:
	
	for child in self.get_children():
		child.queue_free()
	
	self.current_scene = packed_scene

	var scene = packed_scene.instantiate()
	self.add_child(scene)
	scene.switching_to.connect(switch_to)
	scene.reloading_scene.connect(reload_scene)
