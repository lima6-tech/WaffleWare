extends Node2D

@onready var timer: Node2D = $Timer
@onready var player = $Level/PlatformPlayer
@onready var level = $Level

@onready var spawn_timer = $Level/Spawn_timer 
var carrot_scene = preload("res://scenes/4/carrot.tscn")

var collected = false

func _ready() -> void:
	spawn_timer.wait_time = 0.3
	spawn_timer.autostart = true
	spawn_timer.timeout.connect(_on_timer_timeout)

	timer.start_timer(5.0)

func _process(delta: float) -> void: 
	if not timer.timer_active:
		var success = not player.can_move
		Global._finish_minigame(success)

func _on_timer_timeout() -> void:
	var carrot_instance = carrot_scene.instantiate()

	var random_x = randi_range(1, 10) * 24
	carrot_instance.position = Vector2(random_x, 0)

	level.add_child(carrot_instance)
