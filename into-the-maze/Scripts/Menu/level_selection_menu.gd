extends "res://Scripts/contenerized_scene.gd"

signal back(scene: PackedScene)
var main_menu_scene = preload("res://Scenes/Menus/main_menu.tscn")

class LevelEntry:
	var name: String
	var scene_path: String
	
	func _init(name: String, scene_path: String):
		self.name = name
		self.scene_path = scene_path

var levels: Array[LevelEntry] = [
	LevelEntry.new("Tuto 1", "res://Scenes/Levels/tuto1.tscn"),
	LevelEntry.new("Tuto 2", "res://Scenes/Levels/tuto2.tscn"),
	LevelEntry.new("Tuto 3", "res://Scenes/Levels/tuto3.tscn"),
	LevelEntry.new("Tuto 4", "res://Scenes/Levels/tuto4.tscn"),
	LevelEntry.new("Level 1", "res://Scenes/Levels/level1.tscn"),
	LevelEntry.new("Level 2", "res://Scenes/Levels/level2.tscn"),
	LevelEntry.new("Level 3", "res://Scenes/Levels/level3.tscn"),
	LevelEntry.new("Level 4", "res://Scenes/Levels/niveau_n3.tscn"),
	LevelEntry.new("Level 5", "res://Scenes/Levels/niveau n1.tscn"),
	LevelEntry.new("Level 6", "res://Scenes/Levels/niveau n2.tscn"),
	LevelEntry.new("Level 7", "res://Scenes/Levels/levelButton.tscn"),
	LevelEntry.new("Level 8", "res://Scenes/Levels/tutoLaser.tscn"),
	LevelEntry.new("Level 9", "res://Scenes/Levels/level_Final.tscn"),
	
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
				# SFX
				SoundtrackManager.stop_main_menu()
				
				GameData.scene_to_load = level.scene_path
				get_tree().change_scene_to_file("res://Scenes/SceneContainers/level_container.tscn")
		)
		button.mouse_entered.connect(button_hover)
		level_container.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_hover() :
	SfxPlayer.play(SfxPlayer.Hover)




func _on_back_button_pressed() -> void:
	back.emit(main_menu_scene)
