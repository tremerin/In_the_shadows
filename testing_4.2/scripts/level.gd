extends Node3D

var difficulty:int = 1 
var mesh1:Mesh = preload("res://asset/elephant.obj")
var mesh2:Mesh = preload("res://asset/tea_pot.obj")
var label:Label
var shadow1:MeshInstance3D
var shadow2:MeshInstance3D
var model1:MeshInstance3D
var model2:MeshInstance3D
var pos_x:int = 0
var pos_y:int = 0
var speed:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $UI/Label
	print(Global.level_selected)
	for item in Global.levels:
		if item[0] == Global.level_selected:
			print("info:", item)
			label.text = item[0] + "\n" + item[1]
			difficulty = item[2]
			var scale = 1			
			model1 = $View/Area_model/MeshInstance3D
			mesh1 = load(item[3][0])
			model1.mesh = mesh1
			scale = item[3][3]
			print("scale model:", scale)
			model1.set_scale(Vector3(scale, scale, scale))
			shadow1 = $Shadow/Shadow_model
			shadow1.mesh = mesh1
			scale = item[3][4]
			print("scale shadow:", scale)
			shadow1.set_scale(Vector3(scale, scale, scale))
			#if difficulty == 3:
				#model2 = $View/Area_model/MeshInstance3D
				#model2.mesh = load(item[4][0])
				#shadow2 = $Shadow/Shadow_model
				#shadow2.mesh = load(item[4][0])
	#shadow1.mesh = mesh1
	#shadow1.set_surface_override_material(0, material)
	#$View/Area_model/MeshInstance3D.mesh = mesh2
	#$View/Area_model/MeshInstance3D.mesh = mesh1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event) -> void:
	if event is InputEventMouseMotion and Input.is_action_pressed("left_click"):
		if event.position[1] > pos_y and Input.is_action_pressed("control") and difficulty > 1:
			model1.rotate_x(deg_to_rad(speed) * event.velocity[1]/200)
			shadow1.rotate_x(deg_to_rad(speed) * event.velocity[1]/200)
		elif event.position[1] < pos_y and Input.is_action_pressed("control") and difficulty > 1:
			model1.rotate_x(deg_to_rad(speed) * event.velocity[1]/200)
			shadow1.rotate_x(deg_to_rad(speed) * event.velocity[1]/200)
		elif event.position[0] < pos_x and !Input.is_action_pressed("control"):
			model1.rotate_y(deg_to_rad(speed) * event.velocity[0]/200)
			shadow1.rotate_y(deg_to_rad(speed) * event.velocity[0]/200)
		elif event.position[0] > pos_x and !Input.is_action_pressed("control"):
			model1.rotate_y(deg_to_rad(speed) * event.velocity[0]/200)
			shadow1.rotate_y(deg_to_rad(speed) * event.velocity[0]/200)
		pos_x = event.position[0]
		pos_y = event.position[1]


func _on_button_pressed():
	print("back to menu")
	get_tree().change_scene_to_file("res://scenes/level_selector.tscn")
