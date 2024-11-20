extends Node3D

@export_file("*.tscn") var menu_scene
@onready var level_label:Label = $Control/Label
var selected_name:String
var selected_clue:String
var best_time:String
var selected_scene = null
var label_defaul_txt:String = "Level selection"

func _ready():
	pass # Replace with function body.

func no_selected():
	print("no selected")
	level_label.text = label_defaul_txt
	
func level_selected(level):
	print(level)
	level_label.text = level[0] + "\n" + level[1]
	pass


func _on_btn_menu_pressed():
	print("Eval")
	get_tree().change_scene_to_file(menu_scene)
