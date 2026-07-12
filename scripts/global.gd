extends Node

var minigames_done = 0 
var lives = 3 
var timer_length = 3.0

func _finish_minigame(Success: bool) -> void:
	if Success:
		AudioManager.play_sfx("success")
		if Global.minigames_done == 3: 
			get_tree().change_scene_to_file("res://scenes/done_scene.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 
	else:
		Global.minigames_done -= 1 
		Global.lives -= 1
		AudioManager.play_sfx("lose")
		if Global.lives > 0:
			get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 
		else:
			get_tree().change_scene_to_file("res://scenes/lose_scene.tscn") 
