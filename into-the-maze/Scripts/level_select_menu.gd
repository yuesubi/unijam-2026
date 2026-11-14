extends Control

class LevelEntry:
	var name: String
	var scene_path: String
	
	func _init(name: String, scene_path: String):
		self.name = name
		self.scene_path = scene_path

var levels: Array[LevelEntry] = [
	LevelEntry.new("Kaily", "res://Scenes/Kaily.tscn"),
	LevelEntry.new("Mounir", "res://Scenes/Mounir.tscn"),
]

@onready var level_container: HFlowContainer = %LevelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levels:
		# TODO: spawn a prefab if needs to be styled
		var button = Button.new()
		button.text = level.name
		button.pressed.connect(
			func() -> void:
				get_tree().change_scene_to_file(level.scene_path)
		)
		level_container.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
