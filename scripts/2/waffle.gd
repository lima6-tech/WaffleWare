extends TextureButton

signal waffle_pressed

func _on_pressed() -> void: 
	waffle_pressed.emit()
	AudioManager.play_sfx("score")
	hide()
	queue_free()
