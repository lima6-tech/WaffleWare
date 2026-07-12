extends Sprite2D

@onready var area_2d: Area2D = $Area2D

const SPEED = 100
var bottom = 16
var can_collect = false
var collected = false

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	can_collect = true 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and can_collect:
		collected = true
		can_collect = false
		AudioManager.play_sfx("score")
		hide()

func _process(delta: float) -> void: 
	if can_collect:
		position.y += SPEED * delta

	if position.y > 16:
		can_collect = false
		hide()
