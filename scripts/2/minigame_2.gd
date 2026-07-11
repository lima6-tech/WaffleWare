extends Node2D

@onready var timer: Node2D = $Timer 

var waffles_pressed = 0
var x_range: Array[float] = [-140.0, 68]
var y_range: Array[float] = [-116.0, -52.0]

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("waffle_buttons"):
		if button.has_signal("waffle_pressed"):
			var random_x = randf_range(x_range[0], x_range[1])
			var random_y = randf_range(y_range[0], y_range[1])
			button.position = Vector2(random_x, random_y)
			button.waffle_pressed.connect(button_pressed)

	timer.start_timer(3.0) # accessing the timer function

func _process(delta: float) -> void: 
	if not timer.timer_active:
		var success = (waffles_pressed == 5)
		Global._finish_minigame(success)

func button_pressed() -> void:
	waffles_pressed += 1
	return
