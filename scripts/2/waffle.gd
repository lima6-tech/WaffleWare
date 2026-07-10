extends TextureButton

signal waffle_pressed

func _on_pressed() -> void: 
	waffle_pressed.emit()
	hide()
	queue_free()
