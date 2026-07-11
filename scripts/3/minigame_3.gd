extends Node2D

@onready var timer: Node2D = $Timer 
@onready var coconut: Sprite2D = $Level/Coconut

var collected = false

func _ready() -> void:
	var random_x = [-1, 1].pick_random() * 72
	coconut.position = Vector2(random_x, -96)

	timer.start_timer(3.0) # accessing the timer function

func _process(delta: float) -> void: 
	if not timer.timer_active:
		var success = coconut.collected
		Global._finish_minigame(success)
