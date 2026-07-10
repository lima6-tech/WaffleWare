extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("press_space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration
	var direction := Input.get_axis("press_left", "press_right")
	if direction:
		velocity.x = direction * SPEED
		animation.flip_h = (direction > 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_on_floor():
		if velocity.y < 0: animation.play("Jump") 
	else:
		animation.play("Move") 
		animation.speed_scale = 2 if velocity.x != 0 else 1

	move_and_slide()
