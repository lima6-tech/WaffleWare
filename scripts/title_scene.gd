extends Node2D
@onready var background: PackedScene = preload("res://scenes/background.tscn")

func _ready() -> void:
	AudioManager.play_music("ittybitty")

func _on_start_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/timer_scene.tscn")

func _on_settings_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_quit_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().quit()
