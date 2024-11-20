extends Control

@export_file("*.tscn") var eval_scene
@export_file("*.tscn") var play_scene



func _on_btn_play_pressed():
	print("Play")
	$Button_click.play()


func _on_btn_eval_pressed():
	print("Eval")
	btn_pressed(eval_scene)
	#get_tree().change_scene_to_file(eval_scene)


func _on_btn_exit_pressed():
	$Button_click.play()
	print("Exit")

func btn_pressed(scene):
	$Button_click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file(scene)
