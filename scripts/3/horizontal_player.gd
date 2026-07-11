extends CharacterBody2D

const SPEED = 200.0
@onready var animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("press_left", "press_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if velocity.x != 0:
		animation.play("Move")
	else:
		animation.stop()
