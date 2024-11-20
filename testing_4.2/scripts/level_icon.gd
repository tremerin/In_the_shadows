extends Area3D

@onready var mesh:MeshInstance3D = $MeshInstance3D

@export var Open:bool
@export var Name:String
@export var Clue:String
@export var Selector:Node

var best_time:String = "--:--:--"

var selected:bool = false
var material_selected:StandardMaterial3D = preload("res://materials/selected.tres")
var material_standard:StandardMaterial3D = preload("res://materials/standard.tres")


func _on_mouse_entered():
	mesh.set_surface_override_material(0, material_selected)
	Selector.level_selected([Name, Clue])
	#Selector.selected_name = Name
	selected = true

func _on_mouse_exited():
	#Selector.level_label = Selector.label_defaul_txt
	Selector.no_selected()
	mesh.set_surface_override_material(0, material_standard)
	selected = false

func _input(event):
	if selected and event is InputEventMouseButton and Input.is_action_pressed("left_click"):
		create_level()

func create_level():
	print("create level")
	Global.select_level(Name)
	get_tree().change_scene_to_file("res://scenes/level.tscn")
