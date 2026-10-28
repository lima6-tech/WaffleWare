extends Node2D

var value = 10
var decrease_speed = 25
var increase_speed = 10
var bar_max = 94
var run = true

@onready var bar = $ColorRect

func _process(delta: float) -> void:
	if run:
		value -= decrease_speed * delta

		if Input.is_action_just_pressed("press_space"):
			value += increase_speed
			value = min(value, bar_max + decrease_speed)
			value = max(value, 0)

		bar.size.x = value
		bar.size.x = min(bar.size.x, bar_max)
