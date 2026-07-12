extends Node2D

@onready var timer = $Label
@onready var animation: AnimatedSprite2D = $Animation

var time: float = 0.0
var timer_active: bool = false
var tick: float = 0.0
var alert: bool = false

func start_timer(start_time: float) -> void:
	time = start_time
	timer_active = true
	tick = 0.0
	animation.play("default")

func _process(delta: float) -> void:
	if timer_active and time > 0.0:
		time -= delta
		tick += delta
		timer.text = str(snapped(time, 0.01)) # rounds the number

		if tick >= 0.1:
			AudioManager.play_sfx("click")
			tick -= 0.1 # Remove 0.1 to reset the tick counter

	if time <= 0.0:
		time = 0.0
		tick = 0.0

		if not alert: 
			AudioManager.play_sfx("alert", 5.0)
			alert = true

		await get_tree().create_timer(0.5).timeout
		timer_active = false
