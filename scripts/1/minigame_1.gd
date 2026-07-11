extends Node2D

@onready var timer: Node2D = $Timer 

var apples_collected = 0

func _ready() -> void:
	for apple in get_tree().get_nodes_in_group("apples"):
		if apple.has_signal("apple_collected"):
			apple.apple_collected.connect(apple_collect)

	timer.start_timer(3.0) # accessing the timer function

func _process(delta: float) -> void: 
	if not timer.timer_active:
		var success = (apples_collected == 3)
		Global._finish_minigame(success)

func apple_collect() -> void:
	apples_collected += 1
	return
