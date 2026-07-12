extends Node2D

@onready var timer = $Label
@onready var animation: AnimatedSprite2D = $Animation

var time: float = 0.0
var timer_active: bool = false

func start_timer(start_time: float) -> void:
	time = start_time
	timer_active = true
	animation.play("default")

func _process(delta: float) -> void:
	if timer_active and time > 0.0:
		time -= delta
		timer.text = str(snapped(time, 0.01)) # rounds the number

	if time <= 0.0:
		time = 0.0
		await get_tree().create_timer(0.5).timeout
		timer_active = false
