extends Node

var sounds: Dictionary = {
	"popup": preload("res://assets/sounds/popup.wav"),
	"click": preload("res://assets/sounds/click.wav"),
	"score": preload("res://assets/sounds/score.wav"),
	"success": preload("res://assets/sounds/success.wav"),

	"spring": preload("res://assets/music/Spring.mp3"),
	"ittybitty": preload("res://assets/music/IttyBitty.wav")
}

var active_music_channels: Dictionary = {}

func play_music(sound_name: String, volume: float = 0.0) -> void:
	if not sounds.has(sound_name): return
	if active_music_channels.has(sound_name): return

	var player = AudioStreamPlayer.new()

	player.bus = "Music"
	player.stream = sounds[sound_name]
	player.volume_db = volume

	active_music_channels[sound_name] = player

	add_child(player)
	player.play()

func stop_music(sound_name: String) -> void:
	if not active_music_channels.has(sound_name): return

	active_music_channels.erase(sound_name)

func play_sfx(sound_name: String, volume: float = 0.0) -> void:
	if not sounds.has(sound_name): return

	var sfx = AudioStreamPlayer.new()
	
	sfx.bus = "SFX"
	sfx.stream = sounds[sound_name]
	sfx.volume_db = volume

	add_child(sfx)
	sfx.play()

	sfx.finished.connect(sfx.queue_free)
