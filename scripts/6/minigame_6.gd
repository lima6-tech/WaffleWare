extends Node2D

@onready var timer: Node2D = $Timer
@onready var finish_timer = $Level/FinishTimer 
@onready var bar: Node2D = $Level/Bar
@onready var claw: AnimatedSprite2D = $Level/Claw
@onready var radish: AnimatedSprite2D = $Level/Radish

var pull_anim = true
var success_anim = true
var game_over = false
var success = false

func _ready() -> void:
	timer.start_timer(3.0)

func _process(delta: float) -> void:
	if not timer.timer_active and not game_over:
		game_over = true
		bar.run = false
		finish_timer.start()
		if bar.value > 85:
			print("anim")
			success = true
			claw.play("success")
			radish.play("success")
	else:
		if bar.value > 60 and pull_anim:
			pull_anim = false
			claw.play("pull")
			radish.play("pull")
		elif bar.value < 60 and not pull_anim:
			pull_anim = true
			claw.play("release")
			radish.play("release")

func _on_timer_timeout() -> void:
	print("finish")
	Global._finish_minigame(success)
