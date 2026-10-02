extends Node2D

@onready var timer: Node2D = $Timer
@onready var finish_timer = $Level/finish_timer 
@onready var bar: Node2D = $Level/Bar

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if not timer.timer_active:
		finish_timer.run()
