extends Node2D

func _ready() -> void:
	if Global.lives > 0:
		AudioManager.play_sfx("success")
	else:
		AudioManager.play_sfx("lose")
	
	$VBox/Button.grab_focus()
	await Fade.play("fade_in")

func _on_restart_pressed() -> void:
	Global.lives = 3
	Global.minigames_done = 0
	await Fade.play("fade_out")
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/general/title_scene.tscn")

func _on_quit_pressed() -> void:
	await Fade.play("fade_out")
	AudioManager.play_sfx("click", 5.0)
	get_tree().quit()
