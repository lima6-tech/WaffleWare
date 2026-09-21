extends Node2D

@onready var area_2d: Area2D = $Area2D

const SPEED = 100
var bottom = 16
var can_move = false
var hit = false

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	can_move = true 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and can_move:
		can_move = false
		body.can_move = false
		hit = true
		hide()

func _process(delta: float) -> void: 
	if can_move:
		position.y += SPEED * delta
