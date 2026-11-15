extends Node2D

@export var first_scene: PackedScene

@onready var subscene_holder: Node2D = %SubSceneHolder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	switch_to(first_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func switch_to(packed_scene: PackedScene) -> void:
	print("AAAAAAAAAAAAAAAAa")
	for child in subscene_holder.get_children():
		child.queue_free()
		print("bbbbbbbbbbbbb")

	var scene = packed_scene.instantiate()
	subscene_holder.add_child(scene)
	scene.switching_to.connect(switch_to)
