extends Node2D

signal apple_collected

func _on_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and is_visible_in_tree():
		apple_collected.emit()
		AudioManager.play_sfx("score")
		hide()
		queue_free()
