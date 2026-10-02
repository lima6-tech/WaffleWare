extends Sprite2D

var can_press: bool = true
var end_pos: int = 140

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("press_space") and can_press:
		AudioManager.play_sfx("jump")
		can_press = false
		
		var tween = create_tween()
		tween.tween_property(self, "position:x", end_pos, 0.2)\
			.set_trans(Tween.TRANS_BACK)\
			.set_ease(Tween.EASE_OUT)
