extends Node

var minigames = 7
var minigames_done = 1
var lives = 3 
var timer_length = 3.0
var file_addition = "res://scenes/general/"

var minigame_pool : Array = []

func setup_minigames(total_games: int) -> void:
	minigame_pool.clear()
	# Fills pool with [1, 2, 3, 4, 5, 6, 7]
	for i in range(1, total_games + 1):
		minigame_pool.append(i)
		
	minigame_pool.shuffle() # Randomizes the order
	minigames_done = 1

func _finish_minigame(Success: bool) -> void:
	if Success:
		AudioManager.play_sfx("success")
		if Global.minigames_done == minigames: 
			get_tree().change_scene_to_file(file_addition + "done_scene.tscn")
			await Fade.play("fade_out")
		else:
			get_tree().change_scene_to_file(file_addition + "timer_scene.tscn") 
	else:
		Global.minigames_done -= 1 
		Global.lives -= 1
		AudioManager.play_sfx("lose")
		if Global.lives > 0:
			get_tree().change_scene_to_file(file_addition + "timer_scene.tscn") 
		else:
			get_tree().change_scene_to_file(file_addition + "lose_scene.tscn") 
			await Fade.play("fade_out")
