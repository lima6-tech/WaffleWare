extends Node2D

func _ready() -> void:
	if Global.lives > 0:
		AudioManager.play_sfx("success")
	else:
		AudioManager.play_sfx("lose")

func _on_restart_pressed() -> void:
	Global.lives = 3
	Global.minigames_done = 0
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/title_scene.tscn")

func _on_quit_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().quit()
