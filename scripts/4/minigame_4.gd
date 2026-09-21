extends Node2D

@onready var timer: Node2D = $Timer 
@onready var spawn_timer = $Spawn_timer 
@onready var carrot: Sprite2D = $Level/Cupcake
@onready var player: = $Level/PlatformPlayer

var collected = false

func _ready() -> void:
	var random_x = [-1, 1].pick_random() * 72
	carrot.position = Vector2(random_x, -96)
	player.position.x = carrot.position.x

	timer.start_timer(3.0) # accessing the timer function

func _process(delta: float) -> void: 
	if not timer.timer_active:
		var success = not carrot.hit
		Global._finish_minigame(false)
