extends Node2D

var speed: float = 100.0
var accel: float = 2.0

@onready var area_2d: Area2D = $Area

var _can_move: bool = false
var _is_hit: bool = false

func _ready() -> void:
	get_tree().create_timer(0.2).timeout.connect(func(): _can_move = true)

func _process(delta: float) -> void: 
	if _can_move:
		position.y += speed * delta
		speed *= 1 + (accel / 100)

func _on_body_entered(body: Node2D) -> void:
	if not _can_move or _is_hit: return

	if body.is_in_group("player"):
		_can_move = false
		_is_hit = true
		body.can_move = false

		queue_free()
