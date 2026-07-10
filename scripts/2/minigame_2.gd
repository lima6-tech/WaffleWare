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

	timer.start_timer(3.0) # accessing the timer function

func _process(delta: float) -> void: 
	if not timer.timer_active:
		if waffles_pressed == 5:
			if Global.minigames_done > 3: 
				get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 
		else:
			Global.minigames_done -= 1 
			Global.lives -= 1
			get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 

func button_pressed() -> void:
	waffles_pressed += 1
	return
