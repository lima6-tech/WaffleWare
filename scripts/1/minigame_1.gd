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
		if apples_collected == 3:
			if Global.minigames_done > 3: 
				get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 
		else:
			Global.minigames_done -= 1 
			Global.lives -= 1
			get_tree().change_scene_to_file("res://scenes/timer_scene.tscn") 

func apple_collect() -> void:
	apples_collected += 1
	return
