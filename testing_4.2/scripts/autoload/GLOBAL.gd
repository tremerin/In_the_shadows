extends Node
var test:String 
var level_selected:String
var material_selected:StandardMaterial3D = preload("res://materials/selected.tres")
var material_standard:StandardMaterial3D = preload("res://materials/selected.tres")
var game_controller:GameController
@onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# Levels
var levels:Array = [
	#["0/ name"	,"1/ clue"					,"2/ dif"	,"3/ model_1,x,y,m,s"		,"4/ model_2,x,y,m,s"		,"5/ time", "6/ open"],
	# x > objetive x, y > objetive y, m > model scale, s > shadow scale
	["Level 1"	,"You have three whishes"	,1 ,["res://asset/tea_pot.obj", 0, 0, 1, 2], "-", "--:--:--", true],
	["Level 2"	,"Has a good memory"		,2 ,["res://asset/elephant.obj", 0, 0, 1, 1], "-", "--:--:--", true],
	["Level 3"	,"Up to you!"				,3 ,["res://asset/logo-4.obj", 0, 0, 0.2, 0.2], ["res://asset/logo-2.obj",0 ,0 ,1 ,1], "--:--:--", true],
]


func _ready():
	print("Global ready")
	read_data()
	test = "testeando"

func read_data():
	print("reading files")
	
func select_level(level_name:String):
	level_selected = level_name
	
func randon(min, max):
	rng.randomize()
	return rng.randf_range(min, max)
