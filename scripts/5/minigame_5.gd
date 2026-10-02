extends Node2D

@onready var timer: Node2D = $Timer
@onready var pizza = $Level/Pizza

func _ready() -> void:
	timer.start_timer(5.0)

func _process(delta: float) -> void:
	if not timer.timer_active:
		var success = pizza.success
		Global._finish_minigame(success)
