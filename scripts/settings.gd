extends Node2D

@onready var music_slider: HSlider = $Settings/Music
@onready var sfx_slider: HSlider = $Settings/SFX

@onready var music_bus = AudioServer.get_bus_index("Music")
@onready var sfx_bus = AudioServer.get_bus_index("SFX")

func _ready():
	# Connect the sliders' visual movements to our volume logic
	music_slider.value_changed.connect(_on_music_value_changed)
	sfx_slider.value_changed.connect(_on_sfx_value_changed)

	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus))

func _on_music_value_changed(value: float):
	# Convert 0.0-1.0 into decibels and apply it to the Music bus
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_sfx_value_changed(value: float):
	# Convert 0.0-1.0 into decibels and apply it to the SFX bus
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))

func _on_back_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().change_scene_to_file("res://scenes/title_scene.tscn")

func _on_quit_pressed() -> void:
	AudioManager.play_sfx("click", 5.0)
	get_tree().quit()
