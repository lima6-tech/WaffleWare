extends Node2D

func _ready() -> void:
	AudioManager.play_music("ittybitty")
	$VBox/Button.grab_focus()

	Global.setup_minigames(Global.minigames)

	await Fade.play("fade_in")

func _on_start_pressed() -> void:
	await Fade.play("fade_out")
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/general/timer_scene.tscn")
	await Fade.play("fade_in")

func _on_settings_pressed() -> void:
	await Fade.play("fade_out")
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/general/settings_scene.tscn")

func _on_quit_pressed() -> void:
	await Fade.play("fade_out")
	AudioManager.play_sfx("click", 5.0)
	get_tree().quit()
